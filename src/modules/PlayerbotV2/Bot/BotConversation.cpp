// BotConversation - see BotConversation.h.

#include "BotConversation.h"
#include "BotL10nText.h"   // FoldRu / LowerUtf8: Russian lines are matched and styled like English ones

#include <algorithm>
#include <cctype>
#include <initializer_list>
#include <mutex>

namespace Playerbot::V2 {

namespace {

// ---- text helpers -------------------------------------------------------------------------------------------------------

bool HasWord(std::string const& hay, char const* needle)
{
    std::string const n = needle;
    size_t pos = 0;
    while ((pos = hay.find(n, pos)) != std::string::npos)
    {
        bool const left = pos == 0 || hay[pos - 1] == ' ';
        bool const right = pos + n.size() == hay.size() || hay[pos + n.size()] == ' ';
        if (left && right)
            return true;
        pos += n.size();
    }
    return false;
}

bool HasAny(std::string const& hay, std::initializer_list<char const*> words)
{
    for (char const* w : words)
        if (HasWord(hay, w))
            return true;
    return false;
}

// A word that starts with `stem` ("гильди" finds "гильдия", "гильдии", "гильдию"): Russian words change their ending.
bool HasStem(std::string const& hay, char const* stem)
{
    std::string const n = stem;
    size_t pos = 0;
    while ((pos = hay.find(n, pos)) != std::string::npos)
    {
        if (pos == 0 || hay[pos - 1] == ' ')
            return true;
        pos += n.size();
    }
    return false;
}

bool HasAnyStem(std::string const& hay, std::initializer_list<char const*> stems)
{
    for (char const* s : stems)
        if (HasStem(hay, s))
            return true;
    return false;
}

std::string Lower(std::string s)
{
    for (char& c : s)
        c = char(std::tolower(static_cast<unsigned char>(c)));
    return s;
}

void Replace(std::string& s, std::string const& key, std::string const& val)
{
    size_t pos = 0;
    while ((pos = s.find(key, pos)) != std::string::npos)
    {
        s.replace(pos, key.size(), val);
        pos += val.size();
    }
}

uint32_t Mix(uint32_t a, uint32_t b)
{
    uint32_t h = a * 2654435761u ^ (b + 0x9e3779b9u + (a << 6) + (a >> 2));
    h ^= h >> 15;
    h *= 2246822519u;
    h ^= h >> 13;
    return h;
}

// ---- destinations -------------------------------------------------------------------------------------------------------

struct Destination
{
    char const* keys[3];                   // nullptr-terminated when fewer than 3
    char const* name;
    char const* route;
    char const* ru_keys[3];                // Russian word stems; "a b" needs both stems in the line
    char const* ru_name;
    char const* ru_route;
};

// Vanilla geography only; nothing here that is not true of the Classic world.
Destination const kDestinations[] = {
    { { "stormwind", "sw" }, "Stormwind", "follow the road out of Elwynn Forest, or take the Deeprun Tram from Ironforge",
      { "штормград", "шторм" }, "Штормград", "иди по дороге из Элвиннского леса или прокатись на Подземном поезде из Стальгорна" },
    { { "ironforge" }, "Ironforge", "it is in Dun Morogh, or take the Deeprun Tram from Stormwind",
      { "стальгорн" }, "Стальгорн", "он в Дун Мороге, или прокатись на Подземном поезде из Штормграда" },
    { { "darnassus" }, "Darnassus", "it is up in Teldrassil, and a boat from Auberdine in Darkshore gets you to Rutheran Village",
      { "дарнас" }, "Дарнас", "он на Тельдрассиле, туда ходит корабль из Аубердина на Темных берегах до деревни Рут'теран" },
    { { "orgrimmar", "org" }, "Orgrimmar", "it is in Durotar, and the zeppelin from Tirisfal Glades brings you right to it",
      { "оргримм", "орг", "огри" }, "Оргриммар", "он в Дуротаре, а дирижабль из Тирисфальских лесов прилетает прямо туда" },
    { { "thunder bluff", "tb" }, "Thunder Bluff", "it is up on the mesas of Mulgore, take the lift up",
      { "громов уте", "тб" }, "Громовой Утес", "он на плато Мулгора, поднимись на лифте" },
    { { "undercity", "uc" }, "Undercity", "the entrance is in Tirisfal Glades, by the ruins of Lordaeron",
      { "подгород", "андерсити" }, "Подгород", "вход в Тирисфальских лесах, у руин Лордерона" },
    { { "elwynn forest", "elwynn" }, "Elwynn Forest", "it is the zone around Stormwind, head out of the main gate",
      { "элвинн" }, "Элвиннский лес", "это лес вокруг Штормграда, выходи через главные ворота" },
    { { "westfall" }, "Westfall", "it is just west of Elwynn Forest",
      { "западн кра" }, "Западный Край", "он сразу к западу от Элвиннского леса" },
    { { "duskwood" }, "Duskwood", "it is south of Elwynn Forest",
      { "сумеречн лес" }, "Сумеречный лес", "он к югу от Элвиннского леса" },
    { { "redridge mountains", "redridge" }, "Redridge Mountains", "it is east of Elwynn Forest",
      { "красногор" }, "Красногорье", "оно к востоку от Элвиннского леса" },
    { { "dun morogh" }, "Dun Morogh", "it is the snowy zone around Ironforge",
      { "морог" }, "Дун Морог", "это заснеженная зона вокруг Стальгорна" },
    { { "loch modan" }, "Loch Modan", "it is east of Dun Morogh",
      { "модан" }, "Лок Модан", "он к востоку от Дун Морога" },
    { { "teldrassil" }, "Teldrassil", "take the boat from Auberdine in Darkshore to Rutheran Village",
      { "тельдрасс" }, "Тельдрассил", "садись на корабль в Аубердине на Темных берегах до деревни Рут'теран" },
    { { "darkshore" }, "Darkshore", "it is the coast south of Teldrassil, reach it by boat from Rutheran Village",
      { "темн берег" }, "Темные берега", "это побережье к югу от Тельдрассила, туда ходит корабль из деревни Рут'теран" },
    { { "durotar" }, "Durotar", "it is the orc starting zone, Orgrimmar is there, just east of the Barrens",
      { "дурот" }, "Дуротар", "это стартовая зона орков, там Оргриммар, к востоку от Степей" },
    { { "mulgore" }, "Mulgore", "it is south-west of the Barrens, Thunder Bluff is there",
      { "мулгор" }, "Мулгор", "он к юго-западу от Степей, там Громовой Утес" },
    { { "the barrens", "barrens", "crossroads" }, "The Barrens", "it is between Durotar and Mulgore, the Crossroads is the main town",
      { "степ", "перекрест" }, "Степи", "они между Дуротаром и Мулгором, главный город там - Перекресток" },
    { { "tirisfal glades", "tirisfal" }, "Tirisfal Glades", "it is the undead starting zone, Undercity is below it",
      { "тирисфал" }, "Тирисфальские леса", "это стартовая зона нежити, под ней Подгород" },
};

// A Russian key: one stem, or two stems separated by a space that must both start a word of the line.
bool HasRuKey(std::string const& norm, char const* key)
{
    std::string const k = key;
    size_t const sp = k.find(' ');
    if (sp == std::string::npos)
        return HasStem(norm, key);
    return HasStem(norm, k.substr(0, sp).c_str()) && HasStem(norm, k.substr(sp + 1).c_str());
}

Destination const* FindDestination(std::string const& norm)
{
    for (Destination const& d : kDestinations)
    {
        for (char const* k : d.keys)
            if (k && HasWord(norm, k))
                return &d;
        for (char const* k : d.ru_keys)
            if (k && HasRuKey(norm, k))
                return &d;
    }
    return nullptr;
}

// ---- classification -----------------------------------------------------------------------------------------------------

bool IsYouWord(std::string const& norm)
{
    return HasAny(norm, { "you", "u", "ya", "yourself", "your", "ur",
                          "ты", "тебя", "тебе", "тобой", "вы", "вас", "вам", "сам", "твой", "твоя", "твое", "твои" });
}

// Upper-cases the first letter, Latin or Cyrillic (UTF-8, two bytes).
std::string UpperFirst(std::string t)
{
    if (t.empty())
        return t;
    unsigned char const c0 = static_cast<unsigned char>(t[0]);
    if (c0 < 0x80)
    {
        t[0] = char(std::toupper(c0));
        return t;
    }
    if (t.size() < 2)
        return t;
    unsigned char const c1 = static_cast<unsigned char>(t[1]);
    if (c0 == 0xD0 && c1 >= 0xB0 && c1 <= 0xBF)            // а-п -> А-П
        t[1] = char(c1 - 0x20);
    else if (c0 == 0xD1 && c1 >= 0x80 && c1 <= 0x8F)       // р-я -> Р-Я
    {
        t[0] = char(0xD0);
        t[1] = char(c1 + 0x20);
    }
    else if (c0 == 0xD1 && c1 == 0x91)                     // ё -> Ё
    {
        t[0] = char(0xD0);
        t[1] = char(0x81);
    }
    return t;
}

} // namespace

std::string ConvNormalize(std::string const& in)
{
    std::string out;
    out.reserve(std::min<size_t>(in.size(), 256));
    bool last_space = true;
    for (char c : in)
    {
        if (out.size() >= 256)
            break;
        unsigned char const uc = static_cast<unsigned char>(c);
        if (uc == '\'')
            continue;                      // "where's" -> "wheres", "i'm" -> "im"
        if (uc == '!' || uc == '?' || uc == '.' || uc == ',' || uc == ';' || uc == ':' || uc == '(' || uc == ')' ||
            uc == '"' || uc == '\t' || uc == '\r' || uc == '\n' || uc == ' ')
        {
            if (!last_space)
            {
                out.push_back(' ');
                last_space = true;
            }
            continue;
        }
        out.push_back(char(std::tolower(uc)));
        last_space = false;
    }
    while (!out.empty() && out.back() == ' ')
        out.pop_back();
    // Cyrillic lower case and "ё" -> "е" too: the Russian keywords below are written in that form.
    return L10n::FoldRu(out);
}

ConvIntent ConvClassify(std::string const& norm, std::string* slot)
{
    if (slot)
        slot->clear();
    if (norm.empty())
        return ConvIntent::Unknown;

    bool const you = IsYouWord(norm);
    bool const short_line = std::count(norm.begin(), norm.end(), ' ') < 3;

    // Insults first: they should not be read as a question that happens to contain "you".
    if (HasAny(norm, { "stupid", "idiot", "noob", "suck", "sucks", "trash", "useless", "dumb", "moron", "ugly", "stfu" }) ||
        HasWord(norm, "shut up") || HasWord(norm, "fuck you") || HasWord(norm, "f you") ||
        HasAny(norm, { "дурак", "дура", "идиот", "нуб", "нубас", "тупой", "тупая", "тупица", "отстой", "бесполезный",
                       "бесполезная", "урод", "лох", "дебил", "кретин", "заткнись", "отвали" }) ||
        HasWord(norm, "иди нафиг"))
        return ConvIntent::Insult;

    if (HasAny(norm, { "bye", "cya", "goodbye", "gn", "goodnight", "gtg", "g2g", "later", "laters", "farewell", "ttyl", "see you", "see ya" }) ||
        HasWord(norm, "good night") || HasWord(norm, "got to go") || HasWord(norm, "have to go") ||
        HasAny(norm, { "пока", "бб", "бай", "покеда", "споки", "увидимся", "ухожу" }) ||
        HasWord(norm, "до свидания") || HasWord(norm, "до встречи") || HasWord(norm, "спокойной ночи") ||
        HasWord(norm, "мне пора") || HasWord(norm, "я пошел"))
        return ConvIntent::Goodbye;

    if (HasWord(norm, "joke") || HasWord(norm, "funny") || HasWord(norm, "make me laugh") ||
        HasAnyStem(norm, { "шутк", "пошути", "анекдот", "рассмеши" }))
        return ConvIntent::Joke;

    // Directions: "how do i get to X", "where is X", "way to X", "path to X", "how to get to X".
    bool const asks_way = (HasWord(norm, "how") && (HasWord(norm, "get") || HasWord(norm, "go") || HasWord(norm, "reach"))) ||
                          HasWord(norm, "directions") || HasWord(norm, "way to") || HasWord(norm, "path to") ||
                          HasWord(norm, "route") || (HasWord(norm, "where") && (HasWord(norm, "is") || HasWord(norm, "s") || HasWord(norm, "are")) && !you) ||
                          HasWord(norm, "wheres") ||
                          HasWord(norm, "как добраться") || HasWord(norm, "как пройти") || HasWord(norm, "как попасть") ||
                          HasWord(norm, "как дойти") || HasWord(norm, "как доехать") || HasWord(norm, "где находится") ||
                          HasWord(norm, "где найти") || HasWord(norm, "дорога до") || HasWord(norm, "дорога в") ||
                          HasWord(norm, "путь до") || HasWord(norm, "путь в") || HasWord(norm, "в какой стороне") ||
                          (HasWord(norm, "где") && !you);
    if (asks_way)
    {
        if (Destination const* d = FindDestination(norm))
        {
            if (slot)
                *slot = Lower(d->name);
            return ConvIntent::Directions;
        }
        // "where is the auction house / flight master": no destination we know; Unknown lets a provider try.
    }

    if (HasWord(norm, "quest") || HasWord(norm, "quests") || HasWord(norm, "q"))
    {
        if (HasAny(norm, { "help", "stuck", "find", "where", "how", "do", "need", "doing", "on", "got", "have", "any" }))
            return ConvIntent::QuestHelp;
    }
    if (HasAnyStem(norm, { "квест", "задани" }) || HasWord(norm, "кв"))
    {
        if (HasAnyStem(norm, { "помог", "застрял", "делаешь", "нужн" }) ||
            HasAny(norm, { "найти", "где", "как", "есть", "какой", "какие", "на каком" }))
            return ConvIntent::QuestHelp;
    }

    if (HasAny(norm, { "guild", "guilds" }) || HasStem(norm, "гильди") || HasWord(norm, "ги"))
        return ConvIntent::Guild;

    if (HasAny(norm, { "profession", "professions", "craft", "crafting", "crafter", "enchant", "enchanter", "mats", "recipe", "recipes", "mining",
                       "herbalism", "skinning", "tailoring", "alchemy", "blacksmithing", "engineering", "leatherworking", "cooking", "fishing" }) ||
        HasWord(norm, "make me") || HasWord(norm, "can you make") ||
        HasAnyStem(norm, { "професси", "крафт", "скрафт", "зачар", "рецепт", "травнич", "портняж", "алхими", "кузнеч", "инженер",
                           "кожевн", "кулинар", "рыбалк" }) ||
        HasAny(norm, { "чары", "горное дело", "снятие шкур", "можешь сделать", "сделай мне" }))
        return ConvIntent::Trade;

    if ((HasWord(norm, "where") && HasAny(norm, { "from", "come from", "born" })) || HasWord(norm, "откуда"))
        return ConvIntent::WhereFrom;

    if ((HasAny(norm, { "name", "called" }) && !HasAny(norm, { "quest", "quests" }) && (you || HasWord(norm, "whats") || HasWord(norm, "what"))) || HasWord(norm, "who are you") ||
        HasWord(norm, "who r u") || HasWord(norm, "who is this") ||
        HasAny(norm, { "как тебя зовут", "как зовут", "твое имя", "кто ты", "ты кто", "как звать" }))
        return ConvIntent::Name;

    if ((HasWord(norm, "where") || HasWord(norm, "где")) && you)
        return ConvIntent::WhereAreYou;
    if (HasWord(norm, "wherer") || HasWord(norm, "wo bist du"))
        return ConvIntent::WhereAreYou;

    if ((HasAny(norm, { "level", "lvl", "lv" }) && !HasWord(norm, "how to level")) ||
        HasAny(norm, { "уровень", "лвл", "лвла" }) || HasStem(norm, "уровн"))
        return ConvIntent::Level;

    if (((HasWord(norm, "class") || HasWord(norm, "spec") || HasWord(norm, "talents")) && (you || HasWord(norm, "what") || HasWord(norm, "which"))) ||
        ((HasAnyStem(norm, { "класс", "спек", "талант" }) || HasWord(norm, "кем играешь")) &&
         (you || HasAny(norm, { "какой", "какая", "кто", "кем" }))))
        return ConvIntent::ClassSpec;

    if ((HasWord(norm, "how") || HasWord(norm, "hows")) && ((HasAny(norm, { "are", "r", "re" }) && you) || HasAny(norm, { "going", "doing", "things", "been", "life" })))
        return ConvIntent::HowAreYou;
    if (HasAny(norm, { "hbu", "wbu", "whats up", "wassup", "wazzup" }) && !HasWord(norm, "doing"))
        return ConvIntent::HowAreYou;
    if (HasAny(norm, { "как дела", "как жизнь", "как поживаешь", "как оно", "че как", "чо как", "как настроение", "как делишки" }) ||
        (short_line && HasAny(norm, { "как ты", "как сам", "как вы" })))
        return ConvIntent::HowAreYou;

    if ((HasWord(norm, "what") && (HasWord(norm, "doing") || HasWord(norm, "up to"))) || HasWord(norm, "wyd") ||
        (HasWord(norm, "sup") && HasWord(norm, "doing")) || HasWord(norm, "busy") ||
        HasAny(norm, { "что делаешь", "че делаешь", "чо делаешь", "чем занят", "чем занята", "чем занимаешься", "что поделываешь",
                       "ты занят", "ты занята" }))
        return ConvIntent::WhatDoing;

    if (HasAny(norm, { "group", "party", "team", "invite", "lfg", "lfm", "dungeon", "dungeons", "run", "join" }))
    {
        if (HasAny(norm, { "want", "wanna", "can", "join", "invite", "lfg", "lfm", "up", "need", "come", "wana", "would", "will" }))
            return ConvIntent::GroupInvite;
    }
    if (HasAnyStem(norm, { "групп", "инвайт", "пригласи", "данж", "подземель", "рейд" }) || HasWord(norm, "пати"))
    {
        if (HasAnyStem(norm, { "хочешь", "можешь", "пойдешь", "нуж", "присоедин", "вступ", "пригласи", "инвайт" }) ||
            HasAny(norm, { "пойдем", "давай", "го", "возьми", "идешь" }))
            return ConvIntent::GroupInvite;
    }

    if ((HasAny(norm, { "awesome", "amazing", "nice", "cool", "great", "love", "best", "rock", "rocks", "legend" }) ||
         HasAny(norm, { "молодец", "красавчик", "красава", "круто", "классно", "отлично", "супер", "лучший", "лучшая", "легенда",
                        "умница", "крутой", "крутая" })) &&
        (you || HasAny(norm, { "job", "bot", "player", "бот", "игрок", "работа" })))
        return ConvIntent::Compliment;

    // A short line that opens with a greeting ("hi", "hey Aron", "hello there"); a longer line is something else.
    if (short_line &&
        (HasAny(norm, { "hi", "hey", "hello", "heya", "hiya", "howdy", "yo", "sup", "hallo", "moin", "hola", "bonjour", "morning" }) ||
         HasAny(norm, { "привет", "прив", "приветик", "здравствуй", "здравствуйте", "хай", "ку", "здарова", "здорово", "дарова",
                        "даров", "салют", "йо", "хелло", "доброе утро", "добрый день", "добрый вечер" })))
        return ConvIntent::Greeting;

    return ConvIntent::Unknown;
}

bool ConvUnderstands(std::string const& norm)
{
    return ConvClassify(norm) != ConvIntent::Unknown;
}

namespace {

// ---- phrasing -----------------------------------------------------------------------------------------------------------

struct Pools
{
    std::vector<std::string> rude;
    std::vector<std::string> neutral;
    std::vector<std::string> polite;
};

// Each pool is ordered short to long: Terse bots draw from the first half only.
Pools const& PoolsFor(ConvIntent intent, bool variant)
{
    // variant selects the "no data" form where one exists (no quest, no guild, no profession).
    static Pools const how = {
        { "fine", "ok", "alive", "meh" },
        { "good", "doing good", "not bad", "pretty good, you?", "all good, {doing}", "good thanks, {doing}" },
        { "doing great, thanks for asking!", "pretty good, how about you?", "all good here, {doing}. you?", "really good, thanks :)" } };
    static Pools const from = {
        { "around", "{zone}", "dunno, {zone} atm" },
        { "{zone} atm", "around here, {zone} now", "been all over, {zone} at the moment" },
        { "just a {cls} from around here, i'm in {zone} right now", "all over really, {zone} at the moment, you?", "i travel a lot, currently in {zone} :)" } };
    static Pools const where = {
        { "{zone}", "{zone} atm", "in {zone}" },
        { "im in {zone}", "{zone} atm", "over in {zone}", "currently in {zone}" },
        { "i'm over in {zone} :)", "currently in {zone}, come find me!", "you'll find me in {zone}" } };
    static Pools const level = {
        { "{lvl}", "{lvl} {cls}", "level {lvl}" },
        { "level {lvl} {cls}", "im {lvl} {cls}", "{lvl} {cls}, you?", "lvl {lvl}" },
        { "i'm level {lvl}, a {cls} :)", "level {lvl} {cls}, how about you?", "{lvl} {cls}, still levelling" } };
    static Pools const cls = {
        { "{cls}", "a {cls}", "{cls}, why?" },
        { "im a {cls}", "{cls}, level {lvl}", "{lvl} {cls}", "playing a {cls}" },
        { "i'm a {cls} :) level {lvl}", "a {cls}, they're a lot of fun!", "{cls}, and loving it" } };
    static Pools const doing = {
        { "{doing}", "nothing much", "{doing}, why" },
        { "{doing}", "not much, {doing}", "{doing} in {zone}", "{doing}, you?" },
        { "{doing} in {zone}, and you?", "just {doing}, enjoying it :)", "{doing}, how about yourself?" } };
    static Pools const group_free = {
        { "ok invite", "sure", "invite" },
        { "sure, send me an invite", "sure! invite me", "sounds good, invite me", "yeah why not, invite" },
        { "sure, send me an invite :)", "sounds fun, invite me and i'll come", "happy to, just send the invite" } };
    static Pools const group_busy = {
        { "in a group", "busy", "cant" },
        { "already in a group, sorry", "im with a party right now", "in a group atm" },
        { "already in a group, sorry! maybe later :)", "i'm with a party right now, ask me again soon?" } };
    static Pools const quest_have = {
        { "on {quest}", "{quest}", "doing {quest}" },
        { "im on {quest} myself", "doing {quest} atm, what do you need?", "{quest}, what about you?" },
        { "i'm working on {quest} myself, happy to help if you tell me where you are :)", "i'm on {quest} right now, tell me what you're stuck on" } };
    static Pools const quest_none = {
        { "which quest", "what quest", "name?" },
        { "which quest?", "what quest is it?", "whats the quest called?" },
        { "sure, which quest is it?", "happy to help, what's the quest called?", "which one are you stuck on? tell me where you are :)" } };
    static Pools const trade_have = {
        { "{prof}", "i do {prof}", "{prof}, why" },
        { "i do {prof}", "{prof} here, what do you need?", "im into {prof}, what are you after?" },
        { "i do {prof}, what do you need?", "i'm a {prof} person, happy to help if i can :)", "{prof}, tell me what you're after!" } };
    static Pools const trade_none = {
        { "no", "nothing", "nope" },
        { "no professions yet", "not really, still levelling", "nothing yet" },
        { "no professions yet, sorry! still levelling :)", "i haven't picked any up yet, maybe later!" } };
    static Pools const guild_have = {
        { "{guild}", "in {guild}", "<{guild}>" },
        { "im in {guild}", "{guild}, you?", "i'm in <{guild}>" },
        { "i'm in <{guild}>, great bunch :)", "<{guild}> for me, are you looking for one?" } };
    static Pools const guild_none = {
        { "no", "nope", "none" },
        { "no guild", "not in one right now", "unguilded atm" },
        { "no guild right now, are you recruiting? :)", "not in a guild yet, do you know a good one?" } };
    static Pools const name = {
        { "{self}", "{self}", "its {self}" },
        { "im {self}", "{self}, you?", "my name's {self}" },
        { "i'm {self}, nice to meet you :)", "{self}, and you are?", "call me {self}" } };
    static Pools const insult = {
        { "whatever", "ok", "k" },
        { "ok then", "not nice", "alright", "wow ok" },
        { "that's not very nice", "no need for that", "okay... i'll let that go :)" } };
    static Pools const compliment = {
        { "ok", "ty", "yeah" },
        { "thanks!", "ty", "thanks, you too", "appreciate it" },
        { "aw thanks :)", "thank you, that's kind!", "thanks, you're pretty great yourself :)" } };
    static Pools const bye = {
        { "bye", "later", "cya" },
        { "cya", "bye!", "see you around", "later" },
        { "bye, take care :)", "see you around!", "have a good one, bye!" } };
    static Pools const greet_known = {
        { "yo", "hey", "sup {sender}" },
        { "hey {sender}", "hi {sender}!", "hey, what's up?", "hello {sender}" },
        { "hi {sender}! good to see you :)", "hey {sender}, ready when you are", "hello {sender}, how can i help?" } };
    static Pools const dir_here = {
        { "this is it", "you're here", "here" },
        { "that's where i am right now", "you're already close, im here too" },
        { "that's where i am right now :)", "you're nearly there, i'm in the same zone" } };
    static Pools const dir = {
        { "{route}", "{dest}: {route}" },
        { "{dest}? {route}", "{route}", "for {dest}, {route}" },
        { "for {dest}, {route}", "{dest}? {route} :)", "{dest}: {route}. press M for the map if you get lost" } };

    switch (intent)
    {
        case ConvIntent::HowAreYou: return how;
        case ConvIntent::WhereFrom: return from;
        case ConvIntent::WhereAreYou: return where;
        case ConvIntent::Level: return level;
        case ConvIntent::ClassSpec: return cls;
        case ConvIntent::WhatDoing: return doing;
        case ConvIntent::GroupInvite: return variant ? group_busy : group_free;
        case ConvIntent::QuestHelp: return variant ? quest_none : quest_have;
        case ConvIntent::Trade: return variant ? trade_none : trade_have;
        case ConvIntent::Guild: return variant ? guild_none : guild_have;
        case ConvIntent::Name: return name;
        case ConvIntent::Insult: return insult;
        case ConvIntent::Compliment: return compliment;
        case ConvIntent::Goodbye: return bye;
        case ConvIntent::Greeting: return greet_known;
        case ConvIntent::Directions: return variant ? dir_here : dir;
        default: break;
    }
    static Pools const empty;
    return empty;
}

// The same pools in Russian. Worded to fit a bot of either gender; the zone and quest names go into quotes so they keep the
// case they are written in ("в зоне «Тирисфальские леса»").
Pools const& PoolsForRu(ConvIntent intent, bool variant)
{
    static Pools const how = {
        { "норм", "нормально", "живой", "так себе" },
        { "хорошо", "неплохо", "нормально, а ты?", "всё ок, {doing}", "хорошо, спасибо, {doing}" },
        { "отлично, спасибо за вопрос!", "всё хорошо, а у тебя как?", "всё отлично, {doing}. а ты как?", "очень хорошо, спасибо :)" } };
    static Pools const from = {
        { "отсюда", "{zone}", "не знаю, сейчас в зоне «{zone}»" },
        { "сейчас в зоне «{zone}»", "из этих мест, сейчас тут: {zone}", "отовсюду понемногу, сейчас в зоне «{zone}»" },
        { "{cls} из здешних мест, сейчас в зоне «{zone}»", "отовсюду понемногу, сейчас тут: {zone}, а ты?",
          "много путешествую, сейчас в зоне «{zone}» :)" } };
    static Pools const where = {
        { "{zone}", "тут: {zone}", "в зоне «{zone}»" },
        { "я в зоне «{zone}»", "сейчас тут: {zone}", "{zone}, сейчас здесь", "сейчас в зоне «{zone}»" },
        { "я сейчас в зоне «{zone}» :)", "сейчас в зоне «{zone}», заходи!", "найдёшь меня в зоне «{zone}»" } };
    static Pools const level = {
        { "{lvl}", "{lvl}, {cls}", "уровень {lvl}" },
        { "{lvl} уровень, {cls}", "у меня {lvl}, {cls}", "{lvl}, {cls}, а у тебя?", "лвл {lvl}" },
        { "у меня {lvl} уровень, я {cls} :)", "{lvl} уровень, {cls}, а у тебя?", "{lvl}, {cls}, ещё качаюсь" } };
    static Pools const cls = {
        { "{cls}", "{cls}, а что?", "я {cls}" },
        { "я {cls}", "{cls}, уровень {lvl}", "{lvl}, {cls}", "мой класс - {cls}" },
        { "я {cls} :) уровень {lvl}", "{cls}, очень интересный класс!", "{cls}, и мне нравится" } };
    static Pools const doing = {
        { "{doing}", "ничего особенного", "{doing}, а что" },
        { "{doing}", "да так, {doing}", "{doing}, сейчас в зоне «{zone}»", "{doing}, а ты?" },
        { "{doing}, сейчас в зоне «{zone}», а ты?", "{doing}, и мне нравится :)", "{doing}, а у тебя что?" } };
    static Pools const group_free = {
        { "ок, кидай инвайт", "давай", "инвайт" },
        { "давай, кидай приглашение", "конечно! пригласи меня", "звучит неплохо, приглашай", "почему бы и нет, кидай инвайт" },
        { "конечно, пришли приглашение :)", "звучит интересно, пригласи - и я приду", "с удовольствием, просто пришли приглашение" } };
    static Pools const group_busy = {
        { "уже в группе", "не могу", "в группе" },
        { "уже в группе, извини", "я сейчас с группой", "пока в группе" },
        { "уже в группе, извини! может, позже :)", "я сейчас с группой, спроси чуть позже?" } };
    static Pools const quest_have = {
        { "делаю «{quest}»", "«{quest}»", "на «{quest}»" },
        { "тоже делаю «{quest}»", "сейчас на «{quest}», что нужно?", "«{quest}», а у тебя что?" },
        { "я сейчас делаю «{quest}», помогу, если скажешь, где ты :)", "у меня сейчас «{quest}», расскажи, что не получается" } };
    static Pools const quest_none = {
        { "какой квест", "что за квест", "название?" },
        { "какой квест?", "что за задание?", "как называется квест?" },
        { "конечно, какой квест?", "помогу, как называется задание?", "на каком задании проблема? скажи, где ты :)" } };
    static Pools const trade_have = {
        { "{prof}", "у меня {prof}", "{prof}, а что" },
        { "у меня {prof}", "{prof}, что нужно?", "занимаюсь: {prof}, что ищешь?" },
        { "у меня {prof}, что тебе нужно?", "занимаюсь: {prof}, помогу, если смогу :)", "{prof}, рассказывай, что ищешь!" } };
    static Pools const trade_none = {
        { "нет", "ничего", "неа" },
        { "профессий пока нет", "не особо, пока качаюсь", "пока ничего" },
        { "профессий пока нет, извини! ещё качаюсь :)", "пока ничего не выучено, может, позже!" } };
    static Pools const guild_have = {
        { "{guild}", "<{guild}>", "гильдия <{guild}>" },
        { "я в гильдии <{guild}>", "<{guild}>, а ты?", "состою в <{guild}>" },
        { "я в гильдии <{guild}>, отличные ребята :)", "<{guild}>, а ты ищешь гильдию?" } };
    static Pools const guild_none = {
        { "нет", "неа", "никакой" },
        { "без гильдии", "сейчас ни в какой", "пока без гильдии" },
        { "сейчас без гильдии, вы набираете? :)", "пока не в гильдии, знаешь хорошую?" } };
    static Pools const name = {
        { "{self}", "{self}", "я {self}" },
        { "я {self}", "{self}, а ты?", "меня зовут {self}" },
        { "я {self}, приятно познакомиться :)", "{self}, а тебя как зовут?", "зови меня {self}" } };
    static Pools const insult = {
        { "ну и ладно", "ок", "угу" },
        { "ну ок", "некрасиво", "ладно", "ну ничего себе" },
        { "это не очень вежливо", "не надо так", "ладно... забудем :)" } };
    static Pools const compliment = {
        { "ок", "спс", "ага" },
        { "спасибо!", "спс", "спасибо, ты тоже", "приятно" },
        { "ой, спасибо :)", "спасибо, очень мило!", "спасибо, ты тоже супер :)" } };
    static Pools const bye = {
        { "пока", "бб", "давай" },
        { "бб", "пока!", "ещё увидимся", "давай, пока" },
        { "пока, береги себя :)", "ещё увидимся!", "хорошего дня, пока!" } };
    static Pools const greet_known = {
        { "йо", "ку", "здарова, {sender}" },
        { "привет, {sender}", "привет, {sender}!", "привет, как дела?", "здравствуй, {sender}" },
        { "привет, {sender}! вот это встреча :)", "привет, {sender}, жду команды", "здравствуй, {sender}, чем помочь?" } };
    static Pools const dir_here = {
        { "это тут", "ты уже здесь", "здесь" },
        { "я как раз там", "ты уже рядом, я тоже здесь" },
        { "я как раз там :)", "ты почти на месте, я в той же зоне" } };
    static Pools const dir = {
        { "{route}", "{dest}: {route}" },
        { "{dest}? {route}", "{route}", "{dest} - {route}" },
        { "{dest} - {route}", "{dest}? {route} :)", "{dest}: {route}. если заблудишься, нажми M - откроется карта" } };

    switch (intent)
    {
        case ConvIntent::HowAreYou: return how;
        case ConvIntent::WhereFrom: return from;
        case ConvIntent::WhereAreYou: return where;
        case ConvIntent::Level: return level;
        case ConvIntent::ClassSpec: return cls;
        case ConvIntent::WhatDoing: return doing;
        case ConvIntent::GroupInvite: return variant ? group_busy : group_free;
        case ConvIntent::QuestHelp: return variant ? quest_none : quest_have;
        case ConvIntent::Trade: return variant ? trade_none : trade_have;
        case ConvIntent::Guild: return variant ? guild_none : guild_have;
        case ConvIntent::Name: return name;
        case ConvIntent::Insult: return insult;
        case ConvIntent::Compliment: return compliment;
        case ConvIntent::Goodbye: return bye;
        case ConvIntent::Greeting: return greet_known;
        case ConvIntent::Directions: return variant ? dir_here : dir;
        default: break;
    }
    static Pools const empty;
    return empty;
}

// Light Warcraft humour, kept inoffensive. Tone-independent.
std::vector<std::string> const& Jokes(bool ru)
{
    static std::vector<std::string> const j = {
        "why did the murloc cross the road? mrglglgl",
        "how many paladins to change a lightbulb? none, they bubble and hearth",
        "a warrior walks into a bar. taunts everything. gets kicked out",
        "i asked a mage for a drink. now i have a very large pile of water",
        "what do you call a rogue with no stealth? a warrior",
        "my hearthstone and i have a lot in common, we're always on cooldown",
        "a hunter's pet walks into a bar. the hunter says 'no, not again'",
        "never trust a warlock who says 'trust me', he probably wants a soulstone placed",
        "healers never die of boredom, only of someone pulling the next pack",
    };
    static std::vector<std::string> const j_ru = {
        "почему мурлок перешёл дорогу? мргл-мргл-мргл",
        "сколько паладинов нужно, чтобы вкрутить лампочку? ни одного: они уходят в бабл и жмут камень возвращения",
        "воин заходит в бар. провоцирует всех. его выгоняют",
        "попросил мага сотворить попить. теперь у меня огромная куча воды",
        "как назвать разбойника без незаметности? воином",
        "у меня с камнем возвращения много общего: мы оба вечно на перезарядке",
        "питомец охотника заходит в бар. охотник вздыхает: «только не снова»",
        "не верь чернокнижнику, который говорит «доверься мне»: ему просто нужен камень души",
        "лекари не умирают от скуки, только от того, кто сагрил следующую пачку",
    };
    return ru ? j_ru : j;
}

std::vector<std::string> const& FollowUps(bool ru)
{
    static std::vector<std::string> const f = { "you?", "and you?", "what about you?", "how about yourself?" };
    static std::vector<std::string> const f_ru = { "а ты?", "а у тебя?", "а у тебя как?", "а ты как?" };
    return ru ? f_ru : f;
}

std::string JoinProfessions(std::vector<std::string> const& p, bool ru)
{
    if (p.empty())
        return {};
    if (p.size() == 1)
        return p[0];
    return p[0] + (ru ? " и " : " and ") + p[1];
}

// Stable per-bot writing style: some bots type like chat kids (lower-case, no apostrophes), some use proper sentences.
bool IsCasual(uint32_t seed) { return (Mix(seed, 1) & 3u) != 0; }          // 75%
bool UsesSmiley(uint32_t seed) { return (Mix(seed, 2) & 3u) == 0; }        // 25%
bool UsesExclaim(uint32_t seed) { return (Mix(seed, 3) & 7u) == 0; }       // 12.5%

// Capitalises the pronoun in proper-sentence style: "i" -> "I", "im" -> "I'm", "i'll" -> "I'll".
std::string FixPronoun(std::string const& t)
{
    std::string out;
    size_t i = 0;
    while (i < t.size())
    {
        size_t j = i;
        while (j < t.size() && t[j] != ' ')
            ++j;
        std::string w = t.substr(i, j - i);
        std::string stem = w, tail;
        while (!stem.empty() && (stem.back() == ',' || stem.back() == '.' || stem.back() == '!' || stem.back() == '?' || stem.back() == ':'))
        {
            tail.insert(tail.begin(), stem.back());
            stem.pop_back();
        }
        if (stem == "i" || stem == "i'm" || stem == "i'll" || stem == "i'd" || stem == "i've")
            stem[0] = 'I';
        else if (stem == "im")
            stem = "I'm";
        out += stem + tail;
        if (j < t.size())
            out.push_back(' ');
        i = j + 1;
    }
    return out;
}

std::string ApplyStyle(std::string text, ConversationContext const& ctx)
{
    if (text.empty())
        return text;
    bool const smiley = ctx.tone != ConvTone::Rude && UsesSmiley(ctx.bot_seed) && text.find(":)") == std::string::npos;
    if (ctx.ru)
    {
        // Russian: the casual style is all lower case, the proper one opens with a capital letter and ends in a full stop.
        if (IsCasual(ctx.bot_seed))
        {
            text = L10n::LowerUtf8(text);
            if (smiley && text.back() != '?')
                text += " :)";
            return text;
        }
        text = UpperFirst(text);
        if (smiley && text.back() != '?')
            text += " :)";
        else if (text.back() != '?' && text.back() != '!' && text.back() != ')' && text.back() != '>' && text.back() != '.')
            text.push_back(UsesExclaim(ctx.bot_seed) && ctx.tone == ConvTone::Polite ? '!' : '.');
        return text;
    }
    if (IsCasual(ctx.bot_seed))
    {
        text = Lower(text);
        text.erase(std::remove(text.begin(), text.end(), '\''), text.end());
        if (smiley && text.back() != '?')
            text += " :)";
        return text;
    }
    text = FixPronoun(text);
    text[0] = char(std::toupper(static_cast<unsigned char>(text[0])));
    if (smiley && text.back() != '?')
        text += " :)";
    else if (text.back() != '?' && text.back() != '!' && text.back() != ')' && text.back() != '>' && text.back() != '.')
        text.push_back(UsesExclaim(ctx.bot_seed) && ctx.tone == ConvTone::Polite ? '!' : '.');
    return text;
}

std::string const& Pick(std::vector<std::string> const& v, uint32_t sel, size_t limit)
{
    size_t const n = std::max<size_t>(1, std::min(limit, v.size()));
    return v[sel % n];
}

std::mutex g_provider_mtx;
std::shared_ptr<ReplyProvider> g_provider;

} // namespace

char const* ConvIntentName(ConvIntent intent)
{
    switch (intent)
    {
        case ConvIntent::HowAreYou: return "how_are_you";
        case ConvIntent::WhereFrom: return "where_from";
        case ConvIntent::WhereAreYou: return "where_are_you";
        case ConvIntent::Level: return "level";
        case ConvIntent::ClassSpec: return "class";
        case ConvIntent::WhatDoing: return "what_doing";
        case ConvIntent::GroupInvite: return "group";
        case ConvIntent::QuestHelp: return "quest";
        case ConvIntent::Directions: return "directions";
        case ConvIntent::Trade: return "profession";
        case ConvIntent::Guild: return "guild";
        case ConvIntent::Name: return "name";
        case ConvIntent::Joke: return "joke";
        case ConvIntent::Insult: return "insult";
        case ConvIntent::Compliment: return "compliment";
        case ConvIntent::Goodbye: return "goodbye";
        case ConvIntent::Greeting: return "greeting";
        case ConvIntent::Unknown: break;
    }
    return "unknown";
}

std::string ConvRepeatReply(ConversationContext const& ctx, uint32_t sel, uint32_t repeat)
{
    static Pools const again = {
        { "again?", "i heard you", "yes yes" },
        { "you already said that", "heard you the first time", "still here, anything else?", "yep, i'm listening" },
        { "you already said that :) what's on your mind?", "i'm still here! anything i can help with?", "got it the first time, thanks :)" } };
    static Pools const insistent = {
        { "...", "what do you want", "stop spamming" },
        { "ok ok, i'm here", "you keep saying that, what do you need?", "i'm not going anywhere, ask away" },
        { "i'm right here, just tell me what you need :)", "happy to chat, what would you like to talk about?" } };
    static Pools const again_ru = {
        { "опять?", "я слышу", "да-да" },
        { "это уже было", "с первого раза дошло", "я тут, что-то ещё?", "ага, слушаю" },
        { "это уже было :) о чём думаешь?", "я тут! чем помочь?", "дошло с первого раза, спасибо :)" } };
    static Pools const insistent_ru = {
        { "...", "чего тебе", "хватит спамить" },
        { "да-да, я тут", "ты всё повторяешь, что нужно?", "я никуда не ухожу, спрашивай" },
        { "я здесь, просто скажи, что нужно :)", "с радостью поболтаю, о чём поговорим?" } };
    Pools const& p = repeat >= 3 ? (ctx.ru ? insistent_ru : insistent) : (ctx.ru ? again_ru : again);
    std::vector<std::string> const& pool = ctx.tone == ConvTone::Rude ? p.rude : ctx.tone == ConvTone::Polite ? p.polite : p.neutral;
    return ApplyStyle(Pick(pool, Mix(sel, repeat) >> 4, pool.size()), ctx);
}

void ConvSetProvider(std::shared_ptr<ReplyProvider> provider)
{
    std::lock_guard<std::mutex> lk(g_provider_mtx);
    g_provider = std::move(provider);
}

bool ConvReply(ConversationContext const& ctx, std::string const& norm, std::string const& message, uint32_t sel, bool addressed,
               std::string& out)
{
    std::string slot;
    ConvIntent const intent = ConvClassify(norm, &slot);

    if (intent == ConvIntent::Unknown)
    {
        if (!addressed)
            return false;
        std::shared_ptr<ReplyProvider> p;
        {
            std::lock_guard<std::mutex> lk(g_provider_mtx);
            p = g_provider;
        }
        std::string text;
        if (p && p->TryReply(ctx, message, text) && !text.empty())
        {
            out = std::move(text);
            return true;
        }
        return false;
    }

    // A stranger's hello keeps the caller's own pools (ike3 "hi %s, do i know you?"); only someone the bot knows is greeted here.
    if (intent == ConvIntent::Greeting && !ctx.knows_sender)
        return false;

    // Mix the per-bot seed in so two bots asked the same thing do not answer alike.
    uint32_t const s = Mix(sel, ctx.bot_seed);

    std::string text;
    if (intent == ConvIntent::Joke)
    {
        std::vector<std::string> const& jokes = Jokes(ctx.ru);
        text = jokes[s % jokes.size()];
    }
    else
    {
        Destination const* dest = intent == ConvIntent::Directions ? FindDestination(norm) : nullptr;
        bool variant = false;
        switch (intent)
        {
            case ConvIntent::GroupInvite: variant = ctx.in_group; break;
            case ConvIntent::QuestHelp:   variant = ctx.quest_title.empty(); break;
            case ConvIntent::Trade:       variant = ctx.professions.empty(); break;
            case ConvIntent::Guild:       variant = ctx.guild_name.empty(); break;
            case ConvIntent::Directions:
            {
                // the bot already stands in the zone asked about (its zone name is English or Russian, as the server's data)
                std::string const zone_l = L10n::FoldRu(ctx.zone);
                variant = !zone_l.empty() && (zone_l == slot || (dest && zone_l == L10n::FoldRu(dest->ru_name)));
                break;
            }
            default: break;
        }
        Pools const& pools = ctx.ru ? PoolsForRu(intent, variant) : PoolsFor(intent, variant);
        std::vector<std::string> const* pool = &pools.neutral;
        if (ctx.tone == ConvTone::Rude && !pools.rude.empty())
            pool = &pools.rude;
        else if (ctx.tone == ConvTone::Polite && !pools.polite.empty())
            pool = &pools.polite;
        if (pool->empty())
            return false;
        size_t const limit = ctx.length == ConvLength::Terse ? (pool->size() + 1) / 2 : pool->size();
        text = Pick(*pool, s >> 4, limit);

        std::string const zone = ctx.zone.empty() ? (ctx.ru ? "где-то тут" : "around here") : ctx.zone;
        std::string const doing = ctx.activity.empty() ? (ctx.ru ? "просто отдыхаю" : "just hanging around") : ctx.activity;
        std::string const cls = ctx.class_name.empty() ? (ctx.ru ? "путник" : "adventurer") : ctx.class_name;
        Replace(text, "{zone}", zone);
        Replace(text, "{doing}", doing);
        Replace(text, "{cls}", cls);
        Replace(text, "{lvl}", std::to_string(ctx.level));
        Replace(text, "{quest}", ctx.quest_title);
        Replace(text, "{prof}", JoinProfessions(ctx.professions, ctx.ru));
        Replace(text, "{guild}", ctx.guild_name);
        Replace(text, "{self}", ctx.self_name);
        Replace(text, "{sender}", ctx.sender_name);
        if (dest)
        {
            Replace(text, "{dest}", ctx.ru ? dest->ru_name : dest->name);
            Replace(text, "{route}", ctx.ru ? dest->ru_route : dest->route);
        }

        // Chatty bots sometimes hand the question back, the way a person making conversation does.
        if (ctx.length == ConvLength::Chatty && ctx.tone != ConvTone::Rude && text.back() != '?' &&
            (intent == ConvIntent::HowAreYou || intent == ConvIntent::WhatDoing || intent == ConvIntent::WhereFrom ||
             intent == ConvIntent::Level) &&
            (Mix(s, 7) & 1u))
        {
            while (!text.empty() && (text.back() == '!' || text.back() == '.'))
                text.pop_back();
            std::vector<std::string> const& follow = FollowUps(ctx.ru);
            text += ", " + Pick(follow, Mix(s, 8), follow.size());
        }
    }

    out = ApplyStyle(std::move(text), ctx);
    return !out.empty();
}

} // namespace Playerbot::V2

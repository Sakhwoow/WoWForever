// BotL10nText - Russian support for the bots as pure text: std only, header-only, no core headers (so the tables can be unit tested
// on their own). The session part (is this client ruRU?) lives in BotL10n.h.
//
// Three jobs, one table each:
//   * Arguments of the chat commands:  ArgWordToEnglish("воин") = "warrior", ("лекарь") = "healer", ("все") = "all", ...
//   * Orders to the bots (whisper, ';' party line, party / raid chat):  TranslateOrder("танки: тяни") = "tank: pull".
//     The English order then runs through the unchanged English parser, and in group chat through its allow-list, so a
//     Russian word is only ever as powerful as the English one it stands for.
//   * Replies of the bots:  TranslateReply("Raveni: staying here") = "Raveni: остаюсь на месте".
//
// Every Russian key in the tables is lower-case with "ё" written as "е" (FoldRu); the matchers fold the player's text the
// same way, so "Стой!", "СТОЙ" and "стой" are one word. Folding never changes the byte length of a text, which lets a
// match found in the folded copy be cut out of the original (an argument keeps the player's own spelling).
#pragma once

#include <array>
#include <cstddef>
#include <initializer_list>
#include <optional>
#include <string>
#include <string_view>

namespace Playerbot::V2::L10n {

// ---- text helpers ------------------------------------------------------------------------------------------------

inline bool HasNonAscii(std::string_view s)
{
    for (char c : s)
        if (static_cast<unsigned char>(c) >= 0x80)
            return true;
    return false;
}

// Lower-case copy of ASCII and of Cyrillic UTF-8 (А-Я and Ё, two bytes each); every other byte is copied as it is. The copy
// has the same length as the input.
inline std::string LowerUtf8(std::string_view s)
{
    std::string out(s);
    for (size_t i = 0; i < out.size(); ++i)
    {
        unsigned char const c = static_cast<unsigned char>(out[i]);
        if (c >= 'A' && c <= 'Z')
        {
            out[i] = static_cast<char>(c + 32);
        }
        else if (c == 0xD0 && i + 1 < out.size())
        {
            unsigned char const d = static_cast<unsigned char>(out[i + 1]);
            if (d >= 0x90 && d <= 0x9F)          // А..П -> а..п
            {
                out[i + 1] = static_cast<char>(d + 0x20);
            }
            else if (d >= 0xA0 && d <= 0xAF)     // Р..Я -> р..я (the second byte moves into the 0xD1 block)
            {
                out[i] = static_cast<char>(0xD1);
                out[i + 1] = static_cast<char>(d - 0x20);
            }
            else if (d == 0x81)                  // Ё -> ё
            {
                out[i] = static_cast<char>(0xD1);
                out[i + 1] = static_cast<char>(0x91);
            }
            ++i;
        }
    }
    return out;
}

// LowerUtf8 plus "ё" -> "е": the form the tables below are written in.
inline std::string FoldRu(std::string_view s)
{
    std::string out = LowerUtf8(s);
    for (size_t i = 0; i + 1 < out.size(); ++i)
        if (static_cast<unsigned char>(out[i]) == 0xD1 && static_cast<unsigned char>(out[i + 1]) == 0x91)
        {
            out[i] = static_cast<char>(0xD0);
            out[i + 1] = static_cast<char>(0xB5);
            ++i;
        }
    return out;
}

inline std::string_view TrimBlanks(std::string_view s)
{
    while (!s.empty() && (s.front() == ' ' || s.front() == '\t' || s.front() == '\r' || s.front() == '\n'))
        s.remove_prefix(1);
    while (!s.empty() && (s.back() == ' ' || s.back() == '\t' || s.back() == '\r' || s.back() == '\n'))
        s.remove_suffix(1);
    return s;
}

// The first `max_bytes` bytes of `s`, shortened so that no UTF-8 character is cut in half.
inline std::string TruncUtf8(std::string_view s, size_t max_bytes)
{
    if (s.size() <= max_bytes)
        return std::string(s);
    size_t n = max_bytes;
    while (n > 0 && (static_cast<unsigned char>(s[n]) & 0xC0) == 0x80)   // s[n] is a continuation byte: back up to the lead byte
        --n;
    return std::string(s.substr(0, n));
}

inline bool StartsWith(std::string_view s, std::string_view prefix)
{
    return s.size() >= prefix.size() && s.substr(0, prefix.size()) == prefix;
}

// ---- arguments of the chat commands ------------------------------------------------------------------------------

struct WordPair
{
    std::string_view ru;
    std::string_view en;
};

// Classes: nominative and accusative ("добавить воина"), singular and plural, the short slang forms.
inline constexpr WordPair kClassWords[] = {
    { "воин", "warrior" }, { "воина", "warrior" }, { "воины", "warrior" }, { "вар", "warrior" }, { "варриор", "warrior" },
    { "паладин", "paladin" }, { "паладина", "paladin" }, { "паладины", "paladin" }, { "пал", "paladin" }, { "пала", "paladin" },
    { "охотник", "hunter" }, { "охотника", "hunter" }, { "охотники", "hunter" }, { "охотница", "hunter" }, { "охотницу", "hunter" },
    { "хант", "hunter" }, { "хантер", "hunter" },
    { "разбойник", "rogue" }, { "разбойника", "rogue" }, { "разбойники", "rogue" }, { "разбойница", "rogue" },
    { "разбойницу", "rogue" }, { "рога", "rogue" }, { "рог", "rogue" },
    { "жрец", "priest" }, { "жреца", "priest" }, { "жрецы", "priest" }, { "жрица", "priest" }, { "жрицу", "priest" },
    { "прист", "priest" }, { "приест", "priest" },
    { "шаман", "shaman" }, { "шамана", "shaman" }, { "шаманы", "shaman" }, { "шаманка", "shaman" }, { "шаманку", "shaman" },
    { "шам", "shaman" },
    { "маг", "mage" }, { "мага", "mage" }, { "маги", "mage" }, { "магичка", "mage" }, { "магичку", "mage" },
    { "чернокнижник", "warlock" }, { "чернокнижника", "warlock" }, { "чернокнижники", "warlock" },
    { "чернокнижница", "warlock" }, { "чернокнижницу", "warlock" }, { "чернок", "warlock" }, { "лок", "warlock" },
    { "варлок", "warlock" },
    { "друид", "druid" }, { "друида", "druid" }, { "друиды", "druid" }, { "друидка", "druid" }, { "друидку", "druid" },
    { "дк", "dk" },
};

// Roles: tank, healer ("лекарь" / "хил"), damage dealer ("урон" / "дд").
inline constexpr WordPair kRoleWords[] = {
    { "танк", "tank" }, { "танка", "tank" }, { "танки", "tank" }, { "тенк", "tank" }, { "защитник", "tank" },
    { "защитника", "tank" },
    { "лекарь", "healer" }, { "лекаря", "healer" }, { "лекари", "healer" }, { "хил", "healer" }, { "хила", "healer" },
    { "хилер", "healer" }, { "хилера", "healer" }, { "целитель", "healer" }, { "целителя", "healer" },
    { "урон", "dps" }, { "дд", "dps" }, { "ддшник", "dps" }, { "ддшника", "dps" }, { "дпс", "dps" }, { "дамаг", "dps" },
    { "дамагер", "dps" }, { "дамагдилер", "dps" },
};

// Races. The Classic ones are what `.bot add` accepts; the others are the names ParseRace knows. A two-word name
// ("ночной эльф") is joined into one word by the caller (JoinRaceWords).
inline constexpr WordPair kRaceWords[] = {
    { "человек", "human" }, { "человека", "human" }, { "люди", "human" }, { "хуман", "human" }, { "чел", "human" },
    { "орк", "orc" }, { "орка", "orc" }, { "орки", "orc" }, { "орчиха", "orc" }, { "орчиху", "orc" },
    { "дворф", "dwarf" }, { "дворфа", "dwarf" }, { "дворфы", "dwarf" }, { "дварф", "dwarf" }, { "дварфа", "dwarf" },
    { "дворфиха", "dwarf" },
    { "ночнойэльф", "nightelf" }, { "ночногоэльфа", "nightelf" }, { "ночныеэльфы", "nightelf" },
    { "ночнаяэльфийка", "nightelf" }, { "ночнуюэльфийку", "nightelf" }, { "нэльф", "nightelf" }, { "эльф", "nightelf" },
    { "эльфа", "nightelf" }, { "эльфийка", "nightelf" }, { "эльфийку", "nightelf" },
    { "нежить", "undead" }, { "нежити", "undead" }, { "андед", "undead" }, { "отрекшийся", "undead" },
    { "отрекшегося", "undead" }, { "отрекшаяся", "undead" },
    { "таурен", "tauren" }, { "таурена", "tauren" }, { "тауренка", "tauren" }, { "тауренку", "tauren" },
    { "гном", "gnome" }, { "гнома", "gnome" }, { "гномы", "gnome" }, { "гномка", "gnome" }, { "гномку", "gnome" },
    { "тролль", "troll" }, { "тролля", "troll" }, { "тролли", "troll" }, { "троль", "troll" }, { "троля", "troll" },
    { "троллиха", "troll" }, { "троллиху", "troll" },
    // not playable as companions, but ParseRace (also used by the GM `.playerbot create`) knows them
    { "гоблин", "goblin" }, { "эльфкрови", "bloodelf" }, { "дреней", "draenei" }, { "ворген", "worgen" },
    { "пандарен", "pandaren" }, { "ночнорожденный", "nightborne" }, { "вульпера", "vulpera" },
    { "механогном", "mechagnome" }, { "драктир", "dracthyr" }, { "зандалар", "zandalari" }, { "култирасец", "kultiran" },
    { "магхар", "magharorc" },
};

inline constexpr WordPair kGenderWords[] = {
    { "м", "male" }, { "муж", "male" }, { "мужской", "male" }, { "мужчина", "male" }, { "мужик", "male" },
    { "ж", "female" }, { "жен", "female" }, { "женский", "female" }, { "женщина", "female" }, { "девушка", "female" },
};

// "all" and "saved" of `.bot call / dismiss / save / summon ...`.
inline constexpr WordPair kQuantityWords[] = {
    { "все", "all" }, { "всех", "all" }, { "всем", "all" },
    { "сохраненные", "saved" }, { "сохраненных", "saved" }, { "сохраненный", "saved" }, { "сохраненного", "saved" },
};

template <size_t N>
inline std::string_view FindWord(WordPair const (&table)[N], std::string_view folded)
{
    for (WordPair const& w : table)
        if (w.ru == folded)
            return w.en;
    return {};
}

// The English word a Russian class / role / race / gender / quantity word stands for. Other text comes back lower-cased
// (plain English words are therefore passed through, exactly as the English parsers expect them).
inline std::string ArgWordToEnglish(std::string_view token)
{
    std::string s = FoldRu(token);
    if (!HasNonAscii(s))
        return s;
    std::string_view en = FindWord(kClassWords, s);
    if (en.empty()) en = FindWord(kRoleWords, s);
    if (en.empty()) en = FindWord(kRaceWords, s);
    if (en.empty()) en = FindWord(kGenderWords, s);
    if (en.empty()) en = FindWord(kQuantityWords, s);
    return en.empty() ? s : std::string(en);
}

// "ночной" + "эльф" (and the feminine "ночная" + "эльфийка", "эльф" + "крови") are one race typed as two words. `first` and
// `second` are folded words; returns the joined word, or empty when they are no pair.
inline std::string JoinRaceWords(std::string_view first, std::string_view second)
{
    if ((first == "ночной" || first == "ночная" || first == "ночного" || first == "ночные") &&
        (second == "эльф" || second == "эльфийка" || second == "эльфа" || second == "эльфы" || second == "эльфийку"))
        return "ночнойэльф";
    if ((first == "эльф" || first == "эльфа") && second == "крови")
        return "эльфкрови";
    return {};
}

// ---- orders --------------------------------------------------------------------------------------------------------

struct OrderRule
{
    std::string_view ru;   // the whole order, folded
    std::string_view en;   // the English order it stands for
    bool group;            // may also be a bare line in party / raid chat (the English allow-list still has the last word)
};

// An order that takes an argument: `ru` is the folded start of the text (with its trailing blank), the argument is the rest.
struct ArgOrderRule
{
    std::string_view ru;
    std::string_view en;   // the English start, the argument is appended
    bool group;
};

// Whole-line orders. Single common words that a player may also write to other players ("кто", "лут") are whisper-only;
// the party-chat form of those is a phrase ("кто ты", "лут все").
inline constexpr OrderRule kOrderRules[] = {
    // follow
    { "следуй", "follow", true }, { "следуйте", "follow", true }, { "следовать", "follow", true },
    { "следуй за мной", "follow", true }, { "следуйте за мной", "follow", true }, { "следовать за мной", "follow", true },
    { "за мной", "follow", true }, { "иди за мной", "follow", true }, { "идите за мной", "follow", true },
    { "идем за мной", "follow", true }, { "сопровождай", "follow", true }, { "сопровождайте", "follow", true },
    { "ходи за мной", "follow", true }, { "ходите за мной", "follow", true },
    { "не следуй", "unfollow", false }, { "не следуйте", "unfollow", false }, { "отстань", "unfollow", false },
    // stay / hold
    { "стой", "stay", true }, { "стойте", "stay", true }, { "стоять", "stay", true }, { "стоим", "stay", true },
    { "стой на месте", "stay", true }, { "стойте на месте", "stay", true }, { "стоять на месте", "stay", true },
    { "жди", "stay", true }, { "ждите", "stay", true }, { "ждать", "stay", true }, { "оставайся", "stay", true },
    { "оставайтесь", "stay", true }, { "останься", "stay", true }, { "останьтесь", "stay", true }, { "замри", "stay", true },
    { "замрите", "stay", true }, { "не двигайся", "stay", true }, { "не двигайтесь", "stay", true },
    { "держать", "hold", true }, { "держать позицию", "hold", true }, { "держи позицию", "hold", true },
    { "держите позицию", "hold", true }, { "удерживай позицию", "hold", true }, { "удерживать позицию", "hold", true },
    // stance
    { "защита", "defensive", true }, { "оборона", "defensive", true }, { "защищайся", "defensive", true },
    { "защищайтесь", "defensive", true }, { "защитный режим", "defensive", true }, { "режим защиты", "defensive", true },
    { "оборонительный режим", "defensive", true }, { "в оборону", "defensive", true },
    { "агрессия", "aggressive", true }, { "агрессивно", "aggressive", true }, { "агрессивный", "aggressive", true },
    { "агрессивный режим", "aggressive", true }, { "режим агрессии", "aggressive", true },
    { "пассив", "passive", true }, { "пассивно", "passive", true }, { "пассивный", "passive", true },
    { "пассивный режим", "passive", true }, { "не нападать", "passive", true }, { "не нападай", "passive", true },
    { "не нападайте", "passive", true }, { "не атакуй", "passive", true }, { "не атакуйте", "passive", true },
    { "продолжай", "resume", true }, { "продолжайте", "resume", true }, { "продолжить", "resume", true },
    { "возобнови", "resume", true }, { "возобновить", "resume", true }, { "вольно", "resume", true },
    { "свободно", "resume", true }, { "автономно", "resume", true }, { "действуй самостоятельно", "resume", true },
    { "действуйте самостоятельно", "resume", true },
    // attack / assist / stop
    { "атака", "attack", true }, { "атакуй", "attack", true }, { "атакуйте", "attack", true }, { "атаковать", "attack", true },
    { "в атаку", "attack", true }, { "убей", "attack", true }, { "убейте", "attack", true }, { "убить", "attack", true },
    { "бей", "attack", true }, { "бейте", "attack", true }, { "в бой", "attack", true }, { "нападай", "attack", true },
    { "нападайте", "attack", true }, { "напасть", "attack", true }, { "фас", "attack", true },
    { "атакуй цель", "attack", true }, { "атакуйте цель", "attack", true }, { "атакуй мою цель", "attack", true },
    { "атакуйте мою цель", "attack", true }, { "бей цель", "attack", true }, { "убей цель", "attack", true },
    { "убейте цель", "attack", true },
    { "помоги", "assist", true }, { "помогай", "assist", true }, { "помогите", "assist", true }, { "помогайте", "assist", true },
    { "ассист", "assist", true }, { "ассистите", "assist", true },
    { "стоп", "stop", false }, { "отбой", "disengage", true }, { "отставить", "disengage", true },
    { "хватит", "disengage", false }, { "прекрати", "disengage", false }, { "прекратите", "disengage", false },
    // pull / fall back / rally / flee / come
    { "тяни", "pull", true }, { "тяните", "pull", true }, { "тянуть", "pull", true }, { "тянем", "pull", true },
    { "потяни", "pull", true }, { "потяните", "pull", true }, { "пулл", "pull", true }, { "пул", "pull", true },
    { "тяни моба", "pull", true }, { "тяните моба", "pull", true }, { "тяни цель", "pull", true },
    { "тяните цель", "pull", true },
    { "тяни назад", "pull back", true }, { "тяните назад", "pull back", true }, { "тяни и назад", "pull back", true },
    { "тяните и назад", "pull back", true }, { "тяни и возвращайся", "pull back", true }, { "пулл назад", "pull back", true },
    { "пул назад", "pull back", true }, { "оттяни", "pull back", true }, { "оттяните", "pull back", true },
    { "оттянуть", "pull back", true },
    { "тяни по метке", "pull rti", true }, { "тяните по метке", "pull rti", true }, { "тяни метку", "pull rti", true },
    { "отход", "fallback", true }, { "отходим", "fallback", true }, { "отходи", "fallback", true },
    { "отходите", "fallback", true }, { "отходить", "fallback", true }, { "назад", "fallback", true },
    { "отступление", "fallback", true }, { "отступаем", "fallback", true }, { "к точке сбора", "fallback", true },
    { "на точку сбора", "fallback", true }, { "отойти", "fallback", true }, { "отойдите", "fallback", true },
    { "сбор здесь", "rally here", true }, { "точка сбора здесь", "rally here", true }, { "место сбора здесь", "rally here", true },
    { "собираемся здесь", "rally here", true }, { "сбор тут", "rally here", true }, { "точка сбора", "rally here", true },
    { "беги", "flee", true }, { "бегите", "flee", true }, { "бежим", "flee", true }, { "убегай", "flee", true },
    { "убегайте", "flee", true }, { "спасайся", "flee", true }, { "спасайтесь", "flee", true }, { "отступай", "flee", true },
    { "отступайте", "flee", true }, { "отступи", "flee", true }, { "бегство", "flee", true }, { "беги ко мне", "flee", true },
    { "бегите ко мне", "flee", true },
    { "ко мне", "come", true }, { "иди ко мне", "come", true }, { "идите ко мне", "come", true }, { "ко мне все", "come", true },
    { "иди сюда", "come", true }, { "идите сюда", "come", true }, { "подойди", "come", true }, { "подойдите", "come", true },
    { "подойди ко мне", "come", true }, { "подойдите ко мне", "come", true }, { "сюда", "come", false },
    { "призови", "summon", true }, { "призовите", "summon", true }, { "призыв", "summon", true },
    { "отпусти", "release", true }, { "отпустите", "release", true }, { "отпусти дух", "release", true },
    { "отпустите дух", "release", true }, { "отпустить дух", "release", true }, { "освободи дух", "release", true },
    { "освободите дух", "release", true }, { "выйти из тела", "release", true },
    // quests
    { "задания", "quests", true }, { "квесты", "quests", true }, { "список заданий", "quests", true },
    { "список квестов", "quests", true }, { "мои задания", "quests", true }, { "мои квесты", "quests", true },
    { "журнал заданий", "quests", true }, { "журнал квестов", "quests", true },
    { "принять", "accept", true }, { "прими", "accept", true }, { "примите", "accept", true },
    { "принять задания", "accept", true }, { "прими задания", "accept", true }, { "примите задания", "accept", true },
    { "принять квесты", "accept", true }, { "прими квесты", "accept", true }, { "возьми задания", "accept", true },
    { "возьмите задания", "accept", true }, { "возьми квесты", "accept", true },
    { "принять все", "accept all", true }, { "прими все", "accept all", true }, { "примите все", "accept all", true },
    { "принять все задания", "accept all", true }, { "прими все задания", "accept all", true },
    { "принять все квесты", "accept all", true },
    { "сдать", "turn in", true }, { "сдай", "turn in", true }, { "сдайте", "turn in", true },
    { "сдать задания", "turn in", true }, { "сдай задания", "turn in", true }, { "сдайте задания", "turn in", true },
    { "сдать квесты", "turn in", true }, { "сдай квесты", "turn in", true }, { "сдать выполненные", "turn in", true },
    { "сдай выполненные", "turn in", true },
    { "поделиться", "share", true }, { "поделись", "share", true }, { "поделитесь", "share", true },
    { "поделиться заданиями", "share", true }, { "поделись заданиями", "share", true },
    { "поделитесь заданиями", "share", true }, { "поделись квестами", "share", true },
    { "поделиться квестами", "share", true },
    // gear orders
    { "надеть улучшения", "equip upgrades", true }, { "надень улучшения", "equip upgrades", true },
    { "надеть лучшее", "equip upgrades", true }, { "надень лучшее", "equip upgrades", true },
    { "одень лучшее", "equip upgrades", true }, { "одеть лучшее", "equip upgrades", true },
    { "надень лучшую экипировку", "equip upgrades", true }, { "надеть лучшую экипировку", "equip upgrades", true },
    { "улучшения", "equip upgrades", false },
    // questions and housekeeping
    { "помощь", "help", true }, { "справка", "help", true }, { "команды", "commands", false },
    { "кто", "who", false }, { "кто ты", "who", true }, { "ты кто", "who", true }, { "представься", "who", true },
    { "представьтесь", "who", true },
    { "статы", "stats", false }, { "статистика", "stats", false }, { "характеристики", "stats", false },
    { "покажи статы", "stats", true }, { "покажи характеристики", "stats", true },
    { "экипировка", "gear", false }, { "снаряжение", "gear", false }, { "покажи экипировку", "gear", true },
    { "покажи снаряжение", "gear", true },
    { "инвентарь", "inv", false }, { "сумки", "inv", false }, { "деньги", "money", false }, { "золото", "money", false },
    { "лут", "loot", false }, { "добыча", "loot", false }, { "лут все", "loot all", true }, { "лутай все", "loot all", true },
    { "лутать все", "loot all", true },
    { "продай серое", "sell grey", true }, { "продай серые", "sell grey", true }, { "продать серое", "sell grey", true },
    { "продай хлам", "sell grey", true }, { "продать хлам", "sell grey", true }, { "продай мусор", "sell grey", true },
    { "продать мусор", "sell grey", true },
    { "починись", "repair", true }, { "починитесь", "repair", true }, { "чинись", "repair", true },
    { "почини снаряжение", "repair", true }, { "починить снаряжение", "repair", true }, { "отремонтируйся", "repair", true },
    { "ремонт", "repair", false },
    // formation, spacing, main tank
    { "плотный строй", "tight", true }, { "обычный строй", "close", true }, { "широкий строй", "spread out", true },
    { "рассредоточиться", "spread out", true }, { "рассредоточьтесь", "spread out", true },
    { "растянитесь", "spread out", true },
    { "главный танк", "set main tank", true },
    // single actions (whisper)
    { "сядь", "sit", false }, { "встань", "stand", false }, { "слезь", "dismount", false }, { "в седло", "mount", false },
    { "домой", "hearth", false }, { "покинь группу", "leave", false }, { "выйди из группы", "leave", false },
    { "пригласи", "invite", false }, { "пригласи меня", "invite", false }, { "сброс", "reset", false },
    { "сбрось", "reset", false }, { "проверка готовности", "readycheck", false }, { "готовность", "readycheck", false },
};

inline constexpr ArgOrderRule kArgOrderRules[] = {
    { "бросить задание ", "drop quest ", true }, { "брось задание ", "drop quest ", true },
    { "бросить квест ", "drop quest ", true }, { "брось квест ", "drop quest ", true },
    { "бросьте задание ", "drop quest ", true },
    { "бросить ", "drop ", false }, { "брось ", "drop ", false },
    { "принять ", "accept ", false }, { "прими ", "accept ", false }, { "возьми ", "accept ", false },
    { "сдать ", "turn in ", false }, { "сдай ", "turn in ", false },
    { "поделись ", "share ", false }, { "поделиться ", "share ", false },
    { "надеть ", "equip ", false }, { "надень ", "equip ", false }, { "одень ", "equip ", false }, { "одеть ", "equip ", false },
    { "создать ", "craft ", false }, { "создай ", "craft ", false }, { "скрафти ", "craft ", false },
    { "изготовь ", "craft ", false }, { "крафт ", "craft ", false },
    { "главный танк ", "set main tank ", true }, { "главным танком ", "set main tank ", true },
    { "назначь главным танком ", "set main tank ", true }, { "назначить главным танком ", "set main tank ", true },
    { "сделай главным танком ", "set main tank ", true },
};

inline std::string_view FormationWordToEnglish(std::string_view w)
{
    static constexpr WordPair kWords[] = {
        { "круг", "circle" }, { "кругом", "circle" }, { "кольцо", "ring" }, { "кольцом", "ring" }, { "стрелка", "arrow" },
        { "стрелкой", "arrow" }, { "клин", "wedge" }, { "клином", "wedge" }, { "линия", "line" }, { "линией", "line" },
        { "шеренга", "line" }, { "колонна", "column" }, { "колонной", "column" }, { "нет", "none" }, { "без", "none" },
        { "свободно", "none" }, { "обычный", "none" },
    };
    return FindWord(kWords, w);
}

inline std::string_view SpacingWordToEnglish(std::string_view w)
{
    static constexpr WordPair kWords[] = {
        { "плотно", "tight" }, { "тесно", "tight" }, { "близко", "close" }, { "обычно", "close" }, { "широко", "spread" },
        { "свободно", "spread" }, { "разреженно", "spread" },
    };
    return FindWord(kWords, w);
}

// The word before ':' of a prefixed order: who the order is for ("все: стой", "танки: тяни", "маги: атака").
inline std::optional<std::string> AddressWordToEnglish(std::string_view w)
{
    static constexpr WordPair kWords[] = {
        { "все", "all" }, { "всем", "all" }, { "всех", "all" },
        { "отряд", "squad" }, { "отряду", "squad" }, { "группа", "squad" }, { "группе", "squad" },
        { "здесь", "here" }, { "тут", "here" }, { "рядом", "here" },
        { "танки", "tank" }, { "танк", "tank" }, { "танкам", "tank" }, { "танков", "tank" },
        { "лекари", "healer" }, { "лекарь", "healer" }, { "лекарям", "healer" }, { "хилы", "healer" }, { "хил", "healer" },
        { "хилам", "healer" }, { "хилеры", "healer" }, { "хилер", "healer" }, { "целители", "healer" },
        { "урон", "dps" }, { "дд", "dps" }, { "дпс", "dps" }, { "дамагеры", "dps" }, { "дамагер", "dps" },
        { "ддшники", "dps" },
        { "меченые", "marked" }, { "помеченные", "marked" },
    };
    if (std::string_view en = FindWord(kWords, w); !en.empty())
        return std::string(en);
    if (std::string_view en = FindWord(kClassWords, w); !en.empty())
        return std::string(en);
    return std::nullopt;
}

// Removes the first of `prefixes` that `text` starts with. True when one was removed.
inline bool TakePrefix(std::string_view& text, std::initializer_list<std::string_view> prefixes)
{
    for (std::string_view p : prefixes)
        if (StartsWith(text, p))
        {
            text.remove_prefix(p.size());
            return true;
        }
    return false;
}

// `cmd` is one order (no address prefix), folded; `orig` is the same text in the player's own spelling (same length).
inline std::optional<std::string> TranslateCommand(std::string_view cmd, std::string_view orig, bool group)
{
    for (OrderRule const& r : kOrderRules)
        if (cmd == r.ru && (r.group || !group))
            return std::string(r.en);

    // formation / spacing / distance
    {
        std::string_view rest = cmd;
        if (TakePrefix(rest, { "формация ", "строй ", "построение " }))
        {
            std::string_view en = FormationWordToEnglish(TrimBlanks(rest));
            if (!en.empty())
                return "formation " + std::string(en);
            return std::nullopt;
        }
        rest = cmd;
        if (TakePrefix(rest, { "интервал " }))
        {
            std::string_view en = SpacingWordToEnglish(TrimBlanks(rest));
            if (!en.empty())
                return "spacing " + std::string(en);
            return std::nullopt;
        }
        rest = cmd;
        if (TakePrefix(rest, { "дистанция следования ", "дистанция ", "расстояние " }))
        {
            rest = TrimBlanks(rest);
            // an optional unit after the number: "8", "8 ярдов", "8 ярд", "8 м"
            size_t const sp = rest.find(' ');
            std::string_view num = rest.substr(0, sp);
            if (sp != std::string_view::npos)
            {
                std::string_view const unit = TrimBlanks(rest.substr(sp + 1));
                if (unit != "ярдов" && unit != "ярда" && unit != "ярд" && unit != "м")
                    return std::nullopt;
            }
            bool digits = !num.empty() && num.size() <= 5;
            std::string number;
            for (char c : num)
            {
                if ((c >= '0' && c <= '9') || c == '.')
                    number.push_back(c);
                else if (c == ',')
                    number.push_back('.');
                else
                    digits = false;
            }
            if (digits && !number.empty())
                return "distance " + number;
            return std::nullopt;
        }
    }

    // "следуй за <кем>": by role or by name (whisper only)
    if (!group)
    {
        std::string_view rest = cmd;
        if (TakePrefix(rest, { "следуй за ", "следуйте за ", "иди за ", "идите за ", "ходи за " }))
        {
            std::string_view const who = TrimBlanks(rest);
            if (who.empty())
                return std::nullopt;
            if (who == "танком" || who == "танк" || who == "танку")
                return std::string("follow tank");
            if (who == "лекарем" || who == "лекарь" || who == "хилом" || who == "хил")
                return std::string("follow healer");
            if (who == "лидером" || who == "лидер" || who == "главным")
                return std::string("follow leader");
            std::string_view const name = TrimBlanks(orig.substr(cmd.size() - who.size()));
            return "follow " + std::string(name);
        }
    }

    // orders with an argument: the argument keeps the player's spelling
    for (ArgOrderRule const& r : kArgOrderRules)
    {
        if (group && !r.group)
            continue;
        if (cmd.size() > r.ru.size() && StartsWith(cmd, r.ru))
        {
            std::string_view const arg = TrimBlanks(orig.substr(r.ru.size()));
            if (arg.empty())
                continue;
            // "надень улучшения" and friends are whole orders; any other thing after "надень" is an item name or link
            return std::string(r.en) + std::string(arg);
        }
    }
    return std::nullopt;
}

// A Russian order (or an address prefix plus one) as the English line the parsers read. nullopt when `line` is plain ASCII or
// is no order. `group` = a bare party / raid chat line: no address prefixes, only the words allowed there.
inline std::optional<std::string> TranslateOrder(std::string_view line, bool group)
{
    if (!HasNonAscii(line))
        return std::nullopt;
    // blanks around the line and the "!" / "." / "," a player puts after an order
    size_t b = 0, e = line.size();
    auto blank = [](char c) { return c == ' ' || c == '\t' || c == '\r' || c == '\n'; };
    while (b < e && blank(line[b]))
        ++b;
    while (e > b && (blank(line[e - 1]) || line[e - 1] == '!' || line[e - 1] == '.' || line[e - 1] == ','))
        --e;
    if (b >= e)
        return std::nullopt;
    std::string_view const orig = line.substr(b, e - b);
    std::string const folded = FoldRu(orig);
    std::string_view const s = folded;

    size_t at = 0;
    std::string prefix;
    if (!group)
    {
        size_t const colon = s.find(':');
        size_t const space = s.find(' ');
        if (colon != std::string_view::npos && (space == std::string_view::npos || colon < space))
        {
            // A role, a class or "all" in Russian, else the word is taken for a bot's name and stays as it was typed.
            std::optional<std::string> const addr = AddressWordToEnglish(s.substr(0, colon));
            prefix = (addr ? *addr : std::string(orig.substr(0, colon))) + ": ";
            at = colon + 1;
            while (at < s.size() && s[at] == ' ')
                ++at;
        }
    }
    // "все стой", "всем стоять": every bot. Party chat reaches every bot anyway.
    bool every = false;
    if (prefix.empty())
    {
        std::string_view rest = s.substr(at);
        if (StartsWith(rest, "все ") || StartsWith(rest, "всем "))
        {
            every = true;
            at += rest.find(' ') + 1;
        }
    }
    if (at >= s.size())
        return std::nullopt;
    std::optional<std::string> const en = TranslateCommand(s.substr(at), orig.substr(at), group);
    if (!en)
        return std::nullopt;
    if (every && !group)
        prefix = "all: ";
    return prefix + *en;
}

// ---- replies of the bots (English -> Russian) ----------------------------------------------------------------------

struct ReplyRule
{
    std::string_view en;   // "{}" matches any run of characters
    std::string_view ru;   // "{0}" = the first match, "{1}" = the second ...; "{1w}" runs the match through kReplyWords
};

// Words inside a reply (formation, marker, role, class and activity names) that are translated on their own.
inline constexpr WordPair kReplyWords[] = {
    { "circle", "круг" }, { "ring", "кольцо" }, { "arrow", "стрелка" }, { "wedge", "клин" }, { "v", "клин" },
    { "line", "линия" }, { "column", "колонна" }, { "col", "колонна" }, { "none", "нет" }, { "free", "свободный" },
    { "tight", "плотный" }, { "close", "обычный" }, { "spread", "широкий" },
    { "star", "звезда" }, { "diamond", "ромб" }, { "triangle", "треугольник" }, { "moon", "луна" }, { "square", "квадрат" },
    { "cross", "крест" }, { "skull", "череп" },
    { "tank", "танк" }, { "healer", "лекарь" }, { "dps", "урон" }, { "cc", "контроль" }, { "kill", "убийство" },
    { "no role", "без роли" }, { "no spec", "без специализации" },
    { "warrior", "воин" }, { "paladin", "паладин" }, { "hunter", "охотник" }, { "rogue", "разбойник" }, { "priest", "жрец" },
    { "shaman", "шаман" }, { "mage", "маг" }, { "warlock", "чернокнижник" }, { "druid", "друид" }, { "adventurer", "путник" },
    { "following you", "следую за вами" }, { "holding position", "держу позицию" }, { "staying put", "стою на месте" },
    { "attacking on your order", "атакую по вашему приказу" }, { "stopped, not fighting", "бой прекращён" },
    { "carrying out an order", "выполняю приказ" }, { "falling back", "отхожу" }, { "dead", "мёртв(а)" },
    { "fighting", "в бою" }, { "idle", "бездействую" },
};

inline constexpr ReplyRule kReplyRules[] = {
    // confirmations of the movement and stance orders
    { "{}: following at {} yards", "{0}: следую за вами, дистанция {1} ярд." },
    { "Follow distance {} yards", "Дистанция следования: {0} ярд." },
    { "{}: staying here", "{0}: остаюсь на месте" },
    { "{}: not attacking yet (raid pull gate: the main tank opens)", "{0}: пока не атакую (рейдовый пулл: начинает главный танк)" },
    { "{}: attacking {}", "{0}: атакую цель: {1}" },
    { "{}: coming to you", "{0}: иду к вам" },
    { "{}: fleeing to you", "{0}: убегаю к вам" },
    { "{}: stopped following", "{0}: больше не следую за вами" },
    { "{}: stopped", "{0}: бой прекращён" },
    { "{}: falling back", "{0}: отхожу к точке сбора" },
    { "{}: rally point set", "{0}: точка сбора назначена" },
    { "{}: not a tank, ignoring pull back", "{0}: я не танк, оттяжку пропускаю" },
    { "{}: formation {}", "{0}: построение — {1w}" },
    { "{}: spacing {}", "{0}: интервал — {1w}" },
    { "{}: range {}", "{0}: дистанция боя — {1}" },
    { "{}: tight", "{0}: плотный строй" },
    { "{}: close", "{0}: обычный строй" },
    { "{}: spread out", "{0}: широкий строй" },
    { "{}: spaced out", "{0}: широкий строй" },
    { "Hold: holding position.", "Держу позицию." },
    { "Resume: autonomous.", "Продолжаю: действую самостоятельно." },
    { "Reset: cleared movement / attack / cast.", "Сброс: движение, атака и заклинание отменены." },
    { "Unfollow: stopped.", "Больше не следую за вами." },
    { "Follow: stopped.", "Больше не следую за вами." },
    { "Attack: select a target first.", "Атака: сначала выберите цель." },
    { "{}: passive, defending only until you say attack or pull", "{0}: пассивный режим — только защищаюсь, пока вы не скажете «атака» или «тяни»" },
    { "{}: aggressive, attacking anything hostile within {} yards of you", "{0}: агрессивный режим — атакую всех врагов в радиусе {1} ярд. от вас" },
    { "{}: defensive, holding here and fighting only what attacks", "{0}: защитный режим — держу позицию и сражаюсь только с теми, кто нападает" },
    { "{}: you are already in my group", "{0}: вы уже в моей группе" },
    { "{}: invite sent", "{0}: приглашение отправлено" },
    // pull back, tank markers, assignments, raid report
    { "Pull back: no mob carries my icon.", "Оттяжка: ни один моб не помечен моим значком." },
    { "Pull back: select an enemy first.", "Оттяжка: сначала выберите врага." },
    { "Pull back: pulling {} to the rally point.", "Оттяжка: тяну {0} к точке сбора." },
    { "Pull back: pulling {} to you.", "Оттяжка: тяну {0} к вам." },
    { "Pull back: pulling {} to where I stand.", "Оттяжка: тяну {0} туда, где стою." },
    { "Rti raid: not in a group.", "Рейд: вы не в группе." },
    { "{}: tank marker cleared", "{0}: метка танка снята" },
    { "{}: tank on {}", "{0}: танкую метку — {1w}" },
    { "{}: cc on {}", "{0}: контроль на метке — {1w}" },
    { "{}: kill {}", "{0}: убиваю метку — {1w}" },
    { "{}: assignment cleared", "{0}: назначение снято" },
    { "Assign: all assignments cleared.", "Назначения: все сняты." },
    { "Assign: {} cleared.", "Назначения: {0w} снято." },
    { "Assign: no group member '{}'.", "Назначения: в группе нет игрока «{0}»." },
    { "Assign: no bot '{}' in the group.", "Назначения: в группе нет бота «{0}»." },
    { "Assign: target one of your bots first.", "Назначения: сначала выберите одного из ваших ботов." },
    { "Assign: marker is star|circle|diamond|triangle|moon|square|cross|skull.", "Назначения: метка — star|circle|diamond|triangle|moon|square|cross|skull (звезда, круг, ромб, треугольник, луна, квадрат, крест, череп)." },
    { "Assign: role is tank|cc|kill.", "Назначения: роль — tank|cc|kill (танк, контроль, убийство)." },
    { "Assign: skull is the kill mark, a bot cannot crowd-control it. Pick another marker.", "Назначения: череп — метка убийства, бот не может держать её в контроле. Выберите другую метку." },
    { "Assign: skull and cross are kill orders, a tank cannot carry them. Pick another marker.", "Назначения: череп и крест — метки убийства, танк не может их держать. Выберите другую метку." },
    { "Assign: Playerbot.Behavior.TankMarkers is off.", "Назначения: параметр Playerbot.Behavior.TankMarkers выключен." },
    { "Assign: Playerbot.Behavior.MarkCc is off.", "Назначения: параметр Playerbot.Behavior.MarkCc выключен." },
    { "Assign: {} -> {} ({}).", "Назначения: {0} → {1w} ({2w})." },
    { "Rti: {} | cc: {}", "Метки убийства: {0} | контроль: {1}" },
    { "Rti set to: {}", "Метки убийства: {0}" },
    { "Rti cc set to: {}", "Метки контроля: {0}" },
    { "Squad: 0 bots match '{}'.", "Отряд: подходящих ботов нет («{0}»)." },
    { "Squad ({}): {} / {} bot(s) processed.", "Отряд ({0}): обработано ботов — {1} из {2}." },
    { "{}: no order '{}' (unknown, or not yours to give)", "{0}: нет такого приказа «{1}» (неизвестен или вы не можете его отдавать)" },
    // questions
    { "Orders (whisper me, or say it in party / raid chat): follow, stay, come, summon, attack, flee, hold, resume, passive, defensive, aggressive.",
      "Приказы (шепните мне или напишите в группу/рейд): «за мной», «стой», «ко мне», «призови», «атака», «беги», «держать», «продолжай», «пассив», «защита», «агрессия». Английские слова тоже работают." },
    { "Ask: who, stats, gear, quests, inv, money. Quests: accept [all], drop <quest>, turn in, share.",
      "Вопросы: «кто», «статы», «экипировка», «задания», «инвентарь», «деньги». Задания: «принять [все]», «бросить <задание>», «сдать», «поделиться»." },
    { "Town and loot: sell grey, repair, loot / loot all. Raid: pull, pull back, fall back, rally here, formation <x>, spacing <x>, distance <n>, assign, rti.",
      "Город и добыча: «продай серое», «починись», «лут» / «лут все». Рейд: «тяни», «тяни назад», «отход», «сбор здесь», «строй <x>», «интервал <x>», «дистанция <n>», assign, rti." },
    { "The whole verb index: 'commands'. Address several bots: all: / tank: / healer: / dps: / <class>: / <Name>: before the order.",
      "Полный список слов: «команды». Чтобы обратиться к нескольким ботам, поставьте перед приказом «все:», «танки:», «лекари:», «дд:», «<класс>:» или «<Имя>:»." },
    { "{}: still waking up", "{0}: ещё загружаюсь" },
    { "{}: level {} {} ({}), {} - {}", "{0}: уровень {1}, {2w} ({3}), {4w} — {5w}" },
    { "{}: health {}/{} ({}%), mana {}/{}, item level {}, armor {}, str {} agi {} sta {} int {}, crit {}%",
      "{0}: здоровье {1}/{2} ({3}%), мана {4}/{5}, уровень предметов {6}, броня {7}, сила {8} ловк. {9} вын. {10} инт. {11}, крит {12}%" },
    { "{}: health {}/{} ({}%), item level {}, armor {}, str {} agi {} sta {} int {}, crit {}%",
      "{0}: здоровье {1}/{2} ({3}%), уровень предметов {4}, броня {5}, сила {6} ловк. {7} вын. {8} инт. {9}, крит {10}%" },
    { "{}: {} pieces worn, avg item level {}, best: {}; {} free bag slots; {}g {}s {}c",
      "{0}: надето предметов — {1}, средний уровень {2}, лучшие: {3}; свободных ячеек в сумках — {4}; {5}з {6}с {7}м" },
    { "{}: {} pieces worn, avg item level {}; {} free bag slots; {}g {}s {}c",
      "{0}: надето предметов — {1}, средний уровень {2}; свободных ячеек в сумках — {3}; {4}з {5}с {6}м" },
    { "{}: looting everything, greys included, and rolling for myself", "{0}: беру всё, включая серые предметы, и бросаю кости за себя" },
    { "{}: need before greed, the usual rules", "{0}: «Мне это нужно» раньше «Не откажусь», как обычно" },
    { "{}: no vendor within 60 yards - select one and say it again, or walk me to one",
      "{0}: торговца в радиусе 60 ярдов нет — выберите его и повторите приказ или подведите меня к нему" },
    { "{}: nothing grey to sell", "{0}: серых предметов для продажи нет" },
    { "{}: walking to {} ({} yards); say 'sell grey' again when I am there", "{0}: иду к {1} ({2} ярд.); когда дойду, повторите «продай серое»" },
    { "{}: selling {} grey stack(s) to {}", "{0}: продаю серые предметы (стопок: {1}) торговцу {2}" },
    { "{}: no repair vendor within 60 yards - select one and say it again, or walk me to one",
      "{0}: ремонтника в радиусе 60 ярдов нет — выберите его и повторите приказ или подведите меня к нему" },
    { "{}: walking to {} ({} yards); say 'repair' again when I am there", "{0}: иду к {1} ({2} ярд.); когда дойду, повторите «починись»" },
    { "{}: repairing at {}", "{0}: чиню снаряжение у {1}" },
    { "{}: can't be summoned, I am dead - release or revive me first", "{0}: призыв невозможен — я мёртв(а), сначала отпустите мой дух или воскресите меня" },
    { "{}: can't be summoned, I am in combat", "{0}: призыв невозможен — я в бою" },
    { "{}: can't be summoned, you are in combat", "{0}: призыв невозможен — вы в бою" },
    { "{}: can't be summoned, you are in a battleground", "{0}: призыв невозможен — вы на поле боя" },
    { "{}: can't be summoned, I am inside an instance - walk out first", "{0}: призыв невозможен — я в подземелье, сначала нужно выйти из него" },
    { "{}: can't be summoned, you are inside an instance - invite me and walk in with the group",
      "{0}: призыв невозможен — вы в подземелье; пригласите меня в группу и входите вместе" },
    { "{}: quest orders are not available in this build", "{0}: приказы по заданиям в этой сборке недоступны" },
    { "{}: done", "{0}: готово" },
    // quest orders
    { "I have no quests in my log.", "В моём журнале нет заданий." },
    { "Quests: {} ({} done, {} open)", "Задания: {0} (выполнено: {1}, в процессе: {2})" },
    { "{} (L{}, id {}): done, ready to turn in", "{0} (ур. {1}, №{2}): выполнено, можно сдавать" },
    { "I can't take quests right now.", "Сейчас я не могу брать задания." },
    { "Taking the shared quest: {}", "Беру переданное задание: {0}" },
    { "Accepting: {}", "Принимаю: {0}" },
    { "Nothing on offer right here; I'll pick up what the quest givers near us have for the next 45 seconds.",
      "Здесь ничего не предлагают; в течение 45 секунд я буду брать задания у ближайших квестодателей." },
    { "That quest isn't on offer from anyone next to me.", "Этого задания рядом никто не предлагает." },
    { "I can't drop quests right now.", "Сейчас я не могу бросать задания." },
    { "Drop which quest? Give its name, link or id, or \"all\".", "Какое задание бросить? Укажите название, ссылку или номер, либо «all»." },
    { "I have no quest matching \"{}\".", "У меня нет задания «{0}»." },
    { "Dropping: {}", "Бросаю: {0}" },
    { "Dropping {} quests.", "Бросаю заданий: {0}." },
    { "I can't turn in quests right now.", "Сейчас я не могу сдавать задания." },
    { "None of my quests is complete.", "Ни одно из моих заданий не выполнено." },
    { "Handing in: {}", "Сдаю: {0}" },
    { "That quest isn't complete, or its NPC isn't next to me.", "Это задание не выполнено, или его NPC нет рядом." },
    { "{} quest(s) are done; I'll hand them in at the NPC near us.", "Выполнено заданий: {0}; сдам их ближайшему NPC." },
    { "I can't share quests right now.", "Сейчас я не могу делиться заданиями." },
    { "Sharing: {}", "Делюсь: {0}" },
    { "I have no quest matching \"{}\" to share.", "У меня нет задания «{0}», чтобы поделиться." },
    { "I have nothing you could take from me.", "Мне нечем с вами поделиться." },
    // gear and crafting
    { "{}: I don't have that in my bags", "{0}: этого нет в моих сумках" },
    { "{}: [{}] is a PvP item, I don't wear those", "{0}: [{1}] — PvP-предмет, такие я не ношу" },
    { "{}: I can't wear [{}]", "{0}: я не могу надеть [{1}]" },
    { "{}: equipped {}", "{0}: надето: {1}" },
    { "{}: nothing better in my bags", "{0}: в сумках нет ничего лучше" },
    { "I can make {} (up to {} now)", "Могу сделать: {0} (сейчас до {1})" },
    { "...and {} more", "...и ещё {0}" },
    { "I'm out of reagents for {}. One needs: {}. Trade them to me and ask again.", "Не хватает реагентов для {0}. На один предмет нужно: {1}. Передайте их мне через обмен и повторите просьбу." },
    { "I can make {} of the {} you asked for with my reagents; I'll mail {} to you when done.", "Из запрошенного ({1}) могу сделать {0} шт. из своих реагентов; когда закончу, отправлю {2} шт. вам по почте." },
    { "Making {} x{}, I'll mail it to you when done.", "Делаю {0} x{1}, по готовности отправлю вам по почте." },
    { "Mailed {} to you.", "Отправлено вам по почте: {0}." },
    { "I made it but the mail failed ({} of {} left my bags); trade me for it.", "Предмет готов, но почта не сработала (из сумок ушло {0} из {1}); заберите его через обмен." },
    // limits on the group size (also the text of the `.bot add` / `.bot call` refusals)
    { "{} is full: {}/{}", "{0}: заполнено, {1}/{2}" },
    { "You have {} of {} bots out in the open world: dismiss some, invite world bots for more, or call the rest inside an instance",
      "В открытом мире у вас уже {0} из {1} ботов: распустите часть, пригласите мировых ботов или вызывайте остальных внутри подземелья" },
    // why a companion cannot join the group (CompanionJoinRefusal, JoinOwnerGroup)
    { "you are in a battleground or its queue", "вы на поле боя или стоите в очереди на него" },
    { "you are in a dungeon finder group", "вы в группе, собранной поиском подземелий" },
    { "it is in a battleground or its queue", "бот на поле боя или стоит в очереди на него" },
    { "it could not leave its other group", "бот не смог выйти из другой своей группы" },
    { "your raid is full ({} members)", "ваш рейд заполнен (участников: {0})" },
    { "your raid has no free sub-group slot", "в вашем рейде нет свободного места ни в одной подгруппе" },
};

// Fills `caps` with what the "{}" of `pattern` matched in `text`. The pattern must match the whole text.
template <size_t N>
inline bool MatchPattern(std::string_view pattern, std::string_view text, std::array<std::string_view, N>& caps, size_t& ncaps)
{
    ncaps = 0;
    size_t ph = pattern.find("{}");
    if (ph == std::string_view::npos)
        return pattern == text;
    if (text.size() < ph || text.substr(0, ph) != pattern.substr(0, ph))
        return false;
    size_t tpos = ph;
    pattern.remove_prefix(ph + 2);
    for (;;)
    {
        size_t const next = pattern.find("{}");
        std::string_view const lit = pattern.substr(0, next);
        if (ncaps >= N)
            return false;
        if (next == std::string_view::npos)
        {
            // the last literal sits at the very end of the text
            if (text.size() < tpos + lit.size() || text.substr(text.size() - lit.size()) != lit)
                return false;
            caps[ncaps++] = text.substr(tpos, text.size() - lit.size() - tpos);
            return true;
        }
        size_t const at = lit.empty() ? tpos : text.find(lit, tpos);
        if (at == std::string_view::npos)
            return false;
        caps[ncaps++] = text.substr(tpos, at - tpos);
        tpos = at + lit.size();
        pattern.remove_prefix(next + 2);
    }
}

// A reply word ("circle", "following you") in Russian; the text itself when it is not in the table.
inline std::string ReplyWord(std::string_view en)
{
    std::string key;
    key.reserve(en.size());
    for (char c : en)
        key.push_back((c >= 'A' && c <= 'Z') ? static_cast<char>(c + 32) : c);
    std::string_view const ru = FindWord(kReplyWords, key);
    return ru.empty() ? std::string(en) : std::string(ru);
}

inline std::string ExpandReply(std::string_view tpl, std::array<std::string_view, 16> const& caps, size_t ncaps)
{
    std::string out;
    for (size_t i = 0; i < tpl.size(); ++i)
    {
        if (tpl[i] == '{' && i + 2 < tpl.size() && tpl[i + 1] >= '0' && tpl[i + 1] <= '9')
        {
            size_t j = i + 1;
            size_t index = 0;
            while (j < tpl.size() && tpl[j] >= '0' && tpl[j] <= '9')
                index = index * 10 + size_t(tpl[j++] - '0');
            bool const word = j < tpl.size() && tpl[j] == 'w';
            if (word)
                ++j;
            if (j < tpl.size() && tpl[j] == '}')
            {
                if (index < ncaps)
                    out += word ? ReplyWord(caps[index]) : std::string(caps[index]);
                i = j;
                continue;
            }
        }
        out.push_back(tpl[i]);
    }
    return out;
}

// The Russian text of a bot's English reply, or nullopt when the reply is not in the table (it is then sent as it is).
inline std::optional<std::string> TranslateReply(std::string_view en)
{
    if (en.empty())
        return std::nullopt;
    // The generic "<name>: <order> ok" acknowledgement goes last: it would swallow any line that happens to end in " ok".
    std::array<std::string_view, 16> caps{};
    size_t ncaps = 0;
    for (ReplyRule const& r : kReplyRules)
        if (MatchPattern(r.en, en, caps, ncaps))
            return ExpandReply(r.ru, caps, ncaps);
    if (MatchPattern("{}: {} ok", en, caps, ncaps) && caps[0].find(' ') == std::string_view::npos)   // "<bot name>: <order> ok"
        return ExpandReply("{0}: {1} — принято", caps, ncaps);
    return std::nullopt;
}

}  // namespace Playerbot::V2::L10n

// BotL10n - which language a player's client speaks, and the helpers the bots use to answer in it.
//
// The text tables are in BotL10nText.h (pure text). This part needs the core: a ruRU client gets Russian, every other client
// the English text the module has always sent. The language of a session is the client's own locale (WorldSession
// DbLocaleIndex, set when Load.Locales = 1) or, failing that, the loaded DB2 locale; both say ruRU for a Russian client.
#pragma once

#include "BotL10nText.h"

#include "Chat.h"
#include "Common.h"
#include "Player.h"
#include "WorldSession.h"

#include <optional>
#include <string>
#include <utility>

namespace Playerbot::V2::L10n {

inline bool IsRu(WorldSession const* session)
{
    return session && (session->GetSessionDbLocaleIndex() == LOCALE_ruRU || session->GetSessionDbcLocale() == LOCALE_ruRU);
}

inline bool IsRu(Player const* player)
{
    return player && IsRu(player->GetSession());
}

inline bool IsRu(ChatHandler const* handler)
{
    return handler && IsRu(handler->GetSession());
}

// The text for this player: Russian for a Russian client, `en` for everyone else. `who` is a WorldSession, a Player or a
// ChatHandler. The texts are printf formats where they are given to PSendSysMessage, so keep the conversions
// (%s, %u) of both versions the same and in the same order.
template <class Who>
inline char const* Tr(Who const* who, char const* en, char const* ru)
{
    return IsRu(who) ? ru : en;
}

// An English line the module builds at run time (a refusal reason, a bot reply) in Russian when the client is Russian and the
// table knows the line; otherwise the line itself.
template <class Who>
inline std::string Localize(Who const* who, std::string const& en)
{
    if (IsRu(who))
        if (std::optional<std::string> ru = TranslateReply(en))
            return std::move(*ru);
    return en;
}

}  // namespace Playerbot::V2::L10n

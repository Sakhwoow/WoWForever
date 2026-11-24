<#
.SYNOPSIS
    RU-LAYER guard: checks that the Russian bot layer is still present in the ForeverCore tree.

.DESCRIPTION
    The Russian command layer (`.бот добавить ...`, Russian orders, Russian arguments) was lost once already: the
    upstream merge of 13.11.2026 (commit 4e1966587) took the whole `src/modules/PlayerbotV2` directory from upstream
    and our files inside it disappeared. This script is the tripwire for that: run it after every upstream merge
    (the optional git post-merge hook does it automatically, see tools/ru-layer/install-git-hooks.ps1).

    Exit code 0 = the layer is in place, 1 = something is missing (the message lists what and how to restore it).

.PARAMETER Repo
    Path to the ForeverCore checkout. Defaults to the repository this script lives in.

.EXAMPLE
    powershell -NoProfile -ExecutionPolicy Bypass -File tools/ru-layer/check.ps1
#>
[CmdletBinding()]
param(
    [string] $Repo = ''
)

$ErrorActionPreference = 'Stop'

if (-not $Repo) {
    $Repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
}
if (-not (Test-Path (Join-Path $Repo 'src/modules/PlayerbotV2'))) {
    # The HC checkout builds from upstream's core-only `forever` branch and has no bot module at all: nothing to check there.
    # If this checkout is supposed to have bots (upstream-0139), a missing module is a red flag — restore it before building.
    Write-Host 'RU-LAYER N/A: no src/modules/PlayerbotV2 in this checkout (core-only tree), nothing to check.' -ForegroundColor Yellow
    exit 0
}

$missing = New-Object System.Collections.Generic.List[string]

function Test-RuFile {
    param([string] $Relative, [int] $MinBytes)

    $full = Join-Path $Repo $Relative
    if (-not (Test-Path $full)) {
        $script:missing.Add("missing file: $Relative")
        return
    }
    $size = (Get-Item $full).Length
    if ($MinBytes -gt 0 -and $size -lt $MinBytes) {
        $script:missing.Add("file too small (${size} bytes): $Relative")
    }
}

function Test-RuMarker {
    param([string] $Relative, [string] $Pattern, [string] $What)

    $full = Join-Path $Repo $Relative
    if (-not (Test-Path $full)) {
        $script:missing.Add("missing file: $Relative ($What)")
        return
    }
    if (-not (Select-String -Path $full -Pattern $Pattern -SimpleMatch -Quiet)) {
        $script:missing.Add("marker '$Pattern' not found in $Relative ($What)")
    }
}

# 1. The pure-text tables (word, order and reply tables; header-only, no core dependencies).
Test-RuFile 'src/modules/PlayerbotV2/Bot/BotL10nText.h' 20000

# 2. The wiring: Russian command names/arguments, Russian orders in whispers and in party/raid chat.
Test-RuMarker 'src/modules/PlayerbotV2/Commands/cs_playerbot_v2.cpp' 'RU-LAYER' 'marker comments'
Test-RuMarker 'src/modules/PlayerbotV2/Commands/cs_playerbot_v2.cpp' 'botTableRu' 'Russian ChatCommandTable'
Test-RuMarker 'src/modules/PlayerbotV2/Commands/cs_playerbot_v2.cpp' 'ArgWordToEnglish' 'Russian arguments'
Test-RuMarker 'src/modules/PlayerbotV2/Bot/BotCommandParser.cpp' 'RU-LAYER' 'marker comments'
Test-RuMarker 'src/modules/PlayerbotV2/Bot/BotCommandParser.cpp' 'TranslateOrder' 'Russian orders (whisper)'
Test-RuMarker 'src/modules/PlayerbotV2/Bot/GroupOrderText.cpp' 'RU-LAYER' 'marker comments'
Test-RuMarker 'src/modules/PlayerbotV2/Bot/GroupOrderText.cpp' 'TranslateOrder' 'Russian orders (party/raid chat)'

# 3. The bots' Russian speech lines (a data migration, applied by PlayerbotMigrationMgr at module init).
Test-RuFile 'sql/playerbot_v2/0900_bot_text_ru.sql' 1000

# 4. Migration numbers must stay unique: the manager records one version per number, so two files sharing a number
#    would silently shadow each other (that is why our file is numbered 0900 and not 0033).
$migrationDir = Join-Path $Repo 'sql/playerbot_v2'
if (Test-Path $migrationDir) {
    $numbers = Get-ChildItem $migrationDir -Filter '*.sql' |
        Where-Object { $_.Name -match '^(\d{4})_' } |
        ForEach-Object { [int]([regex]::Match($_.Name, '^(\d{4})_').Groups[1].Value) }
    $duplicates = $numbers | Group-Object | Where-Object { $_.Count -gt 1 } | ForEach-Object { '{0:D4}' -f [int]$_.Name }
    if ($duplicates) {
        $missing.Add("duplicate migration numbers in sql/playerbot_v2: $($duplicates -join ', ') (renumber ours, see docs/forever-ru-layer.md)")
    }
}

if ($missing.Count -eq 0) {
    Write-Host 'RU-LAYER OK: Russian commands, arguments, orders and speech are in the tree.' -ForegroundColor Green
    exit 0
}

Write-Host 'RU-LAYER BROKEN: the Russian bot layer is missing again.' -ForegroundColor Red
foreach ($item in $missing) {
    Write-Host "  - $item" -ForegroundColor Yellow
}
Write-Host ''
Write-Host 'Restore it before building/deploying:'
Write-Host '  1. Read docs/forever-ru-layer.md (workspace: G:\Azeroth Project\docs\forever-ru-layer.md).'
Write-Host '  2. The untouched source of truth is git tag ru-layer-2026-11-24 (branch ru-commands-restore,'
Write-Host '     pushed to origin), and the original 2026-10 commits 7b6f6eaff11 / 0975f65bd16.'
Write-Host '  3. Files Bot/BotL10nText.h and sql/playerbot_v2/0900_bot_text_ru.sql can be restored verbatim;'
Write-Host '     the wiring in cs_playerbot_v2.cpp / BotCommandParser.cpp / GroupOrderText.cpp is a manual port'
Write-Host '     (upstream rewrites those files), the RU-LAYER comments mark the places.'
Write-Host '  4. Then run this script again: it must print RU-LAYER OK.'
exit 1

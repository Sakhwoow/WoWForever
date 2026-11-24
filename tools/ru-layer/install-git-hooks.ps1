<#
.SYNOPSIS
    Installs a git post-merge hook that runs the RU-LAYER guard after every merge.

.DESCRIPTION
    Goal: an upstream merge must never silently drop the Russian bot layer again (that happened on 13.11.2026,
    commit 4e1966587, which took the whole src/modules/PlayerbotV2 directory from upstream). The hook runs
    tools/ru-layer/check.ps1 and prints a loud warning when the layer is missing; it never blocks the merge
    itself (git hooks cannot undo a merge already made, the point is to catch it immediately, not a week later).

    Git hooks are local and not versioned, so run this once per checkout (and after a fresh clone).

.EXAMPLE
    pwsh -File tools/ru-layer/install-git-hooks.ps1
#>
[CmdletBinding()]
param(
    [string] $Repo = ''
)

$ErrorActionPreference = 'Stop'

if (-not $Repo) {
    $Repo = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
}

$hooksDir = Join-Path $Repo '.git/hooks'
if (-not (Test-Path $hooksDir)) {
    if (Test-Path (Join-Path $Repo '.git')) {
        # Worktree: .git is a file pointing at the real git dir.
        $gitLine = (Get-Content (Join-Path $Repo '.git') -First 1)
        if ($gitLine -match '^gitdir:\s*(.+)$') {
            $hooksDir = Join-Path (Join-Path $Repo $Matches[1].Trim()) 'hooks'
        }
    }
}
if (-not (Test-Path $hooksDir)) {
    Write-Host "RU-LAYER: cannot find the hooks directory (.git/hooks) under '$Repo'." -ForegroundColor Red
    exit 1
}

$hookPath = Join-Path $hooksDir 'post-merge'
$marker = 'RU-LAYER guard'

if ((Test-Path $hookPath) -and -not (Select-String -Path $hookPath -Pattern $marker -SimpleMatch -Quiet)) {
    $backup = "$hookPath.bak-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Copy-Item $hookPath $backup
    Write-Host "Existing post-merge hook saved as $backup"
}

$hook = @'
#!/bin/sh
# RU-LAYER guard: after an upstream merge, check that the Russian bot layer is still in the tree.
# Installed by tools/ru-layer/install-git-hooks.ps1; remove this file to stop it.
root=$(git rev-parse --show-toplevel) || exit 0
check="$root/tools/ru-layer/check.ps1"
[ -f "$check" ] || exit 0
win_path=$(cygpath -w "$check" 2>/dev/null || printf '%s' "$check")
if command -v pwsh >/dev/null 2>&1; then
    pwsh -NoProfile -File "$win_path"
elif command -v powershell >/dev/null 2>&1; then
    powershell -NoProfile -ExecutionPolicy Bypass -File "$win_path"
fi
'@

# LF line endings: the hook is run by sh (Git for Windows), CRLF would break the shebang.
[System.IO.File]::WriteAllText($hookPath, ($hook -replace "`r`n", "`n"), (New-Object System.Text.UTF8Encoding($false)))

Write-Host "RU-LAYER guard hook installed: $hookPath" -ForegroundColor Green
Write-Host 'Run it by hand after a merge any time: powershell -NoProfile -ExecutionPolicy Bypass -File tools/ru-layer/check.ps1'

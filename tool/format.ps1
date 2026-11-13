# Formats hand-written Dart code only. Generated files (*.g.dart, l10n) must
# stay exactly as their generators write them, or CI's "generated code is up
# to date" check fails.
#   Usage: powershell -File tool/format.ps1 [-Check]
param([switch]$Check)

$root = Split-Path -Parent $PSScriptRoot
Push-Location $root
try {
  $files = Get-ChildItem -Path lib, test -Recurse -Filter *.dart |
    Where-Object { $_.Name -notlike '*.g.dart' -and $_.FullName -notlike '*\l10n\generated\*' } |
    ForEach-Object { Resolve-Path -Relative $_.FullName }

  $failed = $false
  # Batches keep the command line under Windows' length limit.
  for ($i = 0; $i -lt $files.Count; $i += 40) {
    $batch = $files[$i..([Math]::Min($i + 39, $files.Count - 1))]
    if ($Check) {
      dart format --output=none --set-exit-if-changed @batch
    } else {
      dart format @batch
    }
    if ($LASTEXITCODE -ne 0) { $failed = $true }
  }
  if ($failed) { exit 1 }
} finally {
  Pop-Location
}

$ErrorActionPreference = 'Stop'
. '.\Tools\M1LocalizationFallback.ps1'
$row = [pscustomobject]@{ en = 'Relay online'; uk = ''; ru = 'Ретранслятор активен' }
if ((Resolve-M1LocalizedText -Row $row -Locale 'uk') -ne 'Relay online') { throw 'Missing locale did not fall back to English' }
if ((Resolve-M1LocalizedText -Row $row -Locale 'ru') -ne 'Ретранслятор активен') { throw 'Available locale was not used' }
Write-Output 'M1 localization fallback test: PASS'

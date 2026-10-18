$ErrorActionPreference = 'Stop'
$audit = 'Docs/M1ContentPack/M1_INTEGRATION_AUDIT.md'
if (-not (Test-Path -LiteralPath $audit)) { throw 'Final M1 audit not found' }
$text = Get-Content -Raw $audit
foreach ($term in @('Ready for UE integration','M1 Integration Ready validation: PASS','Offline Mode','7 locales')) { if ($text -notmatch [regex]::Escape($term)) { throw "Audit missing: $term" } }
& '.\Tools\ValidateM1IntegrationReady.ps1' -Strict
if ($LASTEXITCODE -ne 0) { throw 'Validator failed during final audit' }
Write-Output 'M1 final audit test: PASS'

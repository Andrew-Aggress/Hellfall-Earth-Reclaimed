$ErrorActionPreference = 'Stop'
$validator = Join-Path $PSScriptRoot 'ValidateM1IntegrationReady.ps1'
if (-not (Test-Path -LiteralPath $validator)) { throw 'M1 integration validator not found' }
& $validator -Strict
if ($LASTEXITCODE -ne 0) { throw 'M1 integration validator returned failure' }
Write-Output 'M1 validator test: PASS'

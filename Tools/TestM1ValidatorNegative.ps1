$ErrorActionPreference = 'Stop'
$source = (Get-Location).Path
$temp = Join-Path ([IO.Path]::GetTempPath()) ('Hellfall-M1-Validator-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $temp | Out-Null
try {
  Copy-Item (Join-Path $source 'Docs') (Join-Path $temp 'Docs') -Recurse
  New-Item -ItemType Directory -Path (Join-Path $temp 'Tools') | Out-Null
  Copy-Item (Join-Path $source 'Tools/ValidateM1IntegrationReady.ps1') (Join-Path $temp 'Tools/ValidateM1IntegrationReady.ps1')
  $validator = Join-Path $temp 'Tools/ValidateM1IntegrationReady.ps1'
  $loc = Join-Path $temp 'Docs/Localization/M1_LOCALIZATION_PACK.csv'
  $text = Get-Content -Raw $loc; $text = $text -replace 'Breach Point,Точка прориву','Breach Point,'; Set-Content -Encoding UTF8 $loc $text
  & $validator -RootPath $temp -Strict; if ($LASTEXITCODE -eq 0) { throw 'Validator accepted empty translation fixture' }
  $weapon = Join-Path $temp 'Docs/ContentTables/M1_WEAPONS_AND_ABILITIES.csv'
  $text = Get-Content -Raw $weapon; $text = $text -replace ',0.15,shots_per_second,1,SingularityCharge',',0.15s,shots_per_second,1,SingularityCharge'; Set-Content -Encoding UTF8 $weapon $text
  & $validator -RootPath $temp -Strict; if ($LASTEXITCODE -eq 0) { throw 'Validator accepted numeric suffix fixture' }
  Add-Content (Join-Path $temp 'Docs/ContentTables/ASSET_IMPORT_MANIFEST.csv') ((Get-Content (Join-Path $temp 'Docs/ContentTables/ASSET_IMPORT_MANIFEST.csv') | Select-Object -Last 1))
  & $validator -RootPath $temp -Strict; if ($LASTEXITCODE -eq 0) { throw 'Validator accepted duplicate asset fixture' }
  Write-Output 'M1 validator negative tests: PASS'
}
finally { if (Test-Path $temp) { Remove-Item -LiteralPath $temp -Recurse -Force } }

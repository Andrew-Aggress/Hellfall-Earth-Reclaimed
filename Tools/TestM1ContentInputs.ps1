$ErrorActionPreference = 'Stop'
$locPath = 'Docs/Localization/M1_LOCALIZATION_PACK.csv'
if (-not (Test-Path -LiteralPath $locPath)) { throw 'M1 localization pack not found' }
$loc = Import-Csv $locPath
foreach ($column in @('Key','en','uk','ru','de','pl','fr','it','Context','MaxLength','Status')) { if (-not ($loc[0].PSObject.Properties.Name -contains $column)) { throw "Missing localization column: $column" } }
foreach ($row in $loc) { foreach ($column in @('en','uk','ru','de','pl','fr','it')) { if ([string]::IsNullOrWhiteSpace($row.$column)) { throw "Empty $column for $($row.Key)" } } }
$manifest = Import-Csv 'Docs/ContentTables/ASSET_IMPORT_MANIFEST.csv'
if ($manifest.Count -lt 5) { throw 'Asset manifest needs at least five M1 rows' }
foreach ($row in $manifest) { foreach ($column in @('AssetId','SourceRevision','TextureMaxSize','MemoryBudgetKB','LicenseStatus','Status','SourcePath','ProvenanceRef')) { if ([string]::IsNullOrWhiteSpace($row.$column)) { throw "Incomplete asset field $column for $($row.AssetId)" } } }
foreach ($path in @('Docs/UI/M1_UI_HUD_SPEC.md','Docs/Engineering/M1_INTEGRATION_CHECKLIST.md')) { if (-not (Test-Path -LiteralPath $path)) { throw "Missing content document: $path" } }
Write-Output 'M1 content input test: PASS'

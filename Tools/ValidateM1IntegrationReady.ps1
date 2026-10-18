[CmdletBinding()]
param([switch]$Strict, [string]$RootPath)
$ErrorActionPreference = 'Stop'
$projectRoot = if ($RootPath) { (Resolve-Path -LiteralPath $RootPath).Path } else { Split-Path -Parent $PSScriptRoot }
Push-Location $projectRoot
try {
  $errors = [System.Collections.Generic.List[string]]::new()
  $warnings = [System.Collections.Generic.List[string]]::new()
  function Add-Error([string]$message) { [void]$script:errors.Add($message) }
  function Add-Warning([string]$message) { [void]$script:warnings.Add($message) }
  function Require-File([string]$path) { if (-not (Test-Path -LiteralPath $path)) { Add-Error "Missing file: $path" } }

  $required = @(
    'Docs/M1ContentPack/M1_PLACEMENT_MAP.md','Docs/Engineering/M1_BLUEPRINT_EVENT_CONTRACTS.md',
    'Docs/Engineering/M1_CANONICAL_ID_MAP.csv','Docs/Engineering/M1_EXTERNAL_REVIEW_DECISIONS.md',
    'Docs/Engineering/M1_GAMEPLAY_INTEGRATION.md','Docs/Engineering/M1_AI_BEHAVIOR_CONTRACTS.md',
    'Docs/Engineering/M1_SAVE_SETTINGS_INPUT.md','Docs/Engineering/M1_ONLINE_READY_CONTRACT.md',
    'Docs/Engineering/M1_INTEGRATION_CHECKLIST.md','Docs/ContentTables/M1_WEAPONS_AND_ABILITIES.csv',
    'Docs/Localization/M1_LOCALIZATION_PACK.csv','Docs/UI/M1_UI_HUD_SPEC.md',
    'Docs/ContentTables/ASSET_IMPORT_MANIFEST.csv','Docs/CONTENT_INDEX.md'
  )
  foreach ($path in $required) { Require-File $path }

  $map = Import-Csv 'Docs/Engineering/M1_CANONICAL_ID_MAP.csv'
  foreach ($column in @('Alias','CanonicalId','EntityType','SourceOfTruth','Decision')) { if (-not ($map[0].PSObject.Properties.Name -contains $column)) { Add-Error "Canonical map missing column: $column" } }
  foreach ($group in ($map | Group-Object Alias)) { if ($group.Count -gt 1) { Add-Error "Duplicate alias: $($group.Name)" } }

  $canonicalCorpus = @('Docs/M1ContentPack/M1_PLACEMENT_MAP.md','Docs/ContentTables/WEAPON_CATALOG.csv','Docs/Engineering/M1_BLUEPRINT_EVENT_CONTRACTS.md','Docs/M1ContentPack/Localization/M1_STRING_KEYS.csv','Docs/Narrative/Dialogue/M1_MARA_COMBAT_LINES.md') | ForEach-Object { Get-Content -Raw $_ }
  foreach ($row in $map) { if (($canonicalCorpus -join "`n") -notmatch [regex]::Escape($row.CanonicalId)) { Add-Error "Canonical target not found: $($row.CanonicalId)" } }

  $weapons = Import-Csv 'Docs/ContentTables/M1_WEAPONS_AND_ABILITIES.csv'
  foreach ($column in @('ID','Name','Type','Damage','FireRate','FireRateUnit','Magazine','AmmoType','Stagger','CooldownSeconds','GameplayTags','VFXEvent','AudioEvent','Authority','SourceOfTruth')) { if (-not ($weapons[0].PSObject.Properties.Name -contains $column)) { Add-Error "Weapon table missing column: $column" } }
  foreach ($row in $weapons) { foreach ($field in @('Damage','FireRate','Magazine','CooldownSeconds')) { $n = 0.0; if (-not [double]::TryParse($row.$field, [Globalization.NumberStyles]::Float, [Globalization.CultureInfo]::InvariantCulture, [ref]$n)) { Add-Error "Non-numeric $field for $($row.ID)" } } if ([string]::IsNullOrWhiteSpace($row.VFXEvent) -or [string]::IsNullOrWhiteSpace($row.AudioEvent)) { Add-Error "Missing VFX/audio event for $($row.ID)" } }
  foreach ($id in @('WPN_ValkyrieArcCarbine','WPN_SingularityDisruptor')) { if (-not ((Import-Csv 'Docs/ContentTables/WEAPON_CATALOG.csv').ID -contains $id)) { Add-Error "Weapon ID not in canonical catalog: $id" } }

  $loc = Import-Csv 'Docs/Localization/M1_LOCALIZATION_PACK.csv'
  foreach ($column in @('Key','en','uk','ru','de','pl','fr','it','Context','MaxLength','Status')) { if (-not ($loc[0].PSObject.Properties.Name -contains $column)) { Add-Error "Localization missing column: $column" } }
  foreach ($group in ($loc | Group-Object Key)) { if ($group.Count -gt 1) { Add-Error "Duplicate localization key: $($group.Name)" } }
  foreach ($row in $loc) { foreach ($locale in @('en','uk','ru','de','pl','fr','it')) { if ([string]::IsNullOrWhiteSpace($row.$locale)) { Add-Error "Empty $locale for $($row.Key)" } } }

  $asset = Import-Csv 'Docs/ContentTables/ASSET_IMPORT_MANIFEST.csv'
  $assetRequired = @('AssetId','SourceRevision','TextureMaxSize','MemoryBudgetKB','LicenseStatus','Status','SourcePath','ProvenanceRef')
  foreach ($row in $asset) { foreach ($field in $assetRequired) { if ([string]::IsNullOrWhiteSpace($row.$field)) { Add-Error "Asset $($row.AssetId) missing $field" } } foreach ($field in @('TextureMaxSize','MemoryBudgetKB')) { if ($row.$field -ne 'N/A') { $n=0; if (-not [int]::TryParse($row.$field,[Globalization.NumberStyles]::Integer,[Globalization.CultureInfo]::InvariantCulture,[ref]$n)) { Add-Error "Non-numeric $field for asset $($row.AssetId)" } } } if ($row.SourcePath -like 'Docs/*' -and -not (Test-Path -LiteralPath $row.SourcePath)) { Add-Error "Asset provenance path not found: $($row.SourcePath)" } }
  foreach ($group in ($asset | Group-Object AssetId)) { if ($group.Count -gt 1) { Add-Error "Duplicate asset ID: $($group.Name)" } }

  $expectedHeaders = @{
    'Docs/M1ContentPack/DataTableTemplates/DT_M1_WaveDefinitions.csv' = @('WaveId','EncounterId','Order','EnemyId','Count','SpawnRoute','DelaySeconds','TriggerTag','ClearConditionTag','RewardId')
    'Docs/M1ContentPack/DataTableTemplates/DT_M1_SpawnPoints.csv' = @('SpawnId','SpawnType','Area','TransformNote','AllowedEnemyIds','MinDistanceFromPlayer','EnabledByDefault')
    'Docs/M1ContentPack/DataTableTemplates/DT_M1_Objectives.csv' = @('ObjectiveId','LocalizationKey','Type','Order','StartState','CompletionRule','FailureRule','Optional')
    'Docs/M1ContentPack/DataTableTemplates/DT_M1_Pickups.csv' = @('PickupId','PickupType','Amount','PlacementId','RespawnPolicy','GrantEvent','LocalizationKey')
  }
  foreach ($path in $expectedHeaders.Keys) { $rows=Import-Csv $path; $actual=@($rows[0].PSObject.Properties.Name); if (($actual -join ',') -ne ($expectedHeaders[$path] -join ',')) { Add-Error "Unexpected DataTable schema: $path" } foreach ($row in $rows) { if ($row.PSObject.Properties.Name -contains 'Amount' -and $row.Amount -notmatch '^\d+(\.\d+)?$') { Add-Error "Non-numeric pickup amount: $($row.PickupId)" }; if ($row.PSObject.Properties.Name -contains 'DelaySeconds' -and $row.DelaySeconds -notmatch '^\d+(\.\d+)?$') { Add-Error "Non-numeric wave delay: $($row.WaveId)" }; if ($row.PSObject.Properties.Name -contains 'MinDistanceFromPlayer' -and $row.MinDistanceFromPlayer -notmatch '^\d+(\.\d+)?$') { Add-Error "Non-numeric spawn distance: $($row.SpawnId)" } }
  }
  $waves = Import-Csv 'Docs/M1ContentPack/DataTableTemplates/DT_M1_WaveDefinitions.csv'
  $enemyIds = (Import-Csv 'Docs/ContentTables/ENEMY_BALANCE.csv').ID
  foreach ($wave in $waves) { if ($wave.EnemyId -notin $enemyIds) { Add-Error "Unknown wave enemy: $($wave.EnemyId)" } }
  $locKeys = $loc.Key
  $objectiveKeys = (Import-Csv 'Docs/M1ContentPack/DataTableTemplates/DT_M1_Objectives.csv').LocalizationKey
  foreach ($key in $objectiveKeys) { if ($key -notin $locKeys) { Add-Error "Objective key missing localization pack: $key" } }
  $pickupKeys = (Import-Csv 'Docs/M1ContentPack/DataTableTemplates/DT_M1_Pickups.csv').LocalizationKey
  foreach ($key in $pickupKeys) { if ($key -notin $locKeys) { Add-Error "Pickup key missing localization pack: $key" } }
  $spawnIds = (Import-Csv 'Docs/M1ContentPack/DataTableTemplates/DT_M1_SpawnPoints.csv').SpawnId
  $placementText = Get-Content -Raw 'Docs/M1ContentPack/M1_PLACEMENT_MAP.md'
  foreach ($id in $spawnIds) { if ($placementText -notmatch [regex]::Escape($id)) { Add-Error "Spawn ID missing placement map: $id" } }
  $contractText = Get-Content -Raw 'Docs/Engineering/M1_BLUEPRINT_EVENT_CONTRACTS.md'
  $knownEvents = [regex]::Matches($contractText,'M1\.Event\.[A-Za-z.]+') | ForEach-Object Value | Sort-Object -Unique
  foreach ($event in ((Import-Csv 'Docs/M1ContentPack/DataTableTemplates/DT_M1_Pickups.csv').GrantEvent)) { if ($event -notin $knownEvents) { Add-Error "Pickup event missing Blueprint contract: $event" } }
  $dialogueText = Get-Content -Raw 'Docs/Narrative/Dialogue/M1_MARA_COMBAT_LINES.md'
  foreach ($key in ([regex]::Matches($dialogueText,'Narrative\.E1M1\.Mara\.[A-Za-z]+') | ForEach-Object Value | Sort-Object -Unique)) { if ($key -notin $locKeys) { Add-Error "Mara key missing localization pack: $key" } }
  foreach ($row in $loc) { $n=0; if (-not [int]::TryParse($row.MaxLength,[Globalization.NumberStyles]::Integer,[Globalization.CultureInfo]::InvariantCulture,[ref]$n)) { Add-Error "Non-numeric MaxLength for $($row.Key)" } }

  $index = Get-Content -Raw 'Docs/CONTENT_INDEX.md'
  foreach ($path in $required | Where-Object { $_ -ne 'Docs/CONTENT_INDEX.md' }) { $relative = $_ -replace '^Docs/',''; if ($index -notmatch [regex]::Escape($relative)) { Add-Error "Not indexed: $relative" } }
  $online = Get-Content -Raw 'Docs/Engineering/M1_ONLINE_READY_CONTRACT.md'
  if ($online -notmatch 'Offline Mode') { Add-Error 'Offline Mode rule missing' }
  if ($online -match 'server connection.*required') { Add-Error 'Online contract makes server required' }
  $runtimeDocs = @('Docs/Engineering/M1_GAMEPLAY_INTEGRATION.md','Docs/Engineering/M1_ONLINE_READY_CONTRACT.md','Docs/UI/M1_UI_HUD_SPEC.md') | ForEach-Object { Get-Content -Raw $_ }
  foreach ($alias in $map.Alias) { if (($runtimeDocs -join "`n") -match [regex]::Escape($alias)) { Add-Error "External alias leaked into runtime docs: $alias" } }

  if ($warnings.Count -gt 0 -and $Strict) { foreach ($warning in $warnings) { Add-Error "Strict warning: $warning" } }
  if ($errors.Count -gt 0) { Write-Output 'M1 Integration Ready validation: FAIL'; $errors | ForEach-Object { Write-Output "ERROR: $_" }; exit 1 }
  Write-Output 'M1 Integration Ready validation: PASS'
  Write-Output "Files checked: $($required.Count)"
  Write-Output "Canonical aliases: $($map.Count)"
  Write-Output "Weapons/abilities: $($weapons.Count)"
  Write-Output "Localization rows/locales: $($loc.Count)/7"
  Write-Output "Assets: $($asset.Count)"
  Write-Output "Wave rows: $($waves.Count)"
  Write-Output "Warnings: $($warnings.Count)"
  exit 0
}
finally { Pop-Location }

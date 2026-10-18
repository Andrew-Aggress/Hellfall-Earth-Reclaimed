$ErrorActionPreference = 'Stop'
$required = @(
  'Docs/Engineering/M1_GAMEPLAY_INTEGRATION.md',
  'Docs/ContentTables/M1_WEAPONS_AND_ABILITIES.csv',
  'Docs/Engineering/M1_AI_BEHAVIOR_CONTRACTS.md',
  'Docs/Engineering/M1_SAVE_SETTINGS_INPUT.md',
  'Docs/Engineering/M1_ONLINE_READY_CONTRACT.md'
)
foreach ($path in $required) { if (-not (Test-Path -LiteralPath $path)) { throw "Missing contract: $path" } }
$weapons = Import-Csv 'Docs/ContentTables/M1_WEAPONS_AND_ABILITIES.csv'
foreach ($id in @('WPN_ValkyrieArcCarbine','WPN_SingularityDisruptor','M1.Ability.Dash')) { if (-not ($weapons | Where-Object ID -eq $id)) { throw "Missing weapon/ability ID: $id" } }
if (($weapons | Where-Object ID -eq 'WPN_SingularityDisruptor').FireRate -ne '0.15') { throw 'Singularity fire rate drifted from canonical catalog' }
if ((Get-Content -Raw 'Docs/Engineering/M1_GAMEPLAY_INTEGRATION.md') -notmatch 'M1.Event.Gate.Opened') { throw 'Canonical gate event missing' }
if ((Get-Content -Raw 'Docs/Engineering/M1_ONLINE_READY_CONTRACT.md') -notmatch 'Offline') { throw 'Offline-first rule missing' }
Write-Output 'M1 contract test: PASS'

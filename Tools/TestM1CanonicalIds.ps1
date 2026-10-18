$ErrorActionPreference = 'Stop'
$mapPath = Join-Path $PSScriptRoot '..\Docs\Engineering\M1_CANONICAL_ID_MAP.csv'
if (-not (Test-Path -LiteralPath $mapPath)) { throw 'M1_CANONICAL_ID_MAP.csv not found' }
$rows = Import-Csv $mapPath
$expected = @{
  'HF_Start_Point' = 'SP_M1_Spawn_Player'
  'HF_Heavy_Gate_01' = 'GATE_M1_Subway'
  'Mission.M1.Obj1' = 'Mission.E1M1.Objective.RestoreRelay'
  'M1.Weapon.Valkyrie' = 'WPN_ValkyrieArcCarbine'
  'M1.Event.RelayDefense_Start' = 'M1.Event.Relay.Activated'
}
foreach ($alias in $expected.Keys) {
  $row = $rows | Where-Object Alias -eq $alias
  if (-not $row) { throw "Missing alias: $alias" }
  if ($row.CanonicalId -ne $expected[$alias]) { throw "Wrong mapping for $alias" }
}
if (($rows | Group-Object Alias | Where-Object Count -gt 1).Count) { throw 'Duplicate aliases found' }
Write-Output 'M1 canonical ID test: PASS'

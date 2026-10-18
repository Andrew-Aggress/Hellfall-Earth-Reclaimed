param(
    [string] $EngineRoot = 'D:\UnrealEngine\UE_5.8',
    [string] $ProjectRoot = $(Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$editor = Join-Path $EngineRoot 'Engine\Binaries\Win64\UnrealEditor.exe'
$uproject = Join-Path $ProjectRoot 'HellfallEarthReclaimed.uproject'

if (-not (Test-Path -LiteralPath $editor)) { throw "Unreal Editor not found: $editor" }
if (-not (Test-Path -LiteralPath $uproject)) { throw "Project descriptor not found: $uproject" }

$json = Get-Content -LiteralPath $uproject -Raw | ConvertFrom-Json
$enabled = @($json.Plugins | Where-Object Enabled | ForEach-Object Name)
$required = @('EnhancedInput','GameplayAbilities','GameplayTags','GameplayTasks','Niagara','CommonUI','CommonInput','StateTree','PCG','AIModule','NavigationSystem')
$missing = $required | Where-Object { $_ -notin $enabled }
if ($missing) { throw "Missing required plugins: $($missing -join ', ')" }

Write-Output "Unreal Editor: $editor"
Write-Output "Project: $uproject"
Write-Output "Enabled core plugins: $($enabled -join ', ')"
Write-Output 'UE stack configuration: OK'

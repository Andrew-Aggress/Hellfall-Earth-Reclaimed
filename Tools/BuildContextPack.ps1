param(
    [Parameter(Mandatory=$true)] [string] $Task,
    [string[]] $ExtraFiles = @()
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$outputDir = Join-Path $projectRoot 'Build\ContextPacks'
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

$files = @(
    (Join-Path $projectRoot 'README.md'),
    (Join-Path $projectRoot 'Docs\CONTENT_INDEX.md')
) + $ExtraFiles

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$safeTask = ($Task -replace '[^a-zA-Z0-9_-]', '_')
$output = Join-Path $outputDir ("{0}-{1}.md" -f $safeTask, $stamp)

 $contextHeader = @"
# Hellfall Context Pack

Task: $Task
Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss K')

Only the following canonical sources were included:
$(($files | ForEach-Object { "- $_" }) -join "`n")

---
"@
$contextHeader | Set-Content -LiteralPath $output -Encoding UTF8

foreach ($file in $files) {
    if (-not (Test-Path -LiteralPath $file)) { Write-Warning "Missing context file: $file"; continue }
    Add-Content -LiteralPath $output -Value "`n## $file`n" -Encoding UTF8
    Get-Content -LiteralPath $file -Raw | Add-Content -LiteralPath $output -Encoding UTF8
}

Write-Output $output

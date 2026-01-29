<#
.SYNOPSIS
    Generates Type A and Type B MSI installers from the staging directory.
#>

$ErrorActionPreference = "Stop"

# Paths
$SourceDir = "$PSScriptRoot\out\stage"
$OutputDir = "$PSScriptRoot\out\msi"
$WxsFile   = "$PSScriptRoot\Product.wxs"

# Prerequisite Checks
if (-not (Get-Command "wix" -ErrorAction SilentlyContinue)) {
    Write-Error "The 'wix' command was not found. Please install it via: dotnet tool install --global wix"
}
if (-not (Test-Path $SourceDir)) {
    Write-Error "The source directory '$SourceDir' does not exist. Please run the build script first."
}

# Create output directory
if (-not (Test-Path $OutputDir)) { New-Item -ItemType Directory -Path $OutputDir | Out-Null }

# -----------------------------------------------------------
# GENERATING TYPE A INSTALLER
# -----------------------------------------------------------
Write-Host "--- Generating MSI Type A (FolderA Visible) ---" -ForegroundColor Cyan

# -b : Base Path (WiX will resolve relative file paths from 'out/stage')
# -d MsiType=A : Preprocessor variable to trigger your specific logic
wix build "$WxsFile" `
    -o "$OutputDir\AppMsiTest-FolderA.msi" `
    -b "$SourceDir" `
    -d MsiType=A `
    -arch x64 `
    -ext WixToolset.UI.wixext

# -----------------------------------------------------------
# GENERATING TYPE B INSTALLER
# -----------------------------------------------------------
Write-Host "`n--- Generating MSI Type B (FolderB Visible) ---" -ForegroundColor Cyan

wix build "$WxsFile" `
    -o "$OutputDir\AppMsiTest-FolderB.msi" `
    -b "$SourceDir" `
    -d MsiType=B `
    -arch x64 `
    -ext WixToolset.UI.wixext

Write-Host "`n[SUCCESS] Installers generated in: $OutputDir" -ForegroundColor Green
Get-ChildItem $OutputDir *.msi | Select-Object Name, Length, LastWriteTime
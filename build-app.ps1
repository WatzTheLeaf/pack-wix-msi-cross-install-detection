<#
.SYNOPSIS
    Compiles the C++ project and stages the files for WiX.
#>

$ErrorActionPreference = "Stop"

# Configuration
$BuildType = "RelWithDebInfo" # Options: Debug, Release, RelWithDebInfo
$BuildDir  = "$PSScriptRoot\out\build"
$StageDir  = "$PSScriptRoot\out\stage"

Write-Host "--- 1. Cleaning and Configuring CMake ---" -ForegroundColor Cyan
if (Test-Path $BuildDir) { Remove-Item $BuildDir -Recurse -Force }
if (Test-Path $StageDir) { Remove-Item $StageDir -Recurse -Force }

# Configure (Generates Ninja)
cmake -S "$PSScriptRoot" -B "$BuildDir" -G "Ninja" -DCMAKE_BUILD_TYPE="$BuildType"

Write-Host "`n--- 2. Building ---" -ForegroundColor Cyan
cmake --build "$BuildDir" --config $BuildType

Write-Host "`n--- 3. Staging (Local Install) ---" -ForegroundColor Cyan
# This is the key step: installing everything into "out/stage"
cmake --install "$BuildDir" --prefix "$StageDir" --config $BuildType

Write-Host "`n[SUCCESS] Application compiled and staged in: $StageDir" -ForegroundColor Green
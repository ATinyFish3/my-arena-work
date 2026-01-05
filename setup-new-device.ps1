# ARENA 3.0 Setup Script for New Devices
# Run this script on a fresh device after cloning your repository

param(
    [switch]$SkipCondaInstall,
    [switch]$SkipRepoClone
)

Write-Host "========================================" -ForegroundColor Green
Write-Host "ARENA 3.0 Setup for New Device" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Step 1: Check/Install Miniconda
if (-not $SkipCondaInstall) {
    Write-Host "Step 1: Checking Miniconda installation..." -ForegroundColor Yellow
    
    $condaAvailable = $false
    try {
        $condaVersion = conda --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            $condaAvailable = $true
            Write-Host "Conda found: $condaVersion" -ForegroundColor Green
        }
    } catch {
        # Conda not in PATH, check if installed
        $condaPath = "$env:USERPROFILE\miniconda3\Scripts\conda.exe"
        if (Test-Path $condaPath) {
            $env:Path = "$env:USERPROFILE\miniconda3;$env:USERPROFILE\miniconda3\Scripts;$env:USERPROFILE\miniconda3\Library\bin;" + $env:Path
            $condaAvailable = $true
            Write-Host "Conda found at: $condaPath" -ForegroundColor Green
        }
    }
    
    if (-not $condaAvailable) {
        Write-Host "Miniconda not found. Installing..." -ForegroundColor Yellow
        Write-Host "This will download and install Miniconda (~50MB)" -ForegroundColor Cyan
        
        $installerPath = "$env:TEMP\Miniconda3-latest-Windows-x86_64.exe"
        
        # Download Miniconda
        Write-Host "Downloading Miniconda..." -ForegroundColor Yellow
        $ProgressPreference = 'SilentlyContinue'
        Invoke-WebRequest -Uri "https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe" -OutFile $installerPath
        
        # Install Miniconda
        Write-Host "Installing Miniconda (this may take a few minutes)..." -ForegroundColor Yellow
        Start-Process -FilePath $installerPath -ArgumentList "/InstallationType=JustMe", "/AddToPath=1", "/RegisterPython=1", "/S", "/D=$env:USERPROFILE\miniconda3" -Wait -NoNewWindow
        
        # Clean up installer
        Remove-Item $installerPath -ErrorAction SilentlyContinue
        
        # Add to PATH for this session
        $env:Path = "$env:USERPROFILE\miniconda3;$env:USERPROFILE\miniconda3\Scripts;$env:USERPROFILE\miniconda3\Library\bin;" + $env:Path
        
        # Initialize conda
        & "$env:USERPROFILE\miniconda3\Scripts\conda.exe" init powershell
        
        # Accept Terms of Service
        & "$env:USERPROFILE\miniconda3\Scripts\conda.exe" tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
        & "$env:USERPROFILE\miniconda3\Scripts\conda.exe" tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r
        & "$env:USERPROFILE\miniconda3\Scripts\conda.exe" tos accept --override-channels --channel https://repo.anaconda.com/pkgs/msys2
        
        Write-Host "Miniconda installed successfully!" -ForegroundColor Green
        Write-Host "Please restart PowerShell for conda to be available in PATH." -ForegroundColor Yellow
        Write-Host "Or run: .\init-conda.ps1" -ForegroundColor Cyan
    }
}

# Step 2: Initialize git submodules (ARENA_3.0 is included as a submodule)
if (-not $SkipRepoClone) {
    Write-Host ""
    Write-Host "Step 2: Initializing git submodules (ARENA_3.0)..." -ForegroundColor Yellow
    
    $arenaRepoPath = Join-Path $PSScriptRoot "ARENA_3.0"
    
    if (-not (Test-Path $arenaRepoPath) -or -not (Test-Path (Join-Path $arenaRepoPath ".git"))) {
        Write-Host "ARENA_3.0 submodule not initialized. Initializing..." -ForegroundColor Yellow
        Set-Location $PSScriptRoot
        git submodule update --init --recursive
        
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Warning: Failed to initialize submodule. Trying alternative method..." -ForegroundColor Yellow
            # Fallback: clone directly if submodule fails
            if (-not (Test-Path $arenaRepoPath)) {
                git clone https://github.com/callummcdougall/ARENA_3.0.git $arenaRepoPath
            }
        } else {
            Write-Host "ARENA_3.0 submodule initialized!" -ForegroundColor Green
        }
    } else {
        Write-Host "ARENA_3.0 submodule already initialized at: $arenaRepoPath" -ForegroundColor Green
    }
}

# Step 3: Set up conda environment
Write-Host ""
Write-Host "Step 3: Setting up conda environment..." -ForegroundColor Yellow

# Ensure conda is in PATH
if (-not (Get-Command conda -ErrorAction SilentlyContinue)) {
    $condaPath = "$env:USERPROFILE\miniconda3"
    if (Test-Path "$condaPath\Scripts\conda.exe") {
        $env:Path = "$condaPath;$condaPath\Scripts;$condaPath\Library\bin;" + $env:Path
    } else {
        Write-Host "ERROR: Conda not found. Please install Miniconda first." -ForegroundColor Red
        exit 1
    }
}

# Check if environment exists
$envExists = conda env list | Select-String "arena-env"

if ($envExists) {
    Write-Host "Environment 'arena-env' already exists." -ForegroundColor Green
    Write-Host "To recreate it, run: conda env remove -n arena-env" -ForegroundColor Yellow
} else {
    Write-Host "Creating conda environment 'arena-env' with Python 3.11..." -ForegroundColor Yellow
    conda create -n arena-env python=3.11 -y
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to create environment" -ForegroundColor Red
        exit 1
    }
}

# Step 4: Install dependencies
Write-Host ""
Write-Host "Step 4: Installing dependencies..." -ForegroundColor Yellow

$arenaRepoPath = Join-Path $PSScriptRoot "ARENA_3.0"
$requirementsPath = Join-Path $arenaRepoPath "requirements.txt"

if (Test-Path $requirementsPath) {
    Write-Host "Installing packages from requirements.txt (this may take 10-20 minutes)..." -ForegroundColor Yellow
    conda run -n arena-env pip install -r $requirementsPath
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Warning: Some packages may have failed to install. Check the output above." -ForegroundColor Yellow
    }
    
    Write-Host "Installing ipykernel..." -ForegroundColor Yellow
    conda install -n arena-env ipykernel --update-deps --force-reinstall -y
} else {
    Write-Host "ERROR: requirements.txt not found at: $requirementsPath" -ForegroundColor Red
    Write-Host "Make sure ARENA_3.0 repository is cloned." -ForegroundColor Yellow
    exit 1
}

# Step 5: Summary
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Activate the environment:" -ForegroundColor White
Write-Host "   conda activate arena-env" -ForegroundColor Yellow
Write-Host ""
Write-Host "2. If conda is not recognized, run:" -ForegroundColor White
Write-Host "   .\init-conda.ps1" -ForegroundColor Yellow
Write-Host "   Or restart PowerShell" -ForegroundColor Yellow
Write-Host ""
Write-Host "3. Start working on exercises:" -ForegroundColor White
Write-Host "   cd ARENA_3.0\chapter0_fundamentals\exercises" -ForegroundColor Yellow
Write-Host ""


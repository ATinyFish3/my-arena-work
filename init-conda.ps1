# Initialize conda in the current PowerShell session
# Run this script before using conda commands, or restart your PowerShell session

$condaPath = "$env:USERPROFILE\miniconda3"
$condaScripts = "$condaPath\Scripts"
$condaLib = "$condaPath\Library\bin"

if (Test-Path $condaScripts\conda.exe) {
    # Add conda to PATH for this session
    $env:Path = "$condaPath;$condaScripts;$condaLib;" + $env:Path
    
    # Initialize conda for PowerShell
    & "$condaScripts\conda.exe" init powershell --quiet 2>$null
    
    Write-Host "Conda initialized for this session!" -ForegroundColor Green
    Write-Host "You can now use: conda activate arena-env" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Note: For permanent access, restart PowerShell or add conda to your PATH permanently." -ForegroundColor Yellow
} else {
    Write-Host "Conda not found at: $condaPath" -ForegroundColor Red
    Write-Host "Please install Miniconda first." -ForegroundColor Yellow
}


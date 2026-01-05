# Script to connect your local repository to GitHub
# Run this after creating your repository on GitHub

param(
    [Parameter(Mandatory=$true)]
    [string]$GitHubUsername,
    
    [Parameter(Mandatory=$true)]
    [string]$RepositoryName
)

Write-Host "Connecting to GitHub repository..." -ForegroundColor Green
Write-Host "Repository: https://github.com/$GitHubUsername/$RepositoryName" -ForegroundColor Cyan
Write-Host ""

# Add remote
git remote add origin "https://github.com/$GitHubUsername/$RepositoryName.git"

if ($LASTEXITCODE -eq 0) {
    Write-Host "Remote added successfully!" -ForegroundColor Green
    
    # Set branch to main
    git branch -M main
    
    # Push to GitHub
    Write-Host ""
    Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "Successfully connected to GitHub!" -ForegroundColor Green
        Write-Host "Your repository is now available at: https://github.com/$GitHubUsername/$RepositoryName" -ForegroundColor Cyan
    } else {
        Write-Host ""
        Write-Host "Push failed. You may need to:" -ForegroundColor Yellow
        Write-Host "1. Authenticate with GitHub (use GitHub CLI or set up SSH keys)" -ForegroundColor Yellow
        Write-Host "2. Make sure the repository exists on GitHub" -ForegroundColor Yellow
    }
} else {
    Write-Host "Failed to add remote. It may already exist." -ForegroundColor Red
    Write-Host "To update the remote URL, run:" -ForegroundColor Yellow
    Write-Host "  git remote set-url origin https://github.com/$GitHubUsername/$RepositoryName.git" -ForegroundColor White
}


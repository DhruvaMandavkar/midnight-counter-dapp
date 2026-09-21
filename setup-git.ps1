# PowerShell Script to Setup Git for GitHub Upload
# Run this script from PowerShell in your project directory

Write-Host "================================" -ForegroundColor Cyan
Write-Host "Git Setup for Midnight Counter" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Check if Git is installed
Write-Host "Checking Git installation..." -ForegroundColor Yellow
try {
    $gitVersion = git --version
    Write-Host "✓ Git is installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git is not installed!" -ForegroundColor Red
    Write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

Write-Host ""

# Check if already initialized
if (Test-Path ".git") {
    Write-Host "⚠ Git repository already initialized" -ForegroundColor Yellow
    $response = Read-Host "Do you want to reinitialize? (y/n)"
    if ($response -eq "y") {
        Remove-Item -Recurse -Force .git
        Write-Host "✓ Removed existing .git directory" -ForegroundColor Green
    } else {
        Write-Host "Keeping existing repository" -ForegroundColor Yellow
    }
}

# Initialize Git
if (-not (Test-Path ".git")) {
    Write-Host "Initializing Git repository..." -ForegroundColor Yellow
    git init
    Write-Host "✓ Git repository initialized" -ForegroundColor Green
}

Write-Host ""

# Configure Git user (if not already set)
Write-Host "Configuring Git user..." -ForegroundColor Yellow
$userName = git config user.name
$userEmail = git config user.email

if (-not $userName) {
    $userName = Read-Host "Enter your name (for Git commits)"
    git config --global user.name "$userName"
    Write-Host "✓ Git user name set to: $userName" -ForegroundColor Green
} else {
    Write-Host "✓ Git user name already set: $userName" -ForegroundColor Green
}

if (-not $userEmail) {
    $userEmail = Read-Host "Enter your email (for Git commits)"
    git config --global user.email "$userEmail"
    Write-Host "✓ Git user email set to: $userEmail" -ForegroundColor Green
} else {
    Write-Host "✓ Git user email already set: $userEmail" -ForegroundColor Green
}

Write-Host ""

# Add all files
Write-Host "Adding all files to Git..." -ForegroundColor Yellow
git add .
Write-Host "✓ All files added" -ForegroundColor Green

Write-Host ""

# Show status
Write-Host "Git Status:" -ForegroundColor Yellow
git status --short

Write-Host ""

# Create initial commit
Write-Host "Creating initial commit..." -ForegroundColor Yellow
$commitMessage = "feat: Initial commit - Privacy-preserving counter dApp with ZK proofs

- Compact smart contract with private/public circuits
- React frontend with Lace wallet integration
- Comprehensive test suite (15+ tests)
- CI/CD pipeline with GitHub Actions
- Complete documentation and proposal
- Mobile responsive design
- Error handling throughout

Levels 1, 2, and 3 complete for Midnight Builder Challenge"

git commit -m $commitMessage

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Initial commit created" -ForegroundColor Green
} else {
    Write-Host "✗ Commit failed - check for errors above" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "================================" -ForegroundColor Cyan
Write-Host "Git Setup Complete!" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Show next steps
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host ""
Write-Host "Option 1 - Using GitHub CLI (Fastest):" -ForegroundColor Yellow
Write-Host "  1. Install: winget install --id GitHub.cli" -ForegroundColor White
Write-Host "  2. Login:   gh auth login" -ForegroundColor White
Write-Host "  3. Create:  gh repo create midnight-counter-dapp --public --source=. --push" -ForegroundColor White
Write-Host ""

Write-Host "Option 2 - Manual Setup:" -ForegroundColor Yellow
Write-Host "  1. Go to: https://github.com/new" -ForegroundColor White
Write-Host "  2. Create repository named: midnight-counter-dapp" -ForegroundColor White
Write-Host "  3. Run these commands:" -ForegroundColor White
Write-Host "     git remote add origin https://github.com/YOUR_USERNAME/midnight-counter-dapp.git" -ForegroundColor Gray
Write-Host "     git branch -M main" -ForegroundColor Gray
Write-Host "     git push -u origin main" -ForegroundColor Gray
Write-Host ""

Write-Host "✓ Your local repository is ready to push!" -ForegroundColor Green
Write-Host ""

# Ask if they want to see the guide
$showGuide = Read-Host "Open GITHUB_UPLOAD_GUIDE.md for detailed instructions? (y/n)"
if ($showGuide -eq "y") {
    Start-Process "GITHUB_UPLOAD_GUIDE.md"
}

# Customized GitHub Upload Script for DhruvaMandavkar
# This will upload your Midnight Counter project to GitHub

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Uploading to GitHub - DhruvaMandavkar" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Git is installed
Write-Host "Checking prerequisites..." -ForegroundColor Yellow
try {
    $gitVersion = git --version
    Write-Host "✓ Git installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git not installed!" -ForegroundColor Red
    Write-Host "Install from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

Write-Host ""

# Initialize Git if needed
if (-not (Test-Path ".git")) {
    Write-Host "Initializing Git repository..." -ForegroundColor Yellow
    git init
    git branch -M main
    Write-Host "✓ Git initialized" -ForegroundColor Green
} else {
    Write-Host "✓ Git already initialized" -ForegroundColor Green
}

Write-Host ""

# Configure Git user if needed
Write-Host "Configuring Git..." -ForegroundColor Yellow
$currentUser = git config user.name
$currentEmail = git config user.email

if (-not $currentUser) {
    $userName = Read-Host "Enter your name (example: Dhruva Mandavkar)"
    git config user.name "$userName"
    Write-Host "✓ Name set: $userName" -ForegroundColor Green
} else {
    Write-Host "✓ Name already set: $currentUser" -ForegroundColor Green
}

if (-not $currentEmail) {
    $userEmail = Read-Host "Enter your email"
    git config user.email "$userEmail"
    Write-Host "✓ Email set: $userEmail" -ForegroundColor Green
} else {
    Write-Host "✓ Email already set: $currentEmail" -ForegroundColor Green
}

Write-Host ""

# Add all files
Write-Host "Adding all files to Git..." -ForegroundColor Yellow
git add .

$filesAdded = (git diff --cached --numstat | Measure-Object).Count
Write-Host "✓ Added $filesAdded files" -ForegroundColor Green

Write-Host ""

# Create initial commit
Write-Host "Creating initial commit..." -ForegroundColor Yellow
$commitMessage = "feat: Privacy-preserving counter dApp on Midnight Network

🌙 Midnight Builder Challenge - Levels 1, 2, and 3 Complete

Features:
- ✅ Compact smart contract with ZK proofs
- ✅ Private/Public increment circuits
- ✅ React frontend with Lace wallet integration
- ✅ 15+ comprehensive tests
- ✅ CI/CD pipeline with GitHub Actions
- ✅ Complete documentation and proposal
- ✅ Mobile responsive design
- ✅ Production-ready error handling

Tech Stack:
- Midnight Network (Compact 0.5.2)
- React 18 + TypeScript
- Vite, Jest, ESLint
- Zero-knowledge proofs
- Privacy-preserving smart contracts

Submission for Rise In competition."

git commit -m $commitMessage

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Initial commit created" -ForegroundColor Green
} else {
    Write-Host "⚠ Nothing to commit (already committed)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Repository Ready!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Your GitHub username: DhruvaMandavkar" -ForegroundColor Cyan
Write-Host "Repository will be: https://github.com/DhruvaMandavkar/midnight-counter-dapp" -ForegroundColor Cyan
Write-Host ""

# Check if GitHub CLI is available
$ghInstalled = $false
try {
    gh --version | Out-Null
    $ghInstalled = $true
} catch {
    $ghInstalled = $false
}

if ($ghInstalled) {
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "GitHub CLI Found - Automatic Upload" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    
    # Check if logged in
    $loggedIn = $false
    try {
        gh auth status 2>&1 | Out-Null
        $loggedIn = $LASTEXITCODE -eq 0
    } catch {
        $loggedIn = $false
    }
    
    if (-not $loggedIn) {
        Write-Host "Please login to GitHub first:" -ForegroundColor Yellow
        Write-Host "  gh auth login" -ForegroundColor White
        Write-Host ""
        $doLogin = Read-Host "Login now? (y/n)"
        if ($doLogin -eq "y") {
            gh auth login
        }
    }
    
    Write-Host ""
    Write-Host "Ready to create repository and push!" -ForegroundColor Green
    Write-Host ""
    $doPush = Read-Host "Create GitHub repository now? (y/n)"
    
    if ($doPush -eq "y") {
        Write-Host ""
        Write-Host "Creating repository..." -ForegroundColor Yellow
        
        gh repo create midnight-counter-dapp --public --source=. --push --description "Privacy-preserving counter dApp on Midnight Network with zero-knowledge proofs"
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host ""
            Write-Host "========================================" -ForegroundColor Green
            Write-Host "SUCCESS! 🎉" -ForegroundColor Green
            Write-Host "========================================" -ForegroundColor Green
            Write-Host ""
            Write-Host "Your repository is live at:" -ForegroundColor Cyan
            Write-Host "https://github.com/DhruvaMandavkar/midnight-counter-dapp" -ForegroundColor Green
            Write-Host ""
            Write-Host "Next steps:" -ForegroundColor Yellow
            Write-Host "1. Visit your repository" -ForegroundColor White
            Write-Host "2. Check GitHub Actions (CI pipeline)" -ForegroundColor White
            Write-Host "3. Update README with contract address" -ForegroundColor White
            Write-Host "4. Deploy to Vercel" -ForegroundColor White
            Write-Host "5. Record demo videos" -ForegroundColor White
            Write-Host "6. Submit on Rise In" -ForegroundColor White
            Write-Host ""
        } else {
            Write-Host "⚠ Repository creation failed" -ForegroundColor Red
            Write-Host "Try manual method below" -ForegroundColor Yellow
        }
    }
} else {
    Write-Host "========================================" -ForegroundColor Yellow
    Write-Host "Manual Upload Instructions" -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Option 1: Install GitHub CLI (Recommended)" -ForegroundColor Cyan
    Write-Host "  winget install --id GitHub.cli" -ForegroundColor White
    Write-Host "  Then restart PowerShell and run this script again" -ForegroundColor White
    Write-Host ""
    Write-Host "Option 2: Manual Upload" -ForegroundColor Cyan
    Write-Host "  1. Go to: https://github.com/new" -ForegroundColor White
    Write-Host "  2. Repository name: midnight-counter-dapp" -ForegroundColor White
    Write-Host "  3. Make it Public" -ForegroundColor White
    Write-Host "  4. Do not initialize with README" -ForegroundColor White
    Write-Host "  5. Click Create" -ForegroundColor White
    Write-Host "  6. Then run these commands:" -ForegroundColor White
    Write-Host ""
    Write-Host "     git remote add origin https://github.com/DhruvaMandavkar/midnight-counter-dapp.git" -ForegroundColor Gray
    Write-Host "     git push -u origin main" -ForegroundColor Gray
    Write-Host ""
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Need more help? Open GITHUB_UPLOAD_GUIDE.md" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

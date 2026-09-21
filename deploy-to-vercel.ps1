# Deploy to Vercel Script
# This script attempts to deploy the midnight-counter-dapp to Vercel

Write-Host "🚀 Deploying Midnight Counter dApp to Vercel..." -ForegroundColor Cyan
Write-Host ""

# Remove any existing Vercel configuration
Write-Host "Cleaning up existing Vercel links..." -ForegroundColor Yellow
Remove-Item -Path .vercel -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path .env.local -Force -ErrorAction SilentlyContinue

Write-Host "✓ Cleaned up" -ForegroundColor Green
Write-Host ""

# Check if vercel CLI is available
$vercelPath = Get-Command vercel -ErrorAction SilentlyContinue
if (-not $vercelPath) {
    Write-Host "❌ Vercel CLI not found in PATH" -ForegroundColor Red
    Write-Host "Using full path: C:\Users\ADMIN\AppData\Local\Microsoft\WinGet\Links\vercel.exe" -ForegroundColor Yellow
    $vercelCmd = "C:\Users\ADMIN\AppData\Local\Microsoft\WinGet\Links\vercel.exe"
} else {
    $vercelCmd = "vercel"
}

Write-Host "📋 Deployment Options:" -ForegroundColor Cyan
Write-Host ""
Write-Host "Option 1: Deploy via Vercel Website (RECOMMENDED)" -ForegroundColor Green
Write-Host "  1. Go to: https://vercel.com/new" -ForegroundColor White
Write-Host "  2. Click 'Import Git Repository'" -ForegroundColor White
Write-Host "  3. Select: DhruvaMandavkar/midnight-counter-dapp" -ForegroundColor White
Write-Host "  4. Click 'Deploy'" -ForegroundColor White
Write-Host ""

Write-Host "Option 2: Deploy via CLI" -ForegroundColor Yellow
Write-Host "  Run this command and follow prompts:" -ForegroundColor White
Write-Host "  vercel --prod" -ForegroundColor Cyan
Write-Host ""

$choice = Read-Host "Do you want to try CLI deployment now? (y/n)"

if ($choice -eq "y" -or $choice -eq "Y") {
    Write-Host ""
    Write-Host "🔧 Starting CLI deployment..." -ForegroundColor Cyan
    Write-Host ""
    Write-Host "When prompted:" -ForegroundColor Yellow
    Write-Host "  1. Select: Create a new project" -ForegroundColor White
    Write-Host "  2. Name: midnight-counter-dapp" -ForegroundColor White
    Write-Host "  3. Connect Git: yes" -ForegroundColor White
    Write-Host "  4. Code directory: ./" -ForegroundColor White
    Write-Host "  5. Customize settings: no" -ForegroundColor White
    Write-Host ""
    
    Start-Sleep -Seconds 3
    
    # Try to run vercel
    & $vercelCmd --prod
    
} else {
    Write-Host ""
    Write-Host "✅ No problem! Use Option 1 (website) instead." -ForegroundColor Green
    Write-Host ""
    Write-Host "Quick steps:" -ForegroundColor Cyan
    Write-Host "1. Open: https://vercel.com/new" -ForegroundColor White
    Write-Host "2. Import: DhruvaMandavkar/midnight-counter-dapp" -ForegroundColor White
    Write-Host "3. Click Deploy" -ForegroundColor White
    Write-Host ""
    Write-Host "Your deployment will be live at:" -ForegroundColor Yellow
    Write-Host "https://midnight-counter-dapp.vercel.app" -ForegroundColor Cyan
    Write-Host ""
}

Write-Host "📝 After deployment, update README.md with your live URL!" -ForegroundColor Magenta

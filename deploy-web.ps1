# Build and push Flutter web to separate branch

Write-Host "🚀 Starting web build process..." -ForegroundColor Green

# Build Flutter web
Write-Host "📦 Building Flutter web..." -ForegroundColor Yellow
flutter build web --release

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Flutter build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Build completed successfully!" -ForegroundColor Green

# Get current branch name
$CURRENT_BRANCH = git branch --show-current
Write-Host "📍 Current branch: $CURRENT_BRANCH" -ForegroundColor Cyan

# Stash any uncommitted changes
Write-Host "💾 Stashing uncommitted changes..." -ForegroundColor Yellow
git stash

# Create or switch to web-build branch
Write-Host "🌿 Switching to web-build branch..." -ForegroundColor Yellow
git checkout web-build 2>$null
if ($LASTEXITCODE -ne 0) {
    git checkout -b web-build
}

# Remove old build if exists
Write-Host "🧹 Cleaning old build..." -ForegroundColor Yellow
if (Test-Path "build") {
    Remove-Item -Recurse -Force build
}

# Checkout the new build from the original branch
Write-Host "📥 Getting new build..." -ForegroundColor Yellow
git checkout $CURRENT_BRANCH -- build/web

# Add and commit
Write-Host "💾 Committing build..." -ForegroundColor Yellow
git add build/web
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Build: Web build from $CURRENT_BRANCH - $timestamp"

# Push to remote
Write-Host "⬆️  Pushing to remote..." -ForegroundColor Yellow
git push origin web-build

# Switch back to original branch
Write-Host "🔙 Switching back to $CURRENT_BRANCH..." -ForegroundColor Yellow
git checkout $CURRENT_BRANCH

# Restore stashed changes
git stash pop 2>$null

Write-Host "✅ Web build published to web-build branch!" -ForegroundColor Green
Write-Host "🌐 Branch: web-build" -ForegroundColor Cyan

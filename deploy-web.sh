#!/bin/bash

# Build and push Flutter web to separate branch

echo "🚀 Starting web build process..."

# Build Flutter web
echo "📦 Building Flutter web..."
flutter build web --release

if [ $? -ne 0 ]; then
    echo "❌ Flutter build failed!"
    exit 1
fi

echo "✅ Build completed successfully!"

# Get current branch name
CURRENT_BRANCH=$(git branch --show-current)
echo "📍 Current branch: $CURRENT_BRANCH"

# Stash any uncommitted changes
echo "💾 Stashing uncommitted changes..."
git stash

# Create or switch to web-build branch
echo "🌿 Switching to web-build branch..."
git checkout web-build 2>/dev/null || git checkout -b web-build

# Remove old build if exists
echo "🧹 Cleaning old build..."
rm -rf build/

# Checkout the new build from the original branch
echo "📥 Getting new build..."
git checkout $CURRENT_BRANCH -- build/web

# Add and commit
echo "💾 Committing build..."
git add build/web
git commit -m "Build: Web build from $CURRENT_BRANCH - $(date '+%Y-%m-%d %H:%M:%S')"

# Push to remote
echo "⬆️  Pushing to remote..."
git push origin web-build

# Switch back to original branch
echo "🔙 Switching back to $CURRENT_BRANCH..."
git checkout $CURRENT_BRANCH

# Restore stashed changes
git stash pop 2>/dev/null

echo "✅ Web build published to web-build branch!"
echo "🌐 Branch: web-build"

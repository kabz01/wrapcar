#!/bin/bash

# Connect Car Wrap Company Project to GitHub Repository
# Repository: https://github.com/kabz01/wrapcar

echo "🔗 Connecting to GitHub Repository: https://github.com/kabz01/wrapcar"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first."
    exit 1
fi

# Initialize git repository if not already initialized
if [ ! -d .git ]; then
    echo "📦 Initializing Git repository..."
    git init
    echo "✅ Git repository initialized"
else
    echo "✅ Git repository already initialized"
fi

# Remove existing remote if it exists
if git remote | grep -q "origin"; then
    echo "🔄 Removing existing remote 'origin'..."
    git remote remove origin
fi

# Add the new remote
echo "🔗 Adding remote: https://github.com/kabz01/wrapcar.git"
git remote add origin https://github.com/kabz01/wrapcar.git

# Verify the remote was added
echo ""
echo "📋 Current remotes:"
git remote -v

# Check current branch
CURRENT_BRANCH=$(git branch --show-current)
if [ -z "$CURRENT_BRANCH" ]; then
    echo ""
    echo "📝 Creating initial commit..."
    git add .
    git commit -m "Initial commit: Car wrap company website with Supabase integration"
    git branch -M main
    echo "✅ Initial commit created on 'main' branch"
else
    echo ""
    echo "✅ Current branch: $CURRENT_BRANCH"
fi

# Stage all changes
echo ""
echo "📦 Staging all files..."
git add .

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo "ℹ️  No changes to commit"
else
    echo "💾 Committing changes..."
    git commit -m "Update: Car wrap website with latest features and Supabase integration"
    echo "✅ Changes committed"
fi

# Push to GitHub
echo ""
echo "🚀 Pushing to GitHub..."
echo "⚠️  If this is your first push, you may need to authenticate with GitHub"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully connected and pushed to GitHub!"
    echo "🌐 Repository: https://github.com/kabz01/wrapcar"
    echo ""
    echo "Next steps:"
    echo "1. Go to https://vercel.com/dashboard"
    echo "2. Click 'Add New Project'"
    echo "3. Import from GitHub: kabz01/wrapcar"
    echo "4. Add environment variables (Supabase credentials)"
    echo "5. Deploy!"
else
    echo ""
    echo "❌ Push failed. This might be because:"
    echo "   1. You need to authenticate with GitHub"
    echo "   2. The repository doesn't exist or you don't have access"
    echo "   3. There are conflicts with existing code"
    echo ""
    echo "To authenticate, you can:"
    echo "   - Use GitHub CLI: gh auth login"
    echo "   - Use SSH keys: https://docs.github.com/en/authentication/connecting-to-github-with-ssh"
    echo "   - Use Personal Access Token"
fi

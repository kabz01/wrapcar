# GitHub Connection Guide

## Connect Your Project to GitHub Repository

This guide will help you connect your car wrap company website to the GitHub repository: **https://github.com/kabz01/wrapcar**

---

## Prerequisites

1. **Git installed** on your computer
   - Check: `git --version`
   - Install: [git-scm.com](https://git-scm.com/)

2. **GitHub account** with access to the repository
   - Repository: https://github.com/kabz01/wrapcar

3. **GitHub authentication** set up (one of these):
   - Personal Access Token
   - SSH Keys
   - GitHub CLI

---

## Method 1: Using the Automated Script (Recommended)

### Step 1: Download Your Project from v0
1. In v0, click the **three dots (⋯)** in the top right
2. Select **"Download ZIP"**
3. Extract the ZIP file to your desired location

### Step 2: Run the Connection Script
\`\`\`bash
# Navigate to your project directory
cd path/to/car-wrap-company

# Make the script executable
chmod +x scripts/connect-to-github.sh

# Run the script
./scripts/connect-to-github.sh
\`\`\`

The script will:
- ✅ Initialize Git repository
- ✅ Add remote: https://github.com/kabz01/wrapcar.git
- ✅ Stage all files
- ✅ Create initial commit
- ✅ Push to GitHub

---

## Method 2: Manual Connection

### Step 1: Initialize Git
\`\`\`bash
cd path/to/car-wrap-company
git init
\`\`\`

### Step 2: Add Remote Repository
\`\`\`bash
git remote add origin https://github.com/kabz01/wrapcar.git
\`\`\`

### Step 3: Verify Remote
\`\`\`bash
git remote -v
# Should show:
# origin  https://github.com/kabz01/wrapcar.git (fetch)
# origin  https://github.com/kabz01/wrapcar.git (push)
\`\`\`

### Step 4: Stage and Commit Files
\`\`\`bash
git add .
git commit -m "Initial commit: Car wrap company website"
\`\`\`

### Step 5: Set Main Branch and Push
\`\`\`bash
git branch -M main
git push -u origin main
\`\`\`

---

## Authentication Methods

### Option A: Personal Access Token (Recommended)

1. **Generate Token:**
   - Go to: https://github.com/settings/tokens
   - Click "Generate new token (classic)"
   - Select scopes: `repo` (full control)
   - Copy the token

2. **Use Token When Pushing:**
   \`\`\`bash
   git push -u origin main
   # Username: kabz01
   # Password: [paste your token]
   \`\`\`

3. **Save Credentials (Optional):**
   \`\`\`bash
   git config --global credential.helper store
   \`\`\`

### Option B: SSH Keys

1. **Generate SSH Key:**
   \`\`\`bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   \`\`\`

2. **Add to GitHub:**
   - Copy key: `cat ~/.ssh/id_ed25519.pub`
   - Go to: https://github.com/settings/keys
   - Click "New SSH key" and paste

3. **Change Remote to SSH:**
   \`\`\`bash
   git remote set-url origin git@github.com:kabz01/wrapcar.git
   git push -u origin main
   \`\`\`

### Option C: GitHub CLI

1. **Install GitHub CLI:**
   \`\`\`bash
   # macOS
   brew install gh
   
   # Windows
   winget install GitHub.cli
   \`\`\`

2. **Authenticate:**
   \`\`\`bash
   gh auth login
   \`\`\`

3. **Push:**
   \`\`\`bash
   git push -u origin main
   \`\`\`

---

## Troubleshooting

### Error: "Repository not found"
**Solution:**
- Verify the repository exists: https://github.com/kabz01/wrapcar
- Check you have access to the repository
- Ensure you're authenticated correctly

### Error: "Permission denied"
**Solution:**
- Check your authentication method
- Verify your GitHub username and token/password
- Try SSH authentication instead

### Error: "Updates were rejected"
**Solution:**
\`\`\`bash
# Pull first, then push
git pull origin main --allow-unrelated-histories
git push -u origin main
\`\`\`

### Error: "Failed to push some refs"
**Solution:**
\`\`\`bash
# Force push (use with caution)
git push -u origin main --force
\`\`\`

---

## After Successful Connection

### Verify on GitHub
1. Go to: https://github.com/kabz01/wrapcar
2. You should see all your project files
3. Check the commit history

### Deploy to Vercel
1. Go to: https://vercel.com/dashboard
2. Click **"Add New Project"**
3. Click **"Import"** next to `kabz01/wrapcar`
4. Configure:
   - Framework: Next.js
   - Root Directory: (leave empty)
   - Build Command: `npm run build`
5. Add Environment Variables:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - `SUPABASE_SERVICE_ROLE_KEY`
6. Click **"Deploy"**

---

## Future Updates

After initial connection, to push updates:

\`\`\`bash
# Stage changes
git add .

# Commit with message
git commit -m "Update: Description of changes"

# Push to GitHub
git push origin main
\`\`\`

Vercel will automatically deploy when you push to GitHub (if auto-deploy is enabled).

---

## Quick Reference Commands

\`\`\`bash
# Check status
git status

# View remotes
git remote -v

# View commit history
git log --oneline

# Create new branch
git checkout -b feature-name

# Switch branches
git checkout main

# Pull latest changes
git pull origin main

# Push changes
git push origin main
\`\`\`

---

## Need Help?

- **GitHub Docs:** https://docs.github.com
- **Git Docs:** https://git-scm.com/doc
- **Vercel Docs:** https://vercel.com/docs

Your repository: **https://github.com/kabz01/wrapcar**

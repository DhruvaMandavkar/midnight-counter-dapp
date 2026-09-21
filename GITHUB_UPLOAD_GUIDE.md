# GitHub Upload Guide

Follow these steps to upload your project to GitHub.

## Prerequisites

- GitHub account created
- Git installed on your system
- GitHub CLI (optional but recommended)

---

## Method 1: Using GitHub CLI (Recommended - Fastest)

### Step 1: Install GitHub CLI (if not installed)

**Windows:**
```powershell
winget install --id GitHub.cli
```

Or download from: https://cli.github.com/

### Step 2: Login to GitHub

```bash
gh auth login
```

Follow the prompts:
1. Select: GitHub.com
2. Select: HTTPS
3. Select: Login with a web browser
4. Copy the one-time code shown
5. Press Enter to open browser
6. Paste code and authorize

### Step 3: Initialize Git and Create Repo

```bash
# Navigate to project directory
cd "d:\OneDrive\Desktop\level1,2,3"

# Initialize git
git init

# Add all files
git add .

# Create first commit
git commit -m "feat: Initial commit - Privacy-preserving counter dApp"

# Create GitHub repo and push (all in one command!)
gh repo create midnight-counter-dapp --public --source=. --push

# Done! Your repo is live at: https://github.com/YOUR_USERNAME/midnight-counter-dapp
```

---

## Method 2: Using GitHub Website (Manual)

### Step 1: Create Repository on GitHub

1. Go to https://github.com/new
2. Repository name: `midnight-counter-dapp`
3. Description: `Privacy-preserving counter on Midnight Network with zero-knowledge proofs`
4. Select: **Public**
5. **DO NOT** initialize with README, .gitignore, or license (we already have these)
6. Click **Create repository**

### Step 2: Initialize Git Locally

```bash
# Navigate to project directory
cd "d:\OneDrive\Desktop\level1,2,3"

# Initialize git
git init

# Add all files
git add .

# Create first commit
git commit -m "feat: Initial commit - Privacy-preserving counter dApp"
```

### Step 3: Connect to GitHub and Push

```bash
# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/midnight-counter-dapp.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

---

## Step 4: Verify Upload

After pushing, verify everything is uploaded:

1. Go to your repository: `https://github.com/YOUR_USERNAME/midnight-counter-dapp`
2. Check that all files are visible
3. Verify GitHub Actions is running (Actions tab)
4. Check the CI badge in README

---

## Step 5: Enable GitHub Pages (Optional)

If you want to host the frontend on GitHub Pages:

1. Go to repository Settings
2. Click "Pages" in sidebar
3. Source: Deploy from a branch
4. Branch: main
5. Folder: /docs (or configure build)
6. Save

---

## Step 6: Add Secrets (for CI/CD)

If your CI needs secrets:

1. Go to Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Add any needed secrets (API keys, etc.)

---

## Additional Git Commands

### Make More Commits

You need 8+ commits for Level 2, 10+ for Level 3:

```bash
# Example commits
git commit -m "docs: Add comprehensive README"
git push

git commit -m "feat: Implement wallet connection"
git push

git commit -m "feat: Add circuit call interface"
git push

git commit -m "test: Add comprehensive test suite"
git push

git commit -m "ci: Configure GitHub Actions pipeline"
git push

git commit -m "docs: Create product proposal"
git push

git commit -m "style: Implement responsive design"
git push

git commit -m "fix: Handle wallet errors gracefully"
git push

git commit -m "docs: Add demo guides"
git push

git commit -m "chore: Update dependencies and configs"
git push
```

### Check Status

```bash
git status          # See what changed
git log --oneline   # See commit history
git remote -v       # See remote URL
```

---

## Update README with Your Links

After pushing, update README.md with:

1. **CI Badge URL:**
```markdown
![CI](https://github.com/YOUR_USERNAME/midnight-counter-dapp/workflows/CI%20Pipeline/badge.svg)
```

2. **Repository URL** (for clone instructions)

3. **Live Demo URL** (after deploying to Vercel)

4. **Contract Address** (after deploying to Preprod)

Then commit and push the changes:
```bash
git add README.md
git commit -m "docs: Update README with repository links"
git push
```

---

## Troubleshooting

### Error: "remote origin already exists"
```bash
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/midnight-counter-dapp.git
```

### Error: "failed to push"
```bash
# Pull first, then push
git pull origin main --rebase
git push origin main
```

### Error: "Permission denied"
```bash
# Use personal access token instead of password
# Generate at: https://github.com/settings/tokens
# Use token as password when prompted
```

### Large Files Error
```bash
# Our .gitignore should handle this, but if you get errors:
git rm --cached node_modules -r
git rm --cached dist -r
git commit -m "fix: Remove large files"
```

---

## Verification Checklist

After upload, verify:

- [ ] All files visible on GitHub
- [ ] README displays correctly
- [ ] CI/CD workflow visible in Actions tab
- [ ] No sensitive data (API keys, private keys)
- [ ] .gitignore working (no node_modules, etc.)
- [ ] Repository is public
- [ ] Description and tags added

---

## Next Steps After GitHub Upload

1. ✅ Get the repository URL
2. ✅ Wait for CI pipeline to run (check Actions tab)
3. ✅ Copy CI badge URL
4. ✅ Update README with badge
5. ✅ Deploy to Vercel
6. ✅ Record demo videos
7. ✅ Submit on Rise In with GitHub URL

---

## Quick Reference

**Initialize and Push:**
```bash
cd "d:\OneDrive\Desktop\level1,2,3"
git init
git add .
git commit -m "feat: Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/midnight-counter-dapp.git
git branch -M main
git push -u origin main
```

**Make Changes:**
```bash
git add .
git commit -m "your message"
git push
```

**Check Everything:**
```bash
git status
git log --oneline
```

---

Good luck! 🚀

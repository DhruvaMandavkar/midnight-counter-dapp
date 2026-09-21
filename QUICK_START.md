# 🚀 Quick Start - Upload to GitHub in 5 Minutes

Follow these steps to get your project on GitHub FAST!

---

## ⚡ Super Fast Method (Recommended)

### 1. Open PowerShell in Project Directory

```powershell
cd "d:\OneDrive\Desktop\level1,2,3"
```

### 2. Run Setup Script

```powershell
.\setup-git.ps1
```

This will:
- ✅ Initialize Git
- ✅ Configure your name/email
- ✅ Add all files
- ✅ Create initial commit

### 3. Install GitHub CLI (One Time)

```powershell
winget install --id GitHub.cli
```

### 4. Login to GitHub

```powershell
gh auth login
```

Follow the prompts (choose: GitHub.com → HTTPS → Web browser)

### 5. Create Repo and Push (One Command!)

```powershell
gh repo create midnight-counter-dapp --public --source=. --push
```

### 6. Done! 🎉

Your repo is live at: `https://github.com/YOUR_USERNAME/midnight-counter-dapp`

---

## 📝 Add More Commits (Optional but Recommended)

```powershell
.\make-commits.ps1
```

This creates 11 meaningful commits automatically.

Then push:
```powershell
git push origin main
```

---

## 🔗 Update README with Links

After pushing, update README.md:

1. **Replace YOUR_USERNAME** with your GitHub username in the CI badge
2. **Add your contract address** after deployment
3. **Add your Vercel URL** after deployment

Then:
```powershell
git add README.md
git commit -m "docs: Update README with repository links"
git push
```

---

## ✅ Verification

Visit your repository and check:
- [ ] All files visible
- [ ] GitHub Actions running (Actions tab)
- [ ] README displays correctly
- [ ] CI badge will turn green after first run

---

## 🎯 What's Next?

After GitHub upload:

1. ✅ **Get CI badge URL** from Actions
2. ✅ **Deploy contract** to Preprod
3. ✅ **Deploy frontend** to Vercel
4. ✅ **Record demo videos**
5. ✅ **Submit on Rise In**

---

## 🆘 Troubleshooting

### Error: "Git not found"
- Install Git: https://git-scm.com/download/win
- Restart PowerShell

### Error: "gh not found"
- Install GitHub CLI: `winget install --id GitHub.cli`
- Restart PowerShell

### Error: "Permission denied"
- Make sure you ran `gh auth login`
- Check you're logged into correct account

### Script won't run
```powershell
# Allow script execution (run once)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## 📞 Need More Help?

See detailed guides:
- `GITHUB_UPLOAD_GUIDE.md` - Complete instructions
- `COMPILATION_GUIDE.md` - Compiling the contract
- `DEMO_GUIDE.md` - Recording demo videos

---

**Total Time: ~5 minutes** ⚡

Let's go! 🚀

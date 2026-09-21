# Vercel Deployment - Step by Step Guide

## Method 1: Deploy via Vercel Website (EASIEST - Recommended)

### Step 1: Go to Vercel Dashboard
1. Open your browser and go to: https://vercel.com/new
2. You should already be logged in (you did `vercel login` earlier)

### Step 2: Import Your GitHub Repository
1. Click on **"Add New Project"** or **"Import Project"**
2. Select **"Import Git Repository"**
3. Find and select: `DhruvaMandavkar/midnight-counter-dapp`
4. Click **"Import"**

### Step 3: Configure Project Settings
The settings should auto-detect:
- **Framework Preset**: Vite
- **Build Command**: `npm run build`
- **Output Directory**: `dist`
- **Install Command**: `npm install`

If these are not filled in, enter them manually.

### Step 4: Add Environment Variables (Important!)
Click on **"Environment Variables"** and add:

| Name | Value |
|------|-------|
| `VITE_PROOF_SERVER_URL` | `http://localhost:6300` |
| `VITE_INDEXER_URL` | `http://localhost:6301` |
| `VITE_NODE_URL` | `http://localhost:6302` |

> Note: These are localhost URLs for development. For production, you'll need actual Midnight testnet/mainnet URLs.

### Step 5: Deploy
1. Click **"Deploy"**
2. Wait 2-3 minutes for the build to complete
3. You'll get a live URL like: `https://midnight-counter-dapp.vercel.app`

### Step 6: Copy Your Live URL
Once deployed, copy the production URL and save it - you'll need it for:
- Updating README.md
- Submitting to Rise In competition

---

## Method 2: Deploy via CLI (Alternative)

If you want to try CLI again:

```powershell
# Remove any existing vercel link
Remove-Item -Path .vercel -Recurse -Force -ErrorAction SilentlyContinue

# Deploy
vercel --prod
```

When prompted:
1. **Which project?** → Arrow down to **"Create a new project"** and press Enter
2. **Name?** → Type `midnight-counter-dapp` and press Enter
3. **Connect Git?** → Type `y` and press Enter
4. **Code directory?** → Just press Enter (uses current directory)
5. **Customize settings?** → Type `n` and press Enter

---

## After Deployment Success

### Update README with Live URL
Once you have your Vercel URL, update the README:

```powershell
# I'll help you update the README after you share the URL
```

### Test Your Deployment
1. Visit your Vercel URL
2. The app should load (but wallet features won't work without Midnight Network running)
3. Take screenshots for your demo video

---

## Troubleshooting

### Build Fails
If the build fails with "Command 'npm run build' exited with 2":

1. Test the build locally first:
```powershell
npm run build
```

2. If it works locally but fails on Vercel, check:
   - Node version (Vercel uses Node 18 by default)
   - Missing environment variables
   - TypeScript errors

### Wrong Project Selected
If Vercel keeps linking to "zkhire":

1. Delete the `.vercel` folder completely:
```powershell
Remove-Item -Path .vercel -Recurse -Force
```

2. Use the web dashboard method instead (Method 1 above)

---

## What's Your Vercel URL?

Once you successfully deploy, your URL will be:
- **Production**: `https://midnight-counter-dapp.vercel.app` (or similar)
- **Preview**: Available on every Git push

Save this URL - you need it for the Rise In submission!

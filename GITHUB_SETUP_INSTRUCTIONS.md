# GitHub Repository Setup Instructions

Your local repository has been initialized! Now you need to create the repository on GitHub and connect it.

## Step 1: Create Repository on GitHub

1. Go to https://github.com/new
2. **Repository name**: Choose a name (e.g., `arena-3.0-work`, `my-arena-exercises`)
3. **Description** (optional): "My work and solutions for ARENA 3.0 AI Safety course"
4. **Visibility**: Choose **Private** (recommended) or **Public**
5. **DO NOT** check any of these boxes:
   - ❌ Add a README file
   - ❌ Add .gitignore
   - ❌ Choose a license
6. Click **"Create repository"**

## Step 2: Connect Your Local Repository

After creating the repository on GitHub, run this command in PowerShell:

```powershell
cd D:\matth\ARENA3.0\my-arena-work
.\connect-to-github.ps1 -GitHubUsername YOUR_USERNAME -RepositoryName YOUR_REPO_NAME
```

Replace:
- `YOUR_USERNAME` with your GitHub username
- `YOUR_REPO_NAME` with the repository name you created

### Alternative: Manual Connection

If you prefer to do it manually:

```powershell
cd D:\matth\ARENA3.0\my-arena-work
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

## Authentication

If you get authentication errors:

### Option 1: GitHub CLI (Recommended)
1. Install GitHub CLI: https://cli.github.com/
2. Run: `gh auth login`
3. Then push: `git push -u origin main`

### Option 2: Personal Access Token
1. Go to GitHub Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate a new token with `repo` permissions
3. When prompted for password, use the token instead

### Option 3: SSH Keys
1. Set up SSH keys: https://docs.github.com/en/authentication/connecting-to-github-with-ssh
2. Change remote URL: `git remote set-url origin git@github.com:USERNAME/REPO.git`

## Next Steps

Once connected, you can:

1. **Start working on exercises**:
   ```powershell
   conda activate arena-env
   cd D:\matth\ARENA3.0\ARENA_3.0\chapter0_fundamentals\exercises
   ```

2. **Commit your work**:
   ```powershell
   git add .
   git commit -m "Completed exercise X.Y"
   git push
   ```

3. **Create branches for different chapters**:
   ```powershell
   git checkout -b chapter0-fundamentals
   # Work on exercises
   git add .
   git commit -m "Chapter 0 exercises"
   git push -u origin chapter0-fundamentals
   ```

## Repository Location

- **Local repository**: `D:\matth\ARENA3.0\my-arena-work` (or wherever you cloned it)
- **ARENA course materials**: Should be in the parent directory as `ARENA_3.0`

## Setting Up on Another Device

After cloning this repository on a new device, simply run:

```powershell
.\setup-new-device.ps1
```

This will automatically:
- Install Miniconda (if needed)
- Clone the ARENA_3.0 repository
- Set up the conda environment
- Install all dependencies

See `README.md` for more details.


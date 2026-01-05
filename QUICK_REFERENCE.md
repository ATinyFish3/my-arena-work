# Quick Reference Guide

## 🔧 Current Device - Fix Conda Not Recognized

If you get "conda is not recognized", run:
```powershell
.\init-conda.ps1
```

Then activate the environment:
```powershell
conda activate arena-env
```

**Note**: After restarting PowerShell, conda should be available automatically. If not, run `init-conda.ps1` again.

## 🚀 New Device Setup

After cloning this repository on a new device:

```powershell
.\setup-new-device.ps1
```

This one command will set up everything automatically!

## 📝 Daily Commands

### Activate Environment
```powershell
conda activate arena-env
```

### Work on Exercises
```powershell
cd ARENA_3.0\chapter0_fundamentals\exercises
```

**Note**: ARENA_3.0 is included as a git submodule. After cloning, run:
```powershell
git submodule update --init --recursive
```

### Save Your Work
```powershell
git add .
git commit -m "Completed exercise X.Y"
git push
```

## 🔄 Switch Between Devices

1. **On current device**: Commit and push your work
   ```powershell
   git add .
   git commit -m "Work in progress"
   git push
   ```

2. **On new device**: Clone and set up
   ```powershell
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
   cd YOUR_REPO
   git submodule update --init --recursive  # Initialize ARENA_3.0 submodule
   .\setup-new-device.ps1
   ```
   
   Or clone with submodules in one command:
   ```powershell
   git clone --recurse-submodules https://github.com/YOUR_USERNAME/YOUR_REPO.git
   cd YOUR_REPO
   .\setup-new-device.ps1
   ```

3. **Pull latest changes**:
   ```powershell
   git pull
   ```

## 🆘 Common Issues

### Conda not found
- Run: `.\init-conda.ps1`
- Or restart PowerShell
- Or manually add to PATH: `$env:Path += ";$env:USERPROFILE\miniconda3;$env:USERPROFILE\miniconda3\Scripts"`

### Environment not found
- Recreate: `conda env remove -n arena-env` then run `.\setup-new-device.ps1 -SkipCondaInstall -SkipRepoClone`

### Git authentication
- Use GitHub CLI: `gh auth login`
- Or use Personal Access Token
- Or set up SSH keys


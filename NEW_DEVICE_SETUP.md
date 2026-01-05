# Setting Up on a New Device - Simple Guide

## ✅ Yes, it's still easy!

Everything is automated. Just follow these steps:

## Step 1: Clone Your Repository

**Option A: Clone with submodules (recommended - one command)**
```powershell
git clone --recurse-submodules https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
```

**Option B: Clone then initialize submodules**
```powershell
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
git submodule update --init --recursive
```

## Step 2: Run the Setup Script

That's it! One command sets up everything:

```powershell
.\setup-new-device.ps1
```

This single script will:
1. ✅ Check for/install Miniconda automatically
2. ✅ Initialize the ARENA_3.0 submodule (if not already done)
3. ✅ Create the `arena-env` conda environment
4. ✅ Install all Python dependencies from `ARENA_3.0/requirements.txt`
5. ✅ Set up ipykernel for Jupyter notebooks

## Step 3: Start Working

```powershell
# If conda not recognized (first time only):
.\init-conda.ps1

# Activate environment:
conda activate arena-env

# Start working:
cd ARENA_3.0\chapter0_fundamentals\exercises
```

## What You Get

After setup, you'll have:
- ✅ Miniconda installed
- ✅ `arena-env` conda environment with Python 3.11
- ✅ All ARENA_3.0 course materials (as submodule)
- ✅ All dependencies installed
- ✅ Ready to work on exercises

## Troubleshooting

### "Conda not recognized"
```powershell
.\init-conda.ps1
```
Or restart PowerShell after Miniconda installation.

### "ARENA_3.0 folder is empty"
The submodule wasn't initialized. Run:
```powershell
git submodule update --init --recursive
```

### Setup script fails
Check that you have:
- PowerShell 5.1 or later
- Git installed
- Internet connection
- Administrator rights (for Miniconda installation)

## Quick Reference

**First time on new device:**
```powershell
git clone --recurse-submodules https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
.\setup-new-device.ps1
.\init-conda.ps1
conda activate arena-env
```

**Daily use:**
```powershell
.\init-conda.ps1  # If conda not recognized
conda activate arena-env
cd ARENA_3.0\chapter0_fundamentals\exercises
```

**Pull latest changes:**
```powershell
git pull
git submodule update --init --recursive  # If submodule updated
```

## Summary

✅ **Everything is automated** - One script does it all
✅ **ARENA_3.0 included** - No need to clone separately
✅ **Portable** - Works on any Windows device
✅ **Self-contained** - All setup files in your repository

The setup is actually **easier** now because:
- ARENA_3.0 is included as a submodule (no separate clone needed)
- Setup script handles submodule initialization automatically
- Everything is in one repository


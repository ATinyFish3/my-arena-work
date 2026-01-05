# Git Submodule Information

## What is a Submodule?

The ARENA_3.0 repository is included in this repository as a **git submodule**. This means:
- ✅ The ARENA_3.0 code is part of your repository
- ✅ When you clone your repo, ARENA_3.0 comes with it
- ✅ You can update ARENA_3.0 independently
- ✅ Your work stays separate from the original ARENA_3.0 repo

## Repository Structure

```
my-arena-work/
├── ARENA_3.0/          # Git submodule (the course materials)
│   ├── chapter0_fundamentals/
│   ├── chapter1_transformer_interp/
│   └── ...
├── setup-new-device.ps1
├── README.md
└── ...
```

## Working with Submodules

### Cloning Your Repository

**Option 1: Clone with submodules (recommended)**
```powershell
git clone --recurse-submodules https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
```

**Option 2: Clone then initialize submodules**
```powershell
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO
git submodule update --init --recursive
```

### Updating ARENA_3.0 to Latest Version

If the ARENA_3.0 repository gets updated, you can pull the latest changes:

```powershell
cd ARENA_3.0
git pull origin main
cd ..
git add ARENA_3.0
git commit -m "Update ARENA_3.0 submodule to latest version"
git push
```

### Checking Submodule Status

```powershell
git submodule status
```

### Working on Exercises

The ARENA_3.0 submodule is in your repository, so you can work directly:

```powershell
cd ARENA_3.0\chapter0_fundamentals\exercises
# Work on exercises here
```

**Note**: Your work on exercises should be committed to your main repository, not to the ARENA_3.0 submodule.

## Benefits

1. **Portability**: Everything is in one repository
2. **Version Control**: You can pin to a specific ARENA_3.0 version
3. **Updates**: Easy to update ARENA_3.0 when needed
4. **Separation**: Your work stays separate from the original repo

## Troubleshooting

### Submodule appears empty after clone
```powershell
git submodule update --init --recursive
```

### Submodule out of sync
```powershell
cd ARENA_3.0
git fetch
git checkout main  # or the branch you want
cd ..
```

### Remove and re-add submodule
```powershell
git submodule deinit ARENA_3.0
git rm ARENA_3.0
git submodule add https://github.com/callummcdougall/ARENA_3.0.git ARENA_3.0
```

## Setup Script

The `setup-new-device.ps1` script automatically handles submodule initialization, so you don't need to worry about it manually.


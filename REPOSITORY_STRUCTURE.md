# Repository Structure

## Overview

This repository contains:
1. **Your work** - All your exercise solutions and progress
2. **ARENA_3.0 submodule** - The original course materials (read-only)
3. **Setup scripts** - Automated setup for new devices

## Directory Structure

```
my-arena-work/
├── ARENA_3.0/                    # Git submodule (original course repo)
│   ├── chapter0_fundamentals/     # Course materials (DO NOT MODIFY)
│   ├── chapter1_transformer_interp/
│   ├── chapter2_rl/
│   ├── chapter3_llm_evals/
│   └── ... (original ARENA_3.0 files)
│
├── setup-new-device.ps1          # Automated setup script
├── init-conda.ps1                # Initialize conda in current session
├── connect-to-github.ps1         # Connect to GitHub (first time)
│
├── README.md                      # Main documentation
├── QUICK_REFERENCE.md             # Quick command reference
├── GITHUB_SETUP_INSTRUCTIONS.md   # GitHub setup guide
├── SUBMODULE_INFO.md             # Git submodule guide
├── SETUP_FIXES.md                # Setup fixes documentation
└── ... (your work files)
```

## Important Notes

### ✅ DO:
- **Modify files in `my-arena-work/`** - This is your workspace
- **Work on exercises** - Copy or reference exercises from `ARENA_3.0/`
- **Commit your work** - Your solutions and progress
- **Update submodule** - Pull latest ARENA_3.0 updates when needed

### ❌ DON'T:
- **Modify files in `ARENA_3.0/`** - This is a submodule (original repo)
- **Commit changes to `ARENA_3.0/`** - Keep it clean and read-only
- **Add files to `ARENA_3.0/`** - All setup files should be in `my-arena-work/`

## File Locations

### Setup Files (in `my-arena-work/`)
- `setup-new-device.ps1` - Complete setup automation
- `init-conda.ps1` - Fix conda PATH issues
- `connect-to-github.ps1` - GitHub connection helper

### Documentation (in `my-arena-work/`)
- `README.md` - Main documentation
- `QUICK_REFERENCE.md` - Quick commands
- `GITHUB_SETUP_INSTRUCTIONS.md` - GitHub setup
- `SUBMODULE_INFO.md` - Submodule guide
- `REPOSITORY_STRUCTURE.md` - This file

### Course Materials (in `ARENA_3.0/` - submodule)
- `chapter0_fundamentals/` - Fundamentals exercises
- `chapter1_transformer_interp/` - Transformer exercises
- `chapter2_rl/` - RL exercises
- `chapter3_llm_evals/` - LLM eval exercises
- `requirements.txt` - Python dependencies

## Working with Exercises

### Recommended Approach

1. **Reference exercises from submodule**:
   ```powershell
   cd ARENA_3.0\chapter0_fundamentals\exercises
   # Open and work on exercises here
   ```

2. **Save your solutions**:
   - Create your own solutions directory in `my-arena-work/`
   - Or work directly in the exercise files (they're in the submodule, but your changes won't be committed to the submodule)

3. **Commit your work**:
   ```powershell
   # Your work goes in my-arena-work/, not ARENA_3.0/
   git add .
   git commit -m "My solutions"
   ```

## Why This Structure?

1. **Separation of Concerns**
   - Your work is separate from the original course materials
   - Easy to update ARENA_3.0 without affecting your work

2. **Portability**
   - Everything is in one repository
   - Clone your repo and everything is there

3. **Clean Submodule**
   - ARENA_3.0 stays clean and matches the original repo
   - Easy to pull updates from upstream

4. **Organization**
   - Setup scripts and documentation in your repo
   - Course materials in the submodule

## Updating ARENA_3.0

When the original ARENA_3.0 repository gets updated:

```powershell
cd ARENA_3.0
git pull origin main
cd ..
git add ARENA_3.0
git commit -m "Update ARENA_3.0 to latest version"
git push
```

This keeps your repository in sync with the latest course materials while preserving your work.


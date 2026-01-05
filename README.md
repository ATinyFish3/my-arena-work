# ARENA 3.0 - My Work

This repository contains my work and solutions for the ARENA 3.0 AI Safety course.

## 🚀 Quick Start on a New Device

After cloning this repository, run the setup script:

```powershell
.\setup-new-device.ps1
```

This will:
1. Install Miniconda (if not already installed)
2. Clone the ARENA_3.0 repository
3. Create the `arena-env` conda environment
4. Install all required dependencies

## 📋 Prerequisites

- Windows 10/11
- PowerShell 5.1 or later
- Git (for cloning repositories)
- Internet connection (for downloading packages)

## 🔧 Manual Setup

If you prefer to set up manually or the script fails:

### 1. Install Miniconda
- Download from: https://docs.conda.io/en/latest/miniconda.html
- During installation, check "Add Miniconda3 to my PATH environment variable"
- Restart PowerShell after installation

### 2. Initialize Git Submodules
The ARENA_3.0 repository is included as a submodule. After cloning this repo, initialize it:
```powershell
git submodule update --init --recursive
```
Or just run `.\setup-new-device.ps1` which handles everything automatically.

### 3. Create Conda Environment
```powershell
conda create -n arena-env python=3.11 -y
conda activate arena-env
```

### 4. Install Dependencies
```powershell
cd ARENA_3.0
pip install -r requirements.txt
conda install ipykernel --update-deps --force-reinstall -y
```

## 💻 Daily Workflow

### Activate Environment
```powershell
# If conda is not recognized, run:
.\init-conda.ps1

# Then activate:
conda activate arena-env
```

### Work on Exercises
```powershell
cd ARENA_3.0\chapter0_fundamentals\exercises
# Open exercises in VS Code or Jupyter
```

**Note**: The ARENA_3.0 repository is included as a git submodule, so it's part of this repository. When you clone this repo, make sure to initialize submodules:
```powershell
git submodule update --init --recursive
```
Or use the setup script which handles this automatically.

### Commit and Push
```powershell
git add .
git commit -m "Completed exercise X.Y"
git push
```

## 📁 Repository Structure

- `chapter0_fundamentals/` - Fundamentals exercises
- `chapter1_transformer_interp/` - Transformer interpretability exercises
- `chapter2_rl/` - Reinforcement learning exercises
- `chapter3_llm_evals/` - LLM evaluation exercises

## 🔗 Links

- **ARENA 3.0 Repository**: https://github.com/callummcdougall/ARENA_3.0
- **Chapter 0 Streamlit**: https://arena-chapter0-fundamentals.streamlit.app/
- **ARENA Slack**: https://join.slack.com/t/arena-uk/shared_invite/zt-3d3sro2sn-lACCkkoA3Sjm8J0pvWSaGQ

## 📝 Progress

- [ ] Chapter 0: Fundamentals
- [ ] Chapter 1: Transformer Interpretability
- [ ] Chapter 2: Reinforcement Learning
- [ ] Chapter 3: LLM Evaluations

## 🆘 Troubleshooting

### Conda not recognized
Run `.\init-conda.ps1` or restart PowerShell after installing Miniconda.

### Environment not found
Recreate the environment:
```powershell
conda env remove -n arena-env
.\setup-new-device.ps1 -SkipCondaInstall -SkipRepoClone
```

### Package installation fails
Try installing packages individually or check your internet connection. Some packages may require additional system dependencies.

## 📚 Documentation

- `setup-new-device.ps1` - Automated setup script for new devices
- `init-conda.ps1` - Initialize conda in current PowerShell session
- `connect-to-github.ps1` - Connect local repo to GitHub (first time only)
- `GITHUB_SETUP_INSTRUCTIONS.md` - Detailed GitHub setup guide

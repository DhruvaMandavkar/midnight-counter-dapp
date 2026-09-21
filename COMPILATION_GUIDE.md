# Compilation Guide for Windows

This document explains how to compile Midnight Compact contracts on Windows using WSL.

## Prerequisites

- Windows 10/11 with WSL2 enabled
- Docker Desktop running
- Node.js v22+ installed

## Why WSL?

The Midnight Compact compiler currently only runs on Linux. Windows users need to:
1. Use WSL (Windows Subsystem for Linux)
2. Install the Compact compiler in WSL
3. Compile contracts via WSL commands
4. The compiled artifacts work normally in Windows

## Step-by-Step Installation

### 1. Install WSL (if not already installed)

```powershell
# Run in PowerShell as Administrator
wsl --install
# This installs Ubuntu by default
# Restart your computer if prompted
```

### 2. Install Compact Compiler in WSL

```powershell
# Run in PowerShell (not as admin)
wsl -d Ubuntu bash -c "curl --proto '=https' --tlsv1.2 -LsSf https://github.com/midnightntwrk/compact/releases/latest/download/compact-installer.sh | sh"
```

This installs the Compact compiler to `~/.local/bin/compact` inside Ubuntu.

### 3. Verify Installation

```powershell
wsl -d Ubuntu bash -c "~/.local/bin/compact --version"
# Should output: compact 0.5.2 (or latest version)
```

## Compiling the Counter Contract

### Windows Path → WSL Path Conversion

Windows: `D:\OneDrive\Desktop\level1,2,3`  
WSL: `/mnt/d/OneDrive/Desktop/level1,2,3`

**Rule**: Replace `D:` with `/mnt/d` and use forward slashes `/`

### Compilation Command

```powershell
# From PowerShell, run:
wsl -d Ubuntu bash -c "cd /mnt/d/OneDrive/Desktop/level1,2,3 && ~/.local/bin/compact compile contracts/counter.compact contracts/managed/counter"
```

### What This Does

1. **cd /mnt/d/...** - Navigate to your project in WSL
2. **~/.local/bin/compact** - Run the Compact compiler
3. **compile** - Compile command
4. **contracts/counter.compact** - Source file
5. **contracts/managed/counter** - Output directory

## Compilation Output

Successful compilation creates:

```
contracts/managed/counter/
├── compiler/    ← Compiler metadata
├── contract/    ← Contract artifacts
├── keys/        ← Cryptographic keys for ZK proofs
└── zkir/        ← Zero-knowledge intermediate representation
```

## Expected Output

```
Compiling 2 circuits:
  circuit "incrementPrivate" (k=6, rows=35) ✓
  circuit "incrementPublic" (k=6, rows=35) ✓
Overall progress [====================] 2/2
```

- **k=6**: Circuit size parameter (2^6 = 64 constraints)
- **rows=35**: Actual circuit complexity

## Common Issues

### Issue: "compact: command not found"

**Solution**: The compiler isn't installed in WSL. Run step 2 again.

### Issue: "No such file or directory"

**Solution**: Check your path conversion. Make sure:
- Windows path uses forward slashes in WSL
- Your drive letter is lowercase in `/mnt/` (e.g., `/mnt/d` not `/mnt/D`)

### Issue: "Permission denied"

**Solution**: The installer may not have made compact executable. Run:
```bash
wsl -d Ubuntu bash -c "chmod +x ~/.local/bin/compact"
```

## Alternative: Native Linux

If you have native Linux or macOS:

```bash
# Install Compact
curl --proto '=https' --tlsv1.2 -LsSf \
  https://github.com/midnightntwrk/compact/releases/latest/download/compact-installer.sh | sh

# Compile
compact compile contracts/counter.compact contracts/managed/counter
```

## Next Steps

After successful compilation:
1. The `managed/` directory contains all circuit artifacts
2. Deploy the contract to Preview/Preprod testnet
3. Integrate with frontend (Level 2)
4. These artifacts work in both WSL and Windows environments

## Resources

- [Midnight Docs](https://docs.midnight.network)
- [Compact Language Reference](https://docs.midnight.network/compact)
- [WSL Installation Guide](https://learn.microsoft.com/en-us/windows/wsl/install)

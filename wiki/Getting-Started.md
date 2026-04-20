# Getting Started

This page walks you from a clean checkout to a rebuilt ROM whose
SHA-1 matches your retail dump.

> [!IMPORTANT]
> You supply your own clean dump — this repo never ships copyrighted
> binaries. Drop it at `orig/baserom_<version>.nds`.

## Prerequisites

| Requirement   | Notes                                                               |
|---------------|---------------------------------------------------------------------|
| Ninja         | any recent version                                                  |
| Python 3.11+  | needs match-statements and PEP 604 unions                           |
| Clean ROM dump| one of `usa` (AYXE), `eur` (AYXP), `jpn` (AYXJ)                     |
| Win32 runner  | `wibo` on Linux (auto-downloaded), `wine` on macOS, native on Windows |

Everything else (`mwccarm`, `mwldarm`, `dsd`, `objdiff-cli`) is fetched
by `tools/download_tool.py` the first time `ninja` runs.

---

## macOS (Apple Silicon or Intel)

```bash
# 1. Native prerequisites (once per machine)
brew install ninja
brew install --cask wine-stable          # runs the Win32 mwcc/mwld toolchain

# 2. Drop your dump in orig/ and clone the repo
cp ~/Downloads/my-eur-dump.nds orig/baserom_eur.nds

# 3. Python deps in a venv
python3 -m venv .venv && source .venv/bin/activate
pip install -r tools/requirements.txt

# 4. Generate build.ninja (verifies the baserom SHA-1 at configure time)
python tools/configure.py eur            # or usa / jpn

# 5. Round-trip build and verify
ninja sha1
```

## Linux

```bash
sudo apt install ninja-build python3-venv           # or your distro's equivalent
python3 -m venv .venv && source .venv/bin/activate
pip install -r tools/requirements.txt
cp ~/my-dump.nds orig/baserom_eur.nds
python tools/configure.py eur
ninja sha1                                          # wibo is auto-downloaded
```

## Windows

```powershell
winget install Kitware.Ninja                        # or chocolatey / scoop
python -m venv .venv; .\.venv\Scripts\Activate.ps1
pip install -r tools/requirements.txt
copy C:\Users\me\my-dump.nds orig\baserom_eur.nds
python tools\configure.py eur
ninja sha1                                          # mwcc runs natively
```

---

## SHA-1 Verification

If the baserom SHA-1 check fails at configure time, the error message
prints the expected and actual hashes and tells you exactly which file
to update.

> [!WARNING]
> **Do not bypass the check.** A wrong dump will silently waste hours
> of analysis.

Known hashes:

| Region | SHA-1 prefix | Languages          |
|--------|--------------|--------------------|
| EUR    | `1da50df7…b4f75` | En, Fr, De, Es, It |
| USA    | `9e53dcc7…c2a83` | En                 |
| JPN    | `761fbfc6…424f6` | Ja                 |

---

## Next Steps

Once `ninja sha1` succeeds (or reports expected module-level diffs — see
[Build Status](Build-Status)):

1. Read the [Matching Workflow](Matching-Workflow) to understand the
   inner loop.
2. Check [Project Conventions](Project-Conventions) before writing code.
3. Skim [Contributing](Contributing) for how to submit changes.

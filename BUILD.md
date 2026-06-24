# Building GX Spirit Caller Decomp

You supply your own clean dump — this repo never ships copyrighted binaries.
Drop it at `orig/baserom_<region>.nds` (`eur` / `usa` / `jpn`); its SHA-1 is
verified at configure time.

## Quick start

```bash
python -m venv .venv && source .venv/bin/activate    # Windows: .\.venv\Scripts\Activate.ps1
pip install -r tools/requirements.txt
cp ~/my-dump.nds orig/baserom_eur.nds                # your own clean dump
python tools/configure.py eur                        # eur | usa | jpn
ninja sha1                                           # round-trip build + verify byte-identical
```

A single `ninja` run pulls the toolchain, extracts the ROM, delinks every
object, compiles `src/`, links, rebuilds the ROM, and compares its SHA-1 to
the original. If the configure-time hash check fails, the error tells you
exactly which hash to paste where — **don't bypass it**; a wrong dump
silently wastes hours of analysis.

## Per-OS prerequisites

Everything except `ninja`, Python, the Win32 runner, and the baserom is
downloaded automatically the first time you run `ninja`.

| OS | Install | Win32 toolchain runner |
|----|---------|------------------------|
| **Windows** | `winget install Kitware.Ninja` + Python 3.11+ | `mwccarm` / `mwldarm` run natively — no runner. |
| **Linux** | `apt install ninja-build python3-venv` (or equivalent) | `wibo` — auto-downloaded. |
| **macOS** | `brew install ninja` + Python 3.11+ + Rosetta 2 | [Game Porting Toolkit](https://github.com/Gcenx/homebrew-wine): `brew install --cask Gcenx/wine/game-porting-toolkit` (`configure.py` auto-selects its `wine64` shim). |

## Matching workflow

```
edit src/foo.c
   │  ninja            compile + link + rebuild ROM
   ▼  ninja objdiff    regenerate the per-unit diff database
   │  ninja report     aggregate into build/<ver>/report.json
   ▼  ninja sha1       final gate: byte-identical ROM
```

Inner loop once decomp is under way:

1. Pick an unmatched function from `config/<ver>/**/symbols.txt`.
2. Write a C version in `src/…` (or `libs/…` for SDK code).
3. `ninja` rebuilds; `ninja objdiff` generates a per-function diff; iterate to 100%.
4. Rename the symbol in `symbols.txt` from `func_02001234` to its real name once it matches.
5. `python tools/progress.py --version <ver>` prints a per-region table.

Hard functions that resist a clean C match can be shipped as byte-exact
assembly (`.s`) to keep the ROM round-tripping, then converted to C later.

## Project layout

```
.
├── orig/                # user-supplied baseroms (gitignored)
├── extract/             # dsd rom extract output (gitignored)
├── config/<ver>/        # dsd init output: delinks, relocs, symbols
├── src/                 # decompiled game code (C/C++) + .s ships
├── include/             # shared headers
├── libs/                # SDK / third-party libraries
├── tools/               # configure.py, progress.py, generators, helpers
├── build/               # ninja output (gitignored)
├── assets/              # committed progress visuals (badge / bars / heatmaps)
├── CLAUDE.md            # conventions & workflow for collaborators
└── README.md
```

## Toolchain

| Tool          | Version      | Notes                                                |
|---------------|--------------|------------------------------------------------------|
| `mwccarm`     | `2.0/sp1p5`  | decomp.me id `mwcc_30_131`; legacy `1.2` variants per-TU |
| `mwldarm`     | `2.0/sp1p5`  | ships alongside `mwccarm`                             |
| `dsd`         | `v0.11.0`    | [ds-decomp](https://github.com/AetiasHax/ds-decomp); macOS arm64 + Linux + Windows |
| `objdiff-cli` | `v2.7.1`     | per-function diffing; macOS/Linux/Windows            |
| `wibo`        | `0.6.16`     | Linux-only PE loader for the Win32 toolchain         |
| `ninja`       | any recent   | build driver                                         |
| Python        | 3.11+        | match-statements & PEP 604 unions                    |

See [CLAUDE.md](CLAUDE.md) for conventions, the per-region source-tree filter,
and `dsd init` bootstrapping notes.

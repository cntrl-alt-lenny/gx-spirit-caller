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

The region is a positional argument to `configure.py` and appears in `config/`
and `build/` subpaths. All three may coexist; configure one per run.

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

`ninja check` runs dsd's module and symbol consistency checks. A function is
"matched" when objdiff shows it identical to the original `.o` that
`dsd delink` produced.

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
├── AGENTS.md            # the project's rules for every agent and contributor
├── CLAUDE.md            # pointer to AGENTS.md (adds no rules)
└── README.md
```

## Toolchain

| Tool          | Version      | Notes                                                |
|---------------|--------------|------------------------------------------------------|
| `mwccarm`     | `2.0/sp1p5`  | Default; decomp.me id `mwcc_30_131`. Per-TU alternatives by filename suffix: `*.legacy.c` uses `1.2/sp2p3` (Style A epilogue, see [`docs/research/style-a-epilogue.md`](docs/research/style-a-epilogue.md)); `*.legacy_sp3.c` uses `1.2/sp3` (`sub sp, #4` prologue with a `pop {regs, pc}` epilogue, see [`docs/research/sp3-routing-decision.md`](docs/research/sp3-routing-decision.md)) |
| `mwldarm`     | `2.0/sp1p5`  | ships alongside `mwccarm`                             |
| `dsd`         | `v0.11.0`    | [ds-decomp](https://github.com/AetiasHax/ds-decomp); macOS arm64 + Linux + Windows |
| `objdiff-cli` | `v2.7.1`     | per-function diffing; macOS/Linux/Windows            |
| `wibo`        | `0.6.16`     | Linux-only PE loader for the Win32 toolchain         |
| `ninja`       | any recent   | build driver                                         |
| Python        | 3.11+        | match-statements & PEP 604 unions                    |

## Conventions

- **Language:** C by default (`.c`); a `.cpp` file opts in to C++ and
  `configure.py` passes `-lang=c++` for it.
- **Source layout:** `src/<module>/` (for example `src/overlay004/`, `src/main/`)
  is the EUR baseline. `src/<region>/` (`src/usa/`, `src/jpn/`) holds the
  region-specific ports that `tools/port_to_region.py` produces, and `libs/`
  is region-neutral SDK code, each library with an `include/` that
  `configure.py` adds to `-i` automatically. `configure.py` filters the source
  trees per region on its own.
- **Symbols:** rename in `config/<ver>/**/symbols.txt` (convention
  `ModuleName_FunctionName`, for example `Duel_DrawCard`); never hand-edit
  `arm9/config.yaml`.
- **Scratches:** `ninja build/<ver>/path/to/file.ctx.c` (or `.ctx.cpp`) writes a
  preprocessed context to paste into decomp.me next to the extracted assembly.
- **Never committed:** ROMs (`*.nds`), BIOS dumps, `extract/`, `build/` and
  downloaded tool binaries; `.gitignore` covers them.

## Platform notes

- **macOS (Apple Silicon):** install the
  [Game Porting Toolkit cask](https://github.com/Gcenx/homebrew-wine) and
  Rosetta 2 (see [`docs/machine-setup.md`](docs/machine-setup.md) and
  [`docs/research/wine-migration.md`](docs/research/wine-migration.md)).
  `configure.py` picks `wine` from `PATH`, and defaults `WINEPREFIX` to
  `<checkout>/.wine-lane` (auto-created, gitignored) so each checkout has its
  own wineserver (set `WINEPREFIX` to override); the `mwld` link step stays
  serialized machine-wide (`tools/wine_link_lock.py`). Use `python3.13`: macOS ships no plain `python`
  and its `/usr/bin/python3` is 3.9.
- **Linux:** `wibo` runs the Win32 compilers. **Windows:** they run natively.

## Bootstrapping `config/<ver>/` (one-off, already done)

`dsd init` is not part of the ninja graph; it was run by hand once per region
and its output is committed under `config/<ver>/`. On this game a stock run
fails with `Local function call from 0x021aaed4 in overlay 0 to 0x021b3810
leads to no function`, because overlays 0 and 2 share base address
`0x021aaee0`. The hidden flag `--allow-unknown-function-calls` injects
placeholder symbols at the unresolved addresses (upstream:
[ds-decomp#58](https://github.com/AetiasHax/ds-decomp/issues/58)):

```bash
./dsd init --rom-config extract/eur/config.yaml --output-path config/eur \
    --build-path build/eur --allow-unknown-function-calls
```

## Round-trip status

All three regions rebuild byte-identical (`ninja sha1`), and all 27 modules
check green in each (`dsd check modules`). Bytes outside `dsd`'s per-module
coverage are closed by three build-chain steps: `tools/clean_macos_junk.py`
strips `.DS_Store` files before `dsd rom build` scans `extract/<ver>/files/`,
`tools/patch_ov004_veneers.py` keeps overlay 4's table entry right, and
`tools/patch_rom_header_crc.py` writes the two ROM-header CRCs.

## Reference projects

[dqix](https://github.com/StanHash/dqix) is the template this repository
follows (the same `dsd` workflow, `configure.py` shape and ninja rules); the
differences are that the baserom lives at `orig/baserom_<version>.nds`, its
SHA-1 is verified at configure time, and the default language is C.
[SonicRushAdventure-Decomp](https://github.com/RushRE/SonicRushAdventure-Decomp)
predates `dsd` and is a reference only; this project does not use its layout.

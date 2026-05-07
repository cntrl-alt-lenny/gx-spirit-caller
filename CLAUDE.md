# CLAUDE.md — Yu-Gi-Oh! GX Spirit Caller decomp

Matching decompilation of *Yu-Gi-Oh! GX Spirit Caller* for Nintendo DS.
Goal: a byte-identical ROM rebuilt from C source, verified via SHA-1.

| Version | Game code | Baserom path              | Status                |
|---------|-----------|---------------------------|-----------------------|
| `usa`   | AYXE      | `orig/baserom_usa.nds`    | hashed                |
| `eur`   | AYXP      | `orig/baserom_eur.nds`    | hashed (En,Fr,De,Es,It) |
| `jpn`   | AYXJ      | `orig/baserom_jpn.nds`    | hashed                |

The version is a positional arg to `tools/configure.py` and appears in
config/ and build/ subpaths. All three may coexist; pick one per run.

## Toolchain

| Tool        | Version        | Notes                                        |
|-------------|----------------|----------------------------------------------|
| `mwccarm`   | `2.0/sp1p5`    | decomp.me id: `mwcc_30_131`. Adjust if objdiff says so after the first matching attempt. |
| `mwldarm`   | `2.0/sp1p5`    | Ships alongside mwccarm.                     |
| `dsd`       | `v0.11.0`      | https://github.com/AetiasHax/ds-decomp (native macOS arm64 builds since v0.9.1) |
| `objdiff-cli` | `v2.7.1`     | https://github.com/encounter/objdiff         |
| Ninja       | any recent     | build driver                                 |
| Python      | 3.11+          | match-statement and PEP 604 unions           |
| `wibo`      | `0.6.16`       | Linux only, runs the Win32 `.exe` compilers  |

All of the above (except Ninja, Python and the baserom) are downloaded by
`tools/download_tool.py` the first time `ninja` runs.

## Quick start

```bash
# 1. Put a clean dump at orig/baserom_<version>.nds (usa/eur/jpn).
#    We never ship ROMs.

# 2. Install Python deps
python -m pip install -r tools/requirements.txt

# 3. Generate build.ninja for your version (also verifies baserom SHA-1)
python tools/configure.py eur   # or usa / jpn

# 4. Build everything and verify the final ROM against its SHA-1
ninja sha1
```

If the baserom SHA-1 is wrong or unset, `configure.py` fails loudly —
do not bypass the check.

## Matching workflow

```
edit src/foo.c
 │
 ▼
ninja                 # compile + link + rebuild ROM
 │
 ▼
ninja objdiff         # regenerate per-unit diff database
ninja report          # aggregate into build/usa/report.json
python tools/progress.py
 │
 ▼
ninja check           # dsd's module + symbol consistency checks
ninja sha1            # final gate: byte-identical ROM
```

A function is "matched" when objdiff shows it identical to the original
`.o` produced by `dsd delink`. Practical loop:

1. Pick an unmatched function from `config/usa/**/symbols.txt`.
2. Write a C version in `src/…` (or `libs/…` for SDK code).
3. `ninja` → `ninja objdiff` → open the objdiff TUI/GUI against the
   generated `objdiff.json` to see the diff.
4. Iterate until 100% matched, then rename the symbol in `symbols.txt`
   and move on.

`ninja sha1` is the only test that actually matters at the project level:
if the rebuilt ROM hashes equal to the baserom, every function is matched.

## Project conventions

- **Language default**: C. Use `.c` files. Opt into C++ per-file by naming
  the file `.cpp`; `configure.py` passes `-lang=c++` automatically.
- **Source layout**:
  - `src/` — game code, mirror the overlay structure once known
    (`src/overlay000/`, `src/overlay001/`, … for code that lives in
    overlays; `src/main/` for arm9 main).
  - `libs/` — vendored / SDK code (NitroSDK, MSL, runtime). Each lib
    gets its own subdir with an `include/` that `configure.py`
    auto-adds to `-i`.
  - `include/` — public headers shared across the whole tree.
- **Symbols**: rename in `config/usa/**/symbols.txt`, never hand-edit
  `arm9/config.yaml`. Convention: `ModuleName_FunctionName`
  (e.g. `Duel_DrawCard`).
- **Scratches**: `ninja build/usa/path/to/file.ctx.c` (or `.ctx.cpp`)
  produces a preprocessed context suitable for pasting into
  decomp.me alongside the extracted assembly.
- **Do not commit**: ROMs (`*.nds`), BIOS dumps, `extract/`, `build/`,
  downloaded tool binaries. All handled by `.gitignore`.

## Known placeholders to fill in

1. ~~**Baserom SHA-1 (usa, jpn)**~~ — all three regions hashed:
   EUR `1da50df7…b4f75` (En,Fr,De,Es,It), USA `9e53dcc7…c2a83`,
   JPN `761fbfc6…424f6`. `BASEROM_SHA1` in `tools/configure.py` and
   `gx-spirit-caller_<ver>.sha1` both set.
2. **Exact mwcc SP revision** — `2.0/sp1p5` is the DS-era default and
   dqix's choice. Revisit after the first objdiff attempt; if everything
   is off by the same handful of instruction patterns, the SP revision
   is the usual suspect.
3. **Overlay count & NitroSDK version** — EUR has 23 arm9 overlays (known
   after the first `dsd rom extract`). USA/JPN overlay counts still TBD;
   NitroSDK version unknown until `dsd init` completes (see next section).
4. **progress.py parser** — the 0% stub counts `function` lines in
   `symbols.txt`. Adjust if ds-decomp's schema differs from what the
   heuristic expects; the real `report.json` path is already wired.

## Bootstrapping `config/<ver>/` (one-off)

`dsd init` is not wired into the Ninja graph — it's a rare, structural
operation you run by hand once per region, before anything else works.
On this game, the stock run of `dsd init` fails with
`Local function call from 0x021aaed4 in overlay 0 to 0x021b3810 leads to
no function` because overlay 0 and overlay 2 share base address
`0x021aaee0` (an overlay-swap pattern dsd's current analysis can't
model). The hidden flag `--allow-unknown-function-calls` bypasses the
error by injecting placeholder symbols at the unresolved addresses —
those symbols will be replaced as real analysis progresses.

```bash
./dsd init \
    --rom-config extract/eur/config.yaml \
    --output-path config/eur \
    --build-path build/eur \
    --allow-unknown-function-calls
```

Run this after `ninja extract/<ver>/config.yaml` and before anything
else. Upstream: filed as [ds-decomp#58](https://github.com/AetiasHax/ds-decomp/issues/58),
related to open issues #17 / #20 / #23.

## Current round-trip status (EUR)

With the workaround above plus the rest of the pipeline, `ninja rom`
succeeds end-to-end and produces `gx-spirit-caller_eur.nds`. Module-level
checksum state vs the baserom (from `dsd check modules`):

| Module      | Status         |
|-------------|----------------|
| ARM9 main   | ❌ checksum diff |
| ITCM        | ✅ OK           |
| DTCM        | ❌ checksum diff |
| Overlay 0   | ✅ OK           |
| Overlay 1–3 | ✅ OK           |
| Overlay 4   | ❌ checksum diff |
| Overlay 5–23| ✅ OK           |

**24 of 27 modules round-trip byte-identically.** The 3 failures are
almost certainly artifacts of the placeholder symbols that
`--allow-unknown-function-calls` injected; expect them to resolve as the
cross-module relocations in ARM9 main / DTCM / overlay 4 are manually
filled in (or as the upstream analyzer improves). `ninja sha1` is the
final gate and will stay red until all 27 modules check green.

## Platform notes

- **macOS (Apple Silicon):** install the
  [Game Porting Toolkit cask](https://github.com/Gcenx/homebrew-wine)
  for the Win32 runner —
  `brew install --cask Gcenx/wine/game-porting-toolkit` — and
  Rosetta 2. `configure.py` auto-selects `wine` from `PATH` on
  Darwin, which resolves to GPTK's `wine64` shim under
  `/opt/homebrew/bin/`. The legacy `wine-stable` cask is
  deprecated; see
  [`docs/research/wine-migration.md`](docs/research/wine-migration.md).
  `dsd-macos-arm64` and `objdiff-cli-macos-arm64` are downloaded
  natively.
- **Linux:** `wibo` is auto-downloaded and runs the Win32 compiler.
- **Windows:** `mwccarm.exe` / `mwldarm.exe` run natively; no runner.
- `get_platform.py` was patched 2026-04-20 to return `Darwin → macos` and
  `arm64 → arm64` (the dqix template masqueraded both as Linux/x86_64).

## Reference projects & where we differ

- **[dqix](https://github.com/StanHash/dqix)** — our primary template.
  Same dsd-based workflow, same `configure.py` shape, same Ninja rules.
  Two deliberate divergences:
  1. Baserom lives at `orig/baserom_<version>.nds` instead of
     `extract/baserom_<game>_<version>.nds` — keeps the user-supplied
     input separate from dsd's extraction output.
  2. Baserom SHA-1 is verified at configure time, not just at
     `ninja sha1` on the rebuilt ROM — a wrong dump fails before any
     build steps run.
  3. Default language is C (dqix defaults to C++).
- **[SonicRushAdventure-Decomp](https://github.com/RushRE/SonicRushAdventure-Decomp)**
  — Make-based, predates dsd, uses per-region directories and manual
  linker scripts (`arm9.lsf`, `rom.rsf`). We do **not** follow this
  layout; it's here for reference only.

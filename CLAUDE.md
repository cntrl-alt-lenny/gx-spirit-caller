# CLAUDE.md — Yu-Gi-Oh! GX Spirit Caller decomp

Matching decompilation of *Yu-Gi-Oh! GX Spirit Caller* for Nintendo DS
(game code **AYXE**, US region). Goal: a byte-identical ROM rebuilt from C
source, verified via SHA-1.

## Toolchain

| Tool        | Version        | Notes                                        |
|-------------|----------------|----------------------------------------------|
| `mwccarm`   | `2.0/sp1p5`    | decomp.me id: `mwcc_30_131`. Adjust if objdiff says so after the first matching attempt. |
| `mwldarm`   | `2.0/sp1p5`    | Ships alongside mwccarm.                     |
| `dsd`       | `v0.6.0`       | https://github.com/AetiasHax/ds-decomp       |
| `objdiff-cli` | `v2.7.1`     | https://github.com/encounter/objdiff         |
| Ninja       | any recent     | build driver                                 |
| Python      | 3.11+          | match-statement and PEP 604 unions           |
| `wibo`      | `0.6.16`       | Linux only, runs the Win32 `.exe` compilers  |

All of the above (except Ninja, Python and the baserom) are downloaded by
`tools/download_tool.py` the first time `ninja` runs.

## Quick start

```bash
# 1. Put a clean US-region dump at orig/baserom_usa.nds
#    (game code AYXE, we do not ship ROMs)

# 2. Install Python deps
python -m pip install -r tools/requirements.txt

# 3. Generate build.ninja (also verifies baserom SHA-1)
python tools/configure.py usa

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

1. **Baserom SHA-1** — `BASEROM_SHA1["usa"]` in `tools/configure.py` and
   the checksum file `gx-spirit-caller_usa.sha1`. Compute with
   `sha1sum orig/baserom_usa.nds` once you have a verified dump.
2. **Exact mwcc SP revision** — `2.0/sp1p5` is the DS-era default and
   dqix's choice. Revisit after the first objdiff attempt; if everything
   is off by the same handful of instruction patterns, the SP revision
   is the usual suspect.
3. **Overlay count & NitroSDK version** — unknown until `dsd init` has
   run against the extracted baserom. Record them in this file once
   you know them.
4. **progress.py parser** — the 0% stub counts `function` lines in
   `symbols.txt`. Adjust if ds-decomp's schema differs from what the
   heuristic expects; the real report.json path is already wired.

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

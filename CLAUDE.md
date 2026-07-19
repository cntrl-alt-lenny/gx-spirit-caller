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
| `mwccarm`   | `2.0/sp1p5`    | Default. decomp.me id: `mwcc_30_131`. Adjust if objdiff says so after the first matching attempt. |
| `mwccarm` (legacy) | `1.2/sp2p3` | Per-TU compiler for Style A epilogue files (`*.legacy.c` filename suffix). See [`docs/research/style-a-epilogue.md`](docs/research/style-a-epilogue.md). |
| `mwccarm` (legacy_sp3) | `1.2/sp3` | Per-TU compiler for the third routing tier — `sub sp, #4` prologue with Style B `pop {regs, pc}` epilogue. Files matching `*.legacy_sp3.c`. See [`docs/research/sp3-routing-decision.md`](docs/research/sp3-routing-decision.md) (brief 044). |
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

## Current round-trip status (all three regions)

**Byte-identical ROM rebuild achieved — all three regions.** `ninja rom`
builds `gx-spirit-caller_<eur|usa|jpn>.nds`, and `ninja sha1` (the
project's final gate) now PASSES byte-for-byte against each baserom.
All 27 modules × 3 regions check green (`dsd check modules`) — the
former ARM9 main / DTCM / overlay 4 checksum diffs are resolved.

Re-verified 2026-06-01: for each of `eur` / `usa` / `jpn`,
`python tools/configure.py <ver> && rm -f objdiff.json
gx-spirit-caller_<ver>.nds && ninja sha1` exits 0 (`sha1.py` reports
`OK`; `cmp -l` against the baserom reports 0 differing bytes).

How the last bytes closed: with every module's checksum green, `ninja
sha1` still diffed on bytes *outside* dsd's per-module coverage (FNT /
FAT, ROM header, overlay table). Brief 137 scoped that residual — see
[`docs/research/sha1-gap-scoping.md`](docs/research/sha1-gap-scoping.md)
— and briefs 138–140 closed it with three build-chain fixes:

1. **`.DS_Store` build-junk filter** (brief 138, PR #555):
   `tools/clean_macos_junk.py` strips macOS metadata from
   `extract/<region>/files/` before `dsd rom build` scans it — this
   alone collapsed the EUR diff from 100,805 → 5 bytes (99.995% of it).
2. **`patch_ov004_veneers.py` off-by-1024 fix** (brief 140, PR #558):
   the idempotent re-run path no longer derives a 1024-bytes-short
   `code_size`, so ov4's overlay-table `ram_size` matches orig.
3. **ROM-header CRC16 patcher** (brief 140, PR #558):
   `tools/patch_rom_header_crc.py` writes the secure-area CRC at `0x6C`
   (copied from orig) and the header CRC at `0x15E` (computed) — both
   left unset by `dsd rom build`.

These took EUR to 0 bytes; the 2-byte USA / JPN main
function-displacement the scoping doc flagged out-of-scope (Cat ζ) has
since closed too, so all three regions match — not just EUR.

`configure.py` filters per-region source trees automatically:
`src/<region>/` is region-specific (USA / JPN ports from
`tools/port_to_region.py`), `src/<module>/` without a region prefix is
the EUR baseline, and `libs/` is region-neutral. See brief 064
deliverable 2 (PR #419) for the porting convention.

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
  natively. `configure.py` defaults `WINEPREFIX` to `<worktree>/.wine-lane`
  (auto-created on first compile, gitignored) instead of the shared
  `~/.wine` — each worktree gets its own wineserver, so concurrent
  worktrees' compiles no longer serialize on each other (brief 608/614;
  see [`docs/research/brief-608-wineprefix-spike.md`](docs/research/brief-608-wineprefix-spike.md)).
  Set `WINEPREFIX` explicitly to override. The `mwld` link step stays
  serialized machine-wide regardless (`tools/wine_link_lock.py`).
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

[//]: # (markdownlint-disable MD013)

# fastmatch.py — per-TU match check without a full ROM rebuild

## What it does

`tools/fastmatch.py` compiles a single source file by running
`ninja <that_unit.o>` — exactly one compilation target, no ROM build,
no link, no sha1 — then word-compares the resulting `.o` against the
delinked gap object for the requested region, reporting the function
match percentage.

It is the **inner-loop gate** for match iterations. The current campaign
workflow rebuilds the whole ROM (`ninja rom` + `ninja sha1`) to test each
attempt — minutes per iteration, with the MED-tier tail parking ~90% of
attempts. A single function's match can be checked by compiling just that one
`.c` and diffing the object against the delinked target `.o` — typically
under five seconds. The full `ninja sha1` only needs to run to *confirm* an
accepted 100% match.

```
┌──────────────────────────────────────────────────────────────────────────┐
│ Match iteration loop (fastmatch per attempt; sha1 only on accept)        │
│                                                                          │
│  edit src/foo.c                                                          │
│       │                                                                  │
│       ▼                                                                  │
│  python tools/fastmatch.py eur src/foo.c     ← seconds, per attempt     │
│       │                                                                  │
│       ├─ 100%? → accept candidate                                        │
│       │    │                                                             │
│       │    ▼                                                             │
│       │  ninja sha1          ← minutes, only on accept (GATE UNCHANGED) │
│       │                                                                  │
│       └─ <100%? → tweak src, loop                                        │
└──────────────────────────────────────────────────────────────────────────┘
```

The sha1 gate is unchanged — fastmatch speeds up the fail case, not the pass
case. Safety is identical.

## Implementation details

### Compilation — delegates to ninja (zero flag drift)

The original approach hand-reconstructed the mwcc flags
(`-O4,p -enum int -char signed …`) and include paths and invoked
`mwccarm.exe` directly. This broke on known-matched functions because
the reconstructed flags diverged from what `configure.py` actually writes
into `build.ninja` (wrong `-d` format, absolute vs. relative include paths,
missing per-TU variables like `$cc_flags`, etc.).

The fix: compute the ninja output target path for the source file and call
`ninja <target.o>`. This delegates to ninja's existing per-TU rule, which
uses the EXACT flags/includes/defines from `build.ninja`. Zero flag drift is
structurally guaranteed.

**Output path formula** (mirrors `configure.py`'s `add_mwcc_builds()`):

```
src/main/func_X.c          →  build/eur/src/main/func_X.o
src/main/func_X.legacy.c   →  build/eur/src/main/func_X.legacy.o
src/usa/main/func_X.c      →  build/usa/src/usa/main/func_X.o
```

`Path.with_suffix(".o")` replaces only the LAST suffix, so multi-suffix
filenames (`*.legacy.c`) correctly produce `*.legacy.o`.

**Tier selection** is handled by ninja's build rules — fastmatch does not
need to know which `mwccarm.exe` to call. The tier displayed in output
is inferred from the filename suffix (for informational purposes only).

### Word comparison

fastmatch.py inherits the exact comparison algorithm from `tools/verify.py`:

- **`.L_`-sublabel spanning** — `dsd delink` splits each function at internal
  labels (`.L_xxxxxxxx` for default-blocks, switch tails, const pools). The
  comparator spans these continuations so whole-function matches read true.
  (Two wave-1 picks were byte-identical all along but read as near-misses until
  verify.py fixed this — fastmatch.py carries the same fix.)
- **Reloc wildcarding** — relocatable words on either side count as wildcards,
  avoiding false diffs on absolute address references.
- **Const-pool stripping** — trailing zero/reloc'd words (the const pool) are
  dropped from both sides before comparison.
- **Percentage output** — `matched_words / total_words × 100`, rounded to two
  decimal places. A count-mismatch reduces the percentage proportionally.

### Gap object discovery

Two-tier strategy, preferred order:

1. **`objdiff.json` lookup** (primary) — if `dsd objdiff` has run (via
   `ninja objdiff`), `objdiff.json` maps each compiled `.o` (`base_path`) to
   its delinked gap `.o` (`target_path`). fastmatch reads this directly.
   Handles `.resolved.o` sidecars written by `objdiff_resolve_relocs.py`.
2. **Recursive glob** (fallback) — `build/<region>/delinks/**/_dsd_gap@<module>_*.o`,
   confirmed by scanning each candidate's symbol table with
   `arm-none-eabi-objdump -t`.

## Usage

```
python tools/fastmatch.py <region> <cfile> [<cfile> ...] [OPTIONS]

Arguments:
  region       eur | usa | jpn
  cfile        Source .c path(s) to compile and check

Options:
  --func NAME  Check only this function (default: all functions in the .o)
  --gap FILE   Explicit gap object (skips auto-discovery)
  --json       Machine-readable JSON output
  --verbose    Show first 8 differing words for non-100% matches

Exit codes:
  0  All queried functions matched 100%
  1  At least one function is a non-100% match
  2  Compile error or gap object not found
```

### Examples

```bash
# Single-function check — EUR
python tools/fastmatch.py eur src/main/func_02000e34.c

# Legacy tier .c (tier auto-detected from suffix)
python tools/fastmatch.py eur src/main/func_0204bf44.legacy.c

# USA source against USA gap objects
python tools/fastmatch.py usa src/usa/main/func_0204bf44.c

# Batch: two files in one call (both must reach 100% for exit 0)
python tools/fastmatch.py eur src/main/func_0204bf44.c src/main/func_020a71e4.c

# Check only one function in a multi-function TU
python tools/fastmatch.py eur src/main/big_module.c --func func_0204bf44

# Machine-readable output for scripted wave automation
python tools/fastmatch.py eur src/main/func_02000e34.c --json

# Explicit gap object (if auto-discovery is slow or ambiguous)
python tools/fastmatch.py eur src/main/func_abc.c \
    --gap build/eur/delinks/_dsd_gap@main_0abc1234.o
```

### Sample human-readable output

```
[eur] func_0204bf44.c
  func_0204bf44 (func_0204bf44.c, cc=2.0): 87.5%  DIFF  (4 diffs, 8w mine vs 8w orig, gap=build/eur/delinks/…)

[eur] func_020a71e4.c
  func_020a71e4 (func_020a71e4.c, cc=2.0): 100.0%  OK  (12 words, gap=build/eur/delinks/…)
```

### Sample JSON output (`--json`)

```json
[
  {
    "file": "src/main/func_0204bf44.c",
    "region": "eur",
    "tier": "2.0",
    "status": "ok",
    "functions": [
      {
        "name": "func_0204bf44",
        "status": "ok",
        "match_percent": 87.5,
        "mine_words": 8,
        "orig_words": 8,
        "diff_count": 4,
        "gap_obj": "build/eur/delinks/…/_dsd_gap@main_XY.o",
        "compiled_obj": "build/eur/src/main/func_0204bf44.o",
        "diffs_sample": [[2, "e3a01001", "e3a01002"]]
      }
    ]
  }
]
```

The `diffs_sample` field contains up to 8 entries: `[word_index, mine_hex, orig_hex]`.

## How it fits the campaign loop

| Scenario | Tool | Cost |
|----------|------|------|
| Test a candidate edit | `fastmatch.py` | ~5 s (ninja compile + objdump) |
| Confirm accepted 100% match | `ninja sha1` | ~2–5 min |
| Review per-unit diff (TUI) | `ninja objdiff` | ~30 s + TUI |
| Verify all regions after match | `ninja sha1` × 3 | ~6–15 min |

A campaign wave that calls `fastmatch.py` per attempt instead of `ninja sha1`
saves roughly 2–5 min **per rejected attempt**. With the MED tail parking
~90% of first attempts, a 10-attempt iteration loop goes from ~20–50 min of
sha1 runs down to ~1 min of fastmatch checks plus one final sha1 on the
winner.

## Prerequisites

- `arm-none-eabi-objdump` on PATH (GNU binutils for ARM; already required by
  `tools/verify.py`).
- `build.ninja` configured for the target region:
  ```bash
  python tools/configure.py eur   # (or usa / jpn)
  ```
  This is a prerequisite for ANY build. fastmatch does not invoke mwccarm
  directly; it needs ninja to have a build graph for the source file.
  Re-run `configure.py` when a new `.c` file is added to `src/`.
- `build/<region>/delinks/` populated — requires `ninja delink` (or a full
  `ninja`) to produce the `_dsd_gap@*.o` files.
- mwccarm binaries are downloaded automatically on first `ninja` run via
  `tools/download_tool.py` — no manual setup needed.

## Validation plan

Run in a baserom worktree (with `build/eur/delinks/` populated from a
previous `ninja` run) to confirm fastmatch agrees with the real build.

### Step 1 — 5 confirmed-matched functions (expect 100%)

Pick 5 functions listed as `complete` in `config/eur/**/delinks.txt`:

```bash
python tools/fastmatch.py eur src/main/<known_matched_1>.c
python tools/fastmatch.py eur src/main/<known_matched_2>.c
python tools/fastmatch.py eur src/main/<known_matched_3>.c
python tools/fastmatch.py eur src/overlay002/<known_matched_4>.c
python tools/fastmatch.py eur src/overlay002/<known_matched_5>.c
# All five should print 100.0%  OK
```

For the C-match campaign, any function from a merged C-match PR is a
confirmed match (e.g. functions from PR #1037 or later).

### Step 2 — 5 unmatched candidates (expect <100%)

Pick 5 functions still in the candidate queue (no `.c` source yet).
Write trivially-wrong stubs and verify fastmatch reports a low match %:

```bash
# Stub: void func_XXXXXXXX(void) {}
python tools/fastmatch.py eur src/main/func_0204bf44.c
# (etc for 5 stubs)
# Each should print <100%  DIFF
```

### Step 3 — Multi-suffix tier routing

Verify that legacy-tier files compile correctly (ninja picks the right
compiler binary from the filename suffix automatically):

```bash
# .legacy.c → mwcc 1.2/sp2p3 (Style-A epilogue tier)
python tools/fastmatch.py eur src/main/func_YYYYYY.legacy.c
# .legacy_sp3.c → mwcc 1.2/sp3
python tools/fastmatch.py eur src/main/func_ZZZZZZ.legacy_sp3.c
```

### Step 4 — Batch mode and JSON output

```bash
# Two files in one invocation
python tools/fastmatch.py eur src/main/<m1>.c src/main/<m2>.c
# Check exit code: 0 if both 100%, 1 if any <100%, 2 on error

# JSON round-trip
python tools/fastmatch.py eur src/main/<m1>.c --json | python -m json.tool
```

### Step 5 — Time comparison

```bash
time python tools/fastmatch.py eur src/main/func_02000e34.c
time ninja sha1
```

Expected: fastmatch ≈ 3–8 s (single ninja compile + two objdumps);
sha1 ≈ 2–5 min (full 3-region ROM rebuild + verify). The speedup is
proportional to how many rejected attempts occur before a 100% match.

### Step 6 — Error path: build.ninja missing

```bash
# In a fresh clone with no build.ninja yet:
python tools/fastmatch.py eur src/main/func_02000e34.c
# Should print: "ERROR: build.ninja not found … Run configure.py first"
# Exit code 2
```

### Pass criteria

- 5 known-matched funcs → 100% ✅
- 5 stubs → <100% ✅
- Legacy/sp3 tier routing → compiles correctly ✅
- Batch mode exit codes correct ✅
- fastmatch runtime < 10 s ✅
- sha1 runtime > 60 s (confirming the speedup is real) ✅
- Missing build.ninja → clean error message, exit 2 ✅

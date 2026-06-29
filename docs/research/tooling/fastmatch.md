[//]: # (markdownlint-disable MD013)

# fastmatch.py — per-TU match check without a full ROM rebuild

## What it does

`tools/fastmatch.py` compiles a single source file with the correct mwcc
tier and word-compares the result against the delinked gap object for the
requested region. No ninja invocation, no link step, no sha1.

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
  decimal places. A count-mismatch (more words on one side) reduces the
  percentage proportionally.

Compiler routing is identical to `build.ninja`:

| Filename suffix | Tier | Binary |
|-----------------|------|--------|
| `*.c` | `2.0` (default) | `tools/mwccarm/2.0/sp1p5/mwccarm.exe` |
| `*.legacy.c` | `legacy` | `tools/mwccarm/1.2/sp2p3/mwccarm.exe` |
| `*.thumb.c` | `legacy` | `tools/mwccarm/1.2/sp2p3/mwccarm.exe` |
| `*.legacy_sp3.c` | `sp3` | `tools/mwccarm/1.2/sp3/mwccarm.exe` |

Wine/runner selection mirrors `configure.py`: Windows runs `mwccarm.exe`
natively, Linux uses `./wibo`, macOS uses `wine`/`wine64` on `PATH`.

Gap objects are located by recursive glob over
`build/<region>/delinks/**/_dsd_gap@<module>_*.o` and confirmed by scanning
their symbol tables with `arm-none-eabi-objdump -t`.

## Usage

```
python tools/fastmatch.py <region> <cfile> [<cfile> ...] [OPTIONS]

Arguments:
  region       eur | usa | jpn
  cfile        Source .c path(s) to compile and check

Options:
  --func NAME  Check only this function (default: all functions in the .o)
  --cc TIER    Override compiler tier: 2.0 | legacy | sp3
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
# Single-function check — EUR default tier
python tools/fastmatch.py eur src/main/func_0204bf44.c

# Force legacy tier (Style A epilogue candidate)
python tools/fastmatch.py eur src/main/func_0204bf44.legacy.c --cc legacy

# USA source against USA gap objects
python tools/fastmatch.py usa src/usa/main/func_0204bf44.c

# Batch: two files in one call (both must reach 100% for exit 0)
python tools/fastmatch.py eur src/main/func_0204bf44.c src/main/func_020a71e4.c

# Check only one function in a multi-function TU
python tools/fastmatch.py eur src/main/big_module.c --func func_0204bf44

# Machine-readable output for scripted wave automation
python tools/fastmatch.py eur src/main/func_0204bf44.c --json

# Explicit gap object (if auto-discovery is slow or ambiguous)
python tools/fastmatch.py eur src/main/func_0204bf44.c \
    --gap build/eur/delinks/_dsd_gap@main_0204bf44.o
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
        "diffs_sample": [[2, "e3a01001", "e3a01002"], …]
      }
    ]
  }
]
```

The `diffs_sample` field contains up to 8 entries: `[word_index, mine_hex, orig_hex]`.

## How it fits the campaign loop

| Scenario | Tool | Cost |
|----------|------|------|
| Test a candidate edit | `fastmatch.py` | ~5 s (compile + objdump) |
| Confirm accepted 100% match | `ninja sha1` | ~2–5 min |
| Review per-unit diff (TUI) | `ninja objdiff` | ~30 s + TUI |
| Verify all regions after match | `ninja sha1` × 3 | ~6–15 min |

A campaign wave that calls `fastmatch.py` per attempt instead of `ninja sha1`
saves roughly 2–5 min **per rejected attempt**. With the MED tail parking
~90% of first attempts, a 10-attempt iteration loop goes from ~20–50 min of
sha1 runs down to ~1 min of fastmatch checks plus one final sha1 on the
winner.

## Prerequisites

- `arm-none-eabi-objdump` on PATH (GNU binutils for ARM; already required for
  `tools/verify.py`).
- `tools/mwccarm/` downloaded — happens automatically on the first `ninja` run,
  or manually via `python tools/download_tool.py`.
- `build/<region>/delinks/` populated — requires `ninja delink` (or a full
  `ninja` once) to produce the `_dsd_gap@*.o` files.
- Windows: no additional runner. Linux: `./wibo` at repo root. macOS:
  `wine`/`wine64` on PATH.

## Validation plan

Run once in a baserom worktree (one with `build/eur/delinks/` populated by a
previous `ninja` run) to confirm fastmatch agrees with `ninja objdiff`:

### Step 1 — Confirmed-matched functions (expect 100%)

Pick 3 functions from `config/eur/**/delinks.txt` that are marked `complete`:

```bash
python tools/fastmatch.py eur src/main/<known_matched_1>.c
python tools/fastmatch.py eur src/main/<known_matched_2>.c
python tools/fastmatch.py eur src/overlay002/<known_matched_3>.c
# All three should print 100.0%  OK
```

### Step 2 — Known-unmatched functions (expect <100%)

Pick 3 functions that are still `.s` placeholders (no `.c` source yet). Write
a trivially-wrong stub (e.g. `void func_XXXXXXXX(void) {}`) and verify
fastmatch reports a low match percentage:

```bash
# Stub: void func_0204bf44(void) {}
python tools/fastmatch.py eur src/main/func_0204bf44.c
# Should print <100%  DIFF  (…)
```

### Step 3 — Agree with `ninja objdiff`

For one function, compare fastmatch's percentage against what `objdiff-cli`
reports in the TUI after `ninja objdiff`. The counts should agree (word-for-
word comparison uses the same algorithm as verify.py which was validated
against the project's accepted matches).

### Step 4 — Time comparison

```bash
time python tools/fastmatch.py eur src/main/func_0204bf44.c
time ninja sha1
```

Expected: fastmatch ≈ 3–8 s; sha1 ≈ 2–5 min. The speedup is proportional to
how many rejected attempts occur before a 100% match is found.

### Step 5 — Three-tier validation

For a function known to need the legacy or sp3 tier:

```bash
# Default tier (expect non-100% or compile warning):
python tools/fastmatch.py eur src/main/func_YYYYYY.legacy.c
# Legacy tier (expect 100% if it's a confirmed legacy match):
python tools/fastmatch.py eur src/main/func_YYYYYY.legacy.c --cc legacy
```

### Pass criteria

- All 3 known-matched: 100% ✅
- All 3 stub-wrong: <100% ✅  
- Matches agree with `ninja objdiff` counts ✅
- fastmatch runtime < 10 s ✅
- sha1 runtime > 60 s (confirming the speedup is real) ✅

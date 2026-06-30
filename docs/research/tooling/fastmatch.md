[//]: # (markdownlint-disable MD013)

# fastmatch.py — per-TU match check without a full ROM rebuild

## What it does

`tools/fastmatch.py` compiles a single source file by running
`ninja <that_unit.o>` — exactly one compilation target, no ROM build,
no link, no sha1 — then runs the **resolved** comparison against its
delinked gap object, reporting the function match percentage.

It is the **inner-loop gate** for match iterations. The key difference
from raw `ninja objdiff` is that fastmatch uses the same reloc-resolution
pass that `ninja report` uses (via `tools/objdiff_resolve_relocs.py`), so
it catches failures that raw objdiff misses.

```
┌──────────────────────────────────────────────────────────────────────────┐
│ Match iteration loop (fastmatch per attempt; sha1 only on accept)        │
│                                                                          │
│  edit src/foo.c                                                          │
│       │                                                                  │
│       ▼                                                                  │
│  python tools/fastmatch.py eur src/foo.c     ← seconds, per attempt     │
│       │                                                                  │
│       ├─ 100% (resolved)? → accept candidate                             │
│       │    │                                                             │
│       │    ▼                                                             │
│       │  ninja sha1          ← minutes, only on accept (GATE UNCHANGED) │
│       │                                                                  │
│       └─ <100%? → tweak src, loop                                        │
└──────────────────────────────────────────────────────────────────────────┘
```

The sha1 gate is unchanged — fastmatch speeds up the fail case, not the pass
case. Safety is identical.

## Why resolved comparison matters

Raw `ninja objdiff` and the old `tools/verify.py` wildcard every
relocatable word: gap `.o` pool entries have `R_ARM_ABS32` relocs (the
gap's zero slots versus mwcc's raw literals), and BL targets have
`R_ARM_PC24` relocs on both sides. This wildcarding hides two critical
failure modes documented in
`docs/research/objdiff-sha1-gap/gap-taxonomy.md`:

| Mode | What differs | Raw objdiff | Resolved | sha1 |
|------|-------------|-------------|---------|------|
| A — Wrong pool value | Pool word bytes | **MISS** (wildcard) | **CATCHES** | CATCHES |
| B — Wrong callee | BL displacement | **MISS** (wildcard) | **CATCHES** | CATCHES |
| C — Extra .rodata/.data | Section size | MISS | MISS | CATCHES |
| D — Pool count mismatch | Function size | Partial | CATCHES | CATCHES |
| E — Scheduling diff | Instruction bytes | CATCHES | CATCHES | CATCHES |

**The campaign's ~80% false-positive rate on raw objdiff is dominated by
Modes A and B.** Resolved fastmatch shrinks that to only Mode C (extra
.rodata/.data sections — a separate, smaller failure class).

## How the resolved comparison works

After `ninja <target.o>` compiles the candidate:

1. `tools/objdiff_resolve_relocs.py`'s `resolve_elf_relocs()` is called
   on BOTH the compiled `.o` and the gap `.o`. This applies every
   `R_ARM_ABS32` and `R_ARM_PC24` reloc to a fictional virtual base
   (same symbol-name → address scheme as the real linker; see
   `docs/research/objdiff-sha1-gap/gap-taxonomy.md` for details).
   Reloc tables are then zeroed out so objdump sees no annotations.

2. The resolved `.o` sidecars are written to a temp dir (never to
   `build/`), then `arm-none-eabi-objdump -d -r` runs on them.

3. Since reloc sections are stripped, `_parse_words()` records
   `is_reloc=False` for every word. The `match_percent()` wildcarding
   branch (`if mw[1] or ow[1]: continue`) never fires.

4. **Pool words** now carry the actual resolved address on both sides:
   - Correct global (`data_02104f4c`) → same value → no diff
   - Wrong global (`data_02104f10`) → different values → diff counted

5. **BL displacements** are now computed from the callee symbol address:
   - Same callee → same displacement → no diff
   - Different callee → different displacements → diff counted

6. `_strip_pool()` strips trailing zero or reloc'd words. In resolved mode,
   pool words are non-zero and non-reloc'd, so they ARE included in the
   comparison (and can show Mode-A diffs). Only literal zero padding is
   still stripped.

Use `--unresolved` to fall back to the old wildcarded path when you want
a quick instruction-byte check without the reloc-resolution overhead.

## Implementation details

### Compilation — delegates to ninja

fastmatch computes `build/<region>/<src>.o` (mirrors `configure.py`'s
`add_mwcc_builds()`) and calls `ninja <target.o>`. This uses the EXACT
flags/includes/defines from `build.ninja`. Zero flag drift possible.

**Output path formula:**

```
src/main/func_X.c          →  build/eur/src/main/func_X.o
src/main/func_X.legacy.c   →  build/eur/src/main/func_X.legacy.o
src/usa/main/func_X.c      →  build/usa/src/usa/main/func_X.o
```

`Path.with_suffix(".o")` replaces only the LAST suffix.

### Gap object discovery

Two-tier strategy:

1. **`objdiff.json` lookup** (primary) — `ninja objdiff` maps each compiled
   `.o` (`base_path`) to its delinked gap `.o` (`target_path`). Handles
   `.resolved.o` sidecars by stripping back to `.o`.
2. **Recursive glob** (fallback) — `build/<region>/delinks/**/_dsd_gap@<module>_*.o`,
   confirmed via `arm-none-eabi-objdump -t` symbol scan.

## Usage

```
python tools/fastmatch.py <region> <cfile> [<cfile> ...] [OPTIONS]

Arguments:
  region         eur | usa | jpn
  cfile          Source .c path(s) to compile and check

Options:
  --func NAME    Check only this function (default: all functions in the .o)
  --gap FILE     Explicit gap object (skips auto-discovery)
  --unresolved   Skip reloc resolution (raw/wildcarded, faster but Mode-A/B blind)
  --json         Machine-readable JSON output
  --verbose      Show first 8 differing words for non-100% matches

Exit codes:
  0  All queried functions matched 100%
  1  At least one function is a non-100% match
  2  Compile error or gap object not found
```

### Examples

```bash
# Single-function check — EUR (resolved by default)
python tools/fastmatch.py eur src/main/func_02000e34.c

# Legacy tier (tier auto-detected from suffix)
python tools/fastmatch.py eur src/main/func_0204bf44.legacy.c

# USA source against USA gap objects
python tools/fastmatch.py usa src/usa/main/func_0204bf44.c

# Check only one function in a multi-function TU
python tools/fastmatch.py eur src/main/big_module.c --func func_0204bf44

# Raw comparison (old behaviour — for debugging or speed)
python tools/fastmatch.py eur src/main/func_02000e34.c --unresolved

# Machine-readable output for scripted waves
python tools/fastmatch.py eur src/main/func_02000e34.c --json
```

### Sample output

```
[eur] func_0204bf44 (func_0204bf44.c, cc=2.0): 87.5%  DIFF  (resolved, 4 diffs, 8w mine vs 8w orig, gap=build/eur/delinks/…)
[eur] func_020a71e4 (func_020a71e4.c, cc=2.0): 100.0%  OK  (resolved, 12 words, gap=build/eur/delinks/…)
```

The `(resolved)` tag confirms Mode-A/B detection is active.

### Sample JSON output (`--json`)

```json
[
  {
    "file": "src/main/func_0204bf44.c",
    "region": "eur",
    "tier": "2.0",
    "status": "ok",
    "resolved": true,
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

`"resolved": true` confirms the comparison used the resolved sidecars.

## Campaign loop — updated gate

| Scenario | Tool | Cost | Mode A+B |
|----------|------|------|----------|
| Test a candidate edit | `fastmatch.py` | ~5 s | **CATCHES** (resolved) |
| Quick instruction-byte sanity | `fastmatch.py --unresolved` | ~3 s | misses |
| Confirm 100% (final gate) | `ninja sha1` | ~2–5 min | CATCHES |
| Full per-unit diff TUI | `ninja report` + objdiff | ~30 s + TUI | CATCHES |

fastmatch's resolved comparison replaces both `ninja objdiff` + `ninja report`
as the iteration gate. The workflow is now:

```
edit src/foo.c  →  fastmatch.py (seconds)  →  100%?  →  ninja sha1 (final)
```

## Prerequisites

- `arm-none-eabi-objdump` on PATH.
- `build.ninja` configured for the target region:
  ```bash
  python tools/configure.py eur   # (or usa / jpn)
  ```
  Re-run `configure.py` when a new `.c` file is added to `src/`.
- `build/<region>/delinks/` populated (`ninja delink` or full `ninja`).
- `tools/objdiff_resolve_relocs.py` present (ships in repo; the resolved
  comparison silently falls back to `--unresolved` mode if import fails).

## Validation plan

Run in a baserom worktree (`build/eur/delinks/` populated). The key proof
is that fastmatch now flags what raw objdiff missed.

### Step 1 — 5 confirmed-matched functions (expect 100% resolved)

Pick 5 functions from merged C-match PRs (e.g. from PRs #1037+):

```bash
python tools/fastmatch.py eur src/main/<matched_1>.c
python tools/fastmatch.py eur src/main/<matched_2>.c
python tools/fastmatch.py eur src/main/<matched_3>.c
python tools/fastmatch.py eur src/overlay002/<matched_4>.c
python tools/fastmatch.py eur src/overlay002/<matched_5>.c
# All five should print: 100.0%  OK  (resolved, …)
```

### Step 2 — 5 Mode-A/B false-positive candidates (the gap-closer proof)

These are the cases that PROVE the fix closes the Mode-A/B gap. Use HIGH
candidates that raw objdiff reports 100% but `ninja sha1` fails. The
examples from `docs/research/objdiff-sha1-gap/gap-taxonomy.md`:

**`func_02000e34`** — Mode A: pool word order risk (3 literal loads may
reorder). Write a draft that uses the wrong global for the first LDR:

```c
/* pool order wrong: data_02104f4c first, but orig has data_02102c60 first */
void func_02000e34(void) {
    *(int *)(data_02104f4c + 0xa38) = 0;
    *(int *)(data_02102c60 + 0) = 0;
    *(int *)(data_021040ac + 0xb64) = 0;
    func_020057dc(func_02001540);
}
```

```bash
python tools/fastmatch.py eur src/main/func_02000e34.c
# EXPECT: <100%  DIFF  (resolved, …)  ← pool word mismatch caught

python tools/fastmatch.py eur src/main/func_02000e34.c --unresolved
# EXPECT: 100.0%  OK  (unresolved, …)  ← confirms raw objdiff was blind
```

**`func_02006524`** — Mode B: wrong callee at indirect dispatch. Write a
draft that calls an adjacent function pointer:

```c
/* wrong callee: func_020919e0 instead of func_020919d8 */
void func_02006524(void) {
    ...
    func_020919e0(...);  // ← one entry off in the dispatch table
}
```

```bash
python tools/fastmatch.py eur src/main/func_02006524.c
# EXPECT: <100%  DIFF  (resolved, …)  ← BL displacement mismatch caught

python tools/fastmatch.py eur src/main/func_02006524.c --unresolved
# EXPECT: 100.0%  OK  (unresolved, …)  ← confirms raw objdiff was blind
```

Verify 3 more HIGH candidates from the docs/research/c-match-prep/ TSV that
carry pool-word or callee risk annotations. The pattern is the same.

### Step 3 — Correctly matched function: verify resolved = 100%

For any function from a merged C-match PR, confirmed by `ninja sha1`:

```bash
python tools/fastmatch.py eur src/main/<confirmed_matched>.c
# EXPECT: 100.0%  OK  (resolved, …)
# If it shows <100% here but passed sha1, that's a resolver bug — report it.
```

### Step 4 — Legacy/sp3 tier routing (ninja handles tier selection)

```bash
python tools/fastmatch.py eur src/main/func_YYYYYY.legacy.c
# Compiler tier is inferred from the .legacy suffix — ninja picks mwcc 1.2/sp2p3
```

### Step 5 — Timing comparison

```bash
time python tools/fastmatch.py eur src/main/func_02000e34.c
time ninja sha1
```

Expected: fastmatch ≈ 5–10 s (ninja compile + two resolve passes + two
objdumps); sha1 ≈ 2–5 min. The speedup holds even with the resolve pass
since resolution is in-process Python (no subprocess, no disk I/O beyond
the temp sidecar writes).

### Step 6 — JSON round-trip and `"resolved"` field

```bash
python tools/fastmatch.py eur src/main/<matched>.c --json | python -m json.tool
# Confirm "resolved": true in the output
python tools/fastmatch.py eur src/main/<matched>.c --unresolved --json | python -m json.tool
# Confirm "resolved": false
```

### Pass criteria

- 5 known-matched funcs → `100.0%  OK  (resolved, …)` ✅
- Mode-A draft → `<100%  DIFF  (resolved)` + `100.0%  OK  (unresolved)` ✅
- Mode-B draft → `<100%  DIFF  (resolved)` + `100.0%  OK  (unresolved)` ✅
- Legacy/sp3 files compile correctly ✅
- `"resolved": true` in JSON output ✅
- fastmatch runtime < 15 s ✅
- sha1 runtime > 60 s (speedup confirmed) ✅

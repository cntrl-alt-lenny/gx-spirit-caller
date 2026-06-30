[//]: # (markdownlint-disable MD013)

# Optimized C-match loop: fastmatch-resolved + batch_sha1

## Overview

The optimized loop composes two tools to maximize throughput on the C-match
campaign while keeping the sha1 gate as the final arbiter:

```
for each wave of ~5-10 candidates:
  │
  ├─ fastmatch.py  (seconds per candidate)
  │    compile candidate .c → compare vs gap .o (RESOLVED: catches Mode A+B)
  │    100%?  → add to accept queue
  │    <100%? → reject / tweak / retry
  │
  └─ batch_sha1.py  (one `ninja sha1` for the whole accept queue)
       apply all accepts (delinks .s → .c)
       ninja sha1
       PASS? → all confirmed, wave done
       FAIL? → bisect to pinpoint culprit(s); revert culprits; confirm clean set
```

**The amortization win**: `ninja sha1` relinks the entire ROM — a shared
delinks recompile that costs ~2–5 minutes regardless of how many candidates
it's confirming. Running one sha1 per batch of 5–10 accepts saves 4–9
recompile cycles per wave versus one sha1 per candidate.

---

## Tool roles

### `tools/fastmatch.py` — inner-loop gate (seconds)

Compiles one candidate `.c` via `ninja <unit.o>` and runs the **resolved**
comparison against its delinked gap object. Default mode uses
`objdiff_resolve_relocs.resolve_elf_relocs()` on both sides before comparing,
which catches:

| Failure mode | fastmatch (resolved) | fastmatch (--unresolved) | ninja sha1 |
|---|---|---|---|
| A — Wrong pool value | **CATCHES** | misses | catches |
| B — Wrong callee (BL target) | **CATCHES** | misses | catches |
| C — Extra .rodata/.data | misses | misses | catches |
| D — Pool count mismatch | catches | partial | catches |
| E — Scheduling diff | catches | catches | catches |

**Accept signal**: `100.0%  OK  (resolved, …)` for every function in the TU.

**False-positive residual**: only Mode C (extra `.rodata`/`.data` sections,
invisible to any `.text`-only tool). Mode C candidates are screened during
candidate prep (avoid `static const`, string literals, initialized statics).

---

### `tools/batch_sha1.py` — batch confirm gate (minutes, amortized)

Takes the accept queue and the region, applies all candidates to delinks.txt
(`.s` → `.c`), runs one `ninja sha1`, and:

- **SHA1 PASS** → all candidates confirmed; delinks changes committed.
- **SHA1 FAIL** → **binary bisect** to isolate culprit(s):
  1. Revert half the candidates; re-run sha1.
  2. If sha1 passes → culprits were in the reverted half → recurse on it.
  3. If sha1 still fails → culprits in the kept half (and possibly both) →
     recurse on each half independently.
  4. Repeat until every culprit is isolated to a single candidate.
  5. Revert only the culprits; leave the confirmed clean set applied.

Worst-case sha1 runs for a batch of N with K culprits:

| N | K | Worst-case sha1 runs |
|---|---|---|
| 5 | 1 | 4 (log₂5 rounds) |
| 10 | 1 | 5 |
| 10 | 2 | 9 (two independent bisects) |
| 10 | 5 | 15 (half the batch are culprits, bisect both halves) |

In practice K≈1 (fastmatch-resolved filters out ~97%+ of culprits), so
10 candidates → ~5 total sha1 runs in the pathological case versus 10 without
batching.

---

## Full wave recipe

```bash
# 0. Candidate list from docs/research/c-match-prep/ TSVs (HIGH tier, no .s-only flags)
CANDIDATES="src/main/func_A.c src/main/func_B.c ... (5-10 files)"

# 1. fastmatch screen — accepts go to QUEUE
QUEUE=""
for c in $CANDIDATES; do
    python tools/fastmatch.py eur "$c" && QUEUE="$QUEUE $c"
done

# 2. batch sha1 confirm
python tools/batch_sha1.py eur $QUEUE

# 3. Commit the confirmed set (batch_sha1 leaves delinks already flipped)
git add config/eur/arm9/**/delinks.txt
git commit -m "c-match wave N: <N> functions confirmed"
```

With `--json` on both tools for scripted pipelines:

```bash
# fastmatch JSON → filter 100% → batch_sha1 JSON
python tools/fastmatch.py eur --json $CANDIDATES \
  | python -c "
import json, sys
results = json.load(sys.stdin)
accepts = [r['file'] for r in results if all(f['match_percent'] == 100.0 for f in r['functions'] if f['status'] == 'ok')]
print(' '.join(accepts))
" | xargs python tools/batch_sha1.py eur --json
```

---

## Validation plan (for brain — requires baserom worktree)

### Step 1 — batch_sha1 happy path

Pick 5 confirmed-matched functions (already `.c` on main) and temporarily
revert them to `.s` (swap delinks entries by hand):

```bash
# Revert 5 matched functions to .s in delinks.txt (temporarily)
# Then run batch_sha1 to re-apply them all:
python tools/batch_sha1.py eur \
    src/main/func_A.c \
    src/main/func_B.c \
    src/main/func_C.c \
    src/main/func_D.c \
    src/main/func_E.c
# Expected:
#   SHA1 PASS — all 5 candidate(s) confirmed.
#   OK  src/main/func_A.c
#   OK  src/main/func_B.c
#   ...
```

### Step 2 — bisect on one known-bad candidate

Include one candidate that is known to break sha1 (e.g. wrong pool value draft):

```bash
python tools/batch_sha1.py eur \
    src/main/func_A.c \
    src/main/func_B.c \
    src/main/func_BROKEN.c   # wrong pool value or callee
# Expected:
#   SHA1 FAIL — bisecting 3 suspects...
#   bisect: testing 3 suspect(s)...
#   bisect: testing 1 suspect(s)...
#   CULPRIT: src/main/func_BROKEN.c
#   Bisect complete: 2 confirmed, 1 culprit(s).
#   OK  src/main/func_A.c
#   OK  src/main/func_B.c
#   !!  src/main/func_BROKEN.c
# Exit code: 1
```

Verify: `ninja sha1` passes after the run (culprit reverted, clean set applied).

### Step 3 — bisect on two independent culprits

Include two broken candidates in different positions (one in each bisect half):

```bash
python tools/batch_sha1.py eur \
    src/main/func_BROKEN_1.c \
    src/main//func_B.c \
    src/main/func_C.c \
    src/main/func_BROKEN_2.c \
    src/main/func_E.c
# Expected: both culprits isolated; 3 confirmed; exit code 1
```

### Step 4 — dry-run sanity

```bash
python tools/batch_sha1.py eur --dry-run \
    src/main/func_A.c src/main/func_B.c
# Expected: prints what would change, exits 0, no files modified
```

### Step 5 — fastmatch.py missing objdump (tool hardening)

Temporarily rename `arm-none-eabi-objdump` off PATH (or use `PATH=/ python ...`):

```bash
PATH=/nonexistent python tools/fastmatch.py eur src/main/func_A.c
# Expected:
#   ERROR: 'arm-none-eabi-objdump' not found on PATH.
#     Run `ninja` once to download toolchain binaries, or:
#     python tools/download_tool.py
# Exit code: 2
```

(NOT a raw FileNotFoundError traceback.)

### Step 6 — timing comparison

```bash
# Fastmatch is the fast inner gate:
time python tools/fastmatch.py eur src/main/func_A.c
# Expected: 5-15 s

# batch_sha1 adds one sha1 overhead per batch:
time python tools/batch_sha1.py eur src/main/func_A.c src/main/func_B.c \
    src/main/func_C.c src/main/func_D.c src/main/func_E.c
# Expected: ~2–5 min (dominated by ninja sha1)

# vs one sha1 per candidate:
# 5 × (2-5 min) = 10–25 min → batch saves 8–20 min per 5-candidate wave
```

### Pass criteria

- `batch_sha1` happy path → SHA1 PASS, all confirmed, exit 0 ✅
- `batch_sha1` with 1 culprit → bisect isolates it, 1 culprit reverted, exit 1 ✅
- `batch_sha1` with 2 culprits in both halves → both isolated, clean set applied ✅
- `ninja sha1` passes after every batch_sha1 run (confirmed or culprits reverted) ✅
- `fastmatch.py` missing objdump → clean error message, exit 2, no traceback ✅
- `--dry-run` → no files modified ✅

---

## Error handling reference

| Error | batch_sha1 response |
|---|---|
| `.c` not found in `build.ninja` | Fails with ERROR at step 1 (pre-apply) |
| delinks.txt entry for `.s` not found | `ERROR: No delinks.txt entry found for .s ship: ...`; exit 2 |
| already applied (`.c` in delinks already) | `ERROR: Already applied ...`; exit 2 |
| `ninja sha1` infra failure (baserom missing) | bisect treats every candidate as culprit (conservative) |
| `sort_delinks` import fails | WARNING printed, delinks left un-sorted (still buildable) |

| Error | fastmatch.py response |
|---|---|
| `arm-none-eabi-objdump` not on PATH | `ERROR: 'arm-none-eabi-objdump' not found...`; exit 2 |
| `build.ninja` not configured | `ERROR: build.ninja not found...`; exit 2 |
| ninja compile fails | `COMPILE ERROR`; exit 2 |
| gap object not found | `NOT-IN-GAP — already matched or gap object not found` |
| resolver import fails | WARNING on stderr; falls back to `--unresolved` mode |

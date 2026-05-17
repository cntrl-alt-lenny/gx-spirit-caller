### decomper/main-cat1-cluster-c-wave-3

**Goal:** Two-part parallel-track wave continuing the
data-tier cadence + landing brief 127's Category 1
ARM9 main fix.

**Part 1 — ARM9 main Category 1 fix (per brief 127).**

Brief 127's bisection found 3 wrong-target source TUs
in main:

| Symbol | Diff bytes | Issue |
|---|---:|---|
| `func_02048f98` | 2 | wrong store target |
| `func_02052bc4` | 2 | wrong BL target |
| `func_0206255c` | 1 | wrong BL target |

**5 bytes total / Category 1 / ~30 min decomper fix.**

For each: read brief 127's scoping doc (`docs/research/
arm9-main-checksum-recovery.md` or similar — confirm
the file location from brief 127's PR) for the exact
correction needed. Each is a wrong target address in
an already-matched TU — bytes-content is mostly
correct, just one reloc target needs to change.

**Note:** Cat 1 fix alone **won't flip main to OK** —
the remaining 16 bytes cascade from OV004's baseline-
FAILED state. Cat 1 reduces main's gap from 21 → 16
bytes. Main flips OK only after **OV004 recovery**
(brief 130+ candidate per brief 129's plan).

**Part 2 — Cluster C Pattern 1 wave 3 continuation.**

Brief 126 took 29 more cluster C Pattern 1 candidates
(post-brief-122's 37). **~80-120 Pattern 1 candidates
remain.** Recipe unchanged: `.c const T arr[N]`,
strict filter `size % 4 == 0 AND addr % 4 == 0`.

**Target: 25-35 candidates** from the next-highest
cross-module-reader pool. Same selection rule as
brief 122/126:

```bash
python tools/data_worklist.py --version eur \
    --cluster C --top 150
```

Filter for size % 4 == 0. Skip already-shipped (66
total in tree post-brief-126).

**Brief 126 recipe refinement note:** brief 119's
Pattern 1 strict-alignment rule **applies to cluster
D-2 too** — but cluster C Pattern 1 was always strict-
aligned, so this brief doesn't change cluster C
selection criteria. The refinement is relevant for
**future** D-2 waves (brief 132+ candidate).

**Method:**

Part 1 — read brief 127's scoping doc for the 3 fixes;
edit + verify per-symbol. Part 2 — same workflow as
brief 122/126: read bytes from extract, write `.c`,
add delinks.txt, `ninja rom`, byte-compare via `xxd`.

**Self-extend clause:**

If Part 2 covers 35+ candidates cleanly, optionally
extend to 50-60 in the same brief. Brief 126's wave
2 was 36 combined; cluster C Pattern 1 alone can
absorb 50+ given the per-symbol cost is low.

**Non-scope:**

- ❌ OV004 recovery (brief 130+ pending brief 129's
  scoping).
- ❌ Cluster D-1 / D-2 application (separate brief
  candidates).
- ❌ Cluster C Pattern 3 generator application (brief
  131+ candidate).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- Part 1: 3 source TUs fixed; main's bytes-diff drops
  from 21 → 16 (main still FAILED, pending OV004).
- Part 2: ≥ 25 cluster C Pattern 1 symbols byte-
  identical.
- All 3 regions stay at 25/27 baseline.
- Per-wave PR with both parts + funnel + per-
  candidate notes.

**Branch:** `decomper/main-cat1-cluster-c-wave-3`

**After this brief lands:**

1. **Main's residue drops to 16 bytes (4 + 12 cascade
   from OV004).** Won't flip OK until brief 130+
   OV004 recovery.
2. **Cluster C Pattern 1 sub-pool drains** to ~55-95
   remaining; 2 more waves close.
3. **Brief 130 candidate** — OV004 recovery wave 1
   per brief 129's plan. **This is the brief that
   flips both OV004 + main to OK = 26/27 baseline.**

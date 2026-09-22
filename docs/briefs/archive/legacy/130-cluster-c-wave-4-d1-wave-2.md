### decomper/cluster-c-wave-4-d1-wave-2

**Goal:** Two-part parallel-track wave continuing the
data-tier cadence while cloud brief 131 works the
26/27 baseline unlock in parallel.

**Part 1 — Cluster C Pattern 1 wave 4 continuation.**

Brief 128 took 39 of the cluster C Pattern 1 sub-pool.
**~40-80 normal candidates remain** plus 3 deferred
mega-arrays from brief 128 (30 KB / 5 KB / 4.6 KB).
Recipe unchanged: `.c const T arr[N]`, strict
`size % 4 == 0 AND addr % 4 == 0`.

**Target: 25-35 normal candidates + try ONE mega-
array** (start with the 4.6 KB `data_022be1ac` —
smallest of the 3, lowest risk).

The 3 mega-arrays are still Pattern 1 (4-aligned),
just substantial enough to warrant care. The recipe
should scale, but a single one-off mega-array per
wave keeps the wave manageable.

**Selection:**

```bash
python tools/data_worklist.py --version eur \
    --cluster C --top 200
```

Filter for size % 4 == 0 AND addr % 4 == 0. Skip the
105 already in tree (briefs 122+126+128). For the
mega-array slot, pick `data_022be1ac` first.

**Part 2 — Cluster D-1 wave 2.**

Brief 124 took 20 of ~71 D-1 dispatch tables. **~50
remaining.** Recipe unchanged: `.c extern + void*[]`
array, naturally 4-aligned.

**Target: 12-18 dispatch tables** in this wave from
the next-highest cross-module-reader pool:

```bash
python tools/data_worklist.py --version eur \
    --cluster D --top 50
```

Filter for `fnptr_table` shape + size ≥ 0x10. Skip
the 20 D-1 already in tree.

**Method:**

Both parts: same workflow as brief 122/124/126/128.
Read bytes from extract, write source, add delinks.txt,
`ninja rom`, verify byte-identical, confirm 3-region
25/27 baseline preserved.

**Note on ov004 candidates:** Skip any ov004 cluster
C or D-1 candidates. Per brief 129's finding, ov004
is baseline-FAILED due to mwldarm veneer leak; byte-
diff against extract is layout cascade, not source
error. Wait for brief 131's Cat 4 fix to land
before attempting ov004 candidates.

**Self-extend clause:**

If combined Part 1 + Part 2 exceeds 40 candidates
cleanly, optionally extend. Otherwise wrap up at the
target.

**Non-scope:**

- ❌ OV004 candidates (pending brief 131 Cat 4 fix).
- ❌ Cluster A / B / C Pattern 2 / Pattern 3 / D-2 /
  D-3 (separate brief candidates).
- ❌ ARM9 main further recovery (pending brief 131
  OV004 cascade).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- Part 1 cluster C: ≥ 25 normal candidates + 1 mega-
  array (≥ 26 total).
- Part 2 cluster D-1: ≥ 12 dispatch tables.
- **Combined: ≥ 38 symbols byte-identical.**
- All 3 regions stay at 25/27 baseline.
- Per-wave PR with funnel + per-candidate notes.

**Branch:** `decomper/cluster-c-wave-4-d1-wave-2`

**After this brief lands:**

1. **Cluster C Pattern 1 sub-pool drains** to ~15-55
   normal + 2 mega-arrays remaining. 1-2 more waves
   close.
2. **Cluster D-1 drains** to ~32-38 remaining; 2-3
   more waves close.
3. **Brief 131's Cat 4 fix** lands in parallel; if
   successful, **26/27 baseline unlocks** and brief
   133+ can include ov004 candidates.

### decomper/cluster-d1-wave-3-mega2

**Goal:** Two-part parallel-track wave continuing the
data-tier cadence while cloud brief 132 works the 26/27
unlock.

**Part 1 — Cluster D-1 wave 3.**

Brief 124 took 20 D-1 dispatch tables. Brief 130 took
15 more. **~35 of the original ~71 D-1 candidates
remain.** Recipe unchanged from brief 121: `.c` with
`extern char data_X; void *data_<addr>[N] = { &data_X,
... };` (or `(void *)func_X` with thumb `+1`). Naturally
4-aligned (4 × N pointers); no W6 risk.

**Target: 12-18 dispatch tables** in this wave from
the next-highest cross-module-reader pool:

```bash
python tools/data_worklist.py --version eur \
    --cluster D --top 100
```

Filter for `fnptr_table` or `jump_table` shape + size
≥ 0x10. Skip the 35 D-1 already in tree (briefs
124+130).

**Part 2 — Try second mega-array (`data_022bf3c4` 5 KB).**

Brief 130 shipped the smallest of 3 deferred Pattern 1
mega-arrays (`data_ov002_022be1ac` 4632 bytes). The
remaining 2 are:

| Symbol | Size | Module |
|---|---:|---|
| `data_022bf3c4` | 5 KB | ov002 |
| `data_020b6ec4` | 30 KB | main |

**Try `data_022bf3c4` (5 KB ov002).** Pattern 1 recipe
unchanged. Read bytes from extract, write `.c const u8
arr[N]`, add delinks.txt, verify byte-identical. Brief
130 confirmed mega-arrays scale; ov002's 5 KB array
should be straightforward.

The 30 KB `data_020b6ec4` is deferred to a later wave
(potentially brief 135+ once brief 132 unlock lands).

**Skip rule:**

**ov004 candidates STILL SKIPPED.** Brief 131 Phase 1
reduced ov004's diff 95% but didn't flip OK. Brief
132 Phase 2 is the actual unlock. Wait for brief 132
to land before attempting ov004 cluster C / D candidates.

**Method:**

Same workflow as briefs 122/124/126/128/130. Read
bytes, write source, add delinks, build, verify.

**Self-extend clause:**

If Part 1 covers 15+ D-1 tables cleanly + Part 2's
mega-array lands, optionally extend D-1 to 20-25 in
the same wave. The D-1 recipe per-candidate cost is
small.

**Non-scope:**

- ❌ ov004 candidates (pending brief 132).
- ❌ 30 KB mega-array (deferred to later wave).
- ❌ Cluster B / D-2 / D-3 / cluster A wave 4 /
  Pattern 2 / Pattern 3 (separate brief candidates).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- Part 1 D-1 wave 3: ≥ 12 dispatch tables byte-
  identical.
- Part 2: 5 KB mega-array byte-identical.
- **Combined: ≥ 13 symbols byte-identical.**
- All 3 regions stay at 25/27 baseline (brief 132
  unlocks 26/27 in parallel).
- Per-wave PR with funnel + per-candidate notes.

**Branch:** `decomper/cluster-d1-wave-3-mega2`

**After this brief lands:**

1. **Cluster D-1 drains** to ~17-23 remaining; 1-2
   more waves close it.
2. **Pattern 1 mega-array pool** drops to 1 (the 30
   KB `data_020b6ec4`).
3. **If brief 132 flips 26/27**: brief 134+ can
   include ov004 cluster C / D-1 / D-2 candidates
   that have been pending since brief 122.

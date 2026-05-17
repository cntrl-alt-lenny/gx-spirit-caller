### decomper/cluster-cd-wave-2

**Goal:** Two-part parallel-track data-tier wave
continuing brief 122 (cluster C Pattern 1) + brief 124
(cluster D-1 dispatch tables) + opening brief 121's
D-2 sub-cluster.

**Part 1 — Cluster C Pattern 1 continuation.**

Brief 122 took 37 of the 4-aligned cluster C candidate
pool. ~110-150 Pattern 1 candidates remain. Recipe
unchanged: `.c` with `const T arr[N] = {...};`,
strict filter `size % 4 == 0 AND addr % 4 == 0`.

**Target: 25-35 candidates** in wave 2 from the next-
highest cross-module-reader pool per:

```bash
python tools/data_worklist.py --version eur \
    --cluster C --top 100
```

Filter the output for size % 4 == 0 and skip the 37
candidates already in tree (brief 122).

**Part 2 — Cluster D wave 2 (D-1 cleanup + D-2 start).**

Brief 124 took 20 of ~71 D-1 candidates. **~51 D-1
remaining** plus brief 121's ~30-40 D-2 sub-cluster
(scalar struct/byte arrays).

**Target:**
- 10-15 more D-1 dispatch tables (same recipe as brief
  124).
- 5-10 D-2 scalar arrays.

**D-2 recipe (per brief 121):**

```c
/* src/<module>/data_<addr>.c */
unsigned char data_<addr>[N] = {
    0x00, 0x01, 0x02, /* ... */
};
```

Notes:
- No `const` qualifier (preserves `.data` placement).
- Type: pick the natural element type (`u8[N]`,
  `u16[N/2]`, `u32[N/4]`).

**Selection — D-2 candidates:**

Run `data_worklist.py --version eur --cluster D
--top 50` and filter for `shape=struct` or
`shape=array` + `size >= 0x10` (substantive arrays;
trivial 4-byte single elements skip).

Skip any candidate that requires typedef discovery
(those are D-3, deferred). Brief 121's worked example
(`data_02101f34` 64-byte permutation array) is the
canonical pattern — pick similar shapes.

**Method:**

Per-candidate (both parts):
1. Read original bytes from `extract/eur/arm9/arm9.bin`
   (or per-overlay .bin).
2. Write source as `src/<module>/data_<addr>.c`.
3. Add TU claim to `delinks.txt`.
4. `ninja rom` + `dsd check modules`.
5. Verify byte-identical via `xxd` against extract.

**Self-extend clause:**

If wave 2 covers 35+ combined candidates cleanly,
optionally extend to 50-60 in the same brief. Both
sub-pools have depth (110-150 + 51 + 30-40 ≈ 190-240
candidates total).

**Non-scope:**

- ❌ Pattern 2/3 application (brief 128 candidate).
- ❌ D-3 complex nested (Pattern 3 generator or
  typedef tool territory).
- ❌ Cluster B / A work.
- ❌ Function-tier carryovers.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- Part 1 (cluster C Pattern 1): ≥ 20 symbols.
- Part 2 (cluster D D-1 + D-2): ≥ 12 combined.
- **Combined target: ≥ 32 symbols.**
- All 3 regions stay at 25/27 baseline (no W6
  cascade).
- Per-wave PR with funnel + per-candidate table
  flagging C vs D-1 vs D-2.

**Branch:** `decomper/cluster-cd-wave-2`

**After this brief lands:**

1. **Cluster C Pattern 1 sub-pool** drains to ~75-115
   remaining; 2-3 more waves close it.
2. **Cluster D-1** drains to ~36-41 remaining; 3-4
   more waves close it.
3. **Cluster D-2** opens; brief 121 estimated ~30-40
   total in the sub-pool, so 3-6 more waves close it.
4. **Brief 128 candidate** — cluster C Pattern 3 wave
   1 via brief 125's generator (~50-90 candidates).

### decomper/cluster-d2-pattern3-wave-1

**Goal:** Two-part parallel-track wave continuing the
data-tier cadence while cloud brief 134 attempts the
26/27 unlock via post-link binary patching. Cluster
D-1 multi-pointer pool is exhausted (brief 133); pivot
to D-2 + Pattern 3 generator application.

**Part 1 — Cluster D-2 wave 2.**

Brief 121 codified the D-2 scalar array recipe; brief
126 shipped wave 1 (7 syms). **~25-35 D-2 candidates
remain** per brief 121's pool estimate.

**Recipe (per brief 121, refined by brief 126):**

```c
/* src/<module>/data_<addr>.c */
unsigned char data_<addr>[N] = {
    0x00, 0x01, 0x02, /* ... */
};
```

Notes:
- No `const` qualifier (preserves `.data` placement
  per brief 117's W4 finding).
- **STRICT 4-alignment**: `size % 4 == 0 AND addr %
  4 == 0` (brief 126's recipe refinement — applies
  to D-2 as well as cluster C).
- Type: pick the natural element type (`u8[N]`,
  `u16[N/2]`, `u32[N/4]`).

**Target: 10-15 D-2 candidates** in wave 2 from the
next-highest cross-module-reader pool:

```bash
python tools/data_worklist.py --version eur \
    --cluster D --top 100
```

Filter for `shape=struct` OR `shape=array` AND
`size >= 0x10` AND `size % 4 == 0` AND `addr % 4 == 0`.
Skip the 7 D-2 already in tree (brief 126).

**Part 2 — Cluster C Pattern 3 wave 1 via brief 125
generator.**

Brief 125 shipped `tools/cluster_c_pattern3_gen.py` +
2 worked examples. **~50-90 cluster C residue
candidates** that Patterns 1 + 2 can't reach (non-
aligned individually but chunk-aggregable into
4-aligned regions).

**Target: 5-10 chunks** in wave 1 using the generator.
Each chunk covers multiple non-aligned candidates
grouped to a 4-aligned chunk extent.

**Method (per brief 125's worked examples):**

1. **Identify chunk candidates.** Run brief 114's
   worklist + manual inspection for non-aligned
   cluster C runs:

   ```bash
   python tools/data_worklist.py --version eur \
       --cluster C --top 200
   ```

   Filter for candidates that DON'T match Pattern 1
   (size % 4 != 0 OR addr % 4 != 0). Group adjacent
   non-aligned symbols into chunk candidates with
   4-aligned start + end.

2. **Per-chunk: run the generator.**

   ```bash
   python tools/cluster_c_pattern3_gen.py \
       --version eur --module main \
       --start 0x<chunk_start> --end 0x<chunk_end>
   ```

   Generator emits `.s` file + delinks.txt header
   entry. Apply to all 5-10 chunks.

3. **Build + verify per chunk:**
   - `ninja rom` after each chunk addition (or batch
     after all chunks land).
   - `dsd check modules` should report 25/27 OK
     (no W6 cascade if chunks are properly 4-aligned).
   - Byte-compare each chunk's bytes against extract.

**Skip rule:**

**ov004 candidates STILL SKIPPED.** Brief 134 Phase 3
in parallel. Wait for the unlock to land before
attempting ov004 cluster C / D-2 candidates.

**Self-extend clause:**

If combined Part 1 + Part 2 exceeds 20 candidates,
optionally extend wave to 25-30. Both sub-pools have
depth.

**Non-scope:**

- ❌ Cluster D-3 (deferred to typedef tool or
  Pattern 3 generator extension).
- ❌ 30 KB main mega-array (brief 137+ candidate).
- ❌ Cluster B wave 1 (separate brief).
- ❌ ov004 candidates (pending brief 134).
- ❌ Function-tier carryovers.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- Part 1 D-2: ≥ 10 byte-identical scalar arrays.
- Part 2 Pattern 3: ≥ 5 chunks byte-identical (each
  covering multiple non-aligned symbols).
- **Combined: ≥ 15 effective candidates closed.**
- All 3 regions stay at 25/27 baseline.
- Per-wave PR with funnel + per-candidate notes +
  Pattern 3 chunk size distribution.

**Branch:** `decomper/cluster-d2-pattern3-wave-1`

**After this brief lands:**

1. **D-2 drains** to ~15-25 remaining; 2 more waves
   close it.
2. **Pattern 3 generator validated at scale** — pool
   drains in 2-4 more waves (~10-15 chunks per wave).
3. **Brief 134 (cloud)** Phase 3 result determines
   whether brief 136 includes ov004 candidates or
   continues data-tier-EUR-only.

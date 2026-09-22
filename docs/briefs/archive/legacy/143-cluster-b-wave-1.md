### decomper/cluster-b-wave-1

**Goal:** Open cluster B — the last unopened data-tier
cluster. Brief 117 scoped cluster B; brief 123 v3 refined the
sub-pool to **81 true scalars** + adjacent sub-pools. Wave 1
targets the easiest sub-pool: true `.data` scalars that don't
need typedefs.

**Context — what brief 117 / 123 documented:**

Cluster B is `.data`-section scalars (single 4-byte or smaller
values, not arrays). Brief 117 found cluster B had a
47% mis-classification rate against cluster C strings — those
115 reclassified strings became cluster C effective (now
mostly drained via Pattern 1 + Pattern 3 waves).

Brief 123 v3's refined cluster B sub-pool:

- **Cluster B true scalars: 81** (target of this brief).
- Cluster B pointers: 32 (need typedef; brief 144+ candidate).
- Cluster B unclassified: 14 (brief 145+ candidate after
  worklist refinement).

The 81 true-scalar sub-pool is the easiest decomp shape:
4-byte integer literals in `.data` with single global symbol
each. C decl shape:

```c
unsigned int data_<addr> = 0x<value>;
```

(or signed int / `unsigned short` / `unsigned char` per byte-
width inference from the gap symbol size).

**Brief 143 deliverables:**

1. **Target: 30-60 cluster B true scalars** in this wave.
   Self-extend if pool is shallow (likely to be).

2. **Method — per scalar:**
   - Enumerate via brief 123 v3's worklist filter: `python
     tools/data_worklist.py --version eur --cluster B
     --sub-pool true-scalar`.
   - For each `(addr, size, value)` triple:
     - Generate `src/<module>/data/data_<addr>.c` with the
       1-3 line C decl.
     - Add TU claim to the module's `delinks.txt`.
   - Stack into per-module subdirs; mirror the cluster A
     wave layout convention.

3. **Module coverage.** Cluster B scalars are distributed
   across multiple modules per brief 117's scoping (main +
   several overlays). Cover 2-4 modules per wave.

4. **3-region verify.** All claims are byte-identical decomp
   work; 3-region 27/27 module baseline must be preserved.
   **Critical**: also verify `ninja sha1` still PASSES across
   3 regions (brief 140 just shipped — any regression here
   breaks SHA1).

**Method:**

1. Read brief 117's cluster B research; brief 123 v3's
   sub-classification table.
2. Use `tools/data_worklist.py` filters to enumerate the
   true-scalar sub-pool.
3. Per-symbol decomp loop:
   - C decl generation
   - delinks.txt claim
   - objdiff verify byte-identical
4. Group into per-module commits; PR per wave.

**Non-scope:**

- ❌ Cluster B pointer sub-pool (32, brief 144+ candidate;
  needs typedef research).
- ❌ Cluster B unclassified sub-pool (14, brief 145+
  candidate).
- ❌ ov004 `.rodata` cluster work (blocked on brief 142
  patcher generalisation).
- ❌ 30 KB main mega-array (`data_020b6ec4`).
- ❌ Cross-region cluster A apply.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 30 cluster B true scalars claimed.
- All 3 regions stay at 27/27 module baseline.
- **3-region `ninja sha1` PASS preserved.**
- Per-wave PR with funnel + per-module breakdown.

**Branch:** `decomper/cluster-b-wave-1`

**Priority:** MEDIUM. Opens the last unopened cluster;
parallel-track work to brief 142.

**After this brief lands:**

1. **Cluster B opened.** Pool depth becomes visible from
   actual wave throughput; subsequent waves close the
   remaining true-scalar pool.
2. **Decomp-tier funnel becomes near-exhausted.** Remaining
   pools post-this-brief: cluster B pointers (typedef
   research), 30 KB mega-array, cross-region cluster A
   apply, residue in pre-processed overlays.
3. **Post-SHA1-PASS work** — this is the first decomp-tier
   wave that lands AFTER `ninja sha1` passing. New
   maintenance discipline: every PR must preserve SHA1.

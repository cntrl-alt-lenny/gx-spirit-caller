### decomper/cluster-b-size-1-2-wave

**Goal:** Apply brief 152's locked workaround #3 recipe (bundle
the size-1/2 scalar + zero-pad neighbours into an
`unsigned int[N]` TU covering the deduced range to the next named
symbol) to drain the ~14-18 size-1/2 cluster B candidates that
brief 148 surveyed. Single-wave brief; estimated to close cluster
B's size-1/2 sub-pool entirely.

**Context:**

Brief 152 (PR #579) closed the size-1/2 alignment-cascade chain
by:

1. Falsifying workaround #1 (`.s` with `.byte`, brief 149) AND
   workaround #2 (`__attribute__((aligned(1)))`) — both fail
   identically because `arm9.lcf`'s `ALIGNALL(2)` directive
   re-aligns every section to 4-byte at link time, regardless
   of the `.o`'s reported alignment.
2. Locking workaround #3 — bundle the singleton size-1/2 slot
   plus its zero-pad neighbours into an `unsigned int[N]` (or
   `struct { … }`) TU covering the full deduced range to the
   next named symbol. Verified byte-identical on
   `data_021020b4` (16-int bundle, 64 bytes).

Cluster B's size-1/2 sub-pool per brief 148's survey: **~14
candidates total** in cluster B's main pool, plus brief 152's
closing note flags **18 overlay candidates** (3 ov002, 13 ov006,
1 ov008, 1 other) of "likely the same zero-pad-followed
singleton shape." Total estimated drain: ~14-32 claims.

**Scope:**

Apply workaround #3 per the recipe in [`docs/research/cluster-b-
size-1-2-recipe.md`](../research/cluster-b-size-1-2-recipe.md).
Per-candidate steps:

1. Identify the size-1/2 candidate from cluster B's W6-rejected
   sub-pool or brief 152's overlay candidate list.
2. Inspect the deduced range from the candidate's vaddr to the
   next named symbol (use `tools/data_worklist.py` or the
   delinks-aware variant from brief 148's research).
3. Confirm the range is zero-padded (no other named symbols
   intersecting) — if there are intervening symbols, this
   candidate needs a different recipe or sub-brief.
4. Emit the bundled TU as `unsigned int[N]` (or `struct` if
   fields carry semantic meaning per brief 152's 3b note).
5. Verify byte-identical via objdiff + 3-region `ninja sha1`
   PASS.

**Selection rule:**

Walk both pools together:

- Cluster B main `.data` size-1/2 sub-pool (brief 148's ~14
  survey row).
- Brief 152's 18 overlay-resident size-1/2 candidates (the 3
  ov002 / 13 ov006 / 1 ov008 / 1 other list).

Skip any candidate whose deduced range to the next named symbol
contains intervening named symbols (not the recipe's target
shape). Document those in the PR body for follow-up.

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
```

Expected: all three regions PASS `ninja sha1`. **If any region's
SHA1 drops from PASS to FAIL the PR does not merge** — same gate
as every post-SHA1 brief.

Run the per-claim objdiff check on each bundled TU's address
range (per brief 152's worked-example discipline).

**Self-extend gate** (same as brief 057, 060, 081, 086, 143,
147, 151):

- Yield ≥ 40%, AND
- Bytes-matched ≥ 250.

Cluster B size-1/2 candidates are typically size 1 or 2, but
the bundles cover up to ~64 bytes each — bytes-matched gate
should clear comfortably. If the sub-pool drains before the
gates trigger self-extend, brief 153 closes after wave 1.

**Apply list:**

1. **Brief 152 workaround #3 is the recipe.** Don't try `.s`
   `.byte` (brief 149 falsified) or `__attribute__((aligned(1)))`
   (brief 152 falsified — root cause `arm9.lcf` `ALIGNALL(2)`).
   Bundle into `unsigned int[N]` or `struct`.
2. **Singleton vs bundle decision per candidate:** if the slot's
   `relocs.txt` shows it referenced by name from other code,
   bundling would break per-slot symbol identity (brief 149
   precedent — same call decomper made for the pointer pool).
   For size-1/2 candidates this is rare but worth a per-candidate
   check.
3. **Carryovers unchanged** — C-22 adjacent-bitfield, C-21
   ternary decomposition, C-20 halfword-pack, S-1 padding
   off-by-one, S-2 switch-case textual ordering, C-23 candidate
   MMIO base folding (still pending cloud sweep classification).

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory).
- ❌ Modifying `arm9.lcf` to relax `ALIGNALL(2)` — brief 152
  explicitly out-of-scoped this.
- ❌ Cluster B W6-rejected size=4 sub-pool (~21 unaligned or
  value=0 candidates) — those need BSS handling or `.s` recipes
  (separate research).
- ❌ Other clusters (A, C, D-1, D-2, D).
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- Wave 1 PR opens with the size-1/2 candidates bundled per
  brief 152's recipe. Yield + bytes reported in PR body.
- 3-region `ninja sha1` PASS preserved.
- Per-claim byte-identical via objdiff on each bundle's
  address range.
- Brain scopes the next decomper brief based on remaining
  cluster B residue (W6-rejected sub-pool) and / or other
  cluster wavefronts.

**Branch:** `decomper/cluster-b-size-1-2-wave`

**Priority:** HIGH. Brief 152 locked the recipe specifically
to unblock this drain. Estimated single wave.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test.
2. Brain scopes the next brief. Options:
   - **Cluster B W6-rejected sub-pool** (~21 size=4 unaligned
     or zero-valued candidates — needs BSS / `.s` research).
   - **Cluster A `.bss`** (39 candidates from brief 141 sweep,
     per cluster-A status note in state.md).
   - **ov004 polish per brief 151's `n=9` floor recommendation**
     — depends on brief 154 (cloud) status.

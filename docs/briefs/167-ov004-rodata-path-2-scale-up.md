### decomper/ov004-rodata-path-2-scale-up

**Goal:** First scale-up wave of path-2 ov004 `.rodata` source
claims now that brief 164 closed the n=5 SHA1 residual.
Empirically test whether the block-level veneer suppression
brief 160 documented continues beyond n=5 — i.e., does
claiming slots in **distinct veneer blocks** drop the
veneer count further?

**Context — what's known:**

Brief 160 (PR #592) found that source-claiming any 4-aligned
ov004 `.rodata` slot suppresses **4 veneers in one step (9 →
5)**, independent of which slot is claimed. Brief 162 tried
2 + 3 source claims and observed n stayed at 5 — the cascade
didn't drop further.

Brief 164 (PR #599) discovered the underlying mechanism for
the +12-byte SHA1 residual at n=5: mwldarm at n=5 emits a
**28-byte cluster** (`WITH_TERMINATOR_LONG` shape) vs n=9's
12-byte cluster (`NO_TERMINATOR`). The patcher's walk-forward
detector now handles all 3 observed shapes. **Any single
4-aligned ov004 `.rodata` claim now ships SHA1 PASS at n=5.**

Brief 159's reverse-lookup tool shows 219 distinct ov004
`.rodata` slots referenced by ov002 cross-overlay pointers.
Brief 156's spot-disasm found 75% byte-coherence on a
MEDIUM cohort sample. Both signals suggest the block
structure: mwldarm likely emits one veneer per (block,
non-source-claimed slot), so claiming slots in N distinct
blocks should drop the veneer count by N×4 (or similar).

**Hypothesis to test:**

Claiming 5-10 ov004 `.rodata` slots spread across **distinct
veneer blocks** drops the veneer count below 5 (target: n=1
or n=0).

**Brief 167 deliverables:**

### Part 1 — Block-discrimination methodology

Identify whether brief 159's reverse-lookup tool output can
be partitioned into veneer-block groups:

- Inspect `docs/research/ov004-rodata-pointer-targets.md`
  for clusters of slot addresses (e.g., contiguous ranges of
  ov004 `.rodata` per block boundary).
- Alternative: use mwldarm's link-time output (the veneer
  pool's `(source_addr, target_VA)` pairs from brief 134's
  patcher's scanner) to deduce block boundaries.
- Pick 5-10 candidate slots — at least 3 should be from
  visibly-distinct address ranges in the survey output.

### Part 2 — Per-slot claim with veneer-count observation

For each picked slot, **one at a time** (per-claim SHA1
gate is the experiment):

1. Generate Pattern 1 `.c`:

   ```c
   const unsigned char data_ov004_<addr>[N] = {0xAA, 0xBB, ...};
   ```

   Bytes from orig binary; size from next-symbol offset.
2. Add TU claim to `config/eur/arm9/overlays/ov004/
   delinks.txt`.
3. Run `ninja sha1`. Record:
   - **PASS** → claim sticks. Observe the patcher's
     "veneers spliced: N" line. Did n drop?
   - **FAIL** → revert the claim. Document the failure mode.
4. Verify 3-region SHA1 PASS after each kept claim.

**Target: ≥ 5 kept claims** with at least one drop below
n=5 (i.e., reach n=1 or n=0).

### Part 3 — Report findings

Update `docs/research/ov004-rodata-pointer-targets.md` (or a
sibling note) with:

| Slot | Refs | Veneer count after claim | SHA1 |
|---|---:|---:|:---:|
| `data_ov004_021ff0b4` | 360 | 5 | PASS |
| `data_ov004_<dist_1>` | … | ? | PASS / FAIL |

Document whether the block-level cascade extends past
n=5 — and if so, the per-block granularity.

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS for all kept claims
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
```

If even ONE kept claim drops EUR SHA1, the PR doesn't merge.

**Self-extend gate** (same as previous decomp-tier briefs):
yield ≥ 40% AND bytes-matched ≥ 250.

**Non-scope:**

- ❌ Reclassifying symbols in `symbols.txt` (path 1 risky
  per brief 154; this brief stays path 2).
- ❌ Touching `tools/` (cloud's territory; brief 166 has
  generator work in parallel).
- ❌ Mega chunk shipping (brief 165 done; remaining mega
  data_020c9694 14.8 KB — separate brief if worth it).
- ❌ Odd-aligned slot recipe (brief 160 finding #4 — separate
  brief if scale-up needs it).
- ❌ `AGENTS.md`, `docs/state.md` beyond Part 3.

**Success:**

- ≥ 5 kept ov004 `.rodata` claims.
- 3-region `ninja sha1` PASS preserved (across all kept
  claims).
- 3-region 27/27 module OK preserved.
- Per-slot report documenting veneer-count progression.
- **Bonus**: at least one claim drops veneer count below n=5
  (validates multi-block cascade hypothesis).

**Branch:** `decomper/ov004-rodata-path-2-scale-up`

**Priority:** HIGH. First scale-up wave of path 2 — the
block-level model brief 160 documented + brief 164 unblocked.
Tests empirical limits of mwldarm's veneer-emission model at
multiple block coverage.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test pre-merge.
2. Brain scopes brief 169+ based on findings:
   - **If n drops below 5**: brief 169 = brain analyses block
     boundaries from claim outcomes; brief 170 = decomper
     scale-up wave 2 targeting more blocks.
   - **If n stays at 5**: brief 169 = brain analyses why
     (maybe ALL distinct-address slots map to same block per
     mwldarm's analysis; consider path-1 cautious
     reclassification as alternative).
   - **3 cluster B value=0 deferred candidates** — wave-2 TU
     rewrite.
   - **Cross-region cluster A apply** — port 1443 EUR
     cluster A symbols to USA + JPN.

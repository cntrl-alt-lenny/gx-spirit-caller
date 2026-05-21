### cloud/unified-chunk-extent-generator

**Goal:** Generalise brief 174's bundle-extent heuristic
into a region-aware **chunk extent generator** that handles
the gap-extent issue across both single-symbol bundles
(brief 174 already covers) AND multi-symbol Pattern 3 /
D-3 chunks (brief 175 hit the same underlying issue).
Unblocks brief 178+ decomper cross-region D-3 retry +
future cluster C cross-region work.

**Context — what briefs 172 + 174 + 175 documented:**

The "gap-extent issue" surfaces when a cross-region apply
slices through inner gap-file symbols whose gap-inferred
sizes extend past the chunk's start boundary:

- **Brief 172** (cluster B residue): mechanical bundle
  apply fails because brief 152/155 extents were hand-tuned.
- **Brief 174** (the fix): single-symbol bundle generator
  picks `[candidate, next_4_aligned_named_vaddr_with_non_zero)`.
  Works for size-1/2 + value=0.
- **Brief 175** (D-3 cross-region): same failure mode at
  Pattern 3 chunk boundaries. Each EUR chunk's vaddr range,
  mapped to USA/JPN, slices through gap-file inner symbols
  whose gap-extent reaches past the chunk start.

**Brief 175's recommendation:**

> **Cloud research**: generalise brief 174's bundle-extent
> heuristic into a **region-aware chunk extent generator**
> that:
>
> 1. Takes an EUR chunk + target region.
> 2. Computes per-region equivalent vaddr range.
> 3. Audits the region's `symbols.txt` + delinks gap-file
>    boundaries around the equivalent range.
> 4. Adjusts the chunk extent to absorb all inner symbols'
>    full gap-extents.
> 5. Falls back to "this chunk needs hand-tuning" with the
>    offending inner-symbol list if no clean extent exists.

**Brief 177 deliverables:**

### Part 1 — Audit brief 175's failing chunks

Pick 3-5 failing chunks from brief 175's 72 attempts. For
each:

1. Identify the EUR chunk's vaddr range.
2. Compute the USA / JPN equivalent range.
3. Enumerate the inner gap-file symbols whose gap-extents
   extend past the chunk's start.
4. Determine what the chunk's "true" extent should be —
   the smallest range that covers all inner gap-file
   symbols' full extents AND meets brief 174's 3 constraints
   (4-aligned end, named-symbol boundary, ≥ 1 non-zero
   byte).

### Part 2 — Generalise the generator

Either:

- **Extend brief 174's `cluster_b_bundle_gen.py`** to
  accept multi-symbol input (a range, not a single
  address). The 3 constraints still apply but operate on
  the chunk-end boundary.
- **OR new `tools/cross_region_chunk_extent.py`** that
  layers atop brief 174's logic and handles cluster D-3
  Pattern 3 chunks specifically. CLI:

  ```bash
  python tools/cross_region_chunk_extent.py \
      --region usa --module ov006 \
      --start 0x021cca88 --end 0x021ccd08
  ```

  Output: adjusted `(start, end)` that satisfies all
  constraints. Or a "needs hand-tuning" report with the
  offending inner-symbol list.

### Part 3 — Tests + worked examples

- Regression: brief 174's worked examples should still
  pass via the generalised path (heuristic unchanged for
  single-symbol case).
- New: ≥ 2 brief 175 failing chunks regenerate cleanly +
  ship as cross-region D-3 worked examples via the new
  tool.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved (current main).
- ≥ 2 cross-region D-3 worked examples ship + PASS.
- Brief 174's tests still pass.
- Markdownlint clean on new docs.

**Non-scope:**

- ❌ Full brief 175 cross-region D-3 application (brief
  178+ decomper after this lands).
- ❌ Patcher Variant E (brief 173 hand-off — brief 179+
  candidate).
- ❌ Cluster C / D-1 / D-2 cross-region (separate brief
  after this generalises further).
- ❌ AGENTS.md / state.md beyond PR.

**Success:**

- Generator handles both single-symbol bundles AND multi-
  symbol Pattern 3 chunks.
- ≥ 2 brief 175 failing chunks ship as cross-region D-3
  worked examples.
- 3-region SHA1 PASS preserved.
- Brief 174's regression tests still green.

**Branch:** `cloud/unified-chunk-extent-generator`

**Priority:** MEDIUM. Unblocks brief 175's ~62 D-3 cross-
region matches in brief 178+; reusable for future cluster
C / D-1 / D-2 cross-region work.

**After this brief lands:**

1. Brief 178 (decomper) re-runs cross-region D-3 with
   the unified generator.
2. Generator can extend to cluster C / D-1 / D-2 (and
   any other multi-symbol cluster) if those surface
   similar gap-extent issues.
3. Path-2 Variant E (brief 173) remains the next big
   cloud lever after this.

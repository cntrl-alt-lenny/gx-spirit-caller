### cloud/bundle-extent-heuristic-generator

**Goal:** Research brief 152/155 worked-example bundle-extent
selection + build a generator that automates it. Unblocks
brief 176+ decomper cross-region cluster B residue
application (brief 172's failure: mechanical bundle apply
doesn't work without per-candidate hand-tuning).

**Context — what brief 172 documented:**

Brief 172 (PR #611) attempted to mechanically apply brief
152/155's `unsigned int[N]` bundle recipe to USA + JPN
cluster B residue (size-1/2 + value=0 sub-pools). 4
iterations attempted; all FAILED:

| Attempt | Recipe | Failure mode |
|---|---|---|
| 1 | Single-word `unsigned int[1]` bundle | mwldarm routes value=0 to `.bss` → BSS shift cascade |
| 2 | Multi-word bundle to next-named symbol | dsd `section-membership` check rejects (next-symbol's gap-inferred size extends past bundle end) |
| 3 | Zero-extend bundle while all-zero | re-triggers attempt 2's failure at extended end |
| 4 | Iterative inner-symbol absorption | dsd rejection / over-absorption / new inner symbols at new extents |

> Why brief 152/155 worked: bundle extents were **hand-tuned**
> per candidate. Brief 152's `data_021020b4[16]` chose N=16
> (64 bytes covering exactly to next named symbol, with no
> intervening symbols, candidate value 0x80 ensuring non-zero
> content). Mechanical apply has no such hand-tuning context.

**Brief 172 hand-off**:

> 1. **Cloud research**: audit brief 152/155 worked examples
>    for the exact bundle-extent selection heuristic that
>    succeeded.
> 2. **Build a generator** that automates the heuristic
>    (likely needs to absorb full named-symbol gap chains
>    until reaching a 4-aligned boundary with no pending
>    gap-extension).
> 3. **Brief 175+ decomper** re-runs cross-region apply with
>    the working generator.

**Brief 174 deliverables:**

### Part 1 — Audit brief 152/155/153/155 + 169 worked examples

Inspect each of the bundle TU files brief 152/153/155 shipped
on EUR:

- Brief 152: `data_021020b4` (16-int bundle, 64 bytes)
- Brief 153: 6 overlay bundles (ov002 + ov006)
- Brief 155: 16 main bundles (W6-rejected value=0)

For each: characterise the chosen bundle extent:

- Start address (symbol's vaddr).
- End address (= start + N × 4).
- Containing section's start/end (from delinks.txt).
- Next-named-symbol-after-start vaddr.
- Whether any intervening unnamed gap symbols exist inside
  the bundle range.
- The first non-zero byte position inside the bundle (i.e.
  where the candidate's actual value is).

Look for a pattern that explains why N was chosen.
Likely hypothesis: the extent absorbs all unnamed gap
symbols + zero-pad after the candidate up to the
**next-named-symbol-or-section-boundary**, choosing the
shortest such extent that still has non-zero content
somewhere inside (to prevent mwldarm `.bss` routing).

### Part 2 — Build a generator

New `tools/cluster_b_bundle_gen.py` (or extend the existing
`tools/cluster_b_bundle.py` from brief 161) that:

1. **Inputs**: target region, target symbol address.
2. **Reads**: region's `symbols.txt` + `delinks.txt` +
   extracted binary at the target's section.
3. **Computes**: the bundle extent per the heuristic
   identified in Part 1.
4. **Emits**: the `unsigned int[N]` bundle source file +
   delinks.txt claim addendum.
5. **Validates**: dsd section-membership check should pass;
   bundle should have non-zero content somewhere.

### Part 3 — Tests + worked examples

- 1-2 regression tests pinning the heuristic against known-
  good EUR fixtures (brief 152's `data_021020b4` should
  regenerate byte-identical bundle file).
- 1-2 cross-region worked examples: apply the generator to
  USA or JPN cluster B size-1/2 candidates, verify SHA1
  PASS per region.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved (current main; brief
  173 left main at n=2).
- New tool tests pass.
- Brief 152's existing `data_021020b4.c` bundle is
  byte-identical when regenerated.
- 1-2 cross-region worked examples ship + PASS.

**Non-scope:**

- ❌ Full brief 172 cross-region cluster B residue
  application (brief 176+ decomper after this lands).
- ❌ Patcher Variant E (brief 175+ candidate from brief 173
  hand-off).
- ❌ Cluster D-3 cross-region (brief 175 decomper, parallel
  track).
- ❌ Path-2 ov004 work.
- ❌ AGENTS.md / state.md beyond PR.

**Success:**

- Bundle-extent heuristic identified empirically from
  worked-example audit.
- Generator tool ships with regression tests.
- Brief 152's existing bundle regenerates byte-identical.
- ≥ 1 cross-region worked example demonstrates the tool
  works for new candidates.
- 3-region SHA1 PASS preserved.

**Branch:** `cloud/bundle-extent-heuristic-generator`

**Priority:** MEDIUM. Unblocks ~104 region-matches in brief
176+; reusable for any future bundle wave.

**After this brief lands:**

1. Brief 176 (decomper) re-runs cross-region cluster B
   residue with the working generator.
2. Generator can extend to additional cluster B sub-pools
   (size-1/2, value=0, ov006) and possibly to other clusters
   if they hit similar patterns.
3. Variant E patcher work (brief 173 hand-off) remains a
   separate brief 177+ candidate.

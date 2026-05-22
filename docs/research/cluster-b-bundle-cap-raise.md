# Cluster B bundle safety cap — raise 1024 → 4096 + per-cluster guardrail

**Brief:** 185 (scaffolder). Diagnoses why `data_ov006_021ceae4`
tripped the 1024-byte safety cap in `tools/cluster_b_bundle_gen.py`,
raises the cap to 4096 with empirical justification, adds a
`max_inner_symbols=16` per-cluster guardrail, ships
`data_ov006_021ceae4` as a worked example proving the change is
safe.

## TL;DR

- **Pre-fix:** `compute_bundle_extent`'s `max_bundle_bytes=1024`
  raised `BundleExtentError` on `data_ov006_021ceae4` (USA + JPN
  ov006). Brief 181 (PR #624) explicitly deferred this case.
- **Diagnosis:** the next 4-aligned named symbol after the
  candidate is **1168 bytes** away. The bundle absorbs **3
  inner placeholders** at offsets `+0x2`, `+0x6`, `+0x24a` and
  has **46.7% non-zero density**. Not pathological — just a
  wider-than-expected gap between 4-aligned anchors.
- **Fix:** raise the default cap from 1024 → 4096 (3.5× headroom
  over the empirical case) and add `max_inner_symbols=16` as a
  per-cluster guardrail that routes truly-pathological cases
  (e.g. multi-segment ranges with dozens of inner placeholders)
  to the Pattern 3 emitter (`cluster_c_pattern3_gen.py`) instead
  of trying to bundle them.
- **Worked example:** `src/usa/overlay006/data/data_ov006_021ceae4.s`
  + `src/jpn/overlay006/data/data_ov006_021ceae4.s` ship the
  generated bundle artifacts. Same byte content cross-region
  (USA / JPN ov006 are identical in this range).

## Diagnosis

Brief 181 deferred `data_ov006_021ceae4` with the note: *"bundle
extent exceeds the 1024-byte safety cap (next 4-aligned named
symbol is 1168 B away)."* Direct inspection of USA's
`config/usa/arm9/overlays/ov006/symbols.txt` confirms:

| VA | Alignment | Notes |
|---|---|---|
| `0x021ceae0` | 4-aligned | Claimed in brief 181 (4 B) |
| `0x021ceae4` | 4-aligned | **The candidate** |
| `0x021ceae6` | `+2` | Inner placeholder (size 4) |
| `0x021ceaea` | `+2` | Inner placeholder (size 0x244 / 580 B) |
| `0x021ced2e` | `+2` | Inner placeholder (size 0x246 / 582 B) |
| `0x021cef74` | 4-aligned | **First 4-aligned named symbol** |

`0x021cef74 - 0x021ceae4 = 0x490 = 1168 bytes`. Three consecutive
non-4-aligned named symbols force the bundle to span all of them.

The bytes within the bundle: 546 non-zero out of 1168 (46.7% non-
zero density). Plenty of content to keep mwcc routing to `.data`
(the existing ≥1 non-zero requirement is met comfortably).

The 580 B and 582 B inner placeholders are substantial data blobs
(likely interned string tables or descriptor records — they have
the byte signature of structured data: alternating non-zero and
zero runs).

## Why option (b) — raise the cap

Brain offered two paths:

- **Option (a)** — tighten the bundle predicate so the cap stays
  at 1024 but this candidate fits inside it.
- **Option (b)** — raise the cap with empirical justification
  + per-cluster guardrail.

**(a) is structurally infeasible for this case.** The bundle MUST
end at a 4-aligned named symbol (per dsd's section-membership
check + mwldarm's `ALIGNALL(2)` cascade — both invariants are
non-negotiable). The next such symbol is `0x021cef74`. No
predicate tightening can move it closer. The only way to make the
bundle smaller would be to add a NEW symbol to `symbols.txt` at an
intermediate 4-aligned VA, which is decomper territory (and
changes the dsd-managed symbol table — out of scope for a tooling
fix).

**(b) works cleanly.** Brief 174's audit of brief 152/155 saw
bundles up to 64 B; the 1024 cap was a "generous soft maximum" to
detect pathological cases (e.g. all-zero `.data` tail). Brief 181's
empirical case at 1168 B is not pathological — just a wider gap.
Raise the cap to 4096 (3.5× over the empirical case, leaves
headroom for similar cases to surface without re-triggering the
deferral cycle).

## Per-cluster guardrail — `max_inner_symbols`

A raised cap alone isn't enough — pathological cases could still
slip through (e.g. a candidate sitting in front of a 3 KB run with
hundreds of size-1 placeholders). The cluster B `unsigned int[N]`
/ byte-bundle recipe is designed for SMALL placeholder clusters
(brief 152/155 worked examples had ≤ 2 inner; brief 185's case
has 3).

Add `max_inner_symbols: int = 16` as the new safety check. If a
bundle would absorb more than 16 inner placeholders, raise
`BundleExtentError` with a clear message pointing the operator
at `cluster_c_pattern3_gen.py` — Pattern 3 multi-symbol `.s`
chunks scale to arbitrary inner-symbol counts via `.global`
aliases at each named offset (brief 178 D-3 shipped 74 chunks
this way).

The guardrail is independent of `max_bundle_bytes`: a 4096-byte
bundle with 17 inner symbols fails the guardrail even though it
fits the size cap. The cap catches "the gap chain is structurally
wrong"; the guardrail catches "the recipe is wrong for this
shape".

Both are configurable kwargs on `compute_bundle_extent`. Callers
that genuinely need higher bounds (e.g. a one-off paste-into-
hand-bundle case) can override; the defaults reflect the
recommended operating envelope.

## Worked example — `data_ov006_021ceae4`

### Why `.s` not `.c`

Cluster B's two emit shapes:

- **`.c unsigned int[N]`** (`cluster_b_bundle_gen.py:render_bundle_c`):
  brief 152/155 form. Anchor-only `.global`; inner placeholders'
  load relocs resolve via `patch_module_literals.py` post-link.
- **`.s` with `.global` aliases** (`cluster_b_bundle.py:render_bundle_s`
  for word-aligned aliases, brief 185 adds
  `cluster_b_bundle_gen.py:render_bundle_s_bytewise` for arbitrary
  byte offsets): brief 161 / 181 form. Every inner placeholder
  exported as `.global` so mwldarm resolves load relocs at link
  time directly.

Per brief 181's commit message: **`patch_module_literals.py`
doesn't run on overlay binaries.** So for any `.data` cluster B
candidate inside an overlay (ov0NN), the `.c` form leaves inner
placeholders' relocs unresolvable. The `.s` form is mandatory.

`data_ov006_021ceae4` is in ov006 → `.s` form. The inner
placeholders at offsets `+0x2` and `+0x6` are non-4-aligned, which
the existing `render_bundle_s` (`.word`-only) rejects. Brief 185
adds `render_bundle_s_bytewise` to handle byte-granular emission
with `.global` labels at any offset.

### Output shape

The artifact follows brief 181's worked-example convention
(`data_ov006_021cdd0c.s` etc.):

```text
; Cluster B bundle — brief 185 byte-granular `.s` emitter (overlay-safe form).
; ...

        .section .data

        .global data_ov006_021ceae4
data_ov006_021ceae4:
        .byte 0x74, 0x04

        .global data_ov006_021ceae6
data_ov006_021ceae6:
        .byte 0x72, 0x04, 0x73, 0x04

        .global data_ov006_021ceaea
data_ov006_021ceaea:
        .byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x0b
        ...
```

`bytes_per_line = 8` matches the brief 181 convention for diff
readability.

### Cross-region consistency

The byte content for `[0x021ceae4, 0x021cef74)` is **identical**
between USA and JPN ov006 (verified by direct comparison: 546
non-zero out of 1168 bytes, byte-for-byte match). The same
artifact ships to both regions. EUR doesn't have this candidate
in its symbol table (the cluster B residue around `0x021cea*`
diverges between EUR's earlier-decomp state and the cross-region
USA/JPN apply).

### Brief 181 deferral closed

The brief 181 deferred-list entry:

> **Skipped (out of scope):** `data_ov006_021ceae4`: bundle extent
> exceeds the 1024-byte safety cap (next 4-aligned named symbol
> is 1168 B away).

Closes with this brief. The other brief 181 deferral
(`data_ov002_022ccc2e` — odd-aligned with no nearby 4-aligned
preceding anchor) is a different problem (needs a new recipe per
brief 181's note, NOT a cap-raise) and stays deferred.

## Regression coverage

Brief 185 adds 13 new tests across 3 classes:

- `TestBrief185CapRaiseAndGuardrails` (5)
  - `test_default_cap_admits_1168_byte_bundle` — empirical case
    that motivated this brief.
  - `test_default_cap_rejects_above_4096` — new cap fires above
    4096.
  - `test_max_inner_symbols_guardrail_rejects_pathological` —
    > 16 inner symbols raises.
  - `test_max_inner_symbols_override_allows_higher` — caller
    can opt out via kwarg.
  - `test_at_default_cap_boundary_4096_accepted` — boundary
    semantics (cap is `>`, not `>=`).
- `TestRenderBundleSBytewise` (6) — new emitter shape, odd-
  offset aliases, byte-per-line formatting, bounds check.
- `TestBrief185Ov006WorkedExample` (2) — pins the actual
  artifact content cross-region against the generator output
  (catches future drift).

The existing 15 `TestComputeBundleExtent*` + `TestEURWorkedExampleRegression`
+ `TestRenderBundleC` tests are **unchanged and still green** —
brief 152/155 worked examples regenerate byte-identically under
the new caps.

## What this PR ships

- `tools/cluster_b_bundle_gen.py` — cap raise + guardrail +
  `render_bundle_s_bytewise` emitter.
- `tests/test_cluster_b_bundle_gen.py` — 13 new tests
  (28 total, was 15).
- `src/usa/overlay006/data/data_ov006_021ceae4.s` — worked example.
- `src/jpn/overlay006/data/data_ov006_021ceae4.s` — worked example.
- `config/usa/arm9/overlays/ov006/delinks.txt` — appended.
- `config/jpn/arm9/overlays/ov006/delinks.txt` — appended.
- This research note.

## Cross-references

- [`docs/briefs/174-bundle-extent-heuristic-generator.md`](../briefs/174-bundle-extent-heuristic-generator.md)
  — the brief that introduced `cluster_b_bundle_gen.py`.
- [`docs/briefs/181-...`](../briefs/) — brief 181's commit (PR #624)
  is the deferral source for this brief.
- [`docs/research/cluster-b-size-1-2-recipe.md`](cluster-b-size-1-2-recipe.md)
  — brief 152's `.c` bundle recipe rationale.
- [`docs/research/cluster-b-pointer-pool.md`](cluster-b-pointer-pool.md)
  — brief 148's overlay-vs-main divergence note (the basis for
  brief 181's "patch_module_literals.py doesn't run on overlays"
  observation).
- [`src/usa/overlay006/data/data_ov006_021cdd0c.s`](../../src/usa/overlay006/data/data_ov006_021cdd0c.s)
  — brief 181's worked example; the bytewise emitter mirrors its
  shape.

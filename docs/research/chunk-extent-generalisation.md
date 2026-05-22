# Chunk-extent generalisation — cluster C / D-1 / D-2 cross-region prep

**Status:** scoping note (scaffolder autonomous work). Brain mentioned
brief 183+ may pivot to cluster C / D-1 / D-2 cross-region after
briefs 178 + 180 closed. This note audits brief 177's
`tools/cross_region_chunk_extent.py` (the multi-symbol extent
adjuster) and the surrounding cross-region apply pipeline to
identify what changes are needed before that next-cluster wave runs.

> ⚠️ **Brain please confirm scope.** This is anticipatory prep
> work, not a brief deliverable. Treat the API surface proposed in
> § 4 as a starting point for brief 183+ scoping, not a locked
> design — particularly the per-cluster `require_nonzero` and
> reloc-handling rules in § 3, which need a small empirical sample
> before they're fixed.

## 1. What brief 177 shipped

`tools/cross_region_chunk_extent.py` (540 LOC, brief 177 / PR #618)
exposes a single function `adjust_chunk_extent(target_start,
target_end, symbols, sections, binary, binary_base_vaddr, *,
section_name=None, require_nonzero=None, max_iters=64) →
AdjustedExtent` plus a CLI wrapper.

The 3-phase algorithm:

- **Phase A — lower start LEFT.** If a predecessor's gap-inferred
  extent reaches into `target_start`, drop start to that
  predecessor's vaddr. Raises if the predecessor lands on a
  non-4-aligned VA.
- **Phase B — raise end RIGHT iteratively.** For every named
  symbol inside `[start, end)`, compute its gap-inferred extent
  (= next-named-symbol vaddr); if any extent exceeds end, extend
  end. Repeat until stable, then round end up to the nearest
  4-aligned named-symbol vaddr or section end.
- **Phase C — validate.** Re-check inner symbol extents fit;
  enforce 4-alignment; for `.data` chunks enforce ≥ 1 non-zero
  byte (mwcc would otherwise route the section to `.bss`).

Brief 178 (PR #620) validated the tool at scale: 74 cross-region
D-3 chunks across USA + JPN, all 3-region SHA1 PASS preserved.
The algorithm is solid at the multi-symbol layer.

## 2. What's genuinely D-3-specific vs general

Re-reading the brief 177 docstring's framing ("for Pattern 3 / D-3
/ cluster-C cross-region apply"), the extent-adjuster algorithm
itself is **already general** — there is no Pattern 3 logic in
`adjust_chunk_extent`. Section auto-detection, 4-alignment rules,
named-symbol boundary enforcement, gap-extent iteration, and the
`.data` non-zero check all apply equally to any `.rodata` /
`.data` chunk. Per-cluster sweep:

| Aspect | Cluster B bundles | Cluster C strings | Cluster D-1 dispatch tables | Cluster D-2 small byte arrays | Cluster D-3 nested structs |
|---|---|---|---|---|---|
| Section | `.data` | `.rodata` | `.data` | `.data` | `.rodata` mostly |
| Multi-symbol | usually 1 anchor + 0-N zero-pad neighbours | usually 1 string | 1 chunk = 1 table | 1 chunk = 1 array | 1 chunk = N inner structs |
| Extent algorithm | brief 174 `cluster_b_bundle_gen.py` (single-anchor) | **same as D-3** | **same as D-3** | **same as D-3** | brief 177 `cross_region_chunk_extent.py` |
| Inner-symbol extent issue | rare (single anchor) | rare (one string) | possible (table contents) | possible (array contents) | common (nested struct rows) |
| `require_nonzero` | True (`.data` rule) | False (`.rodata` rule) | True (`.data`) | True (`.data`) | False (`.rodata`) |
| Reloc-awareness needed | yes for size-0/1 pointer pool (brief 148) | rare (string literals) | **YES** (`kind:load` on every slot) | sometimes | sometimes (function-pointer rows) |
| Chunk-emitter | `cluster_b_bundle.py` | needs new — see § 3 | needs new — see § 3 | needs new — see § 3 | `cluster_c_pattern3_gen.py` |

The conclusion: `adjust_chunk_extent` is **reusable verbatim**
for cluster C / D-1 / D-2. The work in brief 183+ is upstream
(candidate enumeration) and downstream (per-cluster emitters),
not in the extent adjuster itself.

## 3. What cluster C / D-1 / D-2 cross-region apply needs

The cross-region apply pipeline lives in
`tools/cross_region_cluster_apply.py` (brief 170 / PR #605). It
has subcommands `b-scalars` and `b-pointers`; `d3-chunks` is
currently a stub (line 776-788) that returns rc=2. Brief 178's
D-3 wave used `cross_region_chunk_extent.py` + `cluster_c_pattern3_gen.py`
directly, orchestrated outside the apply tool.

Three new subcommands need to be added to
`cross_region_cluster_apply.py`. Each is structurally identical:
enumerate candidates from the region's `symbols.txt` /
`relocs.txt` / `delinks.txt` / `.bin`, call `adjust_chunk_extent`
for each, drive the appropriate emitter.

### 3.1 `c-strings` (cluster C Pattern 1)

- **Candidate enumeration:** `.rodata` symbols not in the
  already-claimed delinks ranges. Filter to byte arrays /
  printable-ASCII strings via a heuristic (`tools/analyze_symbols.py`
  already classifies — confirm it has a `.rodata`-strings
  predicate).
- **`adjust_chunk_extent` call:** `section_name=".rodata"`,
  `require_nonzero=False`. Cluster C strings can be all-zero
  (e.g. the empty-string `""` is 1 byte: `0x00`). The W6
  4-byte rounding handled by Phase B's 4-alignment rule.
- **Emitter:** new `tools/cluster_c_string_gen.py` — emits a
  `.s` file with the right `.global` labels + bytes (or a `.c`
  file with `const char data_<addr>[] = "..."` for the
  W6-safe cases). Brief 122 (cluster C wave 1) already shipped
  hand-written examples; the gen tool codifies the recipe.
- **Per-region content sensitivity:** brief 122 noted cluster
  C has **more region-specific content** than B/D (USA strings
  differ from JPN strings differ from EUR). The
  cross-region apply must read the region's own `.bin` for
  the string bytes — not port EUR's content.

### 3.2 `d1-tables` (cluster D-1 dispatch tables)

- **Candidate enumeration:** `.data` symbols whose bytes contain
  `kind:load` relocs at every 4-byte offset (= pointer-table
  shape). The reloc-scan logic exists in `cmd_b_pointers`
  (lines ~600+ in `cross_region_cluster_apply.py`); reuse and
  extend to multi-slot tables.
- **`adjust_chunk_extent` call:** `section_name=".data"`,
  `require_nonzero=True` (tables always have non-zero pointer
  values at runtime, but rely on relocs for the actual values
  — see emitter note).
- **Emitter:** new `tools/cluster_d1_table_gen.py` — emits a
  `.c` file with `void *data_<addr>[N] = { &data_<target_0>,
  &data_<target_1>, … }` using the reloc `to:` targets. The
  brief 124 recipe codified the shape; only needs the gen
  tool to scale.
- **Reloc dependency:** each `&data_<target>` extern reference
  must resolve at link time. The cross-region apply tool needs
  to verify each `to:` target exists in the region's
  `symbols.txt` (it should — dsd delinks all relocations) and
  emit `extern char data_<target>;` declarations.

### 3.3 `d2-tables` (cluster D-2 small byte arrays)

- **Candidate enumeration:** `.data` symbols without relocs,
  size ≥ 8 bytes (smaller is cluster B), content is
  byte/short/int array (no embedded pointers).
- **`adjust_chunk_extent` call:** `section_name=".data"`,
  `require_nonzero=True`.
- **Emitter:** `tools/cluster_d2_array_gen.py` — types the
  array (u8 / u16 / u32) based on size + alignment + content
  variance. Brief 121 documented the recipe; gen tool codifies.

### 3.4 What doesn't need a new tool

- `d3-chunks` subcommand stub can stay deferred (or be wired
  into the existing `cross_region_chunk_extent.py` +
  `cluster_c_pattern3_gen.py` pipeline brief 178 used directly).
  Either way, the existing tool chain works; only the apply-tool
  CLI surface is missing.
- `adjust_chunk_extent` itself needs no changes — it's
  cluster-agnostic at the algorithm layer.

## 4. Proposed API surface for brief 183+

The minimal-diff approach: extend `cross_region_cluster_apply.py`
with 3 new subcommands that follow the existing `cmd_b_scalars` /
`cmd_b_pointers` pattern. No changes to
`cross_region_chunk_extent.py`. The per-cluster
`require_nonzero` and emitter wiring is the per-subcommand
concern.

Skeleton (illustrative, not authoritative):

```python
def cmd_c_strings(args):
    paths = RegionPaths.make(args.region, args.module)
    symbols, delinks, binary = _load_region_data(paths)
    candidates = _enumerate_unclaimed_rodata_strings(
        symbols, delinks, binary,
    )
    for cand in candidates:
        try:
            adj = adjust_chunk_extent(
                cand.start, cand.end, symbols,
                delinks.sections, binary, paths.base_vaddr,
                section_name=".rodata",
                require_nonzero=False,
            )
        except ChunkExtentError as e:
            _report_needs_hand_tuning(cand, e)
            continue
        _emit_string_chunk(paths, adj, args.dry_run)
```

`cmd_d1_tables` + `cmd_d2_arrays` follow the same shape with the
appropriate enumeration + emitter swaps.

### Per-subcommand checklist

For each of the 3 new subcommands, the work in brief 183+ is:

1. Wire the enumeration query (1 helper per cluster).
2. Wire the emitter (`cluster_c_string_gen.py` / `d1_table_gen.py`
   / `d2_array_gen.py` — new tools, or extend existing ones).
3. Plumb `adjust_chunk_extent` between (verbatim).
4. Self-extend gate per the existing cross-region brief pattern
   (yield ≥ 50%, bytes-matched ≥ 500 per region).
5. Tests: a unit test per subcommand that pins enumeration
   correctness + emitter output for ≥ 1 known candidate.
6. Real-data smoke against EUR `config/eur` for `--dry-run`
   reports (scaffolder verification limit).
7. 3-region `ninja sha1` PASS preserved (brain verifies pre-merge).

## 5. Suggested brief 183+ scoping

If brain agrees the API surface in § 4 is right, the brief 183+
wave shape would be:

- **Brief 183 (cloud / scaffolder, MEDIUM):** ship `c-strings`
  + `d1-tables` + `d2-tables` subcommand stubs that call into
  `adjust_chunk_extent`. Add the corresponding emitters (one
  per cluster). Bring `cross_region_cluster_apply.py
  d3-chunks` out of stub state by wiring it to the existing
  brief 178 pipeline.

- **Brief 184 (decomper, MEDIUM):** drive `c-strings` at scale
  across USA + JPN. ~462 cluster C candidates per brief 119;
  yield gate ≥ 50%.

- **Brief 185+ (decomper, MEDIUM each):** `d1-tables` then
  `d2-tables`. Smaller pools (~70 + ~30 candidates per brief
  121) — likely combine into a single wave depending on yield.

Alternative: one mega-brief 183 (cloud + decomper combined)
that ships all three subcommands + drains them in waves. The
3-subcommand split is mechanical enough that splitting cloud
vs decomper at the subcommand boundary keeps the PR diff
focused, but combining is viable.

## 6. Risks + open questions

- **Cluster C region-specificity (brief 122 finding).** Strings
  often differ between USA / JPN / EUR. The cross-region apply
  must read the **region's own** `.bin`, not port EUR's. Brief
  170's regenerate-don't-port pattern handles this — the
  approach is already proven; just need to confirm the
  enumeration logic doesn't accidentally use EUR addresses.

- **Reloc-target resolution timing.** D-1 tables reference
  externs that may themselves be unclaimed at apply time.
  Brief 148 (cluster B pointer pool) hit this — the recipe was
  "claim the pointer slot regardless; the extern reference
  resolves at link time as long as the target's symbol exists
  in `symbols.txt`". Same applies here.

- **`adjust_chunk_extent` cap at `max_iters=64`.** D-1 / D-2
  chunks are typically small (one symbol, low gap-extent
  depth). Cluster C strings even smaller. Should not hit the
  cap, but worth a safety check on the first wave.

- **The `cluster_c_pattern3_gen.py` naming.** Despite the
  name, it currently emits Pattern 3 (multi-symbol nested
  struct) chunks. New emitters should be named per cluster
  not per pattern (e.g. `cluster_c_string_gen.py`) to avoid
  the same confusion.

## 7. What I did NOT do in this note

- No code changes — pure scoping. Brief 183+ would be the
  implementation.
- No enumeration-query design — that's the per-subcommand
  decision and depends on the existing helpers in
  `cross_region_cluster_apply.py` that I haven't fully audited.
- No empirical sample of cluster C / D-1 / D-2 candidates —
  that's an early-brief task to confirm the yield estimates
  before committing to the wave shape.

## See also

- [`docs/briefs/177-unified-chunk-extent-generator.md`](../briefs/177-unified-chunk-extent-generator.md)
  — original tool spec.
- [`docs/briefs/178-cross-region-cluster-d3-with-generator.md`](../briefs/178-cross-region-cluster-d3-with-generator.md)
  — D-3 apply at scale (74 chunks; tool validated).
- [`docs/research/cluster-c-recipe.md`](cluster-c-recipe.md)
  — cluster C Pattern 1 strings (brief 119).
- [`docs/research/cluster-d-recipe.md`](cluster-d-recipe.md)
  — cluster D-1 / D-2 / D-3 recipes (brief 121).
- [`docs/research/cluster-d3-cross-region-brief178.md`](cluster-d3-cross-region-brief178.md)
  — brief 178's apply notes (worked examples + edge cases).
- `tools/cross_region_chunk_extent.py` — the algorithm.
- `tools/cross_region_cluster_apply.py` — the orchestrator with
  the stub `d3-chunks` subcommand.

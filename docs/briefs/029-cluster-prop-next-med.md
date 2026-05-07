### decomper/cluster-prop-next-med

**Goal:** Continue the cluster-pilot wave. Both ov006 anchors fully
drained via briefs 027 + 028. The remaining top-8 ranking is all
MED 37% (no HIGH; no LOW worth piloting). Pick the strongest-
template-ratio MED candidate and apply the brief-020/028 per-shape
templating workflow.

**Context:**

Brief 028 (PR #309) closed ov006 cluster #1 at 61% yield (27/44).
Combined with brief 027's 94% on cluster #2, the previously-stuck
ov006 problem is fully resolved. Easy tier sits at 76.1% (845/1110).

The post-#309 cluster ranking has no remaining HIGH candidates and
no MED ≥60% candidates with matched ≥10 (rank #5 `ov010_021b4750`
at 64% MED has only 3 matched). Brief 024's anchor-selection rule
no longer fires. This brief uses a relaxed rule: **MED ≥37% with
matched ≥10**, picking by template ratio.

**Anchor selection (do this when you start):**

1. Run:

   ```
   python tools/find_pattern_clusters.py --version eur --top 8
   ```

2. Pick the highest-ratio candidate satisfying:
   - **MED ≥37%** (skip LOW; brief-028 experience says LOW
     predictions can over-deliver but tail-end is rough).
   - **matched ≥10** (template-confidence floor).
   - **NOT** the just-drained ov006 anchors (catch-up siblings,
     if any, are out-of-scope).

3. As of 2026-05-07 late-evening, with cluster #1 + #2 drained,
   the probable winners ranked by template ratio:
   - **rank #2 `func_02001d84`** — size 0x14, sig 0, **27 matched
     / 30 unmatched**, 0.90 ratio, MED 37%. Default suggestion.
   - rank #8 `func_02001e84` — size 0x10, sig 0, **42 matched /
     14 unmatched**, 3.0 ratio (strongest), MED 37%. Smaller
     pool but very high template confidence; could deliver 8-12
     matches at high yield.
   - rank #6 `func_0201397c` — size 0x1c, sig 0, 28 matched / 17
     unmatched, 1.65 ratio, MED 37%. Note: this anchor appeared
     in brief 028's PR body as a matched sibling — may have been
     reclassified as a strong anchor post-merge.

   Pick whichever you have higher confidence on. If unsure, take
   `func_02001d84` (largest pool of the three; brief-028
   experience suggests find_shape_templates handles ratio≥0.9
   well).

**Workflow:**

Same as briefs 027/028. Pull the cluster member list, query
`find_shape_templates` per target, clone the highest-similarity
matched `.c`, adapt literals, byte-compare. 15-shape-template cap.

**Scope / non-scope / verification gate:** identical to brief 028.

**Success:**

- Lower bound: ≥40% of the chosen cluster's unmatched count
  matched. Higher counts exceed expectations and continue the
  brief-027/028 trend.
- All matches verified locally + `pr-tier-delta` green.
- PR body documents:
  - Selection-rule trace (which candidate you picked + why).
  - Per-shape template table.
  - Dropped-with-reason list.
  - One-line note on whether the new tool's leverage scales
    differently with ratio than briefs 027/028 suggested.

**Branch:** `decomper/cluster-prop-<addr>` where `<addr>` is the
8-hex address of the chosen anchor (e.g.
`decomper/cluster-prop-02001d84` if the default suggestion wins).

**After this brief lands:**

1. Brain refreshes state.md + cluster yield track record.
2. If yield ≥ 50%, brain queues brief 030 on the next remaining
   MED candidate (likely rank #8 if #029 took rank #2, or
   vice-versa).
3. If yield ≤ 30%, brain re-evaluates whether MED 37% predictions
   are over-pessimistic with the new tool — possibly queue cloud
   research.

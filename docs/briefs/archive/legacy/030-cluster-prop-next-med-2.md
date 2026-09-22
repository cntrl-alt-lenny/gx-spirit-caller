### decomper/cluster-prop-next-med-2

**Goal:** Continue the brief-029 cluster-pilot wave. Same selection
rule (MED ≥37%, matched ≥10, prefer template ratio); brief 029's
anchor drained, ranking reshuffled. Pick the strongest-template-
ratio remaining MED candidate.

**Selection rule (identical to brief 029):**

1. Run `python tools/find_pattern_clusters.py --version eur --top 8`.
2. Pick the highest-ratio MED ≥37% candidate with matched ≥10
   that is NOT one of the brief-022/024/027/028/029 already-piloted
   anchors (they're showing as residual stragglers).

**Probable winners as of 2026-05-07 night** (post-brief-029 cluster
ranking — verify when you start):

- **rank #7 `func_02001e84`** — size 0x10, sig 0, **42 matched /
  14 unmatched**, 3.0 ratio, MED 37%. **Default suggestion**.
  Strongest template confidence in eligible candidates; small pool
  but per the brief-027/028/029 trend, MED predictions over-
  deliver.
- rank #5 `func_0201397c` — size 0x1c, sig 0, 28 matched / 17
  unmatched, 1.65 ratio, MED 37%. Good fallback if 02001e84 turns
  out unworkable.
- rank #1 `func_02033f10` — size 0x18, sig 0, 16 matched / 31
  unmatched, 0.52 ratio, MED 37%. Largest pool; lowest ratio of
  the eligibles.

**Workflow:** Same as briefs 027/028/029. find_shape_templates per
target, clone matched-elsewhere `.c`, adapt literals, byte-compare.
15-shape-template cap (briefs 028/029 went 18 / 16 — overshoot by
1-3 is fine).

**Scope / non-scope / verification gate / success:** Identical to
brief 029. Target ≥40% yield on the chosen pool; brief-027/028/029
trend suggests 60-100% likely.

**Branch:** `decomper/cluster-prop-<addr>` where `<addr>` is the
8-hex address of the chosen anchor.

## Self-extend clause (extends brief 029's pattern)

After this brief lands, decomper may file follow-up cluster pilots
using the same selection rule without a fresh brain brief. Branch
each as `decomper/cluster-prop-<addr>`. The prior brief-024
self-extend constraints apply:

- One cluster per PR.
- Stop after **two** self-extended PRs in a row, or whenever the
  cluster ranking visibly shifts enough that brain re-scoping
  would help (e.g. all eligible candidates drained, or a new
  HIGH appears).
- If a chosen anchor turns out to need >18 shape templates, ping
  brain — that's a signal the cluster is much harder than the
  rule predicts.

If self-extend works smoothly across briefs 030 → 032, brain
codifies the pattern in AGENTS.md so future brain refreshes don't
need to write near-identical briefs every round.

**After this brief (and its self-extends) land:**

1. Brain refreshes state.md + cluster yield track record.
2. Brain decides whether self-extend graduates to AGENTS.md text
   or stays per-brief based on how the cluster ranking evolves.

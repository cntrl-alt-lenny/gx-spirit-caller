### cloud/ov006-tooling-followup (CONTINGENT on brief 023)

**Status:** Pre-queued, contingent on brief 023's research findings.
This brief becomes actionable only if brief 023's
`docs/research/ov006-cluster-stuck.md` recommends a concrete
tooling change. If brief 023 concludes the ov006 clusters are
codegen-resistant (mwcc-can't-reproduce-from-C territory) without a
tooling angle, this brief is closed unscoped and the work shifts
to a decomper brief on the cluster's actual shape distribution.

**Goal:** Implement whatever tooling change brief 023 recommends.
Three plausible recommendations are scoped below; cloud picks the
one that matches the research note when this brief becomes
actionable.

**Scope variant A — finer fingerprint dimension**

If brief 023 finds the ov006 clusters are heterogeneous (multiple
distinct shapes hiding under one `(size, sig_len)` bucket, similar
to brief 020's func_02006164 discovery but more extreme):

- Extend `tools/find_pattern_clusters.py`'s fingerprint with a
  third dimension. Specific options brief 023 might recommend:
  - Instruction-shape histogram (opcode-class sequence at function
    head).
  - First-N-bytes fingerprint with registers/immediates masked.
  - Reloc-context tuple (position-in-function + opcode it lands
    inside).
- Default-on but opt-out via flag, so existing cluster decisions
  aren't invalidated.
- Test: ov006_021c81a4 cluster splits into multiple smaller
  clusters with sharper yield predictions.
- File: `tools/find_pattern_clusters.py`, plus
  `tests/test_find_pattern_clusters.py` extension.

**Scope variant B — yield-prediction recalibration**

If brief 023 finds the predicted yield is misleading (e.g. the 20%
LOW prediction for `func_ov006_021c81a4` actually understates the
real ceiling, but the prediction depresses both decomper effort
*and* `propagate_template`'s sibling-matching aggressiveness):

- Extend the yield prediction in `tools/find_pattern_clusters.py`
  to factor in additional signals brief 023 surfaces (sibling-
  arity? reloc-target-density? something else).
- Update `predicted_yield` + HIGH/MED/LOW labels (PR #278's
  output) accordingly.
- Test: ov006_021c81a4 prediction shifts in the direction brief
  023 argues for, with documented reasoning.

**Scope variant C — sibling-arity hint for propagate_template**

If brief 023 finds the propagation step itself is dropping
candidates (e.g. siblings have a different arity than the anchor
and `propagate_template` doesn't try to reconcile):

- Extend `tools/propagate_template.py` with an arity-aware mode
  that detects per-sibling argument count from disassembly and
  emits prototypes accordingly.
- Test: rerun `propagate_template apply` on the ov006 cluster
  and observe more siblings reach the build phase (independent of
  whether they then byte-match).
- File: `tools/propagate_template.py`, plus tests.

**Non-scope (regardless of which variant):**

- ❌ Any `src/` change. Tools-only.
- ❌ Replacing the existing fingerprint outright; add the new
  signal as an additional dimension or `--strict-shape` opt-in.
- ❌ Touching `AGENTS.md`, `docs/state.md`, anything outside
  `tools/` + `tests/` + `docs/research/`.

**Success (regardless of which variant):**

- Brief 023's research note's main hypothesis is testable in the
  refreshed cluster ranking and shows the predicted change.
- Existing tests still pass; new tests cover the added behaviour.
- Full test suite green; CI clean.
- PR body documents:
  - Which scope variant was implemented and why.
  - Before/after cluster output for the ov006 anchors.
  - Tier-delta and worklist-diff impact.

**Branch:** `cloud/ov006-tooling-<a|b|c>` (pick the letter
matching the variant; e.g. `cloud/ov006-tooling-fingerprint` if
variant A).

**After this brief lands:**

1. Brain queues a *new* decomper brief on the ov006 anchors using
   the refreshed yield prediction / cluster split / propagation
   reach.
2. State.md gets a "Direction shift" entry documenting how the
   ov006 stuck-cluster problem resolved.

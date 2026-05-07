### cloud/ov006-cluster-investigation

**Goal:** Diagnose why two ov006 clusters
(`func_ov006_021c81a4`, `func_ov006_021b7ce0`) have stayed stuck at
the top of the unmatched-cluster ranking across multiple wave passes
and cluster-tooling iterations. Land a research note + tooling
hypothesis under `docs/research/`.

**Context:**

Across the post-#243 cluster pipeline (brief 015 → 016 → 017 → 020,
PRs #235, #241, #247, #297), the top of the unmatched-pool ranking
has been:

| Pre-#293 | Post-#293 | Post-#297 |
|---|---|---|
| `func_ov006_021c81a4` (44, LOW 20%) | same (44, LOW 20%) | same (44, LOW 20%) |
| `func_ov006_021b7ce0` (34, MED 61%) | same (34, MED 61%) | same (34, MED 61%) |

Both clusters resist propagation despite multiple waves landing
across other clusters. They keep their unmatched count and yield
prediction across every iteration. That's a signal: either the
predicted yield is wrong (in which case decomper effort there is
mis-budgeted), or there's a fingerprint dimension or sibling-arity
hint missing that would let `propagate_template` actually unlock
them.

The decomper's brief 016 PR body and brief 020 PR body's reg-alloc
notes are the closest existing diagnostics — both touch on shapes
that mwcc won't reproduce from natural C. ov006 may be dominated by
that class.

**Scope:**

- Pull the per-cluster member lists for both anchors:

  ```
  python tools/find_pattern_clusters.py --version eur ov006 0x021c81a4
  python tools/find_pattern_clusters.py --version eur ov006 0x021b7ce0
  ```

- Disassemble each anchor + a representative sample of unmatched
  siblings (`./dsd dis ...`, or whatever the current invocation
  is). Document what shape(s) the cluster actually contains.
- Compare against brief 020's heterogeneous-cluster experience —
  is this another case where one fingerprint hides 10+ distinct
  shapes, or is it a single shape that mwcc can't be coaxed into
  producing from C?
- Land the analysis as `docs/research/ov006-cluster-stuck.md`,
  matching the format of `docs/research/hard-tier-clustering.md`
  (brief 020's prior-art parallel).
- If a tooling improvement falls out of the analysis (new
  fingerprint dimension, sibling-arity heuristic, …), append a
  one-paragraph proposal section. Don't ship the tool itself in
  this brief — that's a follow-up if brain agrees.

**Non-scope:**

- ❌ Implementing any new tooling. Research-only. If the analysis
  surfaces a tool, brain queues a separate cloud brief for it.
- ❌ Matching any of the ov006 functions yourself. That's still
  decomper territory; the cluster is a current pilot candidate
  *if* this brief's analysis says it's tractable.
- ❌ Touching `src/`, `config/`, `libs/`, `include/`,
  `AGENTS.md`, `docs/state.md`.

**Success:**

- `docs/research/ov006-cluster-stuck.md` exists, organised
  along the same lines as `docs/research/hard-tier-clustering
  .md` and `docs/research/medium-tier-plateau.md`:
  - Quick exec summary (1 paragraph).
  - The two clusters' anchor disassemblies side by side.
  - 3–5 sample unmatched siblings, disassembled, with shape
    classification.
  - Diagnosis: heterogeneous-cluster vs codegen-resistant vs
    something else.
  - Optional: a recommended tooling change with rough scope.
- Brain reads it, decides: queue a decomper brief on this cluster
  with an updated yield band, or queue a follow-up cloud tooling
  brief, or shelve.

**Branch:** `cloud/ov006-cluster-investigation`

**After this brief lands:**

1. Brain reads the research note, decides which of:
   (a) Queue a decomper pilot on one or both clusters with the
       updated shape understanding.
   (b) Queue a follow-up cloud brief implementing the tooling
       change the research recommends.
   (c) Mark the clusters out-of-scope until a different angle
       appears.
2. State.md gets an entry under "Direction shift" or equivalent
   if (b) or (c).

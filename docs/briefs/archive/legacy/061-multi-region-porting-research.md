### cloud/multi-region-porting-research

**Goal:** Research brief — survey the EUR ↔ USA ↔ JPN function
correspondence space and prototype a `tools/find_region_siblings.py`
correspondence-finder. Report a feasibility verdict: what fraction
of EUR matches can mechanically port to USA and JPN, and what
heuristics surface the right cross-region pairings reliably.

**Context:**

EUR is at **1.45%** matched, USA and JPN are both at **0%** (no
`config/` bootstrapping). All three are the same game's runtime +
game logic with translation-string and language-branch differences;
the binary code is presumed largely shared.

Today there is no tooling to pair an EUR function with its USA / JPN
twin. Decomper works EUR-only because that's the only region with
`config/eur/` infrastructure. Every EUR match is therefore a 1×
match instead of a potential 3× match.

**The math motivating this brief:**

If even 30-50% of EUR matches port cleanly to USA + JPN, that's
~800-1300 free cross-region matches at a stroke. The per-wave
multiplier on future decomper work then becomes 1× → 1×–3×. The
worst plausible outcome (10% port rate due to region-drift) still
unlocks hundreds of free matches and validates the infrastructure
for future incremental adds.

If the cross-region drift turns out to be deep — language branches
diverging the binary in ways that prevent mechanical porting — this
brief tells us so before we invest in a full implementation. That
verdict alone is worth the brief.

**Method (per brief 048 / 050 / 054 research pattern):**

This brief is research + small-prototype, not full-pipeline build.
The output is a verdict + a working correspondence-finder; if the
verdict is positive, a follow-up *implementation* brief queues the
porting pipeline.

1. **Bootstrap USA + JPN config** (one-off, brain-host work cloud
   defers): `dsd init --allow-unknown-function-calls` against
   `extract/usa/config.yaml` and `extract/jpn/config.yaml`, parallel
   to the existing `config/eur/` setup. **Cloud does not need to
   run this** — cloud works from EUR symbol tables alone if USA/JPN
   bootstrapping isn't already done. Brain runs the bootstrap if
   needed before merging this brief's output.

2. **Correspondence-finder heuristics survey.** For each
   already-matched EUR function (~1300 candidates across all tiers),
   compute the following fingerprints from `config/eur/`:
   - `size` (delinks.txt range)
   - `reloc_signature` (sorted reloc kinds per offset)
   - `callee_set` (resolved BL targets via symbols.txt)
   - `string_pool_refs` (any pool literals referencing rodata
     strings)

   Then sweep `config/usa/**/symbols.txt` (or, if USA isn't
   bootstrapped yet, sweep dsd's analysis output / raw symbol
   tables from the extracted ROM) for candidate USA siblings under
   each fingerprint metric. Rank by combined-fingerprint
   confidence. Same pass for JPN.

3. **Sample validation — manual cross-check.** For ~20 randomly-
   sampled EUR matches across tiers (trivial / easy / sinit /
   named / medium / hard), report:
   - HIGH-confidence candidates (exact fingerprint match)
   - MEDIUM-confidence (most fingerprints match)
   - LOW / NO candidates (region drift suspected)

   For the HIGH-confidence subset, manually check 3-5 by
   disassembling the USA / JPN candidate and comparing against the
   EUR matched `.c`. The goal isn't to *prove* the port works yet
   — just to validate that the fingerprint is selecting genuine
   cross-region siblings vs accidental same-size collisions.

4. **Feasibility verdict + prototype.** Output:
   - `docs/research/multi-region-feasibility.md` — what fraction
     of EUR matches surface a HIGH-confidence USA + JPN candidate.
     Histograms by tier. Sample-validated hit rate. Estimated
     ceiling for mechanical porting (e.g. "70% of trivial, 50% of
     easy, 30% of hard").
   - `tools/find_region_siblings.py` — prototype tool that takes
     an EUR symbol name and prints HIGH/MEDIUM/LOW candidates for
     USA + JPN. Output format matches the rest of the
     `find_pattern_clusters.py` / `find_shape_templates.py`
     toolchain.
   - **Recommendation to brain:** GO / NO-GO / GO-WITH-CAVEATS on
     a full implementation brief.

**Non-scope:**

- ❌ Building the full porting pipeline (`tools/port_to_region.py`,
  cross-region delinks.txt management, build-graph integration) —
  that's the next brief if this one returns GO.
- ❌ Bootstrapping `config/usa/` or `config/jpn/` — brain runs `dsd
  init` for those out-of-band if needed.
- ❌ Modifying `configure.py` for cross-region builds.
- ❌ src/, libs/, AGENTS.md, state.md edits.

**Success:**

- Feasibility verdict shipped with concrete percentage estimates
  per tier.
- `tools/find_region_siblings.py` prototype works on a sample of
  10+ EUR functions and returns plausible USA + JPN candidates.
- Manual cross-check of 3-5 HIGH-confidence pairings confirms the
  fingerprint isn't selecting accidental same-size collisions.
- Markdown lint clean; `tools-index` regen current.

**Branch:** `cloud/multi-region-porting-research`

**Priority:** HIGH — biggest potential lever in the toolchain
right now. Brief 060 is unblocking decomper for the current
hard-tier work; this brief unblocks two entire regions' badges.

**After this brief lands:**

1. If verdict = GO → brain queues a follow-up cloud implementation
   brief for `tools/port_to_region.py` + the build-graph + dsd-init
   side. Decomper subsequently runs bulk-port waves to ship
   hundreds of free cross-region matches.
2. If verdict = NO-GO → brain marks the cross-region pursuit
   deferred in `state.md` and pivots back to single-region
   incremental work. The feasibility doc is still valuable as the
   archaeology record.
3. If verdict = GO-WITH-CAVEATS → brain scopes a narrower
   implementation brief targeting only the high-confidence tier
   (e.g. "port trivial + sinit + named only; defer easy/medium/
   hard pending more research").

### decomper/hard-tier-pilot

**Goal:** First hard-tier pilot. Pick 6–10 small hard-tier candidates
(size ≤ 0x20) and match them. Validates whether the dual-compiler
infrastructure (briefs 037/045) + codegen-walls reference + the
3-tier discriminator generalise to the much larger remaining pool.

**Context:**

Brief 046's three-PR self-extend chain (waves 5/6/7) drained
medium tier from 64.7% → 80.1% (+25 matches). Brief 046 wave 7's
PR body explicitly recommended a hard-tier pivot: "Eligible
medium-tier candidates are drained or parked on documented walls."

Current state:
- Easy: 81.7% (203 unmatched, mostly small leaves)
- Medium: 80.1% (31 unmatched, mostly walls — see briefs 042/046)
- **Hard: 1.1% (8262 unmatched, mostly bigger functions)**

Hard tier is the bulk of the remaining work by bytes. By function-
count percentage it dwarfs the others. By byte-count percentage
(what the badge measures), almost all unmatched code lives here —
that's why the badge is at 1.18% despite easy/medium being 80%+.

Brief 044's research already identified **416 sp3-unique candidates
in hard tier** as future leverage. This brief is the first wave
that consumes them, plus picks low-hanging non-sp3 candidates.

**Targets:**

Pull from `python tools/next_targets.py --version eur`'s `hard`
section. Filter:

- **Size ≤ 0x20** (32 bytes / 8 instructions). Small enough that
  shape inference from disassembly is fast.
- **Skip "none of callees named"** functions if the unnamed
  callees are themselves unmatched — those force a recursive
  match. Pick only ones whose callees are external/known
  (BIOS thunks, library-symbol-named-by-dsd, etc.).
- **Mix routing tiers** per disassembly:
  - Style A epilogue (sub-sp + bx lr) → `.legacy.c` (sp2p3)
  - Style A epilogue (sub-sp + ldmia {pc}) → `.legacy_sp3.c`
  - r3-spill push → default `.c` (sp1p5)

**Workflow:**

Standard. find_shape_templates per target — the sp1p5+sp2p3+sp3
matched corpus is now ~250 functions, so shape-clone hits should
start compounding.

**Scope:**

- Match 6–10 hard-tier functions across all three tiers.
- Standard rename / verification gate: `ninja rom`,
  `dsd check modules` 24/27, `check_match_invariants` no new
  error categories, `pr-tier-delta` matches +N count.

**Non-scope:**

- ❌ Re-attempting the 4 brief-046 walled medium-tier targets
  (push-r0 idiom; brief 048 territory).
- ❌ Hard-tier candidates that require recursively matching their
  unmatched callees first. That class needs cluster-style
  propagation, not single-function matching.
- ❌ Tools / libs / include / AGENTS.md / state.md / docs/research
  edits.

**Success:**

- ≥ 6 byte-identical hard-tier matches.
- All matches verified locally + `pr-tier-delta` green.
- PR body documents:
  - Per-target shape (one-line C-equivalent).
  - Routing tier picked + why (use brief 044's discriminator).
  - Drops if any with codegen-walls bucket attribution.
  - Read on whether hard tier feels qualitatively different from
    medium — useful signal for brief 049+ scope. Specifically:
    * Are dropped targets dropping for the same reasons as
      medium-tier walls, or new patterns?
    * Are the size-0x10 candidates trivial (e.g. simple thunks)
      or complex enough that 0x20 might be a better cap?

**Branch:** `decomper/hard-tier-pilot`

## Self-extend clause

If yield ≥ 50% (≥ 3 of 6+ matched), decomper may file up to **2**
follow-up hard-tier waves without a fresh brain brief. Same
selection rule. Stop after 2 self-extends OR if a new systemic
wall appears OR if the eligible-pool needs a different filter
(e.g. size cap raised or recursive-callee handling).

If yield < 50% on this first pilot, ping brain — hard tier may
need a different approach (cluster propagation? smaller initial
size cap? different module focus?).

**After this brief lands:**

1. Brain refreshes state.md with the first hard-tier yield datum.
2. If yield is strong, brain queues more aggressive hard-tier
   waves. Hard tier has the byte-count-leverage to move the
   project's badge meaningfully.
3. Cluster pipeline may re-open if hard-tier candidates form
   propagatable shapes — `find_pattern_clusters` should be re-run
   focused on hard tier.

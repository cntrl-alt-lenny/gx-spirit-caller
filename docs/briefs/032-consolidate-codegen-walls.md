### cloud/consolidate-codegen-walls

**Goal:** Consolidate the cumulative reg-alloc / mwcc-codegen notes
from briefs 020, 022, 028, 029, 030, 031 PR bodies into a single
research note `docs/research/codegen-walls.md`. Permanent reference
for future decomper sessions hitting the same walls — saves
re-discovering each pattern.

**Context:**

The cluster pilot pipeline has accumulated a stack of partial-match
diagnostics across the last six PRs. Each PR body has documented
specific mwcc-vs-baserom codegen mismatches that the decomper
couldn't coerce around within the brief's budget. Examples
(non-exhaustive):

- **Pre-incremented unsigned char counter** (brief 020): mwcc
  inserts a defensive `and r0, #0xff` zero-extension that target
  ROM doesn't.
- **Predicated-execution conditional store** (brief 020): emerges
  from `if (cond) { side; a = b; } return a;` rather than the
  early-return shape.
- **Volatile-prevented CSE for self-copy** (brief 020): mwcc
  optimises `x = x` away unless source field is `volatile`.
- **stmia/ldmia fusion conditions** (brief 022): fires on
  consecutive struct-field writes/reads at offsets 0+4 with the
  source register overwritten in the same load.
- **Local-cached pointer + global-reload pattern** (brief 022):
  emits one re-read of the global, cleaner than `volatile` (which
  forces two reads).
- **byte-bool tst-vs-lsl/lsr** (brief 028): mwcc emits
  `tst r0, #0xff` but target uses `lsl 24 / lsrs 24 / moveq /
  movne` — same semantics, target version one fewer instruction.
- **r2-vs-r3 scratch register choice** (brief 031): mwcc allocates
  `r2` as scratch but target ROM uses `r3`. Both valid; only the
  byte-encoded register field differs.
- **Pool-load vs `add #imm` chain for constants** (brief 031):
  mwcc emits `ldr` from pool word; target builds `0x7000400` via
  two `add #imm` instructions.
- **ldmib fusion mismatch** (brief 031): mwcc fuses
  `ldmib r2, {r0, r2}` (1 instruction, 2 loads) where target
  emits 2 separate loads.

These patterns will keep biting future cluster pilots. Brief 031's
22% yield was dominated by 2-3 of them (r2-vs-r3 + pool-vs-add-imm
+ ldmib fusion); the previous 60-100% yields don't mean those
clusters were free of the patterns, just that the patterns were
absent or coercible at lower density.

**Scope:**

- Read the PR bodies for #297 (brief 020), #301 (brief 022), #309
  (brief 028), #311 (brief 029), #313 (brief 030), #315 (brief
  031). Pull every reg-alloc / codegen pattern documented as
  "dropped" or "carryover" or in the brief's reg-alloc notes
  section.
- Land the consolidated note as
  [`docs/research/codegen-walls.md`](docs/research/codegen-walls.md).
  Same format as `docs/research/ov006-cluster-stuck.md` /
  `hard-tier-clustering.md` / `medium-tier-plateau.md`:
  - Quick exec summary (1 paragraph).
  - Method (which PR bodies were sourced + how patterns were
    classified).
  - Per-pattern entries: name, target asm shape, mwcc-emitted
    asm shape, the C source variation that *did* coerce it (when
    known), the C source variations that *didn't*, and a one-
    line "use when" hint for future decomper.
  - Optional: rough quantification — how many dropped matches
    across the wave came from each pattern? (Useful for prioritising
    which walls are worth a tooling angle vs accepted as permanent.)
- Optional: one-paragraph proposal section if any pattern looks
  tooling-tractable (e.g. could `propagate_template` emit a
  `volatile`-cast variant when source-CSE collapses the load?).
  Don't ship the tool itself — that's a follow-up brief.

**Non-scope:**

- ❌ Implementing any new tooling. Research-only.
- ❌ Fixing dropped matches retrospectively. The 7 dropped from
  brief 031 are out-of-scope; they'll come back in scope only if
  a tooling change makes them tractable.
- ❌ Touching `src/`, `config/`, `libs/`, `include/`, `AGENTS.md`,
  `docs/state.md`.

**Success:**

- `docs/research/codegen-walls.md` lands and is structured for
  the decomper to grep when they hit a similar shape in a future
  brief.
- At least 8 distinct patterns documented (one per major bucket
  surfaced above; expand as the PR bodies dictate).
- PR body summarises which patterns are "permanent" (codegen-
  inherent, no coercion known) vs "coercible-with-knowledge"
  (specific C variation works) vs "tooling-tractable" (proposed
  for follow-up).

**Branch:** `cloud/consolidate-codegen-walls`

**Priority:** Medium. Useful before the next round of cluster
pilots but not blocking — decomper can keep working from PR-body
notes meanwhile.

**After this brief lands:**

1. Brain queues a follow-up brief if the research surfaces a
   specific tooling-tractable pattern with a clear scope.
2. Future cluster-pilot briefs can point decomper at
   `docs/research/codegen-walls.md` instead of repeating the
   reg-alloc carryover notes inline.

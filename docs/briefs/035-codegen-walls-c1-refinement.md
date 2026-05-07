### cloud/codegen-walls-c1-refinement

**Goal:** Update `docs/research/codegen-walls.md`'s C-1 entry
(predicated execution) with the refinement decomper proposed in
brief 033's PR (#320). Small docs-only patch.

**Context:**

Brief 033's PR body (linked from
[`docs/briefs/033-cluster-prop-final-med.md`](033-cluster-prop-final-med.md))
spotted that codegen-walls C-1 ("Predicated-execution: pure
pred-exec vs early-return") doesn't fully capture the trigger.
The doc currently says C-1 is coercible via the "if (cond) { side;
a = b; } return a;" shape. Brief 033 found this **only fires when
the if-body has ≤3 ARM instructions**:

- **Matched** with predication: brief 022 `func_02054ea8` (3
  predicated ops), brief 022 `func_02052798/b8/d8/f8` (3
  predicated ops).
- **Dropped** with `bxXX lr` early-return:
  - `func_02067b8c` (4-op if-body)
  - `func_0207f8f8` (4-op if-body)
  - `func_02087d10` (4-op if-body)

mwcc switches from predicated execution to early-return + branch
once the if-body crosses 4 ARM instructions, regardless of which C
phrasing is used.

**Scope:**

- Update C-1 in `docs/research/codegen-walls.md`:
  - Add a "**ARM-op limit:**" subsection to C-1 documenting the
    ≤3 ARM-op trigger.
  - Update the "use when" hint accordingly (something like:
    "Predicated execution available only when the if-body
    expands to ≤3 ARM instructions in mwcc output. Above that,
    mwcc emits a real branch and there is no known coercion.")
  - Move the 4+ op variants of C-1 from coercible-with-knowledge
    to permanent (P-bucket) — the doc's quantification table
    should reflect that ~3-4 future drops are now "permanent"
    rather than "coercible-but-missed".
- Optional: bullet under C-1's worked example showing the
  matched-vs-dropped pattern table from brief 033's PR.

**Non-scope:**

- ❌ Any other change to codegen-walls.md beyond the C-1 entry +
  the bucket-quantification table update.
- ❌ src/, tools/, libs/, include/, AGENTS.md, state.md.
- ❌ Investigating whether the ≤3-op limit can be raised by
  mwcc compiler flags or different C phrasings (separate
  research if it's interesting).

**Success:**

- Future cluster pilots that grep C-1 and have a 4+-op if-body
  immediately know the early-return is permanent (saves the
  ~4-5 iterations brief 033 burned discovering this).
- Markdown lint clean (please run locally before pushing —
  brief 032's PR shipped 30+ MD031 violations brain had to
  auto-fix).

**Branch:** `cloud/codegen-walls-c1-refinement`

**Priority:** Low. Useful for future cluster pilots if/when brain
queues another cluster brief; not blocking medium-tier work
(brief 034) at all.

**After this brief lands:**

1. Brain notes the refinement in state.md.
2. Future brief authors point cluster-pilot decomper sessions at
   the updated C-1 entry.

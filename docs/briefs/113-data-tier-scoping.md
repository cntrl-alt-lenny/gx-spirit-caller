### cloud/data-tier-scoping

**Goal:** SCOPING brief for data-tier matching. The
data-tier has been at 0% across the entire session and
has been queued as a backlog item since brief 097's
hand-back. With the function-tier walls-research
pipeline mature (3 P-N → C-N promotions, 30 coercible
entries) and the cross-region tooling chain complete
(brief 094 → 095 → 110), data-tier is now the biggest
unrealized lever in the project. **Brief 113 does NOT
attempt data-tier matching** — it scopes what that
work would entail and outputs a future brief plan.

**Context — why data-tier is the next major lever:**

Per AGENTS.md and brief 097's hand-back framing, the
function-tier matching pipeline reached natural drain
multiple times this session (cap-raise, cross-region,
medium-tier follow-on, walls-research). Each cycle
produced meaningful but smaller-per-round yields. The
walls-research pipeline keeps the function-tier
productive but won't scale beyond ~10-30 ports per
round. **Data-tier represents an entirely new pool**:

- Currently `dsd check modules` reports 24/27 OK at the
  function-tier — DTCM, ARM9 main, overlay 4 are the
  3 failing modules. Data-tier completeness affects
  these.
- ARM9 main alone has thousands of unmatched data
  symbols (`.bss`, `.rodata`, `.data` sections).
- Cross-region apply for data-tier is its own
  unblock — once we have EUR data matches, brief 095
  D3's data-shift consensus already handles the
  cross-region resolution.

**Brief 113 deliverables (RESEARCH + SCOPING ONLY):**

1. **Define data-tier matching semantics.**
   - What counts as "matched" for `.bss` / `.rodata` /
     `.data` / jump tables?
   - How does `dsd` track data-symbol byte-identity vs
     just symbol-name resolution?
   - What's the equivalent of `objdiff` for data
     sections?

2. **Inventory existing tooling.**
   - Does `dsd report` track data-tier match rates?
   - Does `tools/progress.py` distinguish function-tier
     vs data-tier match counts?
   - What CI checks (`match-invariants`, `pr-tier-
     delta`) already differentiate?
   - Gaps: identify what tooling is missing that an
     application brief would need.

3. **Identify candidate pool size.**
   - Enumerate unmatched data symbols by module.
   - Cluster by shape: scalar constants, struct
     literals, string tables, jump tables, function-
     pointer tables, MMIO base constants, etc.
   - Per-cluster: how big is the pool, and what's the
     expected difficulty (trivial scalar vs complex
     jump table)?

4. **Workflow design.**
   - Per-cluster: who owns what step?
     - **Cloud research**: identify the cluster's
       canonical recipe (similar to walls-research).
     - **Decomper application**: write the data
       declaration in C, add symbols.txt entry, verify
       byte-identical.
   - Are there clusters where current tooling is
     insufficient (need new tooling brief)?

5. **Output: future brief plan.**
   - Brief 114-or-115 candidate: data-tier wave 1
     (smallest-cluster, simplest pool). Like brief 081
     was the first single-region hard-tier cap-raise
     wave — pick the easiest slice first to calibrate.
   - Brief 116+: subsequent waves per cluster.
   - Tooling-brief candidates: if any tooling gap is a
     hard blocker for cluster N, brief 117-or-similar
     scopes it.

6. **Risk assessment.**
   - What's the expected per-round yield vs function-
     tier?
   - Are there walls of data-tier matching analogous to
     codegen walls (e.g., compiler-introduced padding,
     section-ordering preferences)?
   - Cross-project pipeline: do data-tier matches
     accumulate cross-project (pokediamond /
     pokeheartgold) the way function-tier did, or are
     they project-specific?

**Method:**

- Read `dsd` source for data-tier handling.
- Inventory `config/eur/arm9/` for existing data-tier
  config files (`relocs.txt`, `symbols.txt` data
  entries, etc.).
- Spot-check 5-10 unmatched data symbols across
  different clusters to characterize difficulty.
- Cross-reference dqix (primary template per CLAUDE.md)
  for data-tier conventions.

**Non-scope:**

- ❌ Actually writing data-tier matching code (that's
  brief 114+ application work).
- ❌ Tool changes (separate tooling brief if needed).
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **A clear future brief plan** for data-tier
  application waves, including:
  - Per-cluster brief outline (which cluster, expected
    pool size, workflow).
  - Tooling-gap brief outline if any.
  - Risk + leverage estimate per cluster.
- **A research note** at `docs/research/data-tier-
  scoping.md` summarizing the findings.
- Cross-reference any data-tier walls discovered
  during scoping into `codegen-walls.md` (data-tier
  walls would be a new section type).
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/data-tier-scoping`

**Priority:** MEDIUM (scoping work, not blocking near-
term yield). Decomper brief 112 (C-29 + C-30
application) is the higher-leverage immediate move.
Brief 113 outputs the strategic plan for the next
session arc (post-walls-research).

**After this brief lands:**

1. **Future brief plan defined.** Brain queues brief
   114-or-115 = data-tier wave 1 per the plan.
2. **Realistic expectations set.** If data-tier is
   actually 3-5 briefs of tooling + 5-10 briefs of
   application, the session-arc framing shifts from
   "we're near endpoint" (which we aren't) to "we're
   entering a new major phase."
3. **Cross-project leverage assessment.** If data-tier
   matches accumulate cross-project, that's a similar
   pool to brief 074's 99-port pokediamond run —
   substantial future unlock.
4. **If walls discovered during scoping are
   non-trivial:** brief 113 may itself surface 1-2
   new catalog entries (data-tier-specific walls).
   Cloud's discretion to classify.

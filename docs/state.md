# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-08-17 — **(Windows PC, brain=Opus 5; roster unchanged.)
Round 0817: the properly-powered confirmation came back NULL, and both
`main`-sweep and restock-carve reached the end of their current method.**
EUR natural-C **16.49%** (393,402 B) / USA **11.84%** (282,428 B) / JPN **11.82%**
(282,000 B) — from the regenerated state-table at the SHA below, not inherited.

All four lanes delivered: **#1502** (`cm-main-tier-sweep-7`), **#1501**
(`cm-restock-carve-8`), **#1500** (`q-shape-classifier-bicne`), **#1499**
(`q-validator-brittleness`). Both Codex lanes came back after **three missed
rounds** — the dispatch path is working again; nothing in the repo was ever wrong.

**THE HEADLINE RESULT — the callee-count selector is real but WEAK, and it did
not reproduce at full power.** Sweep-7 ran the 50/arm confirmation the previous
two rounds could not statistically support, and got a clean null:

| Round | 0-1 calls | 4+ calls | Gap | Fisher p |
|---|---|---|---|---|
| `main` (#1494) | 10/25 = 40% | 19/25 = 76% | 36 pt | 0.021 |
| `ov002` (#1497) | 6/25 = 24% | 13/25 = 52% | 28 pt | 0.079 |
| ov004/006/011 (#1502, **50/arm**) | 17/50 = 34% | 18/50 = 36% | **2 pt** | **1.0000** |
| **Pooled (200 candidates, 100/arm)** | **33/100 = 33%** | **50/100 = 50%** | **17 pt** | **0.0214** |

Read it honestly: the effect survives pooling at p=0.02, but the one round
designed to be conclusive on its own found nothing, and **the brain's correction
at merge removed the round's escape hatch.** Sweep-7 attributed the null to two
register-choice wall families landing entirely in the HIGH arm and computed that
crediting half of "21 such rows" restores a 22-point gap. Only **12 of those 21
rows are in Part 1 at all** (re-derived from the ledger's own `brief` column; the
other 9 are Part 2 rows). Half-credit gives 24/50 = 48%, **p = 0.2223 — not
significant**; only crediting every Part 1 wall row reaches 30/50 = 60%,
p = 0.0158. The wall concentration is real and one-sided, but it does not rescue
the round.

**So stop selecting on callee count and start selecting against the walls.** The
thing that actually explains this round is wall-family density, not callee count:
Part 2 (4+ calls, 200-376 B) shipped **8/50 = 16%** against a 30-50% prior, and
the same two families followed it into the larger band. New **P-51**
(changed-bool-field register reuse, 18 confirmed members) is now formal.

**Also closed this round:** the restock-carve lane declared its own method
**exhausted** — 548 B of honest headroom left inside the frozen 274-symbol census
— while sampling a **~227,820 B / ~9,690-symbol zero-reader pool** it structurally
cannot see, plus **11,592 B** reachable by merely widening the shape filter. Both
findings are the lane's own, asked for and delivered.

**NEW BRAIN FINDING — the attempts ledger is structurally park-biased.** Shipped
rows are recorded inconsistently across rounds: sweeps 1-2 recorded both results,
sweeps 3/4/5/7 recorded **parks only**, sweep-6 recorded a partial 10. `park_one.py`
is the only recorder and it records parks by design. Consequence: **any ship rate
computed from `attempts.tsv` is biased toward failure** — sweep-4 reads as 25
parked / 0 shipped when it really shipped 75/100. Sweep-7's own kickoff told the
lane to pick its Part 2 band from "~600 recorded attempts", which may be part of
why Part 2 missed so low. Queued to the Codex Scaffolder as `q-ledger-ship-coverage`.

**Also settled in the previous arc:** shape is NOT a usable selector; the
ALIGNALL(2) alignment wall is beatable by TU composition when the composed span is
4-aligned at BOTH ends; **P-50** (composed-TU declaration order collapsing to
ascending size) is PERMANENT with evidence.

✅ **The >700-line problem flagged here last round is fixed.** Rounds 0805-0810's
per-round narrative moved to
[`docs/research/brain-rounds-0805-0810.md`](research/brain-rounds-0805-0810.md);
this file is back under 400 lines and holds current state, the anchors, the
durable conventions and the open questions. Keep it that way — archive a round's
narrative once the round after it has merged.

<!-- main-sha: 4b94cbb03 -->
<!-- parked-prs: 1020 -->

## Durable conventions (lifted out of the archived round narrative)

Per-round narrative for rounds 0805-0810 now lives in
[`docs/research/brain-rounds-0805-0810.md`](research/brain-rounds-0805-0810.md).
These four conventions were buried inside it and are load-bearing, so
they stay here:

1. **The two HTML markers above are machine-checked** by
   `tools/queue_state_drift.py`. `main-sha` is the `main` commit this
   document describes — drift fires when `main` runs more than
   `_STALE_MERGE_TOLERANCE` (2) PR-merges ahead of it, so a stale handoff
   is caught even when this file makes no PR-count claim. `parked-prs` is
   the EXPLICIT parked list: parked is never inferred from GitHub's draft
   bit, because the worker lanes publish ordinary output as drafts.
2. ⚠️ **The active-PR count EXCLUDES the doc-PR carrying this update.**
   That PR is open while you write the number and merged moments later, so
   counting it makes the claim wrong on `main` the instant it lands, and
   fails `drift-check` on the NEXT PR's CI. Write the count you expect to
   be true *after* this update merges. The `main-sha` anchor has an
   explicit merge tolerance for the same reason; the PR-count claim has
   none.
3. **The canonical dispatch rule**: the brain hands over **one complete
   paste-ready message per active standing lane that needs dispatch,
   normally all four**, in the same final response — never deferred to a
   later message. `docs/agents/brain-onboarding.md` holds the canonical
   statement; `AGENTS.md` and `.claude/agents/brain.md` defer to it.
4. **Branch protection is LIVE** (ruleset `main-protection`). Required
   checks are `Python (ruff)`, `Markdown (markdownlint-cli2)` and
   `drift-check` — the only three that run on EVERY PR (`pr-invariants`
   and the compile checks are paths-filtered; requiring them would hang
   docs-only PRs). Force-push and deletion are blocked; repo-admin bypass
   keeps the brain's gated integ→main flow working. The brain's 3-region
   `ninja sha1` gate remains the real merge gate, always run locally.

## In flight (post this brain-PR)

**Active PRs: 0** once `brain/integ-0817` lands. #1502 / #1501 / #1500 / #1499 all
merged this round. **#1020** (decomp.dev CI) remains the one genuinely parked draft
and is declared in the `parked-prs` anchor above.

**All four lanes idle at hand-off, and all four queues re-seeded** — each lane
resumes with `python tools/work_queue.py next <lane>`, one PR per item. Every one of
the four items was verified to resolve on `origin/main` before dispatch, per the
standing pre-send check.

This round's four items, and why each is what it is:

| Lane | Item | Why |
|---|---|---|
| CC Decomper | `cm-main-wall-filtered-sweep-1` | Callee count is settled as far as it can be (pooled p=0.02, one full-power null). Wall-family density is what actually moves the rate — so filter on it instead of selecting on callees. |
| CC Scaffolder | `cm-restock-carve-9` | The lane proved its own method exhausted (548 B). Two successors it identified itself: the 11,592 B shape-filtered pool (cheap, same method) and a PoC on the 227,820 B zero-reader pool (needs a new method). |
| Codex Decomper | `q-park-class-normalisation` | Sweep-7 used **three different spellings for one wall family** and ~70 distinct `park_class` values appear in a single round. No wall-based selector can work until the tags are a controlled vocabulary. |
| Codex Scaffolder | `q-ledger-ship-coverage` | The park-bias finding above. Also carries the one gap the brain found in #1499: the new property test passes vacuously if `shipped_with_c_lever` is ever empty. |

## Active clusters (post-pivot reality)

**The scaffold phase is officially DONE.** Cluster work is no
longer the primary axis; the project is now grinding C source
against the curated function queue. Cluster status snapshot
retained below for handoff context but cluster-side residue is
intentionally DEFERRED per pivot discipline — if any cluster
residue actively blocks a code-decomp brief, file as a brief 190+
followup; do NOT pre-emptively grind it.

- **Cluster A** — `.rodata`. Largely drained pre-SHA1; brief 141
  closed the ov004 sweep. **DEFERRED (no remaining open work
  surfacing in code-decomp wave 1).**
- **Cluster B** — main `.data`. **FULLY CLOSED** post brief 181 +
  185 (`data_ov006_021ceae4` worked example shipped under the
  raised 4096-byte cap). Single residue: `data_ov002_022ccc2e`
  (odd-aligned size=2, no nearby 4-aligned predecessor) —
  DEFERRED.
- **Cluster C / D-1 / D-2** — ov004 sub-clusters. 73 EUR syms
  shipped pre-pivot. Brief 184 wired the cross-region apply
  subcommands (EUR dry-run smoke 1855 / region). **Cross-region
  apply at scale is DEFERRED** — would be a follow-on to brief 178
  if revived, but pivot discipline says no.
- **Cluster D-3** — nested struct arrays. **EFFECTIVELY CLOSED**
  post brief 178 + 181 (~105 chunks / ~110 KB shipped). Single
  residue: `data_020c9694` 14.8 KB mega — DEFERRED.
- **Cluster D** — `.bss`/zeros. **W7 patcher chain CLOSED for EUR**
  via brief 182 (134 → 142 → 146 → 150 → 162 → 164 → 168 → 180 →
  183 → 186 → 182). USA + JPN cross-region of brief 182's two
  claims hit a +36 B cascade exceeding `MAX_SHIFT_BYTES = 4`;
  reverted, deferred indefinitely. 34 of 35 odd-aligned ov004 data
  symbols remain unclaimed — DEFERRED.

## Code-decomp resumption (post-pivot active work)

**Canonical metric** (changed 2026-05-23 evening per brief 203
investigation): `complete_units` from `build/eur/report.json`.
Brief 199 / 202 / 203 investigation found that
`matched_code_percent` + `matched_functions` systematically
under-count `.legacy.c` + `.s` ships because objdiff requires
unrelocated-`.o` byte-identity, while our ship paths have
different reloc records than dsd's delink (post-link bytes match
— SHA1 PASS verifies). `complete_units` IS the SHA1-aligned
indicator. Full diagnosis:
[`docs/research/objdiff-fuzzy-vs-complete-metric.md`](../docs/research/objdiff-fuzzy-vs-complete-metric.md).

**Current (post #671 + #672 merge):**

| Metric | Value | Notes |
|---|---|---|
| **complete_units** | **1,749 / 2,660** | SHA1-aligned headline. 65.75 %. +46 over post-#668/#669 (1,703 baseline at last round). |
| matched_code_percent | **5.0263 %** | +0.046 pp this round — mostly `.s` ships which are headline-light but complete-units-heavy. |
| matched_functions | **1,786 / 9,801** (18.22 %) | +46 over post-#668/#669 baseline of 1,740. The brief 210 `$d → $a` chain credits `.s` ships cleanly now. |
| fuzzy_match_percent | **5.7246 %** | +0.047 pp this round |
| complete_code_percent | (per-unit) | for individual ships, 100 % means byte-identical at the linker level |
| **easy-tier matched ratio** | **92.9 %** | up from 88.7 %. 79 unmatched easy-tier picks remain, of which 39 are Wall-2-blocked (leaf-no-pool reg-alloc divergence). |

**Resumption queue:** [docs/research/code-decomp-resumption-queue.md](../docs/research/code-decomp-resumption-queue.md)
— 52 picks across trivial (12) / easy (25) / medium-easy (15).
Brief 188 is grinding the trivial bucket; brief 190+ picks up
easy + medium-easy once brief 189's wall pre-emption lands.

**Resumption playbook:** [docs/decomp-workflow.md](../docs/decomp-workflow.md)
§ "Code-decomp resumption — the post-scaffold playbook" (NEW in
brief 187). Routing decision tree, scratch flow, permuter staging,
3-region SHA1 PASS as headline gate.

## Worktree convention — isolation per agent, two equivalent mechanisms

Each agent runs in its own worktree to prevent parallel-session
interference that bit briefs 138 + 140 earlier. **AGENTS.md is the
canonical spec** (worktree-convention section there now covers both
mechanisms — updated in this brain-PR). Two mechanisms are
equivalent:

- **Mac convention (manual sibling worktrees):** `~/Dev/spirit-caller/brain`,
  `~/Dev/spirit-caller/decomper`, `~/Dev/spirit-caller/scaffolder`
  — three named siblings under one parent, set up once via `git worktree
  add`. Each has its own `orig/` baseroms. Adopted during the
  SHA1-milestone arc; PR #564 documented this in state.md.
- **Windows convention (Claude Code automatic sandboxes):** Claude
  Code creates per-session worktrees inside `.claude/worktrees/<auto-
  name>/` for each agent. No manual setup. They share the main
  checkout's `orig/` baseroms. Side-effect: `gh pr merge --delete-
  branch` may fail to clean up the local branch while the agent
  session is active — harmless, server-side merge still succeeds.

Brief 142's clean scaffolder-side work + brief 143's clean decomper-side work
were the validation that worktree separation (either mechanism) is
sufficient.

## Brain-pattern locked

- **Self-merge by default.** Brain reviews + merges autonomously per
  cntrl_alt_lenny's stated working pattern. User gets the scaffolder /
  decomper messages afterward, doesn't gate each merge.
- **PR-URL deliverable.** Every agent message MUST end with "push the
  branch, run `gh pr create`, reply with the PR URL." Brain verifies
  origin before claiming review-ready; PRs missing from origin → ask
  user to nudge the agent rather than silently waiting.
- **Verify gate is now 3-region SHA1 PASS** (was 24/27 module check
  before brief 140). For tools-only PRs that don't touch the build
  path, EUR-only SHA1 PASS is sufficient evidence.

## Next-brain TODO

**0. ✅ DECIDED 2026-08-05 (round 0805, see top): adopted the pret-style public
ladder + verdict-complete gate; rejected attainment-as-completion. Original item
kept below for the reasoning trail.** (2026-07-25, q-readable-c-done-definition)
Decide the "readable-C done" definition; ceiling model corrected, not a completion
criterion anymore. r11 found the tractable-C ceiling self-contradicting (48.03%
vs r7-14's 14-24% band); fixed with shown arithmetic (main's headroom
fraction 0.75 -> 0.10, region-wide ceiling 48.03% -> 30.19%) but
explicitly NOT reconciled to the band — see
[`docs/research/q-readable-c-done-definition-2026-07-25.md`](../docs/research/q-readable-c-done-definition-2026-07-25.md)
for why forcing an exact match would be false precision, and for the
larger still-flagged-not-fixed `FINISHABLE_HEADROOM_FRACTION` residual.
That doc gives 3 candidate "readable-C done" definitions (pret-style
public ladder / attainment=100%-of-ceiling / internal verdict-complete
gate) with a recommendation (adopt the ladder + verdict-gate together,
reject attainment as a completion criterion) — **the brain decides**
which to formally adopt. If verdict-complete is chosen, note the
freshness-cutoff nuance in that doc (key it per-lever-family off
`codegen-walls.md`'s own correction history, not one global date).

1. **Brief 234 (decomper)** — C-39 drain wave 6 + C-40 3-pick
   mechanical cleanup. Kicked off this round. (A) Continue
   C-39b-solo drain (122 picks remain after brief 232's 35).
   (B) Ship the 3 remaining brief-219 C-40 picks via brief 233's
   locked recipe (`func_0208df40`, `_0208e1ac`, `_0208e200`).
   Target: 25-35 ships, hard-tier 7.42 % → 7.7-7.9 %.
2. **Brief 235 (scaffolder)** — Three small pilots. Kicked off
   this round. (A) **C-39e sub-classification** on brief 232's
   new `movs r4, r1` null+helper-at-top sub-shape (2 known
   picks `0228b810`, `0228b850`); if ≥2 ship, classify + extend
   detector. (B) **Brief 232's 2 deferred picks**:
   `func_ov002_02295284` (double-call disjunction),
   `func_ov002_0220673c` (cross-call compare with dead-store
   artifact). (C) **Broader-C-40 corpus pilot**: brief 233 noted
   459 broader `0x04001xxx`-pool occurrences beyond the 4 strict
   C-40 picks; pilot 5 picks outside the strict signature.
3. **Brief 236 candidates** (post-234/235):
   - **C-39e drain wave** if brief 235 (A) locks.
   - **Broader-C-40 / C-42 drain wave** if brief 235 (C) locks.
   - **C-39 mega-batch wave** — combine a/b/d/e + base into one
     cross-shape uniform-batch using brief 230 + 232's variant
     tables.
   - **Permuter wave 2** on hard-tier picks — brief 198 left
     this open; brief 218 bitfield insight may help.
   - **`.s` → `.c` upgrade pass on accumulated punts** — brief
     221 + 223 + 224 + 228 + 230 + 232's deferred cohorts;
     ~100+ `.s` ships with non-permanent walls.
4. **Carryover candidates from prior rounds:**
   - **Hard-bucket pilot** (Track 2 long-form decomp). Brief 220
     is the structural prerequisite for this.
   - Brief 213's brief-201 doc correction, C-24 wall extension,
     C-15 `mvn #0` refinement, P-11 reg-alloc-hint research —
     all still available as smaller scaffolder slots.
5. **Scope brain candidates to keep ready:**
   - **C-24 wall** (predicated cascade research from brief 103):
     pending classifier upgrade, same shape as C-23/C-31/C-32/C-33
   - **Brief 197's mis-tagged C-15 prediction caveat** — `mvn #0`
     isn't always mwcc 1.2 routing; refine the C-15 predictor
   - **Decomp.me scratch upload automation** — productivity
     multiplier (brief 201's success makes this higher priority)
   - **P-11 reg-alloc-hint research** — brief 200 left this open
     as a separate brief candidate; sweep mwcc 2.0 SPs +
     optimization levels on E-12 to see if any produce orig form
   - **Brief 201's "two pool loads" correction in C-23 entry** —
     trivial doc edit (mwcc CSE'd already; the recipe still
     works but the explanation in pick #5's `.legacy.c` worked
     example is imprecise)
6. **Deferred indefinitely (per pivot discipline):**
   - `data_020c9694` 14.8 KB D-3 mega
   - `data_ov002_022ccc2e` odd-aligned size=2
   - 34 remaining odd-aligned ov004 data symbols (brief 182
     self-extend pool)
   - USA + JPN cross-region apply of brief 182's claims (+36 B
     cascade exceeds `MAX_SHIFT_BYTES = 4`)
   - Cluster C / D-1 / D-2 cross-region apply at scale (brief
     184 wired the subcommands; never run)
   - Brief 190 Cluster D (predicated saturation chains, 3-4 picks)
     — waits for a C-1 saturation recipe or permuter coverage
   - Brief 188 epilogue orphans (2 picks) — likely linker-emitted
     scaffolding or dead code
   - These items are NOT lost. If a code-decomp brief actively
     blocks on one, file the followup it deserves; otherwise
     leave them.
7. **Pre-existing carryovers (unchanged):**
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings.
   - `match-invariants` not yet a required branch-protection check.
8. **Known infrastructure state:**
   - Agent-inbox hook fix landed in PR #634 but agent sessions
     started BEFORE that PR will continue to silently fail (Claude
     Code reads `.claude/settings.json` once at session start).
     Inbox populates from next FRESH session start onward — brain
     should mention "exit your previous session" explicitly in
     kickoffs until it stops being a problem.
   - CI comment-upsert workflows hardened in PR #641 (shared
     `.github/scripts/upsert-pr-comment.sh`, REST-only, 3-retry,
     fail-soft). `pr-tier-delta` and 5 sibling workflows no longer
     fail on transient API 401s.
   - `objdiff_filter_panic_units.py` fixed to handle `.legacy.c`
     paths properly (this brain-PR). dsd emits `.o` paths; mwcc
     produces `.legacy.o` / `.legacy_sp3.o`. Filter now rewrites
     via `source_path` as the authoritative routing signal.
     **+198 matched_functions previously invisible** were the
     immediate recovery; the fix permanently closes the gap for
     all future `.legacy.c` ships.
   - **Worktree-pointer breakage from parent-dir rename** (fixed
     this brain-PR via `git worktree repair`): the parent dir was
     renamed `gx-spirit-caller-NEW` → `gx-spirit-caller` at some
     point; `decomper/.git` + `scaffolder/.git` (and the
     corresponding `brain/.git/worktrees/<slug>/gitdir`
     back-pointers) kept the stale `-NEW` paths. Symptom: agent
     worktrees can't run git commands. Fix is non-destructive —
     `git worktree repair <path>...` from the main worktree
     rewrites all four pointer files. Future brains starting on
     a renamed-parent setup should `git worktree list` and check
     for `prunable` markers before assuming agent worktrees work.
   - **Brief 212 `TestStragglerSmoke` becomes idempotent-no-op
     post-merge.** The two tests (`test_021cb574_collapses_one_trailing_a`
     + `test_021d02a4_collapses_four_trailing_a`) load `.o.resolved`
     files from a sibling decomper build and expect the rewriter to
     collapse 1 / 4 trailing `$a` markers. Pre-#668 they passed; post-
     #668 they FAIL because decomper's post-merge rebuild ran the
     rewriter in production, so the on-disk `.o.resolved` files are
     already collapsed (`trailing_promoted_collapsed: 0` on re-run).
     Not a regression — test design depends on pre-rewriter build
     state that no longer exists in normal workflows. Fix candidate
     for whichever scaffolder brief touches `patch_arm_mapping_symbols.py`
     next: either (a) check for already-collapsed shape and skip,
     (b) read pre-resolve `.o` files instead of `.o.resolved`, or
     (c) check in a fixture rather than depending on a build
     artifact.
   - `tools/permute.py` macOS workarounds folded in (PR #655):
     PEP 668 externally-managed-environment fallback auto-creates
     `.venv_permuter/` and patches `sys.path` in-process; disasm
     path resolver scans the tree-mirroring layout (`disasm/src/
     <path>/func_<addr>.s`) when the flat layout is absent.
     Brief 198's symlink workarounds no longer needed.

## Cross-machine handoff notes

User alternates brain between Windows PC and Mac. The role is tied to
the local machine (toolchain + baserom on disk), not to a specific
Claude session. State.md is the bridge. Standing conventions:

- **Working pattern:** brain reviews + merges autonomously; user
  receives the scaffolder / decomper messages afterward.
- **Verify command (Windows):** `python tools/configure.py eur &&
  ninja sha1 && python tools/configure.py usa && ninja sha1 && python
  tools/configure.py jpn && ninja sha1`. **On Mac substitute `python3.13`**
  (macOS ships no plain `python`; `/usr/bin/python3` is Apple's 3.9.6
  which lacks `match` statements — `tools/configure.py` requires 3.11+
  per CLAUDE.md). POSIX paths and `./dsd` instead of `dsd.exe`.
- **Memory per-machine:** Each side's `~/.claude/projects/...` memory
  doesn't follow. State.md is the bridge.
- **Worktrees:** see *Worktree convention* above; 3-worktree split is
  now standard.

## New agents?

No. Continuing with 4-slot setup (brain + decomper + scaffolder +
auto-progress-badge bot).

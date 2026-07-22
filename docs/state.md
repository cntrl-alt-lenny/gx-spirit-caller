# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-07-23 (Windows PC, brain=Opus; roster: 2× Codex GPT-5.6 Luna High +
2× Claude Code Sonnet 5 Max, all four on autonomous standing queues `docs/queue/*.md` —
loop-until-QUEUE-EMPTY, one PR per item). **CHAPTER: READABLE-C, post-wall-correction.**
EUR C-decompiled **8.48%** (+0.460 pp/week measured over 32 days; USA/JPN 7.20% at +0.342).
⚠️ 108 of 10,519 matched `.c` TUs contain inline asm and currently count as C — the
Natural-C vs asm-C metric split is queued (`q-natural-c-metric`). Landmark rounds this stint:
b650/654 (ov002: coercible pool drained 23 ships, remaining ~2,750 verified genuine walls),
b651 (wall classifier fixed: honest pool 6,093 candidates / 32 confirmed-permanent),
b661 (**main's 2,370-file unknown tranche = real runway, size-gated**: 0-256B tier ~35-55%
floor, 1,645 files — both CC lanes now sweeping it split by address range; recurring
epilogue-shape wall ×3 = highest-leverage single target, `cm-epilogue-wall`),
b662 (91-family census untrustworthy: tiny 8-28B exemplars are false anchors — rebuild queued).
External review (GPT-5.6 Sol) applied 2026-07-23: tooling budget + asm-void≠readable-C policy
in all queue headers; green-pytest / natural-C-split / strict tool re-audit / scorecard /
doc-archive queued. **Branch protection LIVE** (ruleset `main-protection`: required checks
Python ruff + Markdown + drift-check — the only 3 that run on EVERY PR (pr-invariants and
compile-check are paths-filtered, requiring them would hang docs-only PRs); force-push +
deletion blocked; repo-admin bypass keeps the brain's gated integ→main push flow working.
The brain's 3-region `ninja sha1` gate remains the real merge gate, always run locally.

**Previously (2026-07-18):** (M1 Mac, brain=Opus; roster: Codex Decomper + Codex Scaffolder =
GPT-5.6 Luna Medium, Claude Code Decomper + Claude Code Scaffolder = Sonnet 5 Max). **CHAPTER:
READABLE-C — and the 544 B CEILING IS BROKEN.** This round merged **#1154** (b582 probe:
`func_02037dc0` 552 B arm9 SHIPPED via real sha1, 1/3; + NEW wall class "repeated-address
rematerialization after a call" with repro; + 908 B half-crack documented), **#1153** (b583:
batch_carve tool-error verdict — infra≠verify-fail; size_census .init/ITCM fixes; **byte-true
ledger: 3-region gap 55,540 B, ov004 = 36.2%**), **#1152** (b584 green-main: ruff+markdownlint
autofixes, link test, indices), **#1151** (b585: CLOSED-LOG 32 entries, region-correct
configure errors, libs-wide delink-dupe check, `ninja` defaults to rom+sha1). Cross-PR
interaction caught in integration: b581's prune deleted a scaffold two safe-queue docs still
linked — de-linked with prune notes. **Round update (same day, second pass):** merged **#1157** (b587 Thumb-tier: 36 EUR Thumb
units restored to reports, `routing_suffixes.py` conformance, Thumb porting unblocked,
`progress.py --by-module`) + **#1155** (b588: CLOSED-LOG placeholders fixed, ruff-action
pinned; decomp.me harvest Cloudflare-blocked — honestly STOPped) on a tests-scope gate.
**#1156 (b589) closed VOID** — forked pre-merge + wrong `--min-addr` gave 0-candidate
censuses it never questioned; kickoffs now carry BASE PREFLIGHT + CANARY rules (banked in
memory). **r6 swarm resume RETIRED** — verification reassigned to b590 (agent seat, no quota
collision). Open: **b586** ceiling r2 (CC Decomper, wine, in flight). Queue: **b590** CC
Scaffolder r6-verify, **b591** Codex Scaffolder hygiene (preflight-gated), **b592** Codex
Decomper census redo (preflight + ov004 canary).

**Previously (2026-07-16):** (superseded) This round merged **#1147** (b577
main-floor autopsy — 12/14 "floor" funcs were 3 asm_escape bugs, now fixed+shipped; ~1 genuine
wall/region), **#1150** (b579 C-match sibling families), **#1149** (b580 unified readable-C
queue), **#1148** (b581 prep-scaffold prune, 473 removed). Committed-tier truth (progress.py):
units EUR 99.11 / USA 93.41 / JPN 92.79; **C-dec EUR 8.11 / USA+JPN 7.19** (the `code:` line
reads a possibly-stale local report.json — b583 fixes instrumentation). ⚠️ **Luna validation
verdict (b575/b576):** mechanical gate-protected lane = clean; hand-transcription ledger =
materially WRONG (r5 finding) → Luna gets ONLY tool-derived/checkable-output tasks now.
Queue: **b582** Sonnet-5 544B ceiling probe (WINE lane, r5 rank-1), **b583** Sonnet-5
instrumentation truth (batch_carve returncode + size_census + byte-derived ledger), **b584**
Luna green-main sweep, **b585** Luna CLOSED-LOG backfill + cold-start fixes. An **r6 R&D
swarm** (8 lanes, dual-verify) is running; report lands as a research doc next round.

**Previously (2026-07-15):** (superseded numbers — see r5's stale-metrics finding) **Re-synced after
an away stint (PC brain ran briefs 556-574).** This round: reviewed + merged the 4 waiting
PRs on one integration branch, gated by `tools/gate3.py` — **#1134** (b563, post-ov002 sweep
waves 3-10, 1,024 shipped, every wave self-gated; genuine `main` floor = 7 funcs/region
parked), **#1143** (b572, EUR floor closeout 77/77 — EUR done except 2 data blobs
`020b2d2c`/`020b3c78`), **#1142** (b574 coverage tracker), **#1141** (b573 Defender guide).
**AGENTS.md put on the Codex 32KB instruction-cap diet** (43.9KB → 31.9KB: model notes /
brain onboarding / worktree mechanism B / wine-macos moved verbatim to `docs/agents/*`;
integrity-controls section untouched) — the trigger fired because Codex is back in the
roster. Queue: **b575** Luna wave-11 ov002 mop-up (the ONE wine lane), **b576** Luna
endgame ledger (wine-free census), **b577** Sonnet `main`-floor autopsy (wine-free, b549
pattern), **b578** Sonnet EUR data-blob emitter (wine-free tool+tests).

Historical dated round log moved to [STATE-LOG.md](STATE-LOG.md) by Brief 599.

## In flight (post this brain-PR)

**Open PRs: 0** once this brain-PR lands. **Both agents idle —
no briefs in flight.** Brain to scope next-round kickoffs based
on the candidates listed in *Next-brain TODO* below.

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

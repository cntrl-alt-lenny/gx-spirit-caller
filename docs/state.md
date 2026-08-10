# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Last updated:** 2026-08-08 — **(Windows PC, brain=Opus 5; roster unchanged.) Round
0808: the biggest single-round coverage move of the campaign.**
EUR natural-C **14.56%** (347,490 B) / USA **11.84%** (282,428 B) / JPN **11.82%**
(282,000 B) — from the regenerated state-table at the SHA below, not inherited.
EUR moved **+0.28 pp in one round** (14.28% → 14.56%, +6,720 B of `.text`), plus
**+16,412 B of newly-typed data** (Typed-array 162,884 → 178,932; Named-struct
57,076 → 72,440).

<!-- main-sha: 1cee4f2c0 -->
<!-- parked-prs: 1020 -->

**Round 0808c (partial round — 3 of 4 lanes reviewed while the CC Decomper
was still sweeping).** Merged **#1467** (ledger event semantics + the
exclusion regression closed), **#1468** (producer anchoring + score
consistency) and **#1476** (carve-3: 64/64 aligned candidates, 1,348 B,
plus a **working TU-composition recipe for the ALIGNALL(2) wall**).

**The alignment wall is cracked, with a narrower precondition than first
claimed.** Pairing two adjacent 2-byte-misaligned symbols as separate named
globals of the same type, in address order, in one TU avoids the cascade —
and it is gate-covered, because the experimental pair actually shipped, so
the 3-region SHA1 PASS proves it. The brain corrected three things before
merge: the precondition is **4-alignment at BOTH ends** of the composed span
(not size alone), the recipe therefore does **not** reach `ov006`'s four
`kv_t` symbols, and **11 of the 35** misaligned candidates fail that screen
structurally. Two reconciliation cells also read 12 where the struct is 10 B
— which was the entire cause of the PR's unexplained "Named-struct 752 vs
748" note.

**#1475 (census methodology) stays open — second pass required.** The two
gaps are genuinely closed and the specific collision the item warned about
is absent (verified by probing: `cfg.unrelated = ... | 20;`, `foo(20);` and
a bare `int x = 20;` all correctly score zero for offset `0x14`). But the
new **decimal member alias is unanchored** — `_field_names_pattern` emits
`f{offset}` and the member path requires no base symbol, so `.f{decimal}`
matches on unrelated structs anywhere in the corpus. 85 of 255 fields gain
sites from it; `PerPlayerRowTable.f_0e` (alias `.f14`) has **37 of its 53
sites, 70%, on unrelated structs at offset 0x14**. That corrupts the very
ranking the item exists to protect. The research doc also claims the census
"follows the same anchoring shape as the landed `field_producer_finder.py`
rule" — untrue when written (#1468 was still an open draft), and the two
rules actually diverge exactly there: the finder is hex-only, the census
adds a decimal alias.

**Partial-round policy (adopted this round).** Do NOT hold finished lanes
for a still-running one. The deciding factor is whether a lane's gate needs
the machine: build-free lanes (Codex, `kb-map`/`kb-types`) can always be
dispatched independently; only lanes running a 3-region gate need their
windows staggered. The costs are a generated-file conflict for the
still-running lane (mechanical, resolved by regen-on-merged-tree) and stale
headline numbers in the dispatched messages (cosmetic; phrase as "as of this
dispatch").

**Merged this round:**

- **#1472 — `cm-main-tier-sweep-1`, the first main-module sweep: 71/100 shipped
  (6,720 B), all 72 files natural C, zero asm-void.** Independently recomputed:
  72 `.c` added == 72 `.s` deleted == 72 delinks activations, every address
  inside the assigned 0x02040000+ range, asm-C column unchanged at 3,904 B.
  Read the rate honestly — the worklist front-loaded a homogeneous
  pre-filtered population (100% shape=`guard chain`, 40–128 B), and that band
  was already 71.8% converted project-wide, so 71% is consistent with the band
  rather than a new campaign-wide expectation. Added C-70…C-76 and P-30…P-33.
- **#1473 — `cm-restock-carve-2`: 58/58 of main's restock-census struct
  candidates (16,412 B).** The 100% rate is genuine, not a redefinition: all 58
  main candidates are 4-aligned at both ends, and all 35 misaligned candidates
  in that census live in non-main modules, so wave 1's ALIGNALL(2) wall cannot
  fire on this scope. 45/58 symbols byte-verified against the ROM (95.7% of
  bytes; the remainder are expected pointer relocations).

**Still open — both need a second pass (see the queue):** #1467 and #1468.

**Round 0808's three process findings, all worth carrying:**

1. **`kickoff_lint`'s location guard was itself a void-work generator.** It
   accepted only the POSIX spelling, so a PowerShell lane transliterated the
   guard, Windows-ified the path to backslashes, and stopped after **17
   seconds while sitting in the correct worktree** — `git rev-parse
   --show-toplevel` always emits forward slashes on Windows. Fixed in this PR:
   the linter now accepts the PowerShell form natively AND rejects a
   backslashed EXPECT outright. The brain owns this failure, not the lane.
2. **The `attempts.tsv` batch-worktree non-recording gap reproduced exactly**
   in #1472 — a zero-line diff from all five batch worktrees. The sweep lane
   backfilled all 101 attempts by hand with sizes recomputed from `delinks.txt`
   ground truth. This is the same gap `q-ledger-event-semantics` is fixing.
3. **A gate failure was masked by a background task's own exit-code 0** (the
   code belonged to an `echo` wrapper, not `gate3.py`). Reading the log — per
   the standing warning — surfaced a real stale-`state-table` pytest failure.
   Third independent recurrence of the tee/exit-code hazard.

Those two markers are machine-checked by `tools/queue_state_drift.py`:
`main-sha` is the `main` commit this document describes (drift fires when
`main` runs more than one PR-merge ahead of it, so a stale handoff is caught
even when this file makes no PR-count claim), and `parked-prs` is the
EXPLICIT parked list — parked is never inferred from GitHub's draft bit,
because the worker lanes publish ordinary output as drafts.

**PR state — active vs merely open.** **active** count is **0** — #1479 and #1481 both merged. #1020 (decomp.dev CI) is the one genuinely parked draft. The CC Decomper's `cm-main-tier-sweep-3` is still in flight with no PR yet, so it is correctly absent.

**Round 0808d — everything else merged.** #1478 (`cm-main-tier-sweep-2`) and
PR #1475 (census methodology, second pass) both landed. EUR natural-C is now
**14.71%** (351,058 B) — up **+0.43 pp across round 0808 as a whole**
(14.28% → 14.71%).

**#1478 answered its question honestly, and found a defect in the selector.**
Pool A (guard chain) **32/50 = 64%**, Pool B (loop/other/small dispatcher)
**27/50 = 54%** — a real gap, far smaller than wave 1's 71% framing implied,
and **two of five batches had Pool B outship Pool A** with Pool B ranging
20–80%. The reason matters more than the rate: several worklist rows labelled
`guard chain` conceal non-guard-chain bodies (softfloat conversions among
them), so wave 1's "100/100 homogeneous" premise — the basis for discounting
its 71% — is itself unreliable. Both follow-ups are queued
(`cm-main-tier-sweep-3` re-derives shape at pull time;
`q-main-shape-reclassify` rebuilds the labels wholesale). The round shipped
60 functions / 3,852 B on ONE stated basis (55 natural-C + 5 mwcc `asm`
softfloat/CLZ functions, disclosed with reasons) — wave 1's mixed-basis
headline error was not repeated.

**#1475's second pass hit the specified numbers exactly**: `f_0e` 53 → 16
sites, canaries unchanged (`f_5b4` 53/54/55, `f_5d4` 31/9/38). The decimal
member alias now requires the documented base symbol on the same line; hex
and real names stay unanchored. The false "landed" coordination claim is
retracted and the divergence from `field_producer_finder.py` is now stated
deliberately (the finder is hex-only) rather than papered over.

**Two brain-caused lane stalls this round, both fixed, both worth avoiding.**
(1) The queue items were seeded in an UNMERGED bookkeeping PR while the
messages went out, so two lanes correctly reported `QUEUE-EMPTY` — merge the
seeding PR before dispatching, and verify `work_queue.py next` resolves on
`origin/main`, not on the local tree. (2) Appending a new item to the same
queue-file region a lane's branch had edited produced a merge conflict that
stopped the Codex Decomper at preflight; the brain resolved it on the lane's
branch. In both cases the lanes behaved correctly by stopping.

**#1467 second pass — the repair introduced a NEW regression.** Three of five
fixes are genuinely closed (module key now derived from the consumer's own
`_source_module`; event-level dedup; failure-safety) and all six required
regressions exist and pass. But the consumer filter added at
`wall_aware_headroom.py:280` is an **allowlist**
(`if result not in {"parked","shipped"}: continue`), which un-excludes 16
`(module, addr)` keys that `main` previously excluded — 12 of them genuine
attempts with measured percentages, including three permanent walls. That
re-dispatches already-diagnosed walls: precisely the failure class the ledger
exists to prevent, reintroduced by its own fix. Separately, three functions
that `PR#1414:2e2d2f3f` explicitly parks (`0x021b7218`, `0x021b33dc`,
`0x021b4a4c`) were relabelled `not-attempted` because the trailing
"`func_ov008_021b16f8` not attempted (time)" sentence was applied backwards
over the preceding parked list — and `0x021b7218`'s 90.5% was shifted onto
`0x021b4a4c`, so the match_pct pairing bug is not fully fixed either.

**#1468 second pass — 7 of 8 closed, empirically verified.** Base-symbol
anchoring works: the tool now resolves the base register to its `_LITn`
producer, the previously-showcased false positives are gone, the three
different-typed `cfg` locals no longer rank as BgCfg producers, and the
canary reproduces exactly (8 / 27 / 46 / 0). The one gap is cosmetic but
misleading: the `score` integer was never adjusted, so the rendered table
shows `1 | 90 | BASE-ANCHORED` above `5 | 120 | OFFSET-ONLY` — the sort is
provably anchored-first, but the score column visibly contradicts the rank.
One-line fix.

⚠️ **Convention — the active count EXCLUDES the doc-PR carrying this update.**
That PR is open while you write the number and merged moments later, so counting
it makes the claim wrong on `main` the instant it lands and fails `drift-check`
on the NEXT PR's CI. Write the count you expect to be true after this update
merges. (The `main-sha` anchor has an explicit one-merge tolerance for the same
reason; the PR-count claim has none, so it must be written post-merge-accurate.)

**#1467 and #1468 are NOT mergeable as they stand** — both were verified at
source and both have correctness defects that CI cannot see:

- **#1467** (`attempts.tsv` recorder + 387-row backfill). Four blockers.
  (a) `park_one.py::_ledger_identity` records module `overlay002` while the only
  consumer, `wall_aware_headroom.py::_source_module`, says `ov002` — so the
  structural recorder is a **no-op for every overlay function**, i.e. for the
  whole ov002 campaign it was built for. It passes today only because its single
  test uses `src/main/`, where the two spellings coincide.
  (b) `_record_attempt` dedupes on **address alone** and returns silently, but
  the ledger is an event log: main already holds 9 addresses with two rows, six
  of them re-attempts that reached a *different* verdict, and `0x021bbc68` is a
  documented park-then-ship. The PR's own backfill contains two park-then-ship
  pairs the writer it ships would refuse.
  (c) the ledger append runs **after** `_flip_delinks` and `unlink()`, so a
  header/IO failure leaves a candidate parked but unrecorded.
  (d) ~19 candidates whose source commits say "Not attempted" are recorded as
  `parked`, which would permanently hide them from `--exclude-attempted` — the
  item's own failure class, inverted.
  Its GitHub "CONFLICTING" status is spurious: `.gitattributes` carries
  `merge=union` for that file and `git merge-tree` merges it cleanly.
- **#1468** (field producer finder). The assembly masked-RMW path accepts on
  same-register + same-offset with **no base-symbol anchoring**, though the
  bulk-fill and sdk-call paths in the same function do call `_contains_symbol`.
  All 12 masked-RMW hits in its own canary are false positives — the showcased
  rank-1 site loads `_LIT0 = data_ov014_02234ff4`, a different symbol in a
  different overlay, and `02104bac` appears zero times in that file — and they
  outrank the 4 genuinely anchored hits. Its assembly test codifies the bug as
  correct. Also: a generic `cfg` alias, an offset-literal fallback where decimal
  `20` matches `0x14`, per-input hardcodes in `make_spec`, and no region filter
  (~3x count inflation from EUR/USA/JPN mirrors).

Both lanes' transcripts were read: procedure was sound (full suite run twice,
canary reconciled, handoff exact, nothing uncommitted). These are design
defects, not process failures.

**Round 0806 (dispatch).** Nothing to merge; all four lanes dispatched on the
0805 seeds. A stale uncommitted `q-recursive-glob-sweep [CLAIMED]` edit from
2026-07-29 was reverted out of `kb-types` (that item shipped as #1385).

**Round 0807 (review) — merged #1462–#1466:**

- **#1462** — `q-port-residual-fix`: root-caused the region-data lookup bug
  (`port_to_region.py` rejected semantic EUR filenames before emitting JSON),
  fixed fail-closed + collision repair, ported all 6 named residues per region
  (852 B each side). Brain fixed one ruff B023 lint-only closure to unblock it.
- **#1463** — `q-port-highconf-no-target`: honest 0-shipped + a 62-per-region
  worklist (the queue's "63" was a stale pre-#1436 census value).
- **#1464** — `cm-restock-carve-1`: 31/35 shipped, 1,960 B; 4 `kv_t` symbols
  declined on a documented mwldarm 2-byte alignment wall.
- **#1465** — `cm-field-recheck-1`: 5/5 fields verdicted, 2 refinements.
- **#1466** — `cm-ov002-unknown-sweep-17`: **42/100 shipped, 6,960 B — the
  best sweep round to date**, validating the worktree-parallel protocol at
  full scale (sweep-16's 3/12 was a scale artifact, not a yield drop).

**Verification standard applied this round:** every PR's numbers were
independently recomputed (not read from the PR body), and all four worker
transcripts were read. No dishonesty was found in any lane; every blocker was
evidence-presentation, lint, or infrastructure. Both Claude lanes then ran a
completion pass that closed all fifteen flagged gaps, including sweep-17's 58
missing `attempts.tsv` park rows and its own overstated "8 double-dispatched"
claim (the demonstrable figure is 4).

**Two infrastructure findings worth carrying forward:**

1. **GitHub Actions event-delivery gap**, ~20:47–21:20Z on 2026-08-06:
   #1462/#1463/#1464 got ZERO workflow runs (not the paths-filter trap —
   `drift-check` is deliberately unfiltered). Remedy: close/reopen the PR.
   Marking ready-for-review does NOT re-trigger, because the workflows use
   the default `pull_request` types, which exclude `ready_for_review`.
2. **Generated-file conflict cascade.** Any two same-round PRs that both
   regenerate `docs/state-table.md` or `docs/research/README.md` will conflict
   pairwise. Resolve by merging `main` into the branch in a throwaway detached
   worktree, re-running the generator on the merged tree, then full pytest —
   never by hand-resolving generated content.

**Round 0807 repair (this update).** Fixed the canonical dispatch rule: the
brain hands over **one complete paste-ready message per active standing lane
that needs dispatch, normally all four**, in the same final response.
`AGENTS.md` § end-of-round checklist and `.claude/agents/brain.md` both carried
obsolete two-lane wording ("exactly TWO kickoffs" / "two paste-ready kickoffs")
that contradicted `AGENTS.md`'s own four-session roster;
`docs/agents/brain-onboarding.md` now holds the canonical statement and the
other two defer to it. Also repaired `queue_state_drift.py` (draft ≠ parked,
plus the `main-sha` anchor above) with regressions.

**0804d round recorded here for the first time** (it post-dated this file's previous
update; the Mac brain merged it but did not get back to state.md): **#1457**
(`tools/field_exposure_census.py` — read/write-site ranking over documented fields),
**#1458** (work-queue discovery read-only by default), **#1459** (port-harvest
continuation: 0 ports, census unchanged — every remaining sim=1.0 row refused below
the HIGH/EXACT floor; 3 recurring "retryable tool-errors" from a region-data lookup
non-JSON bug, previously untracked), **#1460** (cmatch/ov002-sweep-16: 3/12 shipped at
the steady ~25% rate — the drop vs sweeps 9-15's 24-40 ships was scale [12 attempts,
single-lane], NOT yield; new **C-67** switch-vs-goto lever, single-instance; two
OBSERVED-NOT-CONFIRMED codegen-walls notes: row-pointer `mla` register-swap ×3
pending a C-63-variant sweep, post-call guard resistance ×2). Queue: sweep-16 → DONE.

**Round 0805 decisions (this update):**

1. **`q-port-harvest-complete` closed as met** — its own success criterion ("drained
   or genuinely refuse") was satisfied twice (#1456 shipped 10, #1459 shipped 0 on a
   full re-drain of 292 rows / 61,096 B). Residue re-scoped into `q-port-residual-fix`
   (the 3 tool-error ports + 2 named per-function residues) and
   `q-port-highconf-no-target` (the 63-per-region HIGH-but-no-target-file class #1436
   surfaced). Full drains are now **trigger-based** (after EUR-ship rounds) — #1459
   already paid one zero-yield drain cycle for the standing TODO.
2. **Queues re-seeded** (all four were empty or stale): CC Decomper
   `cm-ov002-unknown-sweep-17` (100 candidates, 5-worktree protocol, C-67 in the
   lever set, mla/C-63 mini-item first + near-miss re-attempts, pool pull
   cross-checked against sweeps 9-15 park docs); CC Scaffolder `cm-restock-carve-1`
   (ov006's 33 struct candidates vs ov006_core.h, then main's 58 — the 274-candidate
   restock census) + `cm-field-recheck-1` (producer/consumer lens on the most-tested
   fields ranked by field_exposure_census.py); Codex Decomper as in (1); Codex
   Scaffolder `q-attempts-ledger-backfill` (attempts.tsv blind to ~640 worktree-sweep
   parks) + `q-flags-producer-detection` (masked-RMW/bulk-fill/SDK-call producer
   finder — the 3×-recurring flags-word blind spot).
3. **DECIDED — Next-brain TODO item 0 (pending since 2026-07-25): "readable-C done"
   definition adopted** per the filing doc's own recommendation: the pret-style
   public ladder PLUS the verdict-complete gate; attainment-as-completion REJECTED.
   Freshness cutoff keys per-lever-family off codegen-walls.md's correction history,
   not one global date. Verdict-gate implementation is M-effort, unscheduled — a
   candidate for a future tooling slot. (Owner can veto; recorded as the brain's
   call per the doc's "the brain decides".)
4. **Hygiene:** deleted 5 superseded remote branches (claude/cm-data-020b4680-carve,
   claude/cm-data-020c3198-carve, claude/cm-data-inference-3, cmatch/c66-resweep,
   codex/semantic-contradiction-check — each verified in-main-by-another-path before
   deletion). `brain/decomp-dev-ci` (#1020 draft) kept pending an owner call — the
   only branch with genuinely unmerged content. `progress-visuals` is live CI output,
   never delete. 11 local worktrees on the Windows box are prune candidates
   (branches merged, remotes gone) — listed for the owner, not pruned; `decomper`/
   `scaffolder` are standing dirs that need a branch refresh, not removal.
   `docs/agents/worktree-mechanisms.md` corrected: this Windows box runs manual
   named sibling worktrees (Mechanism A), not `.claude/worktrees` sandboxes.

**Previously (2026-08-03, late):** — **rounds 0803b/0803c integrated, then a
REPAIR round opened.** EUR readable-C **14.14%** (Natural-C 333,354 B / asm-C
3,904 B), USA **11.92%** (281,508 / 2,748), JPN **11.86%** (280,388 / 2,548).

**Merged this stint:** #1436 (port-census classifier — 153 previously-unparseable
function TUs recovered), #1437 (12 main functions), #1438 (**AGENTS.md verify-gate
item 12** — read every dispatched worker's transcript before judging), #1439
+ #1444 (queue seeding), #1440 (kickoff_lint `location-guard`), #1441 (`f_cf8`
enum + confidence-promotion fix), #1442 (5 USA ports — **all asm-C; USA
natural-C did not move**), #1443 (C-66 bitfield-source refinement + 1 ship), plus
Codex Decomper's 33 rescued ports.

✅ **REPAIR ROUND CLOSED (2026-08-04)** — both wrongly-closed items are fixed and merged.

1. **`q-kickoff-location-guard`** — repaired in #1446. The check now requires a
   repo-root *equality assertion* against an expected path, not a probe that
   merely succeeds. Brain-verified all four verdicts on the integrated tree:
   `pwd || exit 1` FAIL · `git rev-parse --show-toplevel || exit 1` FAIL ·
   comparison against the WRONG path FAIL · correct equality PASS. The
   wrong-path case is stronger than asked for — it proves the comparison targets
   the *assigned* worktree, not merely that a comparison exists.
2. **`f_cf8`** — repaired in #1449, and the lane went further than the critique.
   All three canonical docs now state an **open observed-value set**
   (`{0,1,2,3,4,5,7}`, closure unproven, `4` a comparison target with **no known
   producer**), with confidence marked LOW on closure. It also found a **fourth
   producer pattern** — argument-forwarding at `func_ov002_021d1158.s` — that
   **no literal-`str` sweep can reach**, including the brain's own verification
   method. And it corrected its own survey twice over: the denominator
   (`Ov013Slot` self-excluded → 3 of 6, not 3 of 7) and an undercount of
   `Ov006SubState` (14 real values, not 9 — its grep silently skipped the
   `[0] =` array-index form). The three "no contradiction found" rows were
   downgraded to **"unexercised"**, applying its own distinction to its own work.

**Lesson worth keeping:** the `f_cf8` fix initially repeated the bug it
diagnosed — an assumed `0–3` became an assumed `0–4`. "Highest value observed"
is not "upper bound". That is the argument for
`tools/semantic_contradiction_check.py` being a *tool* rather than a discipline.

**PR state — active vs merely open (2026-08-04).** After this integration: **1
active** (#1447, held back for `q-semantic-check-enum-lookup`) and **1 parked
draft** (#1020, decomp.dev CI). `tools/queue_state_drift.py` now enforces this
distinction automatically — it caught an earlier revision of this very file
claiming 0 active while 5 were open, which is exactly the drift it was built for.

**Previously (2026-08-03):** Open PR count was **1**, but *active* count
is **0**: #1020 (decomp.dev CI) is a deliberately parked draft, not in-flight
work. These are different claims and conflating them is exactly the drift
`q-queue-state-drift-check` exists to catch — an earlier revision of this file
asserted "Open PRs: 0" while #1020 was open.

**Dropped by owner decision (2026-08-03):** the duel-AI understanding track.
Rationale: it has no external arbiter. Everything that works here works because
`ninja sha1` is an authority that doesn't care what anyone believes; an ungated
semantic track produces confident prose nobody can falsify — and the `f_cf8`
result above is what that failure mode looks like in miniature. External review
has since re-proposed it twice; the answer remains no. Also dropped: the Luna
re-test and the `batch_port` work-loss chip (three clean contention deferrals —
the original loss was a one-off, not a pattern).

**Previously (2026-08-03, earlier):** (M1 Mac, brain=Opus 5; roster unchanged: 2× Codex GPT-5.6 Luna
+ 2× Claude Code Sonnet 5 Max, all four on autonomous standing queues `docs/queue/*.md`).
**CHAPTER: READABLE-C, and the rate has stepped up hard.** EUR readable-C is now **14.11%**
= Natural-C 333,246 B (13.97%) + asm-C 3,456 B (0.14%) over the 2,385,948 B `.text`
denominator; USA **11.79%** (278,596 natural / 2,540 asm) and JPN **11.68%** (276,072 /
2,548). That is **8.48% → 14.11% on EUR in 12 days** — roughly 7× the +0.46 pp/week the
2026-07-22 scorecard recorded, driven by the ov002 unknown sweeps plus the cross-region
port harvest coming online.

This round merged 4 PRs on `brain/integ-0803`, gated by a real `gate3.py --scope all` on the
consolidated tree — `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`, plus
`check_activation_invariant` OK and `check_delink_dupes` OK (81 delinks.txt, no duplicate
`.text` addresses). The merged PRs: **#1435** (cm-ov002-unknown-
sweep-15, 26/100 shipped / 5,756 B — and **C-66 resolved**: a redundant `and rN, rN, #1`
before a `mul`/`mla` in a provably 0/1-ranged value, two working fixes, 8+ same-round
confirmations, the best-evidenced new lever this campaign), **#1434** (cm-bss-convert-9,
9 symbols / 468 B, and an honest "fresh pool is thin" report that declined to force a
volume batch — the correct call, and the reason that lane is redirected this round),
**#1433** (cross-region port prefilter root-cause fix — `not_in_gap` reclassified as a
retryable tool-error + delink-before-install — plus 92 ports harvested), **#1432** (data
metric overlap semantics documented + 3-state regression test).

Brain-side fixes this session: `wah_out.json` (1.3 MB) + `wah_err.txt` were tracked junk on
main since fe69e9b4e — removed and gitignored; `q-cross-region-alias-guard` was left `[TODO]`
despite shipping as cd3d19fd1 — closed. **3 of the 4 queues were QUEUE-EMPTY**; all four
re-seeded (CC Decomper `cm-c66-resweep` + `cm-ov002-unknown-sweep-16`; CC Scaffolder
`cm-main-sweep-h` + `cm-data-restock-check`; Codex Decomper `q-port-harvest-complete` +
`q-sig-refresh-4` + `q-name-crossprop-4`; Codex Scaffolder `q-port-census-unparsed`).

**Where the runway is (measured this session):** ov002 = 1,129,372 B = **47% of all `.text`**
at 12.58% C; `main` = 738,080 B = 31% at 14.76%. Those two modules are the whole game — every
other module is "finishable" but small. Separately, `port_census.py` shows **322 free
byte-identical cross-region ports** waiting (USA 155 + JPN 167 at `sim = 1.0`, ~68 KB),
which is most of the EUR-vs-USA/JPN gap and the cheapest coverage in the project; the
backlog regrows every time the CC lanes ship EUR, so a non-zero ending census is normal.
Open question filed for a future round: `port_census.py` cannot parse **747 EUR TU names**
(`data_*`, `ovNNN_ADDR`, `sinit_*`, truncated-address `*_stubs_*`) — some unknown share of
those may be portable function TUs missing from the backlog entirely.

**Previously (2026-07-23):** (Windows PC, brain=Opus; roster: 2× Codex GPT-5.6 Luna High +
2× Claude Code Sonnet 5 Max, all four on autonomous standing queues `docs/queue/*.md` —
loop-until-QUEUE-EMPTY, one PR per item). **CHAPTER: READABLE-C, post-wall-correction.**
EUR readable-C **8.591%** = **Natural-C 201,522 B (8.446%)** + **asm-C 3,456 B
(0.145%)** over the `.text` denominator of 2,385,948 B; USA is **7.269%**
(172,520 natural / 832 asm B) and JPN is **7.269%** (172,520 natural / 840 asm B).
The aggregate remains the sum of the two buckets. Landmark rounds this stint:
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

**Open PRs: 0** once `brain/integ-0803` lands (#1432/#1433/#1434/#1435 all merged into it).
**All four lanes idle at hand-off, and all four queues re-seeded** — each lane resumes with
`python tools/work_queue.py next <lane>`, loop-until-QUEUE-EMPTY, one PR per item. Kickoffs
for this round were linted with `tools/kickoff_lint.py` (preflight + canary + paste-control
+ effort tier all PASS) before send.

Standing hygiene note for the next brain: this Mac carries **9 worktrees**, of which 4 are
the live lane dirs (`claude-decomper-queue`, `claude-scaffolder-queue`, `codex-decomper-queue`,
`codex-scaffolder-queue`) and 5 are leftovers from the 2026-07-21 round
(`claude-decomper-mainb1`/`-mainb2`/`-ov004b`, `claude-decomper-queue-2`,
`claude-fix-queue-collision`). All 9 branches were verified either merged into `main` or
fully superseded — `codex/ov004-readable-stubs` and `claude/decomper-queue-run-2` are the two
that read as "not merged" but hold only content that landed by another path. Safe to prune.

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

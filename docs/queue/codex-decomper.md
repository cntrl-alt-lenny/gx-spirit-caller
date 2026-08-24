[//]: # (markdownlint-disable MD013 MD041)

# Codex Decomper — autonomous naming queue

**Protocol:** loop until QUEUE-EMPTY — do NOT stop after one item. `python tools/work_queue.py next codex-decomper --claim` (⚠️ Windows: plain `python`). Every rename via `rename_symbol.py --cascade`, each naming batch gated `scope_gate.py --kind naming` (b610/b612 safety); paste real `dsd check` + `scope_gate` output. Open ONE PR **per item**, `work_queue.py done codex-decomper <id>`, commit, then immediately take the next item. Effort HIGH.

**This lane is now naming + ANALYSIS.** Naming alone is candidate-scarce (honest low counts / QUEUE-EMPTY are a SUCCESS — never invent names), so the queue below mixes renaming with research/census work that feeds the CC C-match lanes.

**Worktree capability:** `kb-map` = build-FREE · `kb-types` = EUR baserom only · `scaffolder`/`decomper` = all 3 baseroms. Match your gate to what you can actually run (briefing bug b642).

**Tooling budget (2026-07-23):** a NEW tool must do one of: replace/delete an existing tool, consolidate duplicated infrastructure, measurably cut cycle time, catch a demonstrated failure class, or directly ship functions/bytes — state which in the PR. **asm-void ≠ readable C:** inline-asm-in-C is coverage hygiene, counted separately from natural C (metric split shipped end-to-end, q-natural-c-metric [DONE]); prefer natural C, use asm-void only where a documented wall justifies it.

---

## Items

### q-sig-refresh-2 — rebuild the sig DB after the CC agents named more functions [DONE]

The CC C-match rounds add real names as they convert functions. Rebuild b630's sig DB from ALL currently-named functions (it grows as C-match progresses), re-apply across EUR/USA/JPN, report the delta vs b630's 29. Round-trip canary first.
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming --base origin/main` PASS + names-applied delta.

### q-name-crossprop-2 — cross-region twin propagation [DONE]

Any EUR-named function whose USA/JPN twin is still `func_*` → propagate via `rename_symbol.py --cascade` (byte-neutral, 3× multiplier). Sweep all modules.
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming` PASS + twins propagated.

### q-family-verify — verify brief 658's anchor-backed families [DONE]

Brief 658 found **91 new C-anchored relocation families** (`docs/research/campaign-analytics/family-census-2026-07.md`). Anchor-backed families are the highest-value C-match targets we have (a matched sibling means near-zero-shot propagation — VRAM 16/16, table-walker 7/7). But the census is mechanical, so some "anchors" may be false. Verify a sample (~20 families): does the claimed anchor really exist as matched `.c`, and do the members really share its shape? Also resolve the rows 658 flagged **ambiguous** (`sig=0` — empty relocation signature can describe unrelated leaf functions). Output: a VERIFIED / SUSPECT / AMBIGUOUS column added to the census, so the CC agents only sweep real families.
**Gate:** doc-only, no build; paste your verification method + counts.

### q-nomarker-census — classify the 294 no-marker files [DONE]

Brief 643's census found **294 `.s` files with no wall marker at all** — neither a taxonomy code nor the blanket cohort stamp. They're pure never-assessed candidates and nobody knows what they are. Census them: module, size distribution, shape (leaf/stub/dispatcher/large), and whether any have matched siblings. These are potentially the cleanest untouched pool in the project.
**Gate:** doc-only, no build; the census table + your read on which look most tractable.

### q-walls-doc-audit — audit codegen-walls.md against its own criteria [DONE]

Brief 640 found **0 of 5 sampled wall citations actually matched the criteria of the taxonomy entry they cited**, and brief 651 then split the buckets properly (permanent `P-NN` / coercible `C-NN` / unknown / no-marker). Now audit the taxonomy document itself: for each `C-NN`/`P-NN` entry in `docs/research/codegen-walls.md`, does its stated criteria match how it's actually being cited in `.s` headers? Flag entries that are (a) mis-filed as permanent when a documented lever exists, (b) too vaguely worded to cite correctly, or (c) cited far more than their criteria would justify (C-34 is cited 116 times — is that plausible, or is it a catch-all?).
**Gate:** doc-only; the audit table + specific rewording proposals. Do NOT rewrite the taxonomy in this item — propose.

### q-sig-refresh-3 — rebuild the signature DB from newly-named functions [DONE]

The CC C-match lanes add real names as they convert (briefs 650/654/655 are running now). Rebuild the signature DB from ALL currently-named functions, re-apply across EUR/USA/JPN, and report the delta vs the last refresh. Round-trip canary first (confirm a known-good signature still resolves before trusting a bulk apply).
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming --base origin/main` PASS + names-applied delta.

### q-name-crossprop-3 — cross-region twin propagation sweep [DONE]

Any EUR-named function whose USA/JPN twin is still `func_*` → propagate via `rename_symbol.py --cascade`. Byte-neutral, 3× multiplier on every name the CC lanes create. Sweep all modules. Brief 569's sig region-twin map (49/60 exact twins, 0/44 false positives) is the validated fallback when the name alone is ambiguous.
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming` PASS + twins propagated count.

### q-progress-history — build the C%-over-time series [DONE]

We have no historical view of the readable-C rate — only spot readings. Reconstruct it from git history: walk merge commits on `main` over the last ~6 weeks, and at each point compute readable-C bytes per region (the committed-delinks tier is build-free, so this is a pure history walk — see `tools/progress.py`'s C-decompiled path). Output a table + the derived rate (pp/week), plus per-module where cheap. This tells us honestly whether the campaign is accelerating or flat, which nothing currently answers.
**Gate:** doc-only, no build; the series + your stated method (say plainly if some points are un-computable).

### q-peer-techniques — mine peer decomps for MATCHING techniques [DONE]

Brief 659 studied peer projects as a *source of SDK code*; this is different — mine them for **techniques we lack**. Look at pret/pokeheartgold, pret/pokediamond, pmd-sky, sm64ds decomps, zeldaret/ph: how do they crack reg-alloc mismatches, what compiler-flag or pragma levers do they use per-TU, what tooling do they have that we don't, how do they organise a large C-matching push? ⚠️ Skip anything already in our ledger as dead: the m2c drafter (~10.66%, dead end), `-ipa` (would break our matches), `#pragma thumb` (already used), the illpragmas opt_* toggles (measured inert). Report only genuinely NEW techniques, each with a URL and an assessment of whether it applies to mwccarm 2.0/sp1p5.
**Gate:** doc-only; the technique list with URLs + applicability verdicts.

### q-family-verify-2 — finish verifying the family census [DONE]

`q-family-verify` sampled ~20 of brief 658's 91 anchor-backed families. Finish the job: verify the remainder, and resolve every row still marked ambiguous. The CC Decomper is now sweeping these families for real (brief 662) — a false anchor costs it a wasted session, so accuracy here directly protects that lane.
**Gate:** doc-only; the completed VERIFIED/SUSPECT/AMBIGUOUS column across all 91 + counts.

### q-unknown-pool-profile — profile the 5,945 never-assessed files [DONE]

This is now the campaign's central unknown. Brief 654 showed ov002's "unknown" tranche was really the 288/290/294 reg-alloc-walled cohort in disguise — genuinely walled, verified. Is `main`'s 2,370-file unknown tranche the same, or actually unexplored? Profile it MECHANICALLY (no matching): for each file, what header text does it carry, what cohort/brief does that text trace to, size distribution, and shape (leaf/stub/dispatcher/large). Group by provenance — "which sweep put this text here" is the key question. You are NOT judging matchability; you're establishing what evidence exists.
**Gate:** doc-only; the profile table grouped by header provenance + your read on how much is cohort-stamp vs genuinely unassessed.

### q-name-batch — name what the C-match lanes converted [DONE]

The CC lanes have converted ~24 more functions this round (18 ov002 + 6 main) and more are landing. Any newly-converted function still called `func_*` whose purpose is now legible from its C body is a naming candidate. Name them via `rename_symbol.py --cascade`, then propagate twins to USA/JPN. ⚠️ Never invent a name you can't justify from the code — an honest small batch beats a speculative large one.
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming` PASS + names applied.

### q-progress-history-2 — extend the series and add per-module [DONE]

Your `q-progress-history` series gave us the first real view of the readable-C rate. Extend it: add the latest merges, and break it down per-module (which modules are actually moving vs flat). Also state the derived rate honestly — pp/week — and, if the trend supports it, a projection with explicit assumptions. This is the number we steer by; it should be uncomfortable if the truth is uncomfortable.
**Gate:** doc-only; updated series + per-module + the stated rate.

### q-endgame-ledger-refresh — rebuild the endgame ledger from current data [DONE]

`endgame-ledger.md` was written before the wall-classification correction and improvement-swarm r5 found it explained only 11.6% of the real byte gap (its EUR row wrong on all three terms, ov004's large gap absent entirely). Rebuild it from current committed data: real per-region byte gap, the corrected candidate buckets, the verified ov002 wall cohort, ITCM, and the 32 confirmed-permanent files. Supersede the old content in place with a dated note.
**Gate:** doc-only; the rebuilt ledger reconciling to `wall_aware_headroom.py` + `progress.py` totals — show the arithmetic.

### q-small-tier-worklist — prioritize the 1,645-file small/medium tier [DONE]

Brief 661 established `main`'s **0–256 byte tier (1,645 of 2,370 files, 69% of the tranche)** as real runway at an estimated 35–55% floor, and both CC lanes are now sweeping it (`cm-main-small-a/b/c`). Give them a prioritized worklist so they don't pick blind.
For every main candidate ≤256 B: address, size, shape class (trivial stub / tail-call forwarder / guard chain / small dispatcher / loop / other — derive mechanically from the `.s`), header provenance, and whether a matched sibling of similar shape exists. Rank by the shapes 661 found tractable (stubs and forwarders first). Split the output by address range so it maps onto the two CC lanes: **0x02000000–0x0203ffff** (Scaffolder) and **0x02040000+** (Decomper).
**Gate:** doc-only, no build; the ranked worklist with per-range counts.

### q-family-census-2 — rebuild the family census with LARGER exemplars [DONE]

Brief 662 found the 91-family census unusable as a worklist: its own audit returns **0 VERIFIED / 54 SUSPECT / 37 AMBIGUOUS**, root-caused to **families clustered around tiny 8–28 byte exemplars — a tiny shape matches many unrelated bodies, so they are false anchors for propagation**.
Rebuild it with that fixed: impose a **minimum exemplar size** (start at ≥64 B and state your threshold), require a distinctive signature (non-empty relocation set — the `sig=0` rows were exactly the ambiguous ones), and require the anchor to be a genuinely matched `.c`. Report how many families survive the stricter criteria — a much smaller, trustworthy list beats 91 unusable rows.
**Gate:** doc-only; the rebuilt census + the criteria you applied + survival counts vs the original 91.

### q-name-batch-2 — name the newly converted functions [DONE]

The CC lanes are shipping steadily (24 last round, more landing). Name any newly-converted function still called `func_*` whose purpose is legible from its C body, then propagate twins to USA/JPN. ⚠️ Never invent a name you can't justify from the code — an honest small batch beats a speculative large one.
**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming` PASS + names applied.

### q-tool-reaudit — stricter tool classification (fix the circular audit) [DONE]

The earlier dead-tool audit kept nearly everything because docs/tests reference it — circular (the test exists because the tool exists). Reclassify ALL 110 `tools/*.py` into: **CORE** (referenced by build.ninja, gate3/merge flow, or a CI workflow), **ACTIVE-CAMPAIGN** (invoked by a current queue lane or appearing in the last 30 days of brief reports), **OCCASIONAL**, **HISTORICAL** (one-off, kept only for reproducibility), **REPLACE/DELETE** (superseded or duplicated — name the successor). Evidence per tool: build.ninja/workflow/queue grep + last-meaningful-change date + last-30-days brief mentions. PROPOSE (don't execute) moving HISTORICAL out of the primary tools/ surface (e.g. tools/archive/) with a migration checklist.
**Gate:** doc-only; the classification table with per-class counts + evidence columns.

### q-health-scorecard — ONE generated weekly scorecard [DONE]

Extend the existing progress-history method (do NOT build a new subsystem — tooling budget applies) into docs/research/campaign-analytics/scorecard.md: per-region natural-C% and asm-C% (after q-natural-c-metric; until then note "split pending"), ships/week from the history series, names recovered, active tool count (CORE+ACTIVE from q-tool-reaudit), open PRs + median age (gh), CI check health. ONE regenerable doc. The point (per the external review): track OUTPUT (readable-C bytes, ships/week), not activity (PR counts, queue completions).
**Gate:** doc-only; the scorecard + the method note.

### q-doc-archive — archive superseded STATUS docs (not brief reports) [DONE]

3,195 tracked .md; the live operational surface should be compact: state.md + 4 queues + generated indices. Move clearly-SUPERSEDED status/planning docs — e.g. path-to-100-coverage.md (superseded by endgame-ledger), safe-queue-v2/v3, pre-b651 candidate lists — into docs/research/archive/ leaving a 2-line stub pointer at each old path. Verify each is genuinely superseded (its own header says so, or a successor doc exists) before moving; if unsure, leave it. ⚠️ Do NOT touch brief-*.md reports (the historical record stays put). Regenerate the research index; the link test must stay green.
**Gate:** doc-only; list of moves + index regenerated + link test green.

### q-sm64ds-reingest — re-ingest the sm64ds lever catalogue delta (r6 bet 4) [DONE]

The sm64ds catalogue moved repos and grew ~970 lines / 21 dated sections of same-compiler (1.2/sp2p3) evidence since our snapshot; §7a directly reports the uniform 'register allocation' near-miss label was a CATEGORIZER failure and 6/8 then matched — corroborating our own reg-alloc finding. Re-ingest to docs/research/reshape-recipes/imported-sm64ds-r2.md; flag §6k/6q/6u/6y/6z/7a/7b for on-2.0/sp2p3 verification (a later CC item will test); fix the stale 'different SP revisions' line. Cite the source URLs.

**Gate:** doc-only; the re-ingested delta + a VERIFY-ON-1.2/sp2p3 checklist + source URLs.

### q-wall-doc-supersede — correct the 3 superseded P-wall headings (r6 bet 10) [DONE]

3 of 17 P-walls (P-7/P-8/P-10) still read as live permanent walls in docs/research/codegen-walls.md while cm-wall-retire re-tests them. Append '— SUPERSEDED BY <the actual mechanism/lever>' to those headings per r6's finding, and name the genuinely-live P-entries so future rounds don't waste budget. Do NOT rewrite the taxonomy bodies — annotate headings + add a status line.

**Gate:** doc-only; the 3 corrected headings + a live-vs-superseded P-wall summary table.

### q-attempts-ledger — build a machine-readable attempts ledger (r6 bet 9) [DONE]

The failed-candidate exclusion set exists only as prose across ~10 briefs, and brief 661's 8 candidate names were never recorded — permanently lost. Create an append-only `docs/research/campaign-analytics/attempts.tsv` with columns `addr,module,text_size,tier,shape,result,match_pct,park_class,brief` and `merge=union` in `.gitattributes` (prevents the queue-file-style conflicts). Backfill what's recoverable from recent brief reports. Add a `wall_aware_headroom.py --exclude-attempted` flag that reads it.

**Gate:** doc+tool; the tsv with backfilled rows + the --exclude-attempted flag + a test.

### q-sm64ds-verify-prep — prep the sm64ds §7a verification (feeds a CC lane) [DONE]

q-sm64ds-reingest banked the ~970-line delta. Now prepare the on-2.0/sp2p3 verification harness for §6k/6q/6u/6y/6z/7a/7b: extract each lever's exact before/after C form and the .s it claims to fix, into a checklist a CC agent can run mechanically. §7a (reg-alloc categorizer failure) is the priority — it corroborates our own finding.

**Gate:** doc-only; the per-lever verification checklist with concrete C forms.

### q-nitro-names — harvest the 35 byte-verified NitroSDK names from libs/nitro headers (r8 bet 4) [DONE]

89 `libs/nitro/func_*.c` carry a `function: <Name>` header (verified). Filter the ~53 FX_Init size-0x4 stubs → ~35 REAL names (FS_Init, OS_SPrintf, MI_Copy48B, OsCountZeroBits, MTX_* …), all still `func_*` in symbols.txt with ZERO overlap vs the 72-entry sig DB. Parse the header field and apply via `rename_symbol.py --cascade` (byte-neutral, 3x across regions). Their bodies name their callees for free — chase those too.

**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming` PASS + names applied count.

### q-ceiling-measured — replace the hard-coded 0.10 asymptotic headroom with main's MEASURED ship-rate (r8 bet 1) [DONE]

⚠️ CAREFUL — this corrects the published north-star. progress.py:490 hard-codes ASYMPTOTIC_MODULES={main,ov002} and :497 ASYMPTOTIC_HEADROOM_FRACTION=0.10, but main is the campaign's #1 mover (+33,832 C-bytes this window, ~8x the next module) — self-refutingly NOT asymptotic. Replace the flat 0.10 with each asymptotic module's MEASURED empirical ship-rate (derive from the attempts ledger / progress history), and publish a per-module ceiling. Reclassifying main alone moves the total ceiling 29.97%→~47.88% (reverify byte-exact). State assumptions; this is a data-driven correction, not an optimistic flip.

**Gate:** doc+tool; the new per-module ceiling with the derivation shown + before/after headline ceiling.

### q-data-metric — add a data-readability metric to progress.py (r8 bet 10 — opens an unworked frontier) [DONE]

Data readability is ~0% and invisible: 10,949 `data_*` placeholders, 2 real names, 0 typed structs. `data%` is byte-MATCH and Natural-C% is `.text`-only by construction (progress.py:747), so naming/typing data moves NO tracked number — the lane's blocker is a missing metric. Add named-data-% and typed-array-byte-% lines mirroring the natural/asm split, reusing the delinks walk. This makes the data frontier measurable so it can be worked.

**Gate:** `python -m pytest -q tests` no-new-failures + the new metric lines + a test.

### q-objdiff-lines — surface objdiff's already-computed line_number in the feedback hook (r9 lever #4 — close localize.py) [DONE]

The post_edit hook already runs objdiff-cli --format json on every .c/.s edit and the JSON ALREADY carries per-instruction 'formatted' (disasm) + 'line_number' (the .debug_line join objdiff does internally; -sym on is default in CC_FLAGS configure.py:141). The hook extracts ONLY match_percent (post_edit.py:255/293) and discards the rest -> agents then hand-run fastmatch/capstone to localize. FIX: in _objdiff_match_percent also return the instruction rows; in _cmatch_feedback, when pct<100 print the first ~3 diverging rows as 'line 25: mov r5,r0'. ~50 lines. This makes the queued/ledgered localize.py task REDUNDANT — mark it closed (nothing to join; objdiff already did it).

**Gate:** `python -m pytest -q tests` no-new-failures + demo: a <100% edit prints the diverging line(s).

### q-fastmatch-keyerror — one-line fastmatch KeyError fix (r9 lever, hours) [DONE]

fastmatch.py:685 reads r['region'] before the status guard at :688, so a stale/renamed candidate path crashes with a raw KeyError:'region' instead of a clean FILE NOT FOUND — common during the func_X.c -> Module_Verb.c rename churn. Add 'region': args.region to the file_not_found dict (~lines 652-657), or move the tag computation past the status guards. Also make the batch loop return exit 2 not 1 on a missing file.

**Gate:** `python -m pytest -q tests` + repro: a stale path now reports FILE NOT FOUND cleanly.

### q-prototypes-h — consolidate 463 conflicting extern prototypes into a canonical header (r10 bet 5 [S]) [DONE]

4,712 extern decl-sites for 2,040 distinct functions (2,672 pure duplicates); 463 functions are declared with 2+ MUTUALLY-CONTRADICTORY signatures inline across files (func_ov002_021ff320 = 17 sigs across 21 files); after stripping cosmetic param-name diffs, 366 keep genuine type conflicts, 142 are ABI-SIGNIFICANT (contradictory return type / arg count -> changes call-site codegen -> BLOCKS first-try byte-match on callers). Emit ONE canonical prototype per function into include/game/prototypes.h (created by q-include-layer). Prioritize the ~30 functions declared >20 ways (ov002 sinks, DMA/fill helpers), then the 142 ABI-significant. Resolve each conflict by the best evidence (a matched C body that USES the fn is ground truth). This directly raises first-try match rate on every caller.

**Gate:** `python tools/configure.py eur && ninja sha1` OK (byte-neutral) + count of prototypes emitted + conflicts resolved.

### q-port-harvest-complete — drain the 322 free byte-identical cross-region ports [DONE]

The prefilter fix (`not_in_gap` reclassified as a retryable tool-error, plus configure + `ninja delink` before temporary C is installed) unblocked this lane. Brain-run census, right now, on the current integration tree:

- **USA**: 161 backlog, **155 at `sim = 1.0`**, 32,912 B — ov002 73 / main 59 / ov006 15 / ov004 6 / rest 8
- **JPN**: 173 backlog, **167 at `sim = 1.0`**, 35,552 B — ov002 79 / main 60 / ov006 16 / ov004 8 / rest 10

These are byte-identical siblings of already-matched EUR functions — the cheapest coverage in the project, ~68 KB across the two regions. USA sits at 11.79% C and JPN at 11.68% against EUR's 14.11%; this backlog is most of that gap.

Run `port_census.py` first, then `port_harvest.py --batch 20` in a loop until the `sim = 1.0` rows are drained or genuinely refuse. A refusal for a real reason (below confidence floor, real mismatch percentage) is expected and fine — record each one; do **not** force a below-floor candidate. The backlog **regrows** every time the CC lanes ship EUR functions, so ending non-zero is normal — just report the ending census.

Effort: **MEDIUM** — this is mechanical, harness-driven, and gated at every step.

**Gate:** per-region `ninja sha1` on every batch (the harness already does this) + `python tools/gate3.py --scope all` at the end + `check_activation_invariant.py` + before/after `port_census.py` counts.

**Result (brain, 2026-08-05):** criterion met twice — #1456 shipped 10 ports (5 natural-C + 5 asm-C; sim=1.0 census USA 155→145, JPN 167→147) and #1459's full re-drain from fresh origin/main shipped 0: every remaining sim=1.0 row (292 rows / 61,096 B) refused below the HIGH/EXACT floor. "Drained or genuinely refuse" is this item's own success line, so DONE. Residue re-scoped below (`q-port-residual-fix`, `q-port-highconf-no-target`); full drains are now triggered by EUR-ship rounds, not a standing TODO — #1459 already paid one zero-yield full-drain cycle for leaving this open.

### q-sig-refresh-4 — rebuild the signature DB after the C%-jump [DONE]

EUR readable-C went **8.48% → 14.11%** between 2026-07-22 and 2026-08-03, and USA/JPN moved with it. The signature DB has not been rebuilt across that jump, so it is materially stale. Rebuild from ALL currently-named functions, re-apply across EUR/USA/JPN, report the delta vs the last refresh. **Round-trip canary first** — confirm a known-good signature still resolves before trusting any bulk apply.

Naming is candidate-scarce by design: an honest low count or QUEUE-EMPTY is a SUCCESS. Never invent names.

Effort: **MEDIUM**.

**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming --base origin/main` PASS + names-applied delta.

### q-name-crossprop-4 — cross-region twin propagation sweep [DONE]

Follows `q-sig-refresh-4`. Any EUR-named function whose USA/JPN twin is still `func_*` → propagate via `rename_symbol.py --cascade`. Byte-neutral, 3x multiplier on every name the CC lanes created during the jump above. Sweep all modules. Brief 569's sig region-twin map (49/60 exact twins, 0/44 false positives) is the validated fallback when a name alone is ambiguous.

Effort: **MEDIUM**.

**Gate:** `dsd check` green 3 regions + `scope_gate.py --kind naming` PASS + twins-propagated count.

### q-port-residual-fix — recover the 3 tool-error ports + the named residues; no full re-drain [DONE]

The sim=1.0 pool is drained to genuine refusals (see q-port-harvest-complete's Result above). What is left has NAMED causes — fix those; do not re-run the loop:

1. **The region-data lookup bug** — on `OSi_PostIrqEvent`, `SNDi_SetTrackParam`, `__register_global_object` the lookup returns a non-JSON filename mismatch; #1459 hit it as 3 "retryable tool-errors" per drain and no queue item tracked it until now. Root-cause and fix the tool (+ a regression test with the failing shape), then port those 3 — they are the only mechanically recoverable ships left in the current pool.
2. `func_0203e95c` needs its `symbols.txt` line added (needs-symbol refusal); `func_02087174` has a name collision — resolve per naming convention.
3. `func_0201c444` parked at 98.0%: ONE bounded attempt; park honestly if it stays below the exact floor.

Do NOT run another full drain — the backlog regrows only when EUR ships, so the next full drain is triggered by the next EUR merge round, not by this item. CANARY: the first recovered port goes through per-region `ninja sha1` before touching the other two. End with one before/after `port_census.py` paste.

Effort: **MEDIUM**.

**Gate:** per-region `ninja sha1` on every shipped port + `python tools/gate3.py --scope all` + `python -m pytest -q tests` green (tool fix) + before/after `port_census.py` output pasted in the PR.

### q-port-highconf-no-target — scope the 63-per-region HIGH-but-no-target-file class [DONE]

PR #1436's census fix surfaced **63 functions per region at HIGH sibling-confidence with NO EUR target file** — a class nothing currently tracks. Determine what they are: which modules, and why no target file exists (never delinked? misclassified as data? gap TUs?). Ship the mechanically safe ones; where EUR-side work is the blocker, produce the worklist (module, address, blocker) as a research doc instead of forcing ports. An honest "0 shippable, here is the worklist" is a SUCCESS. CANARY: fully diagnose ONE candidate end-to-end before sweeping the class.

Effort: **MEDIUM**.

**Gate:** if anything ships, per-region `ninja sha1` + `python tools/gate3.py --scope all`; otherwise doc-only + `python -m pytest -q tests` green. The census/worklist table pasted in the PR.

### q-census-methodology-fixes — close the two field_exposure_census.py gaps #1465 discovered [DONE]

`cm-field-recheck-1` (#1465) surfaced two methodology gaps in the field
exposure census while using it to rank fields — see `tools/field_exposure_census.py`.
They were recorded in that round's research doc but never queued; the ranking is
now a standing input to the producer/consumer lens, so a gap here silently
mis-ranks what gets audited.

1. **Missing base-symbol detection.** The census counts explicit named C members and, per its own coverage note (`field_exposure_census.py:241`), misses access sites where the base symbol is not detected. Establish mechanically which base-symbol spellings are missed (start from the documented symbols in `docs/research/types/` and `docs/research/constants/`), then close the gap. Report a before/after site count per affected field — an honest "the gap is smaller than believed, here are the numbers" is a fine outcome.
2. **Decimal-offset field-name matching.** Field names are matched against hex-offset spellings; sites that reference the same field by its decimal offset are not joined to it. `cm-field-recheck-1` hit this concretely — `func_ov002_021f85f8.c:7` uses `+ 1460` for `+0x5b4`, and `func_ov002_021e2b3c.c:36` writes `f1492 = 0` for the same field. Both are real access sites the census does not count.

⚠️ **Do NOT simply match any bare decimal equal to the offset.** The Codex Scaffolder's `field_producer_finder.py` has the inverse bug from exactly this shortcut: its `#?{offset}\b` fallback matches `cfg.unrelated = cfg.unrelated | 20;` for offset `0x14` because `20 == 0x14`, promoting an unrelated write to a scored producer hypothesis. Require a member-access or pointer-arithmetic context. Coordinate: that lane is fixing its side under `q-producer-anchoring` this round — compare approaches and land the same rule on both sides rather than two divergent heuristics.

CANARY: the two `cm-field-recheck-1` sites above must be counted after the fix and must NOT bring unrelated `1460`/`1492` literals with them — paste both the positive and the negative check.

Effort: **MEDIUM**. Tooling budget: catches a demonstrated failure class (mis-ranked audit inputs).

**Gate:** `python -m pytest -q tests` green (paste the real tail) + `ruff check` clean + a regression per gap (including the negative case above) + before/after per-field site counts, with any field whose RANK changes called out explicitly.

### q-census-decimal-alias-anchor — the decimal member alias re-opens the collision class [DONE]

Second pass on `#1475`, same branch. The two gaps ARE genuinely addressed and your before/after table reproduces exactly when re-run. The specific collision the item warned about is genuinely absent — `cfg.unrelated = cfg.unrelated | 20;`, `other.timeout = 20;`, `foo(20);` and `int x = 20;` all correctly return zero sites for a field at `0x14`. That part is right.

But the fix introduces a **different false-positive class of the same family**, via the new decimal member alias:

`_field_names_pattern` (`tools/field_exposure_census.py:104-107`) returns `{name, f{offset:x}, f{offset:X}, f{offset}}`, and the member path in `_c_accesses` (:135) requires **no base symbol at all** — unlike the raw-offset path (:136-138), which does. So `.f{decimal}` matches anywhere in the corpus, including on unrelated structs.

Measured on the real EUR corpus (10,624 delinked sources): **85 of 255 fields gain sites from the decimal alias.** Worst case `PerPlayerRowTable.f_0e` (offset `0xE`, decimal alias `.f14`): as-shipped `(25, 36, 53)` vs `(10, 12, 16)` with the alias removed — **37 of its 53 sites (70%) are `self->f14` / `p->f14` / `c->f14` accesses on unrelated structs at offset 0x14.** `BgCfg.f14` (offset `0x14`, alias `.f20`) goes 46 vs 37. Twelve aliases collide across two distinct documented offsets AND actually occur in `src/*.c`: `.f14` (99 files, 0x14 vs 0xE), `.f10` (68, 0x10 vs 0xA), `.f18` (64, 0x12 vs 0x18), `.f24` (41), `.f12` (40), `.f20` (31), `.f28` (27), `.f16` (23), `.f60` (9), `.f84` (5), `.f17` (4), `.f13` (3).

This corrupts the ranking the item exists to protect — a field can be promoted up the audit order by sites belonging to a different struct entirely.

**Verified remedy** (implemented and measured during review, so it is known to work): require the documented base symbol on the SAME LINE for **decimal-alias member matches only**. Hex-alias and real-name matches keep their current behaviour. Effect: the canary rows are untouched (`f_5d4` stays `(31, 9, 38)`, `f_5b4` stays `(53, 54, 55)` — the real site `data_ov002_022ce288.f1492 = 0;` carries the base on the line), while the pollution collapses (`f_0e` 53 → 16, `BgCfg.f14` 46 → 37). Implement it your own way if you prefer, but match or beat those numbers and show them.

**Also BLOCKING — retract a false claim.** `docs/research/data/cm-field-census-methodology-2026-08-08.md` states: *"The census now follows the same anchoring shape as the landed `field_producer_finder.py` rule."* That tool was NOT on `origin/main` when you wrote it (#1468 was still an open draft), so "landed" was untrue at the time. It has since merged — so re-check the claim against reality and restate it accurately.

And the rules genuinely DIVERGE where the item told you to converge: the sibling's `field_producer_finder.py:81` uses `field_names = {f"f{offset:x}", f"f{offset:X}"}` — **hex only, no decimal member alias** — while yours adds `f{offset}`. The pointer-arithmetic halves DO agree. Reconcile the member-alias half deliberately: either drop the decimal alias to match, or keep it WITH base anchoring and state why the census needs it when the finder does not. Your PR body never mentions the sibling lane at all — say what the shared rule is.

**Gate:** `python -m pytest -q tests` green (paste the real pytest tail) + `ruff check` clean + a regression pinning an unrelated-struct `.f{decimal}` access as NOT a site + the canary rows unchanged + a before/after table for the ~85 affected fields with any RANK change called out.

> **Result note 2026-08-08 (brain, merge resolution):** the lane delivered this
> in `6233512b2` before the brief reached `origin/main` — it created its own
> shorter entry for the same item and completed the work. This merge keeps the
> brain's fuller requirement text (which records WHY the anchoring is needed)
> over the lane's summary, and carries the lane's `[DONE]` status, which is the
> accurate one. `_member_patterns` now returns "unanchored real/hex names and an
> anchored decimal alias", which is the specified remedy.

### q-main-shape-reclassify — the worklist's shape labels are wrong often enough to mis-target sweeps [DONE]

`cm-main-tier-sweep-2` (#1478) found that several `docs/research/campaign-analytics/main-small-tier-worklist.md` rows labelled `guard chain` conceal non-guard-chain bodies — softfloat conversions among them. That matters more than it sounds:

- the worklist is the CC Decomper's **selector**, so a wrong label mis-targets a whole batch;
- wave 1's headline read ("71% but on a 100/100 homogeneous guard-chain population, so treat it as pre-filtered") rests on those labels being right — if they are not, the campaign's most-quoted rate is resting on a shaky premise;
- sweep-2's Pool A/B split (64% vs 54%) was designed around the same labels, so its gap is measured through a noisy lens.

Rebuild the shape classification **mechanically from each function's own `.s` body**, not from the existing column. Cover the whole `main` small tier the worklist spans (both address ranges, ~1,640 rows). For each row emit: address, size, the CURRENT label, the DERIVED label, and agree/disagree. Then report the confusion matrix — which labels are reliable, which are catch-alls, and the overall disagreement rate.

Derive from structure, and say plainly what each rule keys on so the next reader can audit it: trivial stub (single `bx lr`, no frame), tail-call forwarder (set up args → `b`/`bl` → return), guard chain (compare/branch ladder to a small number of exits), small dispatcher (jump table or switch shape), loop (backward branch), softfloat/CLZ (calls into or implements the float helpers — sweep-2 shipped 5 of these as `asm` for want of a C-reachable `clz`), other. If a body genuinely fits none, say `unclassified` rather than forcing it — an honest bucket beats a wrong label, which is the whole point of this item.

Ship the corrected labels as a NEW column alongside the existing one rather than overwriting it — the old column is what three waves were selected against, so preserving it keeps their results interpretable.

⚠️ Coordinate: the CC Decomper is running `cm-main-tier-sweep-3` in parallel and re-deriving shape at pull time for its own 100 candidates, recording (worklist label, derived label) per attempt. That is an independent sample against your bulk classifier — compare against it when it lands and reconcile any systematic disagreement. If your rules and its rules disagree on a class, resolve it rather than shipping two definitions.

Effort: **MEDIUM**. Tooling budget: catches a demonstrated failure class (mis-targeted sweep batches) and directly improves the selector every C-match round uses.

**Gate:** doc+tool — `python -m pytest -q tests` green (paste the real pytest tail) + `ruff check` clean + the confusion matrix + the overall disagreement rate + a 10-row spot check where you show the `.s` body next to both labels, so the derivation is auditable rather than asserted.

### q-shape-rate-reconcile — the bulk classifier and the sweep sample disagree 5x [DONE]

`q-main-shape-reclassify` (#1486) reports **29/1,247 = 2.33%** disagreement among rows with live `.s` bodies. `cm-main-tier-sweep-3` (#1483), sampling independently at pull time, measured **11/100 = 11%** in its dispatched pool. Both were mechanical, both are internally consistent, and they differ by roughly 5x. One of them does not describe the population it appears to describe, and the campaign has been steering on shape for three waves — so it is worth an hour to know which.

Reconcile it. Candidate explanations to test rather than assume:

- **Population**: sweep-3 dispatched only from the 0x02040000+ range and only from candidates surviving its own filters. Is disagreement concentrated in that range or in that filtered subset? Compute your rate restricted to sweep-3's exact 100 addresses and compare directly against its per-candidate record — that is the apples-to-apples number and it settles most of this on its own.
- **Rule divergence**: your classifier and sweep-3's pull-time derivation are two implementations. Where they disagree on the same address, which is right? Read the `.s` and say.
- **The 393 missing-body rows**: those are rows whose `.s` has since been converted. Confirm they are excluded from both denominators rather than silently inflating one.

Deliverable: the same-population comparison, a per-address disagreement list for sweep-3's 100, and a plain statement of which rate describes what. If the honest answer is "both are right about different populations", say that and give the two scopes precisely — that is a useful result, not a non-answer.

⚠️ Run `npx markdownlint-cli2 --fix` on any doc you write before committing. #1486 needed 13 auto-fixes (MD022/MD031) and the brain applied them for you; that is a required check and it blocks the merge.

Effort: **MEDIUM**.

**Gate:** doc-only — `python -m pytest -q tests` green (paste the real pytest tail) + the same-population comparison table + the per-address list + the scope statement.


### q-shape-classifier-bicne — `branch_kind()` counts predicated data-processing ops as branches [DONE]

`q-shape-rate-reconcile` (#1492) settled the 2.33%-vs-11% question cleanly and its population test reproduces to the address. While verifying it, a **live bug in `tools/main_shape_reclassify.py`** surfaced that the reconcile itself missed.

`branch_kind()` ends with a catch-all along the lines of `if base.startswith("b") and base not in {"bic","bics"}: return "conditional"`. The exclusion list covers the bare mnemonics but **not their predicated forms** — so `bicne` (a data-processing op) is counted as a conditional *branch*. At `0x0209e628` that tips the body from three real conditional exits (`bxne lr`, `bxeq lr`, `bxne lr`) to four, crossing the small-dispatcher threshold and deriving `small dispatcher` where the true shape is `guard chain`. Sweep-3's pull-time tool got this one right; the bulk classifier did not.

Fix the predicate handling properly rather than extending the literal exclusion list: strip a trailing condition code before classifying, and decide on the *base* mnemonic. `bic`/`bics`/`bicne`/`biceq`/… must all classify as data-processing; only real branch mnemonics (`b`, `bl`, `bx`, `blx`, plus their predicated forms) are branches. Then re-run the bulk classification and report how many of the 1,640 rows change — the brain's measurement says the blast radius is small (2 rows, 0.17 pt on the bulk rate), so confirm or correct that.

**Also amend #1492's reconcile doc**, which is now slightly wrong on the record: it states sweep-3 "did not persist a per-candidate derived-shape field for its 57 shipped rows" and uses that to explain why only one implementation-vs-implementation disagreement was adjudicated. Sweep-3's five batch commit messages DO name their disagreements, which is how `0x0209e628` was found. Correct the claim and adjudicate the second address.

Effort: **LOW-MEDIUM**. Tooling budget: catches a demonstrated misclassification in a tool three waves have used as a reference.

**Gate:** `python -m pytest -q tests` green (paste the real pytest tail) + `ruff check` clean + a regression pinning `bicne` (and at least one other predicated data-processing op) as NOT a branch + the before/after row-change count over the 1,640 + the corrected paragraph in the reconcile doc.

### q-park-class-normalisation — one wall family, three spellings, no controlled vocabulary [PARKED]

> PARKED: superseded by q-park-class-remap: PR #1505 is held (cardinality assertions vs a live ledger); the rework item carries the full diagnosis

`q-shape-classifier-bicne` (#1500) is merged and it is clean work. The brain
re-ran your corrected classifier against the unmodified one on the same tree and
reproduced your blast radius **exactly**: 2 of 1,640 rows change label, both
`guard chain` to `other`, live-body disagreements 28 to 30. Your condition-code
stripping is also correct on the cases that matter — `bicne`/`bicsne` are
data-processing, `bne`/`blne`/`blxeq`/`bxne` stay branches, and bare `b`/`bl`/`blx`
keep their unconditional labels. You also amended the reconciliation to withdraw
the earlier too-strong claim and adjudicated `0x0209e628` into the table. That
self-correction is the part worth naming.

**THE NEXT PROBLEM IS UPSTREAM OF EVERY WALL-BASED DECISION THE CAMPAIGN NOW
WANTS TO MAKE.** `attempts.tsv`'s `park_class` column is free text and has drifted
badly. In `cm-main-tier-sweep-7`'s 108 rows alone there are **~70 distinct
`park_class` values**, and the round's own doc admits three of them are one
family:

- `register-numbering-permutation-cascade` (x2)
- `register-numbering-permutation-cascade-P36-adjacent` (x4)
- `P-30-adjacent-register-choice` (x3)

The same round also carries `reg-alloc` (x10), `register-allocation-scheduling`
(x3), `large-diff-register-realloc` (x6), `reg-alloc-instr-scheduling`,
`reg-alloc-preamble-mismatch`, `reg-alloc-stack-footprint-mismatch` (x2),
`extra-2-register-cascade` and `register-reuse-preference` — plausibly a handful
of real families wearing a dozen names. Meanwhile
`docs/research/codegen-walls.md` holds a formal numbered catalog (`C-NN` / `P-NN`,
now through P-51) that most of these rows never reference.

**The CC Decomper is building a wall-family detector this round and the campaign
is about to start selecting on wall family. It cannot work on free text.**

**THE ITEM — three deliverables, and one hard constraint.**

1. **A controlled vocabulary** mapping to the formal catalog in
   `docs/research/codegen-walls.md`. Every canonical family gets its `C-NN`/`P-NN`
   anchor where one exists, and a named provisional family where one genuinely
   does not yet. Derive it from the data, not from taste: enumerate all distinct
   `park_class` values across the full ledger first, then cluster.
2. **A normaliser** (`tools/normalise_park_class.py` or similar) that maps any
   existing free-text value to a canonical family, with its mapping table as
   reviewable data rather than buried regexes.
3. **A family census** over the whole ledger: rows per canonical family, and how
   much of the parked population the top families account for. That number is the
   actual input to any wall-filtered targeting decision.

⚠️ **HARD CONSTRAINT — DO NOT MODIFY `attempts.tsv` THIS ROUND.** Not one row,
not one column. Two reasons. First, provenance: the raw tag a lane wrote is
evidence and must not be overwritten by a derived label — the eventual shape is a
NEW `park_family` column beside the untouched `park_class`, landing in a later
round. Second, collision: the Codex Scaffolder is adding rows to that exact file
this round under `q-ledger-ship-coverage`, and a column addition against
concurrent row additions conflicts textually. Deliver the tool, the vocabulary
and the census report; the ledger edit is sequenced after their work merges.

CANARY, both directions, pasted before the wider run:

- The three permutation-cascade spellings above must normalise to **one** family.
- `C-32` and `C-32-cross-overlay-bl` must both normalise to **C-32** while the
  qualifier survives somewhere inspectable — a normaliser that silently discards
  `cross-overlay-bl` has destroyed the distinction that made that row useful.
- At least one pair that looks similar but must NOT merge, chosen and justified
  from the data (e.g. a scheduling-only P-36 diff vs a register-choice diff —
  these have different fixability and must not collapse into one bucket).

**Gate:** `python -m pytest -q tests` green — paste the real pytest tail — plus
`ruff check` clean, a regression per canary case, the full distinct-value
enumeration with counts, the canonical-family census, and an explicit statement
of how many distinct raw values collapsed into how many families. Run
`npx markdownlint-cli2 --fix` on any doc before committing.

ONE PR; verify every PR-body claim against `git diff --stat`; `python
tools/work_queue.py done codex-decomper q-park-class-normalisation`; commit;
report the PR number with the pasted artifacts.

### q-park-class-remap — finish the normaliser: scope the invariant, kill the counts, map the 8 new values [DONE]

`q-park-class-normalisation` (#1505) is **held, not merged** — the work is good
and the brain wants it, but it cannot survive its own campaign's ledger growth.
Read this before reworking: the tool, the 283→91 mapping and all three canary
cases were **correct**, and holding the `attempts.tsv` constraint is exactly
why PR #1506 could append 303 rows to that file with zero conflict. Rebase onto
current `origin/main` and fix three things.

1. **Kill the cardinality assertions.** `test_every_ledger_value_has_a_reviewed_mapping`
   asserts `report["rows"] == 1164`, plus `raw_distinct == 283`,
   `family_distinct == 91` and `parked_rows == 744`, against a **live,
   append-only** ledger. #1506 (+303 backfilled) and #1508 (+48) took it to
   **1,547** in the same round and the consolidated gate went red. This is the
   identical defect `q-validator-brittleness` (#1499) removed from
   `test_validate_attempts.py` one round earlier — **assert the property, not
   the count.** Print the census for visibility; do not assert it.
2. **Scope the invariant to parked rows.** `all(row["park_class"] in mapping)`
   is wrong as written, and the data proves it: `''` (303 rows) and `n/a` (48
   rows) are **all `result=shipped`**. A shipped row has no park class — the
   empty value is there because the brain instructed #1506 to leave it empty
   rather than guess. Scope the check to `result=parked` with a non-empty
   `park_class`, so correct data stops reading as a gap.
3. **Map the 8 genuinely-new values**, all from `cm-main-wall-filtered-sweep-1`
   parks. Six are bare catalog anchors — `P-4`, `P-17`, `P-20`, `P-36`, `P-42`,
   `OQ-1` — and want a general **identity rule** for anchor-shaped values, not
   six hand-written rows (`C-32` already proves the anchor case; make it
   systematic so the next round's anchors map themselves). Two need real
   taxonomy judgment and are yours to make, with reasoning: `strength-reduction`
   and `tool-anomaly`. The brain deliberately did **not** guess these at merge.

⚠️ **The mapping table must not need hand-editing every round.** If your rework
still requires a new row per new anchor, it will rot exactly as fast as the
counts did. Design for the arrival of unseen values: anchors map themselves,
genuinely-new free text is reported as an explicit "unmapped" list the round can
act on, and the test fails only on the latter.

⚠️ **Both runners.** The CI `unittest` job runs `python -m unittest discover -s tests`
with NO third-party packages installed. A test module that does `import pytest`
fails it outright with `ModuleNotFoundError` even when `pytest -q tests` is green
— that exact defect shipped in #1506 and the brain fixed it at merge.

CANARY, pasted before the wider run: re-run the census against **current**
`origin/main` and paste the four numbers it now produces (they will not be
1164/283/91/744). Then paste the unmapped-value list and show it contains
exactly the 8 parked values above — no `''`, no `n/a`. If your scoping still
surfaces those two, the scope fix is wrong.

**Gate:** `python3.13 -m pytest -q tests` green (paste the real pytest tail) AND
`python3.13 -m unittest discover -s tests` green (paste its `Ran N tests` and
`OK` lines) + `ruff check` clean + a regression proving the suite still passes
when N new ledger rows are appended (construct them; that is the whole point) +
a regression proving a genuinely-unmapped free-text value still FAILS loudly +
the three original canary cases still passing.

ONE PR; verify every PR-body claim against `git diff --stat`; `python3.13
tools/work_queue.py done codex-decomper q-park-class-remap`; commit; report the
PR number with the pasted artifacts.

### q-cascade-ci-quadratic — three PR-CI tools rebuild per-target what they should index once [DONE]

External audit lead (2026-08-14, external read-only pass), brain-verified live on
`main` twice — at `b1015c872` and again at `fcb39a4c2` — so this is not a stale
premise. Three analysis tools that run in **PR CI** carry per-target full-graph
rescans, measured at roughly 78 s of CI wall per triggering PR, and the common
result is now zero rows (EUR is at 9,837/9,867 functions matched).

1. **`tools/find_mega_cascades.py`** — `mega_cascade_for_target` (lines 164-191)
   builds the `callers_of` reverse index over all of `graph.edges_call` *inside*
   the per-target body. Its own comment says "Invert `graph.edges_call` once" —
   it inverts once per **call**. `rank_mega_cascades` (245-273, call site 266)
   calls it once per placeholder symbol. Measured 67.5 s wall for a zero-result
   run. Fix: build `callers_of` once in the rank driver and pass it down. Keep
   the single-target CLI path working (build it there too, once).
2. **`tools/find_cascades.py`** — `cascades_for_target` (146-174) rescans the
   full `graph.edges_call.items()` per target with no index at all. Brain
   re-measured on Mac: **10.36 s wall, 0 results** (`--version eur --top 5`).
   Same fix shape.
3. **`tools/propagate_template.py`** — `relocs_for_function` (134-149) linear
   scans the whole module reloc list per symbol; `find_pattern_clusters.py` and
   `pattern_library.py` each call it once per symbol (measured 10.8 s on `main`:
   4,138 funcs × 27,401 relocs). Fix: pre-sort each module's relocs by
   `src_addr` once, then `bisect` the symbol range per call.

**Why this is worth a slot:** `.github/workflows/cascades-diff.yml` and
`mega-cascades-diff.yml` fire on every PR touching `config/**/symbols.txt`, and
`pattern-clusters-diff.yml` on `delinks.txt` changes — essentially every
conversion PR this campaign ships pays this cost.

⚠️ **OUTPUT-IDENTITY GUARD — this is the gate's core.** These tools' outputs
feed CI diffs. Before and after the restructure, run each tool on the same `eur`
snapshot; the emitted artifacts (`cascades.md`, the mega equivalent, the
pattern-clusters output) must be **byte-identical**. Tie-ordering is the trap:
dict/set iteration order must not leak into output ordering. Add a regression
per tool pinning output equality on a small fixture graph. Do **not** add timing
assertions (flaky) — report measured before/after wall times in the PR body.

Effort: **LOW-MEDIUM**. Build-free: pytest + ruff only.

**Gate:** `python -m pytest -q tests` green (paste the real pytest tail) +
`ruff check` clean + the byte-identity demonstration for all three tools (paste
the `cmp`/sha of before-and-after artifacts) + before/after wall times pasted
from a real timing run.

ONE PR; verify every PR-body claim against `git diff --stat`; `python
tools/work_queue.py done codex-decomper q-cascade-ci-quadratic`; commit; report
the PR number with the pasted artifacts.

### q-park-family-column — add the derived `park_family` column now that both blockers have merged [DONE]

`q-park-class-remap` (#1511) is merged and the sequencing it was waiting on is
now clear on both sides: the normaliser exists, and `q-ledger-ship-coverage`
(#1506) has finished appending its 303 backfilled rows. The original
normalisation item deferred the ledger edit explicitly — *"the eventual shape is
a NEW `park_family` column beside the untouched `park_class`, landing in a later
round"* — because a column addition against concurrent row additions conflicts
textually. **Both merged. This is that later round.**

Add `park_family` to `docs/research/campaign-analytics/attempts.tsv` as a
**derived** column, populated by `tools/normalise_park_class.py`.

Hard rules, all of them provenance rules:

- **`park_class` is evidence and is never overwritten.** The raw tag a lane
  wrote stays byte-identical. `park_family` sits beside it.
- **Regenerable, not hand-maintained.** Provide a `--write` mode (or equivalent)
  that recomputes the whole column from `park_class` deterministically. Running
  it twice must be a no-op — prove that with a test.
- **Shipped rows get an empty `park_family`**, matching the scoping already
  established: a shipped row has no park class, so it has no family either.
  `''` and `n/a` must not acquire one.
- **`UNCLASSIFIED:` and `PROVISIONAL:` families carry through verbatim.** Do not
  quietly promote a provisional family to a formal anchor.

Then make `park_one.py` and `record_shipped.py` write the new column on new
rows, so the ledger does not immediately start drifting again — a derived column
that only a manual tool run maintains is a column that goes stale by round 3.

**Gate:** `python3.13 -m pytest -q tests` green (paste the real pytest tail) AND
`python3.13 -m unittest discover -s tests` green (paste `Ran N tests` and `OK`) +
`ruff check` clean + an idempotence test (regenerate twice, assert byte-identical)
+ a test that a new `park_one.py` park lands with a correct `park_family` + the
row count before and after, proving no rows were added or lost + `git diff --stat`
showing `park_class` values unchanged (diff the column in isolation and say so).

ONE PR; verify every PR-body claim against `git diff --stat`; `python3.13
tools/work_queue.py done codex-decomper q-park-family-column`; commit; then take
the next queue item immediately.

### q-metric-canon-guard — stop "unmatched functions" being read as campaign completion [DONE]

`q-toolchain-repin-eval` (#1512) delivered a genuinely useful census as an
incidental finding: **30 unmatched functions remain project-wide** (18 `ov004`,
10 ITCM stubs, 4 overlay-swap residues), derived by `objdump -t` over every
`_dsd_gap@*.o` in the EUR build. The number is real and the method is sound.

**Its framing is not, and the brain caught it at merge.** The doc says the
project is *"materially closer to done than the historical docs suggest"* and
suggests *"a headline update somewhere in the campaign tracking"*. Acting on
that would badly misrepresent campaign state. A `.s` file is **byte-matched by
construction** — that is precisely why `ninja sha1` passes with 4,642 of them
still shipped in the EUR baseline — but it is **not decompiled C**, and this
campaign's headline is natural-C, currently **~16.5% EUR / 11.84% USA**. "30
unmatched" measures *delink gaps*, a different axis entirely.

Two deliverables:

1. **Correct the record in place.** Amend
   `docs/research/q-toolchain-repin-eval.md` so the census keeps its value and
   loses the completion framing: state plainly what `_dsd_gap` unmatched counts
   and what it does not, and cross-reference the metric canon. Do not delete the
   finding — it is good work and the 30-function pool is a real, small,
   closeable target. Reframe it.
2. **Make the confusion mechanically hard to repeat.** `docs/state-table.md`
   already warns that `C-decompiled` must not be conflated with natural-C. Extend
   that discipline: a check (test or lint) that fails when a doc presents a
   function-count completion claim without naming which axis it measures. Design
   this narrowly enough that it does not fire on ordinary prose — a check that
   cries wolf gets switched off, which is the lesson `q-validator-brittleness`
   already paid for. If you conclude a mechanical check cannot be made precise
   enough to be worth it, **say so with your reasoning and deliver only item 1** —
   that is an acceptable, reportable outcome, not a failure.

**Gate:** `python3.13 -m pytest -q tests` green (paste the real pytest tail) AND
`python3.13 -m unittest discover -s tests` green (paste `Ran N tests` and `OK`) +
`ruff check` clean + the corrected paragraph quoted in the PR body + the
independently re-derived count of `.s` files still shipped in `src/` (the brain
gets 4,642 for the EUR baseline — confirm or correct it) + if you build the
check, a test proving it does NOT fire on three ordinary existing docs.

ONE PR; verify every PR-body claim against `git diff --stat`; `python3.13
tools/work_queue.py done codex-decomper q-metric-canon-guard`; commit; then take
the next queue item immediately.

### q-wall-citation-backfill — the wall catalog and the `.s` headers disagree, and the tool trusts the headers [DONE]

`wall_aware_headroom.py` decides "permanent" by reading each `.s` file's **own
header citation**. `codegen-walls.md` records wall membership in per-wall
`**Affected picks**` lists. These two are supposed to agree. They do not.

`cm-main-exploit-drain-1` (#1524) grepped its 100 dispatch candidates' bare
addresses against every `**Affected picks**` line before freezing the partition
and caught **2 real misses** — `func_ov002_02212bc4` (a documented P-25 member)
and `func_ov002_0224b01c` (P-21) — both of which `wall_aware_headroom.py` was
happily reporting as fresh candidates because their `.s` headers were never
backfilled with the citation. In a 100-candidate sample. Nobody has ever run that
check project-wide.

**Do the project-wide cross-check, then backfill.**

1. Build the cross-check as a committed tool (or a subcommand of an existing one
   — the tooling budget applies, state which clause it satisfies). For every
   address cited in any wall entry's affected-picks list, determine whether a
   live `.s` for that address in that **module** exists and whether its header
   cites the wall it is catalogued under.
2. **Report the real number.** A crude, module-naive, prose-inclusive scan by the
   brain returns an upper bound of ~264 hits — that number is **not** a target
   and it is **not** evidence. It counts cross-region duplicates
   (`src/usa/main/...` alongside `src/main/...`) and any address that merely
   appears in prose as though it were a pick. Your properly module-scoped,
   affected-picks-scoped count is the real one and it will be smaller. If it
   comes out at 12 or at 200, report what you got.
3. Backfill the missing citations into the `.s` headers. **Header comment lines
   only — not one byte of emitted code changes**, and your PR must demonstrate
   that, not assert it (`git diff` showing only comment-prefixed lines is the
   cheap proof).
4. Where the catalog is the thing that is wrong — an address listed under a wall
   whose live `.s` shows nothing of that wall's signature — **say so and do not
   backfill it.** #1524 retracted `func_ov002_02253304` from P-23 for exactly
   this reason and downgraded the wall confirmed -> tentative. A wrong catalog
   entry is a defect to report, not a header to manufacture (AGENTS.md control 9).

⚠️ **Partition, to avoid colliding with the CC Decomper this round.** That lane
is draining these 32 addresses and will be deleting their `.s` files:

```
0x020896cc 0x0208a5e4 0x0209c280 0x0224b1e0 0x02250d9c 0x02251104 0x02251bb0
0x02251ec0 0x022527b8 0x02291160 0x02294478 0x02295efc 0x02296240 0x0229d258
0x022ae2e0 0x021cbdf4 0x021abb08 0x021afbac 0x021b2b08 0x021b3ea0 0x021b3f50
0x021b4194 0x021b6b58 0x021b2644 0x021b3ecc 0x021b3f98 0x021b43a8 0x021b61dc
0x021b6774 0x021aa4a0 0x021ab330 0x021ab3f0
```

Do not edit those files. `0x02212bc4` (P-25) and `0x0224b01c` (P-21) are
explicitly **yours** — they are the two #1524 found, the CC Decomper has been
told to leave them alone, and they are the natural canary for this item.

**Canary (brain-verified runnable on this machine, 2026-08-22 — run it BEFORE
you touch anything, and again after):**

```
python tools/wall_aware_headroom.py --json --exclude-attempted --max-size 192   | grep -oE '"[^"]*(02212bc4|0224b01c)[^"]*"' | sort | uniq -c
```

Right now that prints exactly four lines, count 2 each — the two addresses and
their two `.s` paths, 8 matching strings in total. **After your backfill it must
print nothing.** Paste both runs. Note `--coercible` will NOT show them: both
files are in the `unknown` bucket, which is the whole point — the tool has no
citation to read, so it reports them as fresh candidates.

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean + the before/after
canary above + `git diff` demonstrating only comment-prefixed lines changed in
`src/`. This worktree is build-free — the brain runs the 3-region ROM gate at
integration.

### q-batch-sha1-stale-s — the apply step leaves the superseded `.s` on disk, silently [DONE]

Reported as a defect by `cm-main-exploit-drain-1` (#1524), confirmed **twice** in
one round, in two different situations:

- once when the `.s` had been pre-restored from `HEAD` as a bisection safety net
  — the flip only rewrites `delinks.txt`'s text and never touches the file;
- once as a partial self-heal — 13 of 14 stale siblings cleaned automatically,
  the 14th (a `.legacy_sp3.c`-suffixed file) left behind.

Both are **silent**. `git status` shows a clean add-only diff. Nothing surfaces
until a later `configure.py` regeneration dies with `multiple rules generate X`.
PR #1524 only caught them because it hand-verified all 73 shipped files
file-by-file before committing, which is not a control that scales.

Reproduce both shapes at unit level, fix the apply step so a flip that activates
`X.c` cannot leave `X.s` (or `X.legacy.s` / `X.legacy_sp3.s`) on disk, and add a
regression test per shape. **Show the tests red first** (AGENTS.md control 7) —
paste them failing against the current code before your fix, then green after.
A test you cannot show red is narrow-case and is not trusted.

Note the suffix handling is where the second case lived: the self-heal matched
plain-stem siblings and missed the `.legacy_sp3.c` one. Cover every tier suffix
the project actually ships (`.c`, `.legacy.c`, `.legacy_sp3.c`).

**Gate:** `pytest -q tests` + `unittest discover -s tests` both green (paste real
tails) + `ruff check` clean + the two red-then-green transcripts. Build-free.

### q-fastmatch-error-masking — a crashed objdump is reported as "no functions in compiled .o" [DONE]

Also from #1524, and it cost that round real time. A freshly downloaded
`arm-binutils` produced an `arm-none-eabi-objdump` that **crashed on launch**
(`Library not loaded: @rpath/libzstd.1.dylib`, macOS). `fastmatch.py` swallowed
that crash and reported `"no functions in compiled .o"` — which reads exactly
like a real compile failure, and sends the reader off debugging their C.

Two separable things; do both:

1. **Stop masking the error.** `fastmatch.py` must distinguish "objdump failed to
   run" (non-zero exit / empty output / missing binary) from "objdump ran
   successfully and the `.o` genuinely contains no functions". Surface the real
   stderr in the first case. This is platform-independent and unit-testable with
   a stub binary — no baserom needed.
2. **Report, don't fix, the dependency itself.** The missing `libzstd.1.dylib` is
   a macOS packaging problem in the upstream release, worked around per-worktree
   by copying Homebrew's copy into `tools/arm-none-eabi/libexec/` (which is
   gitignored, so it recurs on every fresh worktree bootstrap). Record it in the
   right place — a `download_tool.py` post-download sanity check that *verifies
   the downloaded binary actually runs* is in scope and is the durable fix; a
   silent auto-install of somebody else's dylib is not. If you judge the check
   belongs elsewhere, say where and why.

**Gate:** `pytest -q tests` + `unittest discover -s tests` green + `ruff check`
clean + a test that shows the old behaviour would have reported "no functions"
for a deliberately-broken objdump stub and the new behaviour reports the launch
failure. Red-first, per control 7. Build-free.

### q-worktree-gc — safe, repeatable cleanup of stale sweep worktrees [DONE]

The Windows PC has accumulated 20+ registered worktrees from finished sweeps
(`wfs1-batch1..5`, `sweep17-batch*`, `fix-14xx`, the codex-port series), all on
long-merged branches, plus a second population of ORPHANED directories that look
like checkouts but are no longer registered with git at all. The Mac
accumulates the same. Manual cleanup happened in round 0822b; this item makes it
repeatable and safe, because ad-hoc `rm -rf` of a directory that MIGHT hold
unpushed work is exactly the kind of destructive shortcut this project bans.

Build `tools/worktree_gc.py`:

1. Read `git worktree list --porcelain` and classify every entry:
   - **KEEP** — a standing lane worktree. The keep-set is the five standing
     names (`brain`, `decomper`, `scaffolder`, `kb-map`, `kb-types`) plus
     anything passed via `--keep`; match on basename, not full path, so the
     same tool works on the Mac layout.
   - **REMOVABLE** — branch fully merged into `origin/main` (verify with
     `git merge-base --is-ancestor`, not name-matching), working tree clean
     (`git -C <wt> status --porcelain` empty), not locked.
   - **HELD** — dirty tree, unmerged branch, or locked: report with the reason,
     never touch.
2. Default mode is REPORT ONLY. `--prune` executes `git worktree remove`
   (never `--force`) on REMOVABLE entries and prints each removal.
3. Directories under the repo parent that look like worktrees but are NOT
   registered (stale checkouts whose metadata was pruned): REPORT with path and
   size, never delete. A human deletes those, with the report in hand.

Unit-test against synthetic temp repos (create real worktrees with subprocess
git; no baserom needed). Show the dangerous cases red-first: a dirty worktree
and an unmerged branch must both classify HELD even when `--prune` is passed —
demonstrate the test failing against a deliberately-broken classifier before
your fix, per AGENTS.md control 7. Tooling budget clause: catches a
demonstrated failure class (destructive cleanup of possibly-unpushed work) and
measurably cuts cycle time (round 0822b's manual audit of 20+ worktrees).

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean + a real
REPORT-mode run on this machine pasted (it should classify the five standing
worktrees KEEP). Build-free — fits kb-map.

ONE PR; verify every PR-body claim against `git diff --stat`; `python
tools/work_queue.py done codex-decomper q-worktree-gc`; commit; then take the
next queue item immediately.

### q-ledger-effort-column — the ledger cannot measure the thing that broke last round's headline [DONE]

`cm-main-exploit-drain-2` (#1536) reported **0/40** on the 193-256 B band, then
disclosed in prose that Part 2 candidates got roughly **one** fastmatch attempt
each against Part 1's **2-4**. That disclosure is the only reason the number
wasn't spent — and it survived purely because one lane chose to write it down.
The brain could partly reconstruct the picture from `match_pct` distributions,
but only partly, and `match_pct` is itself a free-text field the agent supplies.

**The ledger has ten columns and not one of them records effort:**

```text
addr  module  text_size  tier  shape  result  match_pct  park_class  park_family  brief
```

So "how hard did we actually try?" is structurally unmeasurable across 1,715
rows, and every ship-rate this campaign quotes silently assumes constant effort
per candidate. It has not been constant, and we now know of at least one round
where it wasn't.

**Add an `attempts` integer column** (draft-compile/fastmatch iterations for
that candidate in that brief) and wire it through **both** recorders —
`park_one.py` and `record_shipped.py`. Requirements:

1. **Append-safe.** `attempts.tsv` is a live, append-only, 1,715-row artifact
   that three lanes write concurrently. Adding a column must not invalidate a
   single existing row. Existing rows have no value: leave them **empty**, do
   NOT backfill a guess — an invented 1 is worse than a blank, and the
   `-backfilled` provenance convention from `q-ledger-ship-coverage` is the
   precedent for how absence gets recorded.
2. **Default is empty, not zero.** Zero means "tried zero times", which is a
   real and different claim from "not recorded".
3. `validate_attempts.py` accepts blank, rejects non-integer, and does **not**
   assert any cardinality (0-for-3 class; the merged AST guard from #1530 will
   fail your PR if you hardcode repo-state constants).
4. Update the ledger's own schema documentation in the same PR.

**Canary:** record one parked and one shipped row with `attempts=3`, read both
back, and show a pre-existing row still validating with the column blank. Paste
all three.

**Tooling budget:** catches a demonstrated failure class — the round-0822c
confound, which cost a full 40-candidate experiment.

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean + the canary.
Build-free.

ONE PR; verify every PR-body claim against `git diff --stat`; `python
tools/work_queue.py done codex-decomper q-ledger-effort-column`; commit; then
take the next item immediately.

### q-ledger-contradiction-audit — 57 addresses appear more than once; find out which are real [DONE]

Brain measured on `main`: **1,655 distinct `(module, addr)` pairs across 1,715
rows — 57 pairs appear more than once.** `attempts.tsv` is an EVENT log by
design (`q-ledger-event-semantics` established that a second event is legal), so
repeats are expected: park-then-ship is the normal life of a candidate that a
later round cracked. But nobody has ever checked which of the 57 are legitimate
sequences and which are contradictions.

Classify every one of the 57:

- **Legitimate** — e.g. `parked` in an early brief, `shipped` in a later one;
  or two parks with different `park_class` from genuinely different attempts.
- **Contradictory** — `shipped` twice; `shipped` then `parked` with no
  intervening re-attempt (a ship that silently regressed, or a mis-recorded
  row); or two rows in the **same** brief with different `result`.
- **Ambiguous** — say so and show the rows rather than forcing a call.

Then add the audit as a check that runs over the live ledger. ⚠️ Assert the
SHAPE of a contradiction, never the count — 57 will change next round and a
hardcoded 57 is exactly the class the merged guard rejects.

**Watch for the trap this campaign already hit once:** an apparent contradiction
may be a *module-key* artifact rather than a real one — the same address can
exist in `main` and in a region-specific tree, and `_normalise_attempt_addr` /
the selector's module key have crossed before. Check that before calling
anything contradictory.

**Tooling budget:** catches a demonstrated failure class (ledger integrity is
what every ship-rate in the campaign rests on).

**Gate:** pytest + unittest green (paste both tails) + `ruff check` clean + the
full 57-row classification pasted with counts per bucket. Build-free.

ONE PR; verify claims against `git diff --stat`; `work_queue.py done`; next item.

### q-tentative-wall-audit — nine walls are stuck at "tentative" and the evidence to settle some may already exist [DONE]

`codegen-walls.md` currently carries **nine** LIVE-tentative walls: P-23, P-24,
P-28, P-29, P-30, P-33, P-34, P-35, P-37. The catalog's own convention promotes
tentative → confirmed at **n=3** members. Every sweep since has been recording
parks with `park_class` values that name these families — so for at least some
of them, the third member may already be sitting in the ledger, unclaimed.

This is a **read-only reconciliation**, not new decomp work: for each of the
nine, cross-reference the catalog's affected-picks list against every
`park_class` / `park_family` value in `attempts.tsv`, and report per wall:

- current cited member count,
- ledger rows that name the family but are NOT in the catalog's list,
- whether that pushes it to n>=3 (→ **promote**, with the evidence),
- or whether the ledger rows are actually a *different* symptom wearing the same
  tag (→ say so; do NOT promote on a tag match alone — read the rows).

**P-23 is the cautionary case and must be handled explicitly:** it was
*downgraded* confirmed→tentative in #1524 when `func_ov002_02253304` shipped
clean via an unrelated fix, dropping it to n=2. A tag-match promotion that
ignores that history would silently undo a correction the campaign paid for.

Where the evidence genuinely isn't there, say "still n=2, needs a real
attempt" — an honest short list of what remains unprovable is the deliverable
just as much as any promotion.

**Tooling budget:** directly ships bytes downstream — every confirmed wall
sharpens `wall_aware_headroom.py`'s exclusion and stops future sweeps burning
attempts on known-dead candidates.

**Gate:** pytest + unittest green + `ruff check` clean + the nine-wall table
pasted. If you commit a promotion, `codegen-walls.md` carries the evidence
inline. Build-free.

ONE PR; verify claims against `git diff --stat`; `work_queue.py done`; next item.

### q-park-class-drift-guard — new raw park_class values appear every round and are caught by hand [DONE]

`tools/park_class_map.tsv` is the controlled vocabulary `q-park-class-remap`
(#1511) established. It works, but it is maintained reactively: #1524 had to add
three entries mid-round (`P-20-family`, `address-fold`, `scheduling-diff`), and
PR #1536 added two more (`P-20-row-offset`, `P-23-tentative`). Each time the lane
discovered the gap by watching its own test suite go red *after* the parks were
already written.

Make it a pre-commit-visible check instead of an after-the-fact failure: flag
any `park_class` in the live ledger with no mapping entry, name the rows that
introduced it, and suggest the closest existing family by string distance
**without auto-adopting it** — the taxonomy call stays human. A lane should be
able to run one command before opening its PR and see "you introduced 2 new raw
values; here they are".

⚠️ Do not auto-map. `q-park-class-remap` deliberately refused a wall family for
`tool-anomaly` because it records a tooling discrepancy, not a codegen wall.
An auto-mapper would have got that wrong, and a wrong mapping is invisible
downstream in a way a missing one is not.

**Tooling budget:** measurably cuts cycle time (removes a recurring mid-round
red) and catches a demonstrated failure class (five unmapped values across two
rounds).

**Gate:** pytest + unittest green + `ruff check` clean + a demonstration on a
deliberately-introduced fake value, shown flagged and then shown clean after
mapping. Build-free.

ONE PR; verify claims against `git diff --stat`; `work_queue.py done`; next item.

### q-ledger-analytics-tool — commit the analysis that saved last round's headline [TODO]

Reviewing #1536, the brain wrote throwaway Python to bucket park `match_pct` by
brief, and it changed the round's conclusion:

```text
Part 1 (<=192B tail, 2-4 attempts):  n=27  median 17.8%  >=85%: 2   <50%: 19
Part 2 (193-256B, ~1 attempt):       n=40  median 12.9%  >=85%: 1   <50%: 36
```

That distribution is what separated "under-iterated" from "genuinely hard" — a
pile of high-percentage near-misses would have meant the first, and it isn't
there. The analysis then evaporated into a chat message.

Commit it as `tools/ledger_analytics.py`: given a brief filter (or a pair of
briefs to compare), emit per-group n, median/mean `match_pct`, the count at
`>=85%` / `>=75%` / `<50%`, the `park_class` breakdown, and shipped bytes.
Comparison mode should print both groups side by side, because the comparison is
where the signal was.

**State the caveat in the tool's own output, not just its docs:** `match_pct` is
agent-reported (`park_one.py` takes it as a free-text argument), so it is
evidence, not proof; a comparison is only meaningful when both groups were
recorded by the same lane under the same convention. A tool that prints
authoritative-looking statistics over a self-reported field must say so on every
run. Once `q-ledger-effort-column` lands, group by `attempts` too — that turns
the inference into a measurement.

**Tooling budget:** consolidates duplicated infrastructure (the brain re-derives
this by hand every review) and catches a demonstrated failure class.

**Gate:** pytest + unittest green + `ruff check` clean + the tool reproducing
the two-row table above from the live ledger (state your commit; the numbers
move as lanes append). Build-free.

ONE PR; verify claims against `git diff --stat`; `work_queue.py done`; next item.

### q-walls-catalog-index — 13,561 lines with no way in [TODO]

`docs/research/codegen-walls.md` is **13,561 lines**. It is the campaign's most
load-bearing document — every sweep consults it, `wall_aware_headroom.py`
depends on its citations, and #1524 found two members catalogued in it that the
tooling could not see. It has no index.

Generate one (`tools/generate_walls_index.py`, written into the document or a
sibling): every P-NN and C-NN with its status (LIVE / tentative / retracted),
member count, one-line symptom, and line anchor. Derive all of it from the
document — do not maintain a parallel hand-written list, which would drift
within one round.

Add the freshness guard the same way `docs/state-table.md` does it: a stale
committed index fails the suite. **Mirror that existing mechanism rather than
inventing a new one**, and assert shape, not counts.

**Tooling budget:** measurably cuts cycle time — every wall lookup today is a
grep through 13.5k lines, and mis-citation has already cost this campaign real
attempts.

**Gate:** pytest + unittest green + `ruff check` clean + markdownlint clean on
the generated file + the freshness guard shown RED against a deliberately-stale
index. Build-free.

ONE PR; verify claims against `git diff --stat`; `work_queue.py done`; next item.

### q-worktree-gc-mac-parity — the tool you just shipped has an unverified half [TODO]

`tools/worktree_gc.py` (#1540) is correct on Windows: the REPORT canary
classified all five standing worktrees KEEP, reported four orphan directories,
and removed nothing. Its keep-set matches on basename specifically so the Mac
layout works too — but no Mac has ever run it, so that half is **asserted, not
verified**, and this project has been burned by exactly that asymmetry before
(the round-0817 "three missed rounds" misread, and #1520's machine-local SHA).

Make the Mac path testable without a Mac: drive the classifier over a synthetic
worktree tree laid out in the Mac convention
(`~/Dev/spirit-caller/{brain,decomper,scaffolder,codex-decomper-queue,codex-scaffolder-queue}`)
and assert the same KEEP/REMOVABLE/HELD outcomes. The Mac lane names differ from
the Windows ones — `codex-decomper-queue` / `codex-scaffolder-queue` versus
`kb-map` / `kb-types` — so a basename keep-set that only knows the Windows names
would silently classify two live Mac lanes as REMOVABLE. **That is the bug this
item exists to prevent, and if it is already present, it is a real one: say so
and fix it.**

Also add `--keep` coverage: an operator-supplied name must survive even when the
branch is merged and the tree is clean.

**Tooling budget:** catches a demonstrated failure class (cross-machine
assumptions that hold on one host and not the other).

**Gate:** pytest + unittest green + `ruff check` clean + the synthetic Mac-layout
test, shown RED against the current keep-set if it is indeed Windows-only.
Build-free.

ONE PR; verify claims against `git diff --stat`; `work_queue.py done`; then take
the next item — and report QUEUE-EMPTY honestly if you genuinely reach it.

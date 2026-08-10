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


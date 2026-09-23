# State changes for `docs/state.md`

Round 001-framework-3-retire-process. Sentence-by-sentence account of
`docs/state.md`: every sentence of the old file (as at the archive tag
`archive/pre-redesign-2026-09-23`) is quoted and marked **kept**, **moved** or
**archived**; every sentence of the new file is quoted under Added. Units are
sentences, table rows, headings, fenced blocks and HTML comments; a table's
separator row is not a sentence. Consecutive quoted sentences share the mark of
the group heading above them unless a line carries its own. Home folders and
email addresses in quoted old text are replaced by `<home>` and `<email>`.

Documents removed whole are listed by path in the worker report, not by
sentence.

## Removed from the old file

### Old lines 1-1: archived: the title is replaced by the 3.0.0 template's `# State`.

- L1: "# State of play"

### Old lines 3-3: archived: a dated status heading; the new file stores no status (framework 'State').

- L3: "## Current state (2026-09-22)"

### Old lines 5-5: archived: history of the 2026-09-21 framework adoption and the 2.0.0 pin; superseded by round A (the pin is in `docs/agents/framework.json`, and `tools/check_dispatch_log.py`, which it names, is retired).

- L5: "This project adopted the [agentic framework](../AGENTS.md) on 2026-09-21."
- L5: "`AGENTS.md` is now the coordination document: roles, scopes, invariants, evidence table and what is actually enforced."
- L5: "This project now follows agentic-framework release 2.0.0; release 2.0.1 is expected as a small follow-up update."
- L5: "This file keeps its full pre-adoption history below unchanged — `tools/check_dispatch_log.py`, `tools/progress.py`, `tools/generate_dashboard.py` and others read it, so nothing below this section was reordered or removed."

### Old lines 14-14: archived: status of a single-folder layout change that is complete; live status is never stored (`fw.py status`).

- L14: "The repository now describes the target single-folder layout from this change; the Mac's physical move follows in the next round."

### Old lines 17-17: archived: the Dev Hub is a retired channel and its message log is retired (owner decision 2); dated message ids are history. The Dev Hub is a shared drive folder, so no log of it exists in the repository.

- L17: "**Dev Hub** (shared Google Drive folder `Software/Dev Hub`, where the owner's project Brains message each other in `mail/` and report framework problems in `framework-feedback/`; rules in its own README.md) — Brain reads it only when the owner says to, and records here what it read or sent."
- L17: "On 2026-09-22 this project sent framework-feedback reports `2026-09-22_0935` (authority-scan wording and owner override), `2026-09-22_0936` (adoption bootstrap first action), and `2026-09-22_1044` (installed tools fail `pyflakes`; `authority.py` on the framework's own documents), plus mail `2026-09-22_1050` (adoption blocked on the tool lint fix)."
- L17: "On 2026-09-22 Brain read framework replies `2026-09-22_0945` and `2026-09-22_0946`, and mail `2026-09-22_1105`, `2026-09-22_1215` (release 2.0.0) and `2026-09-22_1230` (adoption unblocked), and sent framework-feedback `2026-09-22_1320` (owner-override form still wording-dependent) and `2026-09-22_1350` (update byte-identity rule versus adoption merges)."

### Old lines 33-36: archived: describes the retired churn-log role of this file and the retired session-end update habit; superseded by owner decision 2 and framework rule 3 ('derive live state; never store it').

- L33: "Churn-heavy brain log."
- L33: "Split out of `AGENTS.md` so the manifest stays stable while this file turns over every working chunk."
- L36: "The brain updates this file at the end of every session so the next brain (possibly on a different machine or LLM) can catch up in under a minute."
- L36: "Keep it short."
- L36: "If you're the brain reading this cold: `git log --oneline -20` and the open-PR list fill in whatever this misses."

### Old lines 41-41: archived: pointers to research files that hold older round narrative; those files stay for round B, and the pointers are history.

- L41: "**Older rounds archived.**"
- L41: "0818b, 0822b, 0825b, 0827, 0828 and 0828b were lifted verbatim to [`docs/research/brain-rounds-0822-0828b.md`](research/brain-rounds-0822-0828b.md) on 2026-09-02 to keep this file at its intended size."
- L41: "Earlier archives: [0805-0810](research/brain-rounds-0805-0810.md), [0817-0818](research/brain-rounds-0817-0818.md)."

### Old lines 48-128: archived: round 0829 narrative (history). The standing facts in it survive elsewhere: ports and EUR flatness in `docs/state.md` Parked; the gate-ledger practice is retired with the queue.

- L48: "**Round 0829 (2026-08-29, Windows PC, brain=Opus 5; both lanes Claude Sonnet 5 at `max` effort, swarm on the build-free lane only.)"
- L48: "Round 0829: the falsification test came back negative — `verified_neighbor` survived 9 consecutive ROM gates and 95 ports, all 7 unchecked collision pairs audited CORRECT, and the dashboard self-reference is fixed."
- L48: "USA 14.15%, JPN 14.07%.**"
- L54: "Merged **PR #1592**, **PR #1593**, **PR #1594**."
- L54: "`main` at `a3a5ce6fc`."
- L56: "| region | before | after |"
- L58: "| EUR | 17.27% | 17.27% |"
- L59: "| USA | 13.79% | **14.15%** |"
- L60: "| JPN | 13.79% | **14.07%** |"
- L62: "**THE SIGNAL SURVIVED ITS OWN FALSIFICATION TEST.**"
- L62: "`cm-verified-neighbor-tranche` was deliberately written so a failure would be the valuable outcome."
- L62: "It did not fail: **95 ports across 9 consecutive gated batches**, zero gate failures, zero bisects, both regions."
- L62: "The first batch took **14 of 20** candidates that had refused for two prior rounds."
- L62: "Brain verified 95 `.c` added / 95 `.s` deleted, invariant 95/95/95, dup-scan clean, own three-region `--clean` gate PASS."
- L69: "**Three things made PR #1594 trustworthy and are worth reusing.**"
- L69: "It **re-derived PR #1589's measurement against the current, larger tree before running anything** (2,972/3,010 at 100%) rather than reusing a stale snapshot."
- L69: "The predicted address is **arithmetic only**, and the call site verifies a real size-matching target actually exists there before trusting it — the signal cannot fabricate a resolution."
- L69: "And it wired `port_refusal_taxonomy.py` to the same index so the measurement tool cannot silently drift from the resolver."
- L77: "⚠️ **Tracked risk carried into the next item.**"
- L77: "PR #1594 deliberately kept **two copies** of `verified_neighbor_signal()`, arguing the evidence copy is frozen and published with a different calling convention."
- L77: "That is reasonable — **but `FLOOR_RANK` in this same codebase had already drifted across two copies** before PR #1590 consolidated it, so the precedent cuts the other way."
- L77: "`cm-verified-neighbor-drain` asks for either unification or a divergence test."
- L84: "⚠️ **PR body miscount.**"
- L84: "PR #1594's prose says "8 consecutive gated batches" twice while its own table and the commit log both show **9** (2+3+12+12+13+13+12+14+14 = 95)."
- L84: "Material claims were all correct."
- L84: "**Verify counts, not just totals.**"
- L89: "**PR #1592 — all 7 unchecked collision pairs are CORRECT**, canary reproducing brief 673's verdict first."
- L89: "**The 1-in-8 known-wrong rate does not generalise.**"
- L89: "It found the shared mechanism: `find_region_siblings.Function.reloc_sig` **deliberately excludes the relocation target address** for cross-region portability — exactly the information that would separate two same-size siblings calling different callees."
- L89: "5 of 7 have a surviving discriminator in the full reloc data; **2 (an IRQ chain) can never have one** and shipped correct by raw byte match alone."
- L89: "It ran a critic pass naming its own weakest verdict, and spot-checked its sub-agent's bonus finding rather than relaying it."
- L100: "**Bonus finding, brain-confirmed independently:** `docs/research/brief-435-region-port-wave7.md` has two symbol names swapped **in its prose only** — `src/usa/main/func_0209a8c4.legacy.c` calls `func_0209a900`, and the two functions differ in size (0x50 vs 0x54), so they are not even same-size siblings."
- L100: "The code was always right; only the brief's sentence is backwards."
- L100: "Not fixed — out of that item's scope."
- L107: "**PR #1593 — the derived-artifact self-reference is RESOLVED**, after costing three consecutive rounds."
- L107: "The freshness check now tolerates **at most one** differing line, only the trend table's **trailing** row, differing **solely** in its SHA column, re-matched against the fresh render rather than assumed by position."
- L107: "It states what the check still guarantees and what it no longer does, and **demonstrated** the fix — pre-fix `--check` FAILs and post-fix PASSes on the same squash-simulated mutation, with a regression test that performs it live."
- L115: "**Remaining port pool, brain-measured on `main`:** USA 285 backlog / **255 sim=1.0**; JPN 299 / **269 sim=1.0** — 524 rows."
- L115: "The 100-port cap existed only because the signal was unproven; `cm-verified-neighbor-drain` takes it off while keeping the **stop-on-gate-failure rule unrelaxed**: nine clean gates bound the error rate below PR #1589's ≤0.1% estimate, they do not make it zero."
- L121: "⚠️ **THE STRATEGIC POINT.**"
- L121: "**EUR has been flat at 17.27% for five consecutive rounds.**"
- L121: "Every gain since is derivative — USA and JPN porting EUR content that already existed."
- L121: "When the 524-row pool empties, **all three regions stall unless EUR moves.**"
- L121: "`q-eur-next-frontier` is seeded to cost every remaining EUR avenue — code bands, the 407,506 B data pool the Windows path bug had hidden, `.bss` — **before** the ports run out rather than after."
- L128: "⚠️ **Control 12 NOT executable, fourth consecutive round** — both lanes run outside Claude Code and Codex."
- L128: "Every finding above is git- and tool-derived."

### Old lines 131-201: archived: round 0830 narrative (history). The `.text`-only headline caveat it restates is kept once, from the Metrics section, in `AGENTS.md` Working rules.

- L131: "**Round 0830 (2026-08-30, Windows PC, brain=Opus 5; both lanes Claude Sonnet 5 at `max` effort, swarm on the build-free lane only.)"
- L131: "Round 0830: the port campaign is DONE — 489 final ports take USA and JPN to 15.85% and leave 17 and 18 rows."
- L131: "And the code frontier was never closed: it was under-sampled."
- L131: "87% of the code pool sits behind 83 logged attempts.**"
- L137: "Merged **PR #1596** and **PR #1597**."
- L137: "`main` at `81c879c13`."
- L139: "| region | before | after |"
- L141: "| EUR | 17.27% | 17.27% |"
- L142: "| USA | 14.15% | **15.85%** |"
- L143: "| JPN | 14.07% | **15.85%** |"
- L145: "**THE PORTS ARE FINISHED.**"
- L145: "PR #1597 drained the pool the `verified_neighbor` signal unlocked: **489 ports (USA 238, JPN 251) across 26 gated batches**, zero failures."
- L145: "The byte-identical backlog went **524 -> 35 rows** (17 USA / 18 JPN)."
- L145: "Brain verified 489 `.c` added / 489 `.s` deleted, invariant 489/489/489, per-region batch sums, dup-scan clean, own three-region `--clean` gate PASS."
- L145: "**There is no derivative work left; from here only EUR moves anything.**"
- L152: "The lane **verified its own batch count programmatically**, citing last round's miscount, and chose **unification** over a divergence test for the duplicated `verified_neighbor_signal()` — reasoning that a test only *detects* drift while unification eliminates it."
- L152: "It proved the refactor behaviour-identical by running the measurement before and after, with the known-wrong cases predicting byte-identical addresses."
- L159: "⚠️ **PR #1596 CORRECTED THE BRAIN TWICE."
- L159: "Both corrections are load-bearing.**"
- L161: "**1."
- L161: ""EUR stuck at 17.27%" is a `.text`-only claim.**"
- L161: "`progress.py`'s natural-C metric — the same function `state-table.md` and `dashboard.md` both use — never scans `.data`/`.bss`/`.rodata`."
- L161: "Brain confirmed directly: it returns "readable-C `.text` bytes" and `CODE_SECTIONS = {".text", ".init"}`."
- L161: "**The data/carve lane's work cannot move the headline number no matter how well it does**, and the brain had been using "EUR is flat" as a strategic driver without that qualification."
- L161: "The 407,506 B data pool moves a **separate, non-combined** metric."
- L169: "**2."
- L169: "The "closed" bands were never exhausted — those were ATTEMPT counts, not populations.**"
- L169: "Brain re-derived from `attempts.tsv` directly:"
- L172: "(fenced block) '''text    193-256: 267 attempts      321-376:  70    377-512:  66               513-1023: 16     >=1024:   1 '''"
- L178: "204 and 161 fresh never-tried candidates sit behind the "closed" 193-256 B and 321-376 B samples."
- L178: "**And the three largest bands hold 1,211,260 B dispatch-ready — 87% of the entire 1,389,500 B code pool — against 83 attempts between them.**"
- L178: "`>=1024 B` has been attempted **once** in the whole ledger."
- L178: "**377-512 B appears in no prior band recap at all.**"
- L184: "PR #1596 left the ship rate **blank** for all three rather than extrapolate from 83 attempts — correct, and consistent with `band-rate-vintage.md`, where a same-band resample collapsed 27.6% to 0/60."
- L184: "It also corrected the item's own premise (**ITCM has zero data symbols**; the Windows bug's hidden pool was 100% overlay data) and the brain's "~220,000 B hidden" figure (true delta **+241,590 B**)."
- L184: "Its critic pass named its own weakest-provenance figure."
- L191: "**Strategic consequence, and it is a real pivot.**"
- L191: "The campaign spent months believing the code frontier was mapped and mostly closed."
- L191: "It is not: it is **barely sampled above 376 B**."
- L191: "`cm-377-512-probe` is seeded as a pre-registered n=20 probe into the largest *reachable* untried band, and `q-large-band-reachability` tests whether the toolchain can even feed those bands — `m2c_feed.py`'s `find_object()` globs **only** `_dsd_gap@*.o` (brain verified, around line 373) and may be structurally blind to the ~10,000 per-source delink objects."
- L191: "If so, the 83 attempts are a **tooling artefact**, not a verdict on difficulty."
- L201: "⚠️ **Control 12 NOT executable, fifth consecutive round** — both lanes run outside Claude Code and Codex."
- L201: "Every finding above is git- and tool-derived."

### Old lines 204-258: archived: round 0831 narrative (history); the frontier-band figures survive in `docs/state.md` Parked. The two levers named here (`volatile` on an MMIO pointer, shift-pair over mask) are candidates for round B's compiler-quirks reference.

- L204: "**Round 0831 (2026-08-31, Windows PC, brain=Opus 5; both lanes Claude Sonnet 5 at `max` effort.)"
- L204: "Round 0831: both results came back NEGATIVE and both were reported honestly."
- L204: "377-512 B is CLOSED at 5.0%, and the brain's own tooling-blindness hypothesis is DEAD."
- L204: "The band map is now complete and monotone.**"
- L210: "Merged **PR #1599** and **PR #1600**."
- L210: "`main` at `bfbdc1d27`."
- L210: "EUR **17.27% -> 17.29%** — small, but the first EUR movement in six rounds."
- L210: "USA and JPN unchanged at 15.85%."
- L214: "**PR #1600 — the band is closed, on a threshold nobody moved.** n=20 at 377-512 B returned **1/20 = 5.0%**, inside the pre-registered `<=10%` zone."
- L214: "The frontier is now fully mapped and **monotonically harder with size**:"
- L218: "| band | rate | status |"
- L220: "| 193-256 B | 0/60 | closed (204 fresh candidates remain) |"
- L221: "| **257-320 B** | **4/20 = 20.0%** | **the only pocket above 10%** |"
- L222: "| 321-376 B | 1/15 = 6.7% | closed |"
- L223: "| 377-512 B | **1/20 = 5.0%** | **closed — BR-7** |"
- L224: "| 513-1023 B | 0/15 | effectively closed |"
- L225: "| >=1024 B | 1 attempt ever | unmeasured |"
- L227: "Three near-misses broke **80%+** (91.5%, 82.0%, 81.1%) on genuine multi-attempt work and were each diagnosed as **compiler-internal register-allocation residuals, not under-effort** — the method has a ceiling and we have found it."
- L227: "It also corrects BR-6's "fully characterised" claim, which had skipped this band entirely."
- L233: "**Two new levers, both worth carrying forward.**"
- L233: "`volatile` on a raw MMIO register pointer forces mwcc's own two-load read-modify-write instead of a CSE'd single load — **20.8% -> 81.1% in one change**."
- L233: "And **shift-pair over mask simplification**: reverting `(field & 7) == 0` to the literal `(u32)(field << 0x1D) >> 0x1D` closed a 6.7% attempt to **100%**; it extends to 3-bit fields."
- L240: "**PR #1599 — the brain's hypothesis is dead, and the ledger settled it.**"
- L240: "Coverage **rises** with size (48.4% small/mid vs 62.1% large), the opposite of predicted."
- L240: "The load-bearing finding is build-independent: **zero of the 83 large-band attempts used gap objects at all** — every one used manual disassembly reading."
- L240: "**The low attempt count is a methodology choice, not a tooling wall.**"
- L240: "Brain verified the canary directly: exactly one ledger row >=1024 B, `0x02246a50` / ov002 / 1036 B / parked / `brief-650`, produced by hand."
- L248: "⚠️ **BRAIN FINDING: PR #1599's coverage figure is BUILD-STATE-DEPENDENT.**"
- L248: "Running `tools/m2c_gap_coverage.py` on the integration tree returned **~0.0% coverage in every band** against the reported 45-68%."
- L248: "Not a lane error — the brain's `build/eur/delinks/` held **754 gap objects containing only 55 distinct functions between them**, so the gap objects there were essentially empty."
- L248: "**The percentage is a property of whichever build tree it is run against, not of the project.**"
- L248: "The conclusion survives untouched because it rests on the ledger cross-check and the canary."
- L248: "`q-find-object-persource` requires the figure be dated and labelled rather than cited as a constant."
- L258: "⚠️ **Gate caught real drift at integration.**"
- L258: "The first `--scope all --clean` run passed all three SHA1 checks but **failed 2 tests** — both dashboard freshness, including PR #1593's own regression test."
- L258: "Cause: merging the two branches produced genuine content drift, which is more than the trailing-SHA tolerance covers."
- L258: "Regenerated state-table then dashboard; `--scope tests` then returned **3,540 passed**."

### Old lines 258-258: kept, reworded: `AGENTS.md` Evidence, 'Until round C, the gate's exit status cannot be trusted'.

- L258: "**The `tee` wrapper reported exit 0 while the gate had FAILED** — reading the log is what caught it."

### Old lines 266-274: archived: round 0831 narrative (history); the frontier-band figures survive in `docs/state.md` Parked. The two levers named here (`volatile` on an MMIO pointer, shift-pair over mask) are candidates for round B's compiler-quirks reference.

- L266: "**Next round.**"
- L266: "`cm-257-320-drain`: 257-320 B is the only pocket above 10%, with **263 unattempted candidates / 75,980 B** behind it — roughly 50 functions and ~15,000 B at its measured rate, and the two new levers have never been applied there."
- L266: "Probing 513-1023 B was rejected: the gradient is monotone and it would buy a predictable null."
- L266: "`q-find-object-persource` implements the fix PR #1599 scoped (**774/774** candidates resolve at a single predictable path — a deterministic path check, not a glob widening) and dates the coverage figure."
- L274: "⚠️ **Control 12 NOT executable, sixth consecutive round.**"

### Old lines 276-333: archived: round 0901 narrative (history); superseded by later rounds and by owner decision 2.

- L276: "**Round 0901 (2026-09-01, Windows PC, brain=Opus 5; both lanes Claude Sonnet 5 at `max` effort.)"
- L276: "Round 0901: the shift-pair lever is confirmed to transfer on a controlled A/B, the `find_object()` tax is gone, and wall membership has quietly become the thing that decides which candidates get attempted at all.**"
- L282: "Merged **PR #1602** and **PR #1603**."
- L282: "`main` at `87b18e48f`."
- L282: "EUR **17.29% -> 17.32%**; USA/JPN unchanged at 15.85%."
- L285: "**PR #1603 — 3/17 = 17.6% at 257-320 B**, inside the noise of BR-4's pre-registered 20.0% at n=17."
- L285: "The lane **declined to declare a divergence it could not support**, which is the correct call."
- L285: "Recorded as BR-8; **259 candidates remain unattempted** in the band."
- L290: "**Lever 2 (shift-pair over mask) CONFIRMED TRANSFERRING, on a direct A/B.**"
- L290: "On `func_ov002_021fa968` the literal `(u32)(x << 0x1F) >> 0x1F` scored **71.2%**; simplifying the identical logic to `x & 1` dropped it to **7.7%**."
- L290: "**Lever 1 (`volatile` on MMIO) was reported as "not exercised"** — no candidate in the pool had the read-modify-write shape — rather than falsely confirmed."
- L290: "Two restructuring attempts that made a match *worse* were disclosed (78.8%->47.0%, 62.1%->57.6%)."
- L290: "Three new unconfirmed failure signatures recorded as leads: push-vs-`sub sp,#N` alignment padding, `str`/`stmib` fusion, and independent-computation interleaving."
- L300: "⚠️ **THE DENOMINATOR ISSUE, AND IT IS NOW STRUCTURAL.**"
- L300: "PR #1603 screened **6 of 23** candidates out **on sight** as confirmed P-20 wall members and excluded them: 3/17 = **17.6% attempted-rate** vs 3/23 = **13.0% pool-rate**."
- L300: "The exclusion was defensible (11+ independently falsified prior attempts) and clearly disclosed."
- L300: "But **wall membership is now gating which candidates get attempted at all**, in the only band above the 10% closed line — and **a screened-out candidate produces no attempt row, so it is invisible to every ship-rate the campaign computes**."
- L300: "`q-wall-overblock-audit` is seeded to test whether any wall is broader than its evidence; `cm-257-320-drain-2` now requires **both** rate figures."
- L311: "**PR #1602 — the `find_object()` tax is removed and the coverage figure is dated.**"
- L311: "The per-source fallback **disasm-verifies the header** at the predictable path rather than trusting existence, so a stale object is never silently returned; gap objects are still checked first."
- L311: "Its canary **confirmed the brain's build-state finding directly**: the lane's tree (2,083 gap objects / 2,881 distinct functions) shows 45-68%, the brain's integration tree (754 / 55) shows ~0% — **same code, two trees, two answers**."
- L311: "`m2c_gap_coverage.py` now prints its own build state, turning a silent dependency into a visible one."
- L320: "⚠️ **BRAIN MISS, caught by the lane.**"
- L320: "`docs/dashboard.md` was stale on `origin/main` — brain confirmed with `stale (line count differs)`."
- L320: "Cause: the **round-0831 brain PR added a whole new trend row**, and PR #1593's tolerance covers only a **rewritten SHA on the trailing row**, not a **new row appearing**."
- L320: "Same self-reference, second form."
- L320: "**The brain's own loop is the trigger** — it regenerates on the integration branch, but the round PR lands afterwards and can invalidate it again."
- L320: "Folded into `q-wall-overblock-audit` as a second task."
- L328: "**Process note:** the scaffolder worktree showed one dirty file (`config/eur/arm9/delinks.txt`) whose diff was **empty** — a CRLF line-ending artifact, not lost work."
- L328: "Check the diff before treating a dirty tree as a finding."
- L333: "⚠️ **Control 12 NOT executable, seventh consecutive round.**"

### Old lines 335-399: archived: round 0902 narrative (history); the P-20 wall evidence lives in `docs/research/` (round B).

- L335: "**Round 0902 (2026-09-02, Windows PC, brain=Opus 5; both lanes Claude Sonnet 5 at `max` effort.)"
- L335: "Round 0902: the wall audit found that on-sight screening leaves NO ledger trace for any wall, and that only P-20 is strongly evidenced."
- L335: "The drain reported both denominators and corrected the brain's own stale candidate count.**"
- L341: "Merged **PR #1605** and **PR #1606**."
- L341: "`main` at `676fed454`."
- L341: "EUR **17.32% -> 17.34%**; USA/JPN unchanged at 15.85%."
- L344: "**PR #1605 — the ledger blind spot is TOTAL, and brain verified it exactly.**"
- L344: "Across all **1,822** rows, **zero** are `result=not-attempted` tagged to any formal P-NN wall."
- L344: "The 31 `not-attempted` rows carry `unknown` (27), `C-31`, `permanent-header`, `C-23-C-36`, `complexity` — nothing else."
- L344: "**Screening leaves no trace for ANY wall**, so Deliverable 1's literal question was unanswerable from the ledger and required re-matching each wall's idiom against the live pool."
- L344: "PR #1603's own screening left zero rows (exactly 17 cite it = 3 shipped + 14 parked)."
- L353: "**P-20 is the only wall with genuinely independent 3+-round confirmation** — 55 confirmed members, 6 convergent falsification rounds (2026-07-27 to 2026-08-22), and a fresh signature re-scan of the 1,777-candidate pool found **zero further matches**."
- L353: "Every other wall tops out at 2 rounds; P-11 is accretive rather than independent, P-28 self-admittedly a possible grab-bag."
- L353: "**So the screening in PR #1603/PR #1606 was justified — it used the one strong wall.**"
- L360: "⚠️ **Two concrete defects, neither acted on (correctly).**"
- L360: "`generate_walls_index.py`'s heading-boundary regex only recognises an exact `### P-N.`/`### C-N.` heading, so any other heading bleeds its bracket into the prior wall's count."
- L360: "Brain confirmed the symptom in `docs/research/codegen-walls-index.md`: **P-20 reports 30** (re-count 55) and **P-49 reports 9** (re-count 1, from ~1,700 unrelated lines)."
- L360: "And **8 walls carry stale members still counted as blocking — worst P-11, 10 of 16 (62.5%) already shipped**, never looped back; P-50 is under-counted the other way (17 pairs/34 symbols vs a documented 4)."
- L360: "Both seeded as `q-wall-catalog-repair`."
- L370: "**PR #1606 — 1/14 = 7.1% attempted, 1/27 = 3.7% pool**, both reported as asked."
- L370: "**Zero of 27 candidates needed `--obj`** (down from all 20), independently confirming PR #1602's fallback in the field."
- L370: "It **corrected the brain's stale "259 remaining" to 246** and continued on the corrected number."
- L370: "**232 remain.**"
- L375: "⚠️ **Read the rate correctly — the brain nearly did not.**"
- L375: "All-time attempted-rate across BR-4/BR-8/BR-9 is **8/51 = 15.7%**, still marginal, not closed."
- L375: "The pool-rate is lower **only because roughly half of examined candidates are screened on P-20**, whose membership is **bounded at 55 confirmed**."
- L375: "The pool-rate measures "a bounded share of this band is P-20", not "this band is hard"."
- L375: "**Do not conflate them.**"
- L382: "**Honesty pattern held again:** the `volatile` lever finally met a genuine MMIO read-modify-write case and came back **inconclusive** (blocked by an unrelated structural mismatch), reported as such rather than claimed."
- L382: "A restructuring that made a match worse (24.2%->12.1%) was disclosed **and reverted**."
- L382: "Push-vs-`sub sp,#N` alignment padding is now **effectively confirmed compiler-internal** (4th+ occurrence, zero source-level response) — a wall, not a lever."
- L390: "**The primary change seeded for next round:** the drain lane now **writes an `attempts.tsv` row with `result=not-attempted` and the wall's `park_class` when it screens**."
- L390: "That closes the blind spot permanently and makes every future screening measurable."
- L395: "**Process note:** the scaffolder worktree again showed dirty `delinks.txt` files with **empty diffs** — CRLF artifacts."
- L395: "The kickoff's "check the diff before reporting" instruction worked."
- L399: "⚠️ **Control 12 NOT executable, eighth consecutive round.**"

### Old lines 401-423: archived: findings about the retired pre-push hook, the unittest collection gap and lane hosts; the hook is retired (this round) and the collection gap was repaired by a later PR.

- L401: "⚠️ **The `pre-push` invariants guard was INERT for its entire life** (found 2026-09-02 by an external review of the agentic workflow, verified here)."
- L401: "It captured the checker's status as `if ! cmd; then rc=$?` — `!` inverts the pipeline status, so `$?` inside that block is **0** and the `-eq 2` "errors, block the push" branch was unreachable."
- L401: "Every push since the hook landed went unguarded."
- L401: "`tests/test_install_git_hooks.py` pinned the installer, the file mode and `core.hooksPath`, but **never executed the hook**, which is exactly the "documented but untested safety mechanism" failure class."
- L401: "Fixed with `|| rc=$?`, plus `rev-parse --verify` (an unresolvable SHA was being echoed back, so the "run conservatively" fallback also never fired) and CR-stripping on the ref manifest."
- L401: "`tests/test_pre_push_hook.py` now runs the real script; mutating the fix back to the original pattern turns 3 of its 4 tests red."
- L414: "⚠️ **39 tests never run in CI** (found 2026-09-03 while verifying PR #1608's one red test)."
- L414: "`pytest --collect-only` sees **3,594**; CI's `unittest discover` runs **3,555**."
- L414: "Eight files use module-level `def test_*` functions that `unittest` cannot collect — including `test_validate_attempts.py` (12 tests, guards the ledger every ship-rate is computed from) and `test_port_to_region.py` (the port resolver)."
- L414: "`tools/check_test_imports.py` sounds like it would catch this and does not: it checks only third-party imports."
- L414: "Seeded as `q-ci-test-visibility`."
- L423: "⚠️ **A lane is running on the Mac, not the Windows PC.**"
- L423: "PR #1608's red test resolved `python3.13` only."
- L423: "`tools/make_kickoff.py` stamps `"python" if host == "windows" else "python3.13"` and the test hard-codes the Windows form, so it can only pass on Windows."
- L423: "The `python3.13` **hard version pin** is a separate latent defect — it breaks on any Python upgrade — and is deliberately NOT being changed blind from a machine that cannot verify the Mac."

### Old lines 430-469: archived: round 0903 narrative (history), including a process defect in the retired dispatch-log and queue-drift guards, both retired.

- L430: "**Round 0903 (2026-09-03, Windows PC, brain=Opus 5; both lanes Claude Sonnet 5 at `max` effort.)"
- L430: "Round 0903: the ledger screen-row change landed and worked, P-20 screens fell 12 -> 0, and the wall-index fix corrected seven stale counts."
- L430: "Written up retroactively during round 0904 — see the process defect below.**"
- L436: "Merged **PR #1608** and **PR #1609**, plus brain PRs **#1610**, **#1611**, **#1612**, **#1613**, **#1614**."
- L436: "`main` at `050f06c0f`."
- L436: "EUR **17.34% -> 17.36%** (413,622 -> 414,174 B); USA/JPN unchanged at 15.85%."
- L440: "**PR #1609 — 2/16 attempted (12.5%), 2/17 pool (11.8%)**, shipping `func_ov002_021c9c94` and `func_ov002_021c9fc4`."
- L440: "It delivered the ledger change round 0902 seeded: `attempts.tsv` now carries a formal `result=not-attempted` row when a candidate is screened, and `validate_attempts.py` reported 1,853 rows / 0 errors."
- L440: "**P-20 screens went 12 -> 0**, so this was the first tranche where attempted-rate and pool-rate nearly converged."
- L447: "**PR #1608 — the wall-index heading regex is fixed and seven counts reconciled.**"
- L447: "It found a wall nobody had asked about (C-39) and corrected **P-11 to 13/16 shipped, not the audit's own 10/16**; P-50 went 4 -> 21."
- L451: "⚠️ **PROCESS DEFECT — this round's own bookkeeping never happened, and both guards that exist to catch it are inert.**"
- L451: "PR #1614 appended two warning paragraphs into the round-0902 section: it opened no Round 0903 heading, left the `main-sha` anchor at `676fed454` (eight PR-merges behind by the time round 0904 began), and added no `0903` dispatch-log row."
- L451: "Control 5's checklist went unticked."
- L451: "Two guards should have fired and could not:"
- L458: "1. `tools/queue_state_drift.py` measures anchor staleness with `git rev-list --count --merges <anchor>..<ref>`."
- L458: "**The repo has squash-merged exclusively since 2026-08-25** (`efb512d32`, PR #1581, the last real merge commit), so `merges_since` is **always 0** and the `_STALE_MERGE_TOLERANCE` branch is unreachable."
- L458: "Demonstrated in round 0904: `main_anchor_checker` returns `(True, 0)` for anchors roughly 30 PRs back."
- L464: "2. `tools/check_dispatch_log.py` requires a dispatch row only when the `**Last updated:**` *block* changes — that line through the next blank line."
- L464: "A round appending its narrative anywhere else skips the requirement silently, which is exactly what happened."
- L469: "**Neither guard is wired into any CI workflow.**"
- L469: "This is the third instance of the "documented, installed, inert" class in three rounds, after the pre-push invariants hook and the unittest collection gap."
- L469: "`docs/guard-coverage-review.md` is not evidence against it: that table lists `test_install_git_hooks.py` as FIRES-CORRECTLY while the hook it installs was inert for its entire life — it audited the installer, not the behaviour."
- L469: "Seeded as `q-handoff-guard-repair`."

### Old lines 476-585: archived: round 0904 narrative (history); the band-rate findings are in `docs/research/` and the ledger.

- L476: "**Round 0904 (2026-09-04, Windows PC, brain=Opus 5; both lanes Claude Sonnet 5 at `max` effort.)"
- L476: "Round 0904: the 257-320 B band is not one pool but two, and the round spent 16 of 17 attempts on the wrong one."
- L476: "Both lanes reported their own limits accurately; the brain's contribution was to put numbers on what the drain lane had already described in prose.**"
- L482: "Merged **PR #1616**."
- L482: "**PR #1615 is HELD open on a red required check** — see below."
- L482: "EUR **17.36% -> 17.37%** (414,174 -> 414,466 B); USA/JPN unchanged at 15.85%."
- L486: "⚠️ **THE BAND IS TWO POOLS."
- L486: "This is the round's finding and it decides the next dispatch.**"
- L486: "PR #1616 returned 1/17 = 5.9% and reported it as a genuine divergence from the all-time figure, explaining in prose that the batch "drew heavily from `main`-tier candidates rather than the `ov002` near-miss shapes that dominate the campaign's ship history"."
- L486: "The brain quantified that explanation from the ledger, across all six 257-320 B briefs:"
- L493: "| sub-pool | shipped / attempted | remaining candidates |"
- L495: "| **ov002** | **6/30 = 20.0%** | **132** |"
- L496: "| `main` | 1/34 = 2.9% | 56 |"
- L497: "| everything else | 4/20 = 20.0% | 10 |"
- L499: "The per-round rate tracks the module mix almost exactly: drain-1 (10 main / 6 ov002) 17.6%, drain-2 (6/7) 7.1%, drain-3 (0 main / 12 ov002) 12.5%, drain-4 (16 main / 1 ov002) **5.9%**."
- L499: "**The divergence is a selection artefact, not band exhaustion** — drain-4 spent 16 of 17 attempts on the 2.9% sub-pool while 132 candidates sat in the 20.0% one."
- L499: "Remaining pool measured with the project's own `pool_freshness.py`: **198 candidates / 57,976 B**, reconciling exactly with the lane's 215 minus its own 17."
- L507: "⚠️ **Three different cumulative rates for this band are in circulation, and the wall catalogue is two rounds stale.**"
- L507: "`codegen-walls.md`'s BR ledger stops at **BR-9**; drain-3 and drain-4 never added BR-10/BR-11."
- L507: "The figures are:"
- L511: "| source | figure | scope |"
- L513: "| `codegen-walls.md` BR-9 | 4/31 = 12.9% | BR-8 + BR-9 only |"
- L514: "| `state.md` + the last two kickoffs | 8/51 = 15.7% | BR-4 + drains |"
- L515: "| drain-4's writeup, brain-recomputed | **11/84 = 13.1%** | all six briefs |"
- L517: "**11/84 = 13.1% is the correct one** — the lane derived it independently and the brain's recomputation matched exactly."
- L517: "One denominator, pinned, from now on."
- L517: "A wall catalogue that stops being updated is the same narrative-vs-ledger divergence the C-63 recovery just found in the other direction."
- L522: "**PR #1616 — verified, and honest about its own limits.**"
- L522: "Brain re-derived the 17 ledger rows from the diff: 1 shipped / 16 parked, **zero screens**, so attempted-rate and pool-rate are genuinely identical at 5.9% rather than converged by argument."
- L522: "The C-63 recovery (`func_ov002_02236bbc`) was a **narrative-only decline** — documented as parked in `codegen-walls.md` but never ledgered; the lane applied the lever for real, got 8.96%, and recorded it."
- L522: "It did not ship, and the lane did not claim it did."
- L522: "Control 10 dup-scan clean; `.s` deleted, `.c` added, `delinks.txt` flipped."
- L531: "**Its systemic finding is real and is the highest-value tooling item on the board.**"
- L531: "`prepare_compile_source`'s auto-scaffold declares every referenced `unkNN` field as a sequentially-packed `int` with **no padding for the real byte gap**, so a compile succeeds at the wrong field offsets."
- L531: "One `char _pad[N]` insertion took the shipped function from **95.89% to 100.0%**, and the same fix moved `func_0201cab4` from 10.96% to **83.6%**."
- L531: "The gap is derivable from the numeric suffixes already present in the field names."
- L539: "⚠️ **BRAIN FINDING: `m2ctx.py` hardcodes `gcc`, and this machine has none.**"
- L539: "Reproduced directly — `m2c_feed.build_context('eur','ov002')` raises `FileNotFoundError [WinError 2]`."
- L539: "PR #1616 fixed the *consequence* (the raise escaped and dropped the whole skeleton) by catching it and recording `context_error`, which is correct."
- L539: "But **`context_error` is written at `cmatch_loop.py:361` and read nowhere**, so the degradation is now silent rather than loud."
- L539: "The modules this hits are exactly those with a `*_core.h` — **`ov002`**, the 20.0% sub-pool the next round targets."
- L539: "`main` has no core header and legitimately returns `None`, which is why drain-4 was unaffected and why the lane's attribution of its own near-misses to the scaffold, not to the context, was correct."
- L551: "**PR #1615 — the parity guard is real, brain-verified red.**"
- L551: "Control 7: pointed `scan_collection` at a temp tree containing a module-level `def test_*` and a non-`TestCase` class; **both go red**, and the guard catches the class form the brief never asked for."
- L551: "Green on the converted tree with an **empty allow-list** — all 39 were converted, none excused."
- L551: "Brain re-derived the population by running the new guard against `origin/main`: **exactly 39 violations across exactly the 8 named files, per-file counts matching.**"
- L559: "⚠️ **PR #1615 IS HELD: its required `unittest` check is red in CI, and both failures are real.**"
- L559: "`Ran 3593 tests ..."
- L559: "FAILED (errors=2, skipped=27)`:"
- L562: "1. `test_ship_coverage_history_is_not_vacuous` — `KeyError: 'cm-main-tier-sweep-7'`."
- L562: "It derives rounds from round-labelled commits, but the `unittest` job uses a default shallow `actions/checkout` with no `fetch-depth: 0`."
- L562: "The `drift-check` job sets it explicitly and documents why; this one never did."
- L567: "2. `test_pool_item_stamps_live_figure_and_reproducer` — `FileNotFoundError: 'python3.13'`."
- L567: "`make_kickoff._run_pool` **executes** the pinned interpreter, and `_lane_spec` models only `windows`/`mac`, so the Linux runner resolves `python3.13`, which is absent (CI is 3.11)."
- L572: "**Both are pre-existing defects that were invisible precisely because these tests never ran in CI** — the new guard working as designed on its first outing."
- L572: "The brain did **not** fix (2) here: round 0903 reserved the `python3.13` pin as unverifiable from a machine without the Mac, and that reservation is not overruled silently."
- L572: "The branch stays open and the item returns to the decomper lane."
- L579: "The lane's headline "gap closed from 46 to 0" mixes the real 39 with a 7-test discrepancy it separately investigated and concluded was an artefact of its own diagnostic script, not of the repo."
- L579: "It disclosed that openly and did not report the 7 as a repo defect — but the two halves have different provenance and should not be quoted as one figure."
- L585: "⚠️ **The gate FAILED on the first integration run, and the wrapper exited 0.**"
- L585: "All three SHA1 PASS, then `test_generate_research_index.py:: TestCommittedIndexIsCurrent` went red: PR #1616 added its research writeup without re-running `tools/generate_research_index.py`."
- L585: "One generated line."

### Old lines 585-585: kept, reworded: `AGENTS.md` Evidence, 'Until round C, the gate's exit status cannot be trusted'.

- L585: "**`[exited with code 0]` sat directly beneath `==================== GATE FAIL ====================`** — reading the log is what caught it, for the second round running."

### Old lines 585-612: archived: round 0904 narrative (history); the band-rate findings are in `docs/research/` and the ledger.

- L585: "Fixed on the lane's branch (`8cc6301bd`, fast-forward push, not a force) per the round-0824c precedent, then re-gated to `GATE PASS` (3,584 passed / 16 skipped)."
- L595: "**Round 0902's two dashboard failures are gone**, confirming the diagnosis: they were caused by round 0903's missing regeneration, and PR #1616's regeneration cleared them."
- L599: "**Gate provenance, stated exactly:** the three SHA1 PASS lines were produced on the integration tree *before* the one-line research-index commit; the only delta between that tree and the `GATE PASS` tree is `docs/research/README.md`, verified by `git diff --stat` and confirmed absent from `build.ninja`."
- L604: "✅ **Control 12 EXECUTABLE — first time in nine rounds.**"
- L604: "Both lanes ran in Claude Code and both transcripts were read."
- L607: "| lane | session located | final report read | caveats / parked work | matched branch, PR, files |"
- L609: "| Claude Code Decomper | yes (`local_8ae4709a`) | yes | disclosed a 7-test discrepancy as its own instrumentation artefact rather than a repo defect; left the `python3.13` pin untouched as instructed and reported it as a finding | yes — 13 files, +571/-355 |"
- L610: "| Claude Code Scaffolder | yes (`local_32bdcd11`) | yes | disclosed a self-inflicted pytest race (regenerated `dashboard.md` while pytest exercised its own staleness fixtures) and re-ran clean; declined to adjust the 5.9% figure | yes — 10 files, +228/-107 |"
- L612: "Neither lane's report contradicted the artefacts, and neither overstated a result."
- L612: "Both surfaced their own limits before the brain asked."

### Old lines 615-709: archived: round 0905 narrative (history), including retired worktree and kickoff mechanics.

- L615: "**Round 0905 (2026-09-05, Mac M1, brain=Opus 5; both lanes on the same Mac — scaffolder toolchain-bound, decomper build-free.)"
- L615: "Round 0905: the brain moved to the Mac, unblocked and merged the PR round 0904 held, and found that the ov002 m2c blocker is a property of the Windows PC rather than of the tool.**"
- L621: "Merged **PR #1615**."
- L621: "`main` at `5b865162b`."
- L621: "No region percentage moved: the merge touches tests, CI and tooling only, and no build input."
- L624: "✅ **PR #1615 IS UNBLOCKED AND MERGED — both held defects were real, both are fixed, and the reserved `python3.13` pin was never implicated.**"
- L624: "Round 0904 held it on a red required `unittest` check and returned the item to the lane."
- L624: "The brain fixed it on the lane's branch instead (fast-forward push, not a force, per the round-0824c precedent), because both defects were one line each and a lane-round is worth more than that:"
- L631: "1. `.github/workflows/tests.yml` — the `unittest` job used a bare `actions/checkout` while eight other workflows pin `fetch-depth: 0`."
- L631: "Added, with the reason inline, mirroring `generated-files-drift.yml`."
- L634: "2. `tools/make_kickoff.py` — `_run_pool` executed `spec.interpreter`, which names the interpreter the WORKER will type on the TARGET host, not one that exists on the host generating the kickoff."
- L634: "Now `sys.executable`."
- L638: "⚠️ **Round 0903's reservation was correct to make and is intact.**"
- L638: "Changing the `python3.13` pin needed the Mac; the brain had the Mac and verified the pin is untouched — `lane_spec('scaffolder','mac').interpreter` is still `python3.13`, and the emitted `REPRODUCER` line is unchanged because `pool_freshness.py` prints its own hardcoded command string rather than echoing its invoker."
- L638: "The interpreter the kickoff NAMES and the interpreter the generator RUNS are separate concerns, and conflating them was the whole defect."
- L646: "⚠️ **The defect is host-independent, not Linux-specific as reported.**"
- L646: "It reproduces on macOS too, and with the OPPOSITE missing interpreter (`FileNotFoundError: 'python'` for `host='windows'`), because the failing test pins the target host rather than the running one."
- L646: "CI's `python3.13` report was one symptom of a two-sided bug."
- L652: "⚠️ **BRAIN FINDING: the `m2ctx.py` gcc blocker is a property of the Windows PC, not of the tool — and this round's drain target is exactly the pool it hits.**"
- L652: "Round 0904 recorded that `build_context('eur','ov002')` raises `FileNotFoundError [WinError 2]`."
- L652: "On this Mac `/usr/bin/gcc` exists as the Apple clang shim, and the call returns a real context file:"
- L658: "| call | result |"
- L660: "| `build_context('eur','ov002')` | `build/eur/_m2c_ctx/ov002_core.ctx.c`, **5,035 B**, exists |"
- L661: "| `build_context('eur','main')` | `None` — no core header, correct |"
- L663: "So `cm-257-320-drain-5` is the first ov002 tranche to run WITH an m2c compile context, and round 0904's explanation of why drain-4 was unaffected is confirmed from the other direction."
- L663: "`context_error` is still written at `cmatch_loop.py:361` and read nowhere, so the fix to surface it stands — the Windows PC will still trip it."
- L669: "**The inert drift guard, re-derived independently on current `main`.**"
- L669: "`git rev-list --count --merges efb512d32..HEAD` is **0** against **36** real commits, and `main_anchor_checker` returns `(True, 0)` for anchors `0b2f8c630`, `676fed454` and `efb512d32` — 5, ~10 and 36 commits back."
- L669: "The `_STALE_MERGE_TOLERANCE` branch is unreachable, exactly as round 0903 said."
- L669: "Seeded as a real queue item this round rather than narrative only, which is what round 0903's seed was."
- L677: "⚠️ **UNEXPLAINED: at 22:56 on 2026-08-31 all nine non-brain worktrees were hard-reset to `origin/main` by something outside the brain session.**"
- L677: "No work was lost — every branch involved was already squash-merged, and the pre-reset commits remain in reflog — but "this branch is merged" stopped being independent evidence for those nine, so the local branch namespace was left untouched rather than garbage-collected."
- L677: "Recorded because the next brain will see nine branches sitting exactly on `main` and should not read that as proof of anything."
- L686: "**Housekeeping.**"
- L686: "The five spent `claude-decomper-batch*` worktrees (round-0822 sweep dirs, content verified present on `main`, remote branches already deleted upstream) were removed, reclaiming ~470 MB."
- L686: "`git worktree remove` left three of them half-deleted with ignored build artefacts in place and had to be finished by hand — worth knowing before scripting this."
- L686: "The four named lane worktrees were deliberately NOT recut to the new `decomper/`/`scaffolder/` naming: the rename is cosmetic and the paths are load-bearing in live kickoffs."
- L694: "⚠️ **`make_kickoff.py`'s Mac lane paths do not exist on this Mac.**"
- L694: "`LANE_WORKTREES` names `~/Dev/spirit-caller/decomper` and `~/Dev/spirit-caller/scaffolder`; the real worktrees are `claude-decomper-queue` and `claude-scaffolder-queue`."
- L694: "A generated Mac kickoff would send a lane to a nonexistent directory and the location guard would correctly STOP it."
- L694: "Both kickoffs this round were hand-written against the real paths and pass `kickoff_lint.py` on all eight required checks."
- L694: "Seeded."
- L702: "**Gate provenance, stated exactly.**"
- L702: "The 3-region `gate3.py --scope all` run was started against `1592a2568` and PR #1615 merged while it was running."
- L702: "The sha1 result carries to `5b865162b` because #1615 touches **no build input** — verified by file list: `.github/workflows/`, `docs/`, `tests/`, and two `tools/` scripts, with nothing under `src/`, `libs/`, `config/`, `include/` or `assets/`."
- L702: "The tree was not re-gated for a change that cannot reach the ROM."
- L709: "**Control 12 — not yet executable for this round.**"
- L709: "The lanes had not run at the time of writing; the transcript audit belongs to the review that follows their PRs."

### Old lines 713-724: archived: round 0908 narrative (history), largely about retired guards, the dashboard, dispatch-log and lane transcripts.

- L713: "**Last updated:** 2026-09-08 — **(Windows PC, brain=Opus 5; both lanes ran on the Mac M1 last round — scaffolder toolchain-bound, decomper build-free.)"
- L713: "Round 0908: the brain moved back to Windows and merged both Mac-round lane PRs."
- L713: "Two rounds ran on the Mac and left no record of themselves at all, and the drain lane's headline rate is a lower bound it measured with a compiler scaffold it was still repairing.**"
- L720: "Merged **PR #1620** and **PR #1622**."
- L720: "`main` at `288253e4b`."
- L720: "EUR 17.37% -> **17.38%** (414,738 B natural C)."
- L720: "USA and JPN unchanged at 15.85% — neither merge touches a port."
- L724: "⚠️ **ROUNDS 0906 AND 0907 ARE UNRECORDED, AND THIS IS THE ROUND-0903 DEFECT RECURRING TWICE UNDER ITS OWN REPAIR.**"

### Old lines 724-724: archived: retired dispatch-log; history.

- L724: "`docs/dispatch-log.md` ends at 0905."

### Old lines 724-851: archived: round 0908 narrative (history), largely about retired guards, the dashboard, dispatch-log and lane transcripts.

- L724: "`docs/state.md`'s newest narrative was 0905."
- L724: "Both rounds demonstrably ran — PR #1622's writeup is dated by kickoff round 0907, PR #1620's body describes its own 0906 and 0907 iterations — and `grep "0906\|0907"` over `state.md` and `dispatch-log.md` on `main` at `b14879e28` returned **nothing**."
- L724: "The only surviving trace anywhere is one sentence in `docs/decomp-workflow.md` / `docs/tools-index.md`, shipped by PR #1621."
- L724: "Two rounds of dispatch, host, model and lane-assignment facts are gone and cannot be recovered from memory without violating the log's own premise."
- L724: "Rows are appended below carrying only what git can still prove."
- L736: "**The repair PR #1620 does not close this hole, and the brain verified why.**"
- L736: "`check_dispatch_log.check_texts` opens with"
- L739: "if state_base is None or state_head is None or state_base == state_head: return CheckResult(True, detail="state narrative unchanged; ...")"
- L742: "so a round that never touches `docs/state.md` is never asked for a dispatch row."
- L742: "0906 and 0907 touched nothing."
- L742: "Guard 1 is the only backstop and its `_STALE_MERGE_TOLERANCE = 2` is exactly the width of a normal two-PR round."
- L742: "Seeded as `q-fail-open-audit` with the 0906/0907 window as its canary."
- L747: "✅ **Both repaired guards were confirmed FIRING live, which is the part that was never true before.**"
- L747: "On `main` at `b14879e28`, `queue_state_drift.py` reported the `5b865162b` anchor as three PR commits behind the ref against a tolerance of two."
- L747: "Before PR #1620 that branch was unreachable by construction — the tool counted `--merges` in a repo that has squash-merged exclusively since 2026-08-25, so it returned "fresh, zero behind" for every input."
- L747: "Both guards are now wired into `generated-files-drift.yml`, so this round's own PR is checked by them."
- L756: "**PR #1622 was held on a red required `unittest`, and the brain fixed it on the lane's branch** (fast-forward push, not a force — the round-0824c and 0905 precedent) rather than spending a lane-round on a one-file regeneration."
- L756: "Reproduced on Windows at `e6574bbf0`: `TestCheckToleratesSquashMergedTrailingSha` and `TestCheckToleratesTrailingRowAddition` both failed."
- L756: "After `python tools/generate_dashboard.py` and nothing else, the file went **34 passed**. ⚠️ **Those two tests do not use a fixture** — they run the real `--check` against the live committed `docs/dashboard.md` and then simulate one further trailing-row delta."
- L756: "The tolerance admits exactly one row, so any branch that touches `docs/state-table.md` without regenerating puts the committed file one row behind and lands the simulation two rows out."
- L756: "**This file has now cost four rounds** — 0901, 0904, 0907 and this one — each time diagnosed from scratch and each time fixed by "regenerate and commit"."
- L756: "Seeded as `q-dashboard-check-coupling`."
- L771: "⚠️ **BRAIN FINDING: `pool_freshness.py --module` fails OPEN.**"
- L771: "Verified on `40e5d826b`:"
- L774: "| `--module` | count | bytes |"
- L776: "| `overlay002` | 116 | 33,948 |"
- L777: "| `ov002` | 0 | 0 |"
- L778: "| `not_a_real_module` | 0 | 0 |"
- L780: "No error, exit 0."
- L780: "`ov002` is the spelling used in `attempts.tsv`'s own `module` column, in `codegen-walls.md` and in every 257-320 B kickoff written so far, so a lane typing the name it reads everywhere else is told the pool is empty."
- L780: "The brain hit this itself while sizing this round's dispatch."
- L780: "Folded into `q-fail-open-audit`."
- L786: "**THE DRAIN'S 6.25% IS A LOWER BOUND, NOT A MEASUREMENT — and that decides the next dispatch.**"
- L786: "`cm-257-320-drain-5` shipped 1 of 16 attempted, all 16 from `ov002` exactly as scoped, which read at face value kills round 0904's two-pool hypothesis."
- L786: "But the same round found and fixed **three** real auto-scaffold bugs in `cmatch_loop.py` *while draining*, one of which its own writeup calls "a 100% compile blocker for every ov002 candidate", and two of the three were found mid-tranche."
- L786: "Brain recomputed the parks from `attempts.tsv` (16 rows, 34 compile attempts): of the 15 parks, **11 of the 13 carrying a numeric match are under 20%**, only two cleared 20% (53.52%, 25.35%), and **2 never compiled at all**."
- L786: "That is the shape of a scaffold mistyping fields, not of a codegen wall."
- L786: "`cm-257-320-drain-6` re-attempts all 15 parks under the fixed toolchain as a pre-registered A/B before taking any fresh candidate — one variable changed, and a 0/15 re-run is a publishable result that closes the two-pool question for good."
- L801: "**Brain finding, not acted on:** PR #1620 changed `make_kickoff.py`'s Mac lane paths to `~/Dev/spirit-caller/claude-{decomper,scaffolder}-queue`, which is right per round 0905's on-Mac verification — but `AGENTS.md`'s worktree table and `docs/dispatch-log.md`'s own header still name `~/Dev/spirit-caller/{decomper,scaffolder}`."
- L801: "Two documents now disagree about where the Mac lanes live."
- L801: "Windows dispatch is unaffected."
- L808: "**Directory sync (this host).**"
- L808: "All five Windows worktrees were clean — no uncommitted lane work was at risk."
- L808: "`brain` fast-forwarded to `main`; `decomper`, `kb-map`, `kb-types` and `scaffolder` were detached onto `origin/main`; four merged local branches were pruned."
- L808: "Five unregistered directories remain beside the worktrees (`mainsweep7-p2batch2`, `sweep17-batch1`, `sweep3-4`, `sweep9-batch5`, `scratch_stash`) plus `mwccarm.bad.tmp`; they are not registered worktrees and were left alone pending an owner call."
- L817: "⚠️ **Control 12 NOT executable.**"
- L817: "Both lanes ran on the Mac; their transcripts are not readable from this host."
- L817: "The audit belongs to whichever brain next runs on the Mac, and by then rounds 0906/0907 will have been unrecorded for three rounds — see the dispatch rows below."
- L822: "**POST-MERGE AUDIT OF PR #1622, ON THIS HOST, WITH THE REAL TOOLCHAIN.**"
- L822: "Capabilities were derived live rather than read from a machine note: python 3.12.10, ninja 1.13.2, `dsd` 0.11.0, native `mwccarm` (no wine on Windows), all three baseroms, `build.ninja` configured."
- L822: "The claims verified rather than accepted: `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`; `check_activation_invariant b14879e28..288253e4b` -> `.c added 1 / .s deleted 1 / activations 1 / OK`; `check_delink_dupes` OK across 81 delinks; exactly one `.s:` -> `.c:` line flipped in EUR, the `.s` gone from disk, USA and JPN configs untouched."
- L822: "Ledger recomputed from `attempts.tsv` rather than read from prose: 16 rows, 1 shipped / 15 parked / 0 screens = 6.25%, and the six prior band briefs sum to exactly 11/84, so the pinned **12/100 = 12.0%** is correct."
- L822: "All five generated-doc `--check`s current: no race artefacts survived."
- L835: "⚠️ **EACH OF THE THREE SCAFFOLD FIXES LEFT A HOLE IN ITS OWN DEFECT CLASS.**"
- L835: "The corrections are in this PR, each mutation-verified per control 7 (revert it and exactly its own test goes red; the four round-0907 tests stay green)."
- L835: "`tools/cmatch_loop.py` appears **0** times in `build.ninja`, so no region gate result is affected."
- L841: "| # | hole, demonstrated on the real tree | correction |"
- L843: "| 1 | the padding fix sizes every `unkNN` as 4 bytes, so a halfword access overlaps: `unk2` after `unk0` gives gap `= -2`, no pad, no error, field declared at byte 4. **9 files in this tree** carry sub-4-byte `unkNN` spacing | size each field to the room before the next referenced offset |"
- L844: "| 2 | `_mined_field_types` keys on the hex offset alone, so the last mined bank parsed wins. The real `ov002_core.h` declares 162 `f_<hex>` fields over 144 offsets and **`f_0`, `f_4`, `f_c` are each declared BOTH `int` and `u16`** — a `u16` read as `int` over-reads its neighbour, the exact failure the lookup exists to prevent | keep the narrowest declared width |"
- L845: "| 3 | the `u32` fix — which the lane's own writeup calls a 100% compile blocker for every ov002 candidate — is covered only by a `build_dossier` test that SKIPS without a configured EUR build, vendored m2c and `arm-none-eabi-objdump`. It is skipped in CI **and** here, and reverting the fix left the suite green | lift the rule into `skeleton_includes()`, tested on any host |"
- L847: "The `u32` detector itself was checked and left alone: it keys on `u32` only, which is narrower than the class, but all 88 `*_core.h` in the tree that redeclare any width type redeclare `u32` — no live instance, so no change."
- L851: "⚠️ **THE GATE CAUGHT A FOURTH DEFECT, AND THE WRAPPER LIED ABOUT IT AGAIN.**"

### Old lines 851-851: kept, reworded: `AGENTS.md` Evidence, 'Until round C, the gate's exit status cannot be trusted' (three rounds running).

- L851: "`gate3.py --scope all` printed three SHA1 PASS lines and then `==================== GATE FAIL ====================` with `1 failed, 3631 passed` — while the shell wrapper exited **0**, for the third round running."

### Old lines 851-851: archived: round 0908 narrative (history), largely about retired guards, the dashboard, dispatch-log and lane transcripts.

- L851: "The failure is `test_lane_report.py::ClaudeScanTests::test_recovers_last_assistant_turn`, a hermetic test that was green in CI: **PR #1621's new tool is blind on Windows.**"
- L851: "`scan_claude` built its shortlist with `str(p).replace("/", "-")`, a no-op here because `str(Path)` yields backslash separators and a drive colon."
- L851: "Measured against the live store: the computed slugs never intersected `~/.claude/projects`, which holds `C--Users-leona-Dev-gx-spirit-caller-decomper`, and `scan_claude` returned 0 hits for a role whose directory exists."
- L851: "The fixture had the same bug, which is why it failed loudly instead of passing vacuously — a drive-lettered slug makes `root / slug` resolve to the drive root, writing the synthetic session outside the temporary directory."
- L851: "**This is control 12's evidence path**, unexecutable for nine of the last ten rounds, and it would have silently reported "no lane sessions" on the coordinating machine."
- L851: "Third instance of the path-separator class after PR #1580's `load_module_sections` and carve-15."
- L851: "After the fix the shortlist matches 2 real project directories (0 before)."

### Old lines 870-870: kept: `docs/state.md` Parked, 'decomp.dev CI (was PR #1020) is closed; it needed a private image only the owner could build' (re-checked live on 2026-09-23: `gh pr view 1020` reports CLOSED).

- L870: "**PR #1020 re-checked, still parked, no owner action requested.**"
- L870: "It is unchanged since 2026-06-24 and still waits on the private `ghcr.io/cntrl-alt-lenny/gx-spirit-caller-build` image; this host's token cannot enumerate packages, so the prerequisite is neither satisfied nor refutable from here."
- L870: "Left open and declared in `parked-prs`. <!-- main-sha: 7d546615f --> <!-- parked-prs: 1020 -->"

### Old lines 878-880: archived: heading and intro of a list of five conventions, each dispositioned below.

- L878: "## Durable conventions (lifted out of the archived round narrative)"
- L880: "Per-round narrative for rounds 0805-0810 now lives in [`docs/research/brain-rounds-0805-0810.md`](research/brain-rounds-0805-0810.md)."
- L880: "These four conventions were buried inside it and are load-bearing, so they stay here:"

### Old lines 885-892: archived: conventions 1 and 2 describe the machine-checked anchors and the PR-count rule of the retired `queue_state_drift.py`.

- L885: "1. **The two HTML markers above are machine-checked** by `tools/queue_state_drift.py`."
- L885: "`main-sha` is the `main` commit this document describes — drift fires when `main` runs more than `_STALE_MERGE_TOLERANCE` (2) PR-merges ahead of it, so a stale handoff is caught even when this file makes no PR-count claim."
- L885: "`parked-prs` is the EXPLICIT parked list: parked is never inferred from GitHub's draft bit, because the worker lanes publish ordinary output as drafts."
- L892: "2. ⚠️ **The active-PR count EXCLUDES the doc-PR carrying this update.**"
- L892: "That PR is open while you write the number and merged moments later, so counting it makes the claim wrong on `main` the instant it lands, and fails `drift-check` on the NEXT PR's CI."
- L892: "Write the count you expect to be true *after* this update merges."
- L892: "The `main-sha` anchor has an explicit merge tolerance for the same reason; the PR-count claim has none."

### Old lines 899-899: archived: convention 3 is the retired dispatch rule for the Decomper and Scaffolder lanes (owner decision 4).

- L899: "3. **The canonical dispatch rule**: Brain hands over **one complete paste-ready message per active standing lane that needs dispatch — currently two, Decomper and Scaffolder** (Verifier reviews an exact SHA rather than being dispatched a queue item) — in the same final response, never deferred to a later message."
- L899: "**Corrected 2026-09-22:** this section previously said `docs/agents/brain-onboarding.md` held the canonical statement and that `AGENTS.md` deferred to it; that file described a stale "normally all four" lane count and a "do not ask permission to merge" rule that contradicts the 2026-09-21 owner override."
- L899: "Its operating-protocol content is now archived at `docs/archive/agents-2026-09-22/brain-onboarding.md`, kept for history, not as current guidance."
- L899: "The canonical statement is `AGENTS.md` § Authority and § Topology, and the Brain role contract is `docs/agents/roles/brain.md` — nothing defers to an archived document."

### Old lines 913-913: kept, reworded and re-checked live: `AGENTS.md` 'What is actually enforced' (ruleset, required checks, force-push and deletion blocked, admin bypass; five required checks now include `configure-windows`).

- L913: "4. **Branch protection is LIVE** (ruleset `main-protection`)."
- L913: "Required checks are `Python (ruff)`, `Markdown (markdownlint-cli2)`, `drift-check` and — since round 0822b (#1531) — `unittest`, the four that run on EVERY PR (`pr-invariants` and the compile checks are paths-filtered; requiring them would hang docs-only PRs — the required set and the workflows are contract-checked by `tools/check_ci_contract.py`)."
- L913: "Force-push and deletion are blocked; repo-admin bypass keeps the brain's gated integ→main flow working."
- L913: "The brain's 3-region `ninja sha1` gate remains the real merge gate, always run locally."

### Old lines 922-922: archived: convention 5 is the retired dispatch-log row (owner decision 2).

- L922: "5. **Every seeding/doc PR appends a row to [`docs/dispatch-log.md`](dispatch-log.md)** — round, date, host, brain model, lanes dispatched, transcript location."
- L922: "Machine-locality has burned this campaign at least five distinct ways (#1504's correction, the 0822 transcript-audit gap, #1520's local git object, the WRONG-WORKTREE void dispatch); the log is the structural fix."
- L922: "A kickoff is written for the host in that row, never forwarded across machines."

### Old lines 930-940: archived: the two-lane roster and the toolchain-lane scheduling rule belong to the retired lane process (owner decision 4).

- L930: "## In flight"
- L932: "**Roster (as of 2026-09-02): TWO lanes, not four.**"
- L932: "`decomper` and `scaffolder`, both on the Windows PC."
- L932: "The Codex lanes (`kb-map`, `kb-types`) and their queues are **dormant** — `docs/queue/codex-*.md` are retained as history, not dispatched."
- L932: "Owner is trialling external models (GPT 5.6 Luna, Gemini) in the two live lanes, which is why control 12's transcript audit has been unexecutable since round 0827 — see that control's external-harness clause for the compensating checks that replace it."
- L940: "**Standing scheduling rule:** at most **one toolchain-bound lane per machine per round**; the second lane gets **build-free** work."
- L940: "The compiler serialises machine-wide and ignoring this cost a full lane-round on 2026-08-27."

### Old lines 944-949: archived: current queue items; the queue is retired (owner decision 2).

- L944: "**Current lane items** (re-seeded round 0908, live on `main`):"
- L946: "| Lane | Item | Kind |"
- L948: "| scaffolder | `cm-257-320-drain-6` | toolchain-bound |"
- L949: "| decomper | `q-dashboard-check-coupling`, `q-fail-open-audit`, `q-codegen-walls-br-backfill` | build-free |"

### Old lines 951-951: kept, reworded: `docs/state.md` Parked, 'decomp.dev CI (was PR #1020) is closed; it needed a private image only the owner could build'.

- L951: "**#1020 (decomp.dev CI) is parked on an OWNER action, not on engineering.**"
- L951: "It is complete as written (+579/-0: a Dockerfile, a workflow, and setup docs). decomp.dev ingests only CI build artifacts, the build needs the ROM, and the ROM is correctly never committed — so the design bakes it into a **private** GHCR image that CI pulls."
- L951: "**Nothing in this repo can unblock it**: it needs cntrl_alt_lenny to build and push that private image and grant the workflow access."
- L951: "Declared in the `parked-prs` anchor above so `queue_state_drift.py` excludes it."
- L951: "Leave it open; it is not stale work."

### Old lines 960-962: archived: heading and intro of the cluster snapshot; superseded by the Parked entry for the deferred residue.

- L960: "## Active clusters (post-pivot reality)"
- L962: "**The scaffold phase is officially DONE.**"
- L962: "Cluster work is no longer the primary axis; the project is now grinding C source against the curated function queue."
- L962: "Cluster status snapshot retained below for handoff context but cluster-side residue is intentionally DEFERRED per pivot discipline — if any cluster residue actively blocks a code-decomp brief, file as a brief 190+ followup; do NOT pre-emptively grind it."

### Old lines 970-970: archived: cluster A status, closed or deferred with no open work.

- L970: "- **Cluster A** — `.rodata`."
- L970: "Largely drained pre-SHA1; brief 141 closed the ov004 sweep."
- L970: "**DEFERRED (no remaining open work surfacing in code-decomp wave 1).**"

### Old lines 973-973: kept, condensed: `docs/state.md` Parked, 'Data-carve residue' (the `data_ov002_022ccc2e` residue). Cluster B itself is closed history.

- L973: "- **Cluster B** — main `.data`."
- L973: "**FULLY CLOSED** post brief 181 + 185 (`data_ov006_021ceae4` worked example shipped under the raised 4096-byte cap)."
- L973: "Single residue: `data_ov002_022ccc2e` (odd-aligned size=2, no nearby 4-aligned predecessor) — DEFERRED."

### Old lines 978-978: kept, condensed: `docs/state.md` Parked, 'Data-carve residue' (cluster C/D cross-region apply at scale).

- L978: "- **Cluster C / D-1 / D-2** — ov004 sub-clusters."
- L978: "73 EUR syms shipped pre-pivot."
- L978: "Brief 184 wired the cross-region apply subcommands (EUR dry-run smoke 1855 / region)."
- L978: "**Cross-region apply at scale is DEFERRED** — would be a follow-on to brief 178 if revived, but pivot discipline says no."

### Old lines 983-983: kept, condensed: `docs/state.md` Parked, 'Data-carve residue' (the 14.8 KB `data_020c9694`).

- L983: "- **Cluster D-3** — nested struct arrays."
- L983: "**EFFECTIVELY CLOSED** post brief 178 + 181 (~105 chunks / ~110 KB shipped)."
- L983: "Single residue: `data_020c9694` 14.8 KB mega — DEFERRED."

### Old lines 986-986: kept, condensed: `docs/state.md` Parked, 'Data-carve residue' (brief 182's cross-region cascade over `MAX_SHIFT_BYTES` and the 34 odd-aligned ov004 symbols).

- L986: "- **Cluster D** — `.bss`/zeros."
- L986: "**W7 patcher chain CLOSED for EUR** via brief 182 (134 → 142 → 146 → 150 → 162 → 164 → 168 → 180 → 183 → 186 → 182)."
- L986: "USA + JPN cross-region of brief 182's two claims hit a +36 B cascade exceeding `MAX_SHIFT_BYTES = 4`; reverted, deferred indefinitely."
- L986: "34 of 35 odd-aligned ov004 data symbols remain unclaimed — DEFERRED."

### Old lines 993-995: kept, reworded: `AGENTS.md` Invariants ('All three ROMs rebuild byte-identical') and Evidence (the gate row).

- L993: "## Metrics — what the headline is, and what it cannot measure"
- L995: "**Acceptance gate (unchanged, the only thing that decides correctness):** the 3-region byte-identical `ninja sha1`, driven by `python tools/gate3.py --scope all`."
- L995: "Nothing below outranks it."

### Old lines 999-999: kept, reworded: `AGENTS.md` Working rules (progress numbers come from `tools/progress.py` at a stated commit; do not hand-compute).

- L999: "**Headline progress metric:** **natural-C percentage per region**, from `tools/progress.py` — the same function `docs/state-table.md` and `docs/dashboard.md` both render."
- L999: "Do not hand-compute it; run the tool."

### Old lines 1003-1003: kept, reworded: `AGENTS.md` Working rules (the headline counts `.text` only; name the metric).

- L1003: "⚠️ **The headline is `.text`-ONLY, and this is load-bearing.**"
- L1003: "`progress.py` defines `CODE_SECTIONS = {".text", ".init"}` and never scans `.data`, `.rodata` or `.bss`."
- L1003: "So **no amount of data/carve work can move the headline number** — the ~407,506 B reachable data pool moves a *separate, non-combined* metric."
- L1003: "Established by PR #1596 (round 0830) after the brain had spent two rounds treating "EUR is flat" as a strategic signal without that qualification."
- L1003: "Any claim of the form "EUR is stuck" must say *at which metric*."

### Old lines 1012-1012: archived: historical objdiff metrics kept only 'for provenance'; they are in the tag and the linked research note stays for round B.

- L1012: "**Historical metrics, retained for provenance only — NOT the headline.**"
- L1012: "`complete_units`, `matched_code_percent`, `matched_functions` and `fuzzy_match_percent` from `build/<ver>/report.json` were the canonical indicators in the 2026-05 scaffold era."
- L1012: "The brief 199/202/203 diagnosis of why objdiff's fuzzy metrics under-count `.legacy.c` and `.s` ships is still correct and worth reading — [`objdiff-fuzzy-vs-complete-metric.md`](research/objdiff-fuzzy-vs-complete-metric.md) — but the figures that used to sit here were from the brief-671 era and are about a thousand PRs out of date."
- L1012: "They were removed rather than refreshed: a stale number in the file the next brain reads cold is worse than no number, and the live ones are one command away."

### Old lines 1024-1032: archived: the nested per-role worktree layout is retired; seats are not tied to a folder (framework release 3.0.0).

- L1024: "## Worktree convention — isolation per agent"
- L1026: "Each agent runs in its own worktree to prevent parallel-session interference that bit briefs 138 + 140 earlier."
- L1026: "**AGENTS.md is the canonical spec.**"
- L1026: "Since the 2026-09-21 framework adoption, the layout is one checkout per role, nested under the primary checkout, per [`docs/agents/git-and-isolation.md`](agents/git-and-isolation.md):"
- L1032: "(fenced block) ''' brain/                       primary checkout — Brain works here brain/.worktrees/decomper/   Decomper's isolated checkout brain/.worktrees/scaffolder/ Scaffolder's isolated checkout brain/.worktrees/verifier/   Verifier's isolated checkout '''"

### Old lines 1039-1039: moved: `AGENTS.md` Working rules and `docs/machine-setup.md` step 2 (a checkout needs its own `orig/` baseroms, linked with `tools/link_baseroms.py`).

- L1039: "Each linked worktree has its own `orig/` baseroms (not seeded automatically — copy them in once per worktree) and its own `build/`."
- L1039: "This replaced the older sibling-folder layout (`~/Dev/spirit-caller/brain`, `~/Dev/spirit-caller/decomper`, `~/Dev/spirit-caller/scaffolder` as separate top-level clone-shaped worktrees, and the Windows automatic `.claude/worktrees/<auto-name>/` sandboxes) — both retired in the same round that adopted the framework, once every branch they held was confirmed on `origin/main`."

### Old lines 1048-1048: archived: history of the retired sibling-folder layout and of worktree validation.

- L1048: "Brief 142's clean scaffolder-side work + brief 143's clean decomper-side work were the validation that worktree separation is sufficient."

### Old lines 1051-1051: archived: heading.

- L1051: "## Brain-pattern locked"

### Old lines 1053-1053: kept, reworded: `AGENTS.md` 'Merge rule: owner-approves' paragraph (Brain merges only after the owner's yes to that merge; a worker never accepts or merges its own work is framework rule 1).

- L1053: "- **Brain reviews and merges reviewed work — but only after the owner's explicit approval of each merge.**"
- L1053: "This is the standing owner override recorded in `AGENTS.md` § Authority (2026-09-21): Brain still does the independent review and reproduces the gate itself, but the merge waits for cntrl_alt_lenny to say go, one merge at a time — a deliberate, named exception to the framework's default routine-merge pattern, not the prohibited act of a worker accepting or merging its own work (Decomper, Scaffolder and Verifier still never do that, in any circumstance)."

### Old lines 1062-1062: archived: the PR-URL closer is replaced by `fw.py report --push` and `fw.py delivery` (framework rules 5 and 6).

- L1062: "- **PR-URL deliverable.**"
- L1062: "Every agent message MUST end with "push the branch, run `gh pr create`, reply with the PR URL.""
- L1062: "Brain verifies origin before claiming review-ready; PRs missing from origin → ask user to nudge the agent rather than silently waiting."

### Old lines 1066-1066: archived: superseded: `AGENTS.md` Evidence now sets the evidence for changes that are off the build path.

- L1066: "- **Verify gate is now 3-region SHA1 PASS** (was 24/27 module check before brief 140)."
- L1066: "For tools-only PRs that don't touch the build path, EUR-only SHA1 PASS is sufficient evidence."

### Old lines 1070-1072: archived: an audit trail of three resolved queue items.

- L1070: "## Next-brain TODO"
- L1072: "**0a. ✅ RESOLVED — the three 2026-08-17 CI/tooling items all shipped.**"
- L1072: "`q-cascade-ci-quadratic`, `q-ci-timeout-cache` and `q-toolchain-repin-eval` are all marked DONE in their queues (verified 2026-09-02)."
- L1072: "The fourth item referenced here, `q-readable-c-done-definition`, is not in any queue — its decision is recorded at item 0 below."
- L1072: "**Nothing in this block is outstanding; it is kept only so the audit trail is not silently dropped.**"

### Old lines 1079-1079: kept, condensed: `docs/state.md` Parked ('Rewriting history to scrub `.wine-lane` blobs was declined' and the untested wider-than-2-way concurrent link).

- L1079: "**Rejected in the same pass, with reasons — do not re-litigate without new information.**"
- L1079: "A `git filter-repo` scrub of the `.wine-lane` blobs in history is real (the three largest objects in the pack are `.wine-lane` files; 1,822 wine-path blobs; ~150 MB pack) but was **declined**: rewriting every commit hash invalidates 47 unique commit-sha citations across `docs/`, this file's own `main-sha` drift anchor, and the standing `git show <sha>` convention in briefs and kickoffs, and forces a re-clone on both machines."
- L1079: "Reclaiming ~74 MB does not buy that."
- L1079: "Preconditions if ever revived: between rounds, both machines synced, commit-map retained, and docs sha-citations remapped in the same change."
- L1079: "Separately, `wine_link_lock.py` was examined and is **correctly scoped** — per- worktree WINEPREFIXes already parallelise compile (3.66× at 4 lanes, brief 608/614); only the final link serialises, and wider-than-2-way concurrent linking was never tested."
- L1079: "That test is the next experiment if anyone wants one."

### Old lines 1093-1093: archived: a decision made on 2026-08-05 (the readable-C definition), recorded with its reasoning trail; history.

- L1093: "**0. ✅ DECIDED 2026-08-05 (round 0805, see top): adopted the pret-style public ladder + verdict-complete gate; rejected attainment-as-completion."
- L1093: "Original item kept below for the reasoning trail.**"
- L1093: "(2026-07-25, q-readable-c-done-definition) Decide the "readable-C done" definition; ceiling model corrected, not a completion criterion anymore. r11 found the tractable-C ceiling self-contradicting (48.03% vs r7-14's 14-24% band); fixed with shown arithmetic (main's headroom fraction 0.75 -> 0.10, region-wide ceiling 48.03% -> 30.19%) but explicitly NOT reconciled to the band — see [`docs/research/q-readable-c-done-definition-2026-07-25.md`](../docs/research/q-readable-c-done-definition-2026-07-25.md) for why forcing an exact match would be false precision, and for the larger still-flagged-not-fixed `FINISHABLE_HEADROOM_FRACTION` residual."
- L1093: "That doc gives 3 candidate "readable-C done" definitions (pret-style public ladder / attainment=100%-of-ceiling / internal verdict-complete gate) with a recommendation (adopt the ladder + verdict-gate together, reject attainment as a completion criterion) — **the brain decides** which to formally adopt."
- L1093: "If verdict-complete is chosen, note the freshness-cutoff nuance in that doc (key it per-lever-family off `codegen-walls.md`'s own correction history, not one global date)."

### Old lines 1112-1155: archived: numbered queue items for briefs 234 to 236 and carryover candidates; the queue is retired (owner decision 2).

- L1112: "1. **Brief 234 (decomper)** — C-39 drain wave 6 + C-40 3-pick mechanical cleanup."
- L1112: "Kicked off this round."
- L1112: "(A) Continue C-39b-solo drain (122 picks remain after brief 232's 35)."
- L1112: "(B) Ship the 3 remaining brief-219 C-40 picks via brief 233's locked recipe (`func_0208df40`, `_0208e1ac`, `_0208e200`)."
- L1112: "Target: 25-35 ships, hard-tier 7.42 % → 7.7-7.9 %."
- L1118: "2. **Brief 235 (scaffolder)** — Three small pilots."
- L1118: "Kicked off this round."
- L1118: "(A) **C-39e sub-classification** on brief 232's new `movs r4, r1` null+helper-at-top sub-shape (2 known picks `0228b810`, `0228b850`); if ≥2 ship, classify + extend detector."
- L1118: "(B) **Brief 232's 2 deferred picks**: `func_ov002_02295284` (double-call disjunction), `func_ov002_0220673c` (cross-call compare with dead-store artifact)."
- L1118: "(C) **Broader-C-40 corpus pilot**: brief 233 noted 459 broader `0x04001xxx`-pool occurrences beyond the 4 strict C-40 picks; pilot 5 picks outside the strict signature."
- L1128: "3. **Brief 236 candidates** (post-234/235):"
- L1129: "- **C-39e drain wave** if brief 235 (A) locks."
- L1130: "- **Broader-C-40 / C-42 drain wave** if brief 235 (C) locks."
- L1131: "- **C-39 mega-batch wave** — combine a/b/d/e + base into one cross-shape uniform-batch using brief 230 + 232's variant tables."
- L1134: "- **Permuter wave 2** on hard-tier picks — brief 198 left this open; brief 218 bitfield insight may help."
- L1136: "- **`.s` → `.c` upgrade pass on accumulated punts** — brief 221 + 223 + 224 + 228 + 230 + 232's deferred cohorts; ~100+ `.s` ships with non-permanent walls."
- L1139: "4. **Carryover candidates from prior rounds:**"
- L1140: "- **Hard-bucket pilot** (Track 2 long-form decomp)."
- L1140: "Brief 220 is the structural prerequisite for this."
- L1142: "- Brief 213's brief-201 doc correction, C-24 wall extension, C-15 `mvn #0` refinement, P-11 reg-alloc-hint research — all still available as smaller scaffolder slots."
- L1145: "5. **Scope brain candidates to keep ready:**"
- L1146: "- **C-24 wall** (predicated cascade research from brief 103): pending classifier upgrade, same shape as C-23/C-31/C-32/C-33"
- L1148: "- **Brief 197's mis-tagged C-15 prediction caveat** — `mvn #0` isn't always mwcc 1.2 routing; refine the C-15 predictor"
- L1150: "- **Decomp.me scratch upload automation** — productivity multiplier (brief 201's success makes this higher priority)"
- L1152: "- **P-11 reg-alloc-hint research** — brief 200 left this open as a separate brief candidate; sweep mwcc 2.0 SPs + optimization levels on E-12 to see if any produce orig form"
- L1155: "- **Brief 201's "two pool loads" correction in C-23 entry** — trivial doc edit (mwcc CSE'd already; the recipe still works but the explanation in pick #5's `.legacy.c` worked example is imprecise)"

### Old lines 1159-1160: kept, condensed: `docs/state.md` Parked ('Data-carve residue'), bullets below.

- L1159: "6. **Deferred indefinitely (per pivot discipline):**"
- L1160: "- `data_020c9694` 14.8 KB D-3 mega"

### Old lines 1161-1166: kept, condensed: `docs/state.md` Parked ('Data-carve residue').

- L1161: "- `data_ov002_022ccc2e` odd-aligned size=2"
- L1162: "- 34 remaining odd-aligned ov004 data symbols (brief 182 self-extend pool)"
- L1164: "- USA + JPN cross-region apply of brief 182's claims (+36 B cascade exceeds `MAX_SHIFT_BYTES = 4`)"
- L1166: "- Cluster C / D-1 / D-2 cross-region apply at scale (brief 184 wired the subcommands; never run)"

### Old lines 1168-1170: kept, condensed: `docs/state.md` Parked ('brief 190 saturation chains', 'brief 188 epilogue orphans').

- L1168: "- Brief 190 Cluster D (predicated saturation chains, 3-4 picks) — waits for a C-1 saturation recipe or permuter coverage"
- L1170: "- Brief 188 epilogue orphans (2 picks) — likely linker-emitted scaffolding or dead code"

### Old lines 1172-1172: kept in substance: `docs/state.md` Parked deferrals (these items are not lost; a brief that blocks on one files a follow-up).

- L1172: "- These items are NOT lost."
- L1172: "If a code-decomp brief actively blocks on one, file the followup it deserves; otherwise leave them."

### Old lines 1175-1178: archived: three carryovers unverified since July; superseded by round C's checker (owner decision, redesign order).

- L1175: "7. **Pre-existing carryovers (unchanged):**"
- L1176: "- `func_ov021_021aaf58` placeholder-in-complete-TU warning."
- L1177: "- ov005 placeholder-name warnings."
- L1178: "- `match-invariants` not yet a required branch-protection check."

### Old lines 1179-1223: archived: per-PR infrastructure notes (an agent-inbox hook, comment workflows, a worktree repair, a test that became a no-op, macOS permuter workarounds); the hook and inbox are retired and the rest is history in the tag.

- L1179: "8. **Known infrastructure state:**"
- L1180: "- Agent-inbox hook fix landed in PR #634 but agent sessions started BEFORE that PR will continue to silently fail (Claude Code reads `.claude/settings.json` once at session start)."
- L1180: "Inbox populates from next FRESH session start onward — brain should mention "exit your previous session" explicitly in kickoffs until it stops being a problem."
- L1186: "- CI comment-upsert workflows hardened in PR #641 (shared `.github/scripts/upsert-pr-comment.sh`, REST-only, 3-retry, fail-soft)."
- L1186: "`pr-tier-delta` and 5 sibling workflows no longer fail on transient API 401s."
- L1190: "- `objdiff_filter_panic_units.py` fixed to handle `.legacy.c` paths properly (this brain-PR). dsd emits `.o` paths; mwcc produces `.legacy.o` / `.legacy_sp3.o`."
- L1190: "Filter now rewrites via `source_path` as the authoritative routing signal."
- L1190: "**+198 matched_functions previously invisible** were the immediate recovery; the fix permanently closes the gap for all future `.legacy.c` ships."
- L1197: "- **Worktree-pointer breakage from parent-dir rename** (fixed this brain-PR via `git worktree repair`): the parent dir was renamed `gx-spirit-caller-NEW` → `gx-spirit-caller` at some point; `decomper/.git` + `scaffolder/.git` (and the corresponding `brain/.git/worktrees/<slug>/gitdir` back-pointers) kept the stale `-NEW` paths."
- L1197: "Symptom: agent worktrees can't run git commands."
- L1197: "Fix is non-destructive — `git worktree repair <path>...` from the main worktree rewrites all four pointer files."
- L1197: "Future brains starting on a renamed-parent setup should `git worktree list` and check for `prunable` markers before assuming agent worktrees work."
- L1208: "- **Brief 212 `TestStragglerSmoke` becomes idempotent-no-op post-merge.**"
- L1208: "The two tests (`test_021cb574_collapses_one_trailing_a` + `test_021d02a4_collapses_four_trailing_a`) load `.o.resolved` files from a sibling decomper build and expect the rewriter to collapse 1 / 4 trailing `$a` markers."
- L1208: "Pre-#668 they passed; post- #668 they FAIL because decomper's post-merge rebuild ran the rewriter in production, so the on-disk `.o.resolved` files are already collapsed (`trailing_promoted_collapsed: 0` on re-run)."
- L1208: "Not a regression — test design depends on pre-rewriter build state that no longer exists in normal workflows."
- L1208: "Fix candidate for whichever scaffolder brief touches `patch_arm_mapping_symbols.py` next: either (a) check for already-collapsed shape and skip, (b) read pre-resolve `.o` files instead of `.o.resolved`, or (c) check in a fixture rather than depending on a build artifact."
- L1223: "- `tools/permute.py` macOS workarounds folded in (PR #655): PEP 668 externally-managed-environment fallback auto-creates `.venv_permuter/` and patches `sys.path` in-process; disasm path resolver scans the tree-mirroring layout (`disasm/src/ <path>/func_<addr>.s`) when the flat layout is absent."
- L1223: "Brief 198's symlink workarounds no longer needed."

### Old lines 1230-1232: archived: describes machine alternation and state.md as the cross-machine bridge; git is the only memory (framework rule 2).

- L1230: "## Cross-machine handoff notes"
- L1232: "User alternates brain between Windows PC and Mac."
- L1232: "The role is tied to the local machine (toolchain + baserom on disk), not to a specific Claude session."
- L1232: "State.md is the bridge."
- L1232: "Standing conventions:"

### Old lines 1236-1236: archived: 'brain reviews and merges autonomously' contradicts the owner-approves rule and is retired.

- L1236: "- **Working pattern:** brain reviews + merges autonomously; user receives the scaffolder / decomper messages afterward."

### Old lines 1238-1238: moved: `AGENTS.md` Working rules (use `python3.13` for project scripts; macOS `python3` is 3.9) and `docs/machine-setup.md`; the three-region re-verify command is `tools/gate3.py --scope all` in `AGENTS.md` Evidence.

- L1238: "- **Verify command (Windows):** `python tools/configure.py eur && ninja sha1 && python tools/configure.py usa && ninja sha1 && python tools/configure.py jpn && ninja sha1`."
- L1238: "**On Mac substitute `python3.13`** (macOS ships no plain `python`; `/usr/bin/python3` is Apple's 3.9.6 which lacks `match` statements — `tools/configure.py` requires 3.11+ per CLAUDE.md)."
- L1238: "POSIX paths and `./dsd` instead of `dsd.exe`."

### Old lines 1244-1244: archived: per-machine memory does not follow; superseded by framework rule 2.

- L1244: "- **Memory per-machine:** Each side's `~/.claude/projects/...` memory doesn't follow."
- L1244: "State.md is the bridge."

### Old lines 1246-1246: archived: points at the retired worktree convention.

- L1246: "- **Worktrees:** see *Worktree convention* above; 3-worktree split is now standard."

### Old lines 1249-1251: archived: 'New agents? No.' describes the retired four-slot setup (owner decision 4).

- L1249: "## New agents?"
- L1251: "No."
- L1251: "Continuing with 4-slot setup (brain + decomper + scaffolder + auto-progress-badge bot)."

## Added in the new file

Every sentence of the new file is quoted, in groups that share a mark. **added**
means new text with no counterpart in the old file; **kept** or **moved** groups
name the old lines they come from. New line numbers are `N<line>`.


### New lines from N1: added: title, intro and template headings, from the 3.0.0 `state.md` template (intro text is the template's own).

- N1: "# State"
- N3: "The owner's standing decisions, what is deliberately parked, and pointers."
- N3: "Read it in a minute."
- N3: "It holds **no live state**: what is in flight, merged or failing comes from `python3 tools/fw.py status` and git, every session."
- N3: "Its word budget is checked by `tools/fw.py check`."
- N8: "## Where we are going"

### New lines from N10: added: the goal, from owner decision 1 and the redesign description in the brief, dated 2026-09-23.

- N10: "The project is becoming a lean "matching factory": a script, not people, drives the matching of functions to C, and the byte-identical rebuild of all three ROMs (EUR, USA, JPN) is the reviewer."
- N10: "Rounds exist to improve the factory, run readability passes, and deal with the functions it gives up on."
- N10: "The redesign is five reviewed rounds, each guarded by the three-ROM check:"

### New lines from N16: added: the A to E redesign order, from the brief.

- N16: "- **A** Framework 3.0.0 and retiring the old process."
- N17: "- **B** Housekeeping: research corpus and retired logs out of `main`, `tools/` cut to what the build, gate, matching loop and CI use, comment-only CI jobs dropped, and one short compiler-quirks reference distilled from the research."
- N20: "- **C** A trustworthy checker: the gate's exit status, a check that every call and data reference points at the right symbol, a lint rule against fake matches, and Claude Code and Codex settings that stop agents editing checksums, the original ROMs or generated files."
- N24: "- **D** One source tree with per-region configuration, instead of `src/`, `src/usa/` and `src/jpn/`."
- N26: "- **E** The factory: an unattended `cmatch_loop.py` runner and a one-week pilot, measured against the baseline under Historical anchors."

### New lines from N29: added: heading, dated by the owner's decisions of 2026-09-23.

- N29: "## Owner decisions (2026-09-23)"

### New lines from N31: added: owner decisions 1 to 6 of 2026-09-23, each with the one-line reason written for it here (the reasons are this round's wording, drawn from the brief and the retired file).

- N31: "1. **A script drives the matching; the ROM rebuild is the reviewer.**"
- N31: "A byte-identical rebuild of three ROMs is a check no report can fake."
- N33: "2. **The project's state is the code, the attempts ledger and one computed progress number.**"
- N33: "STATE-LOG, the dispatch log, the queue essays, the generated state table and dashboard, the briefs index, the report inbox and the Dev Hub log are retired: hand-kept records went stale (two rounds ran unrecorded)."
- N38: "3. **Housekeeping is aggressive.**"
- N38: "The research corpus, old logs and unused tools and tests go to a git tag and out of `main`, because the tag keeps everything retrievable and agents then read less."
- N41: "4. **Roles are Brain, one executor (Worker) and Verifier.**"
- N41: "The Decomper/Scaffolder lanes belonged to the retired process."
- N43: "5. **The factory runs on the owner's Windows 11 desktop.**"
- N43: "Its usage cap is set after a one-week pilot measures the cost per match, because that cost is unknown until measured."
- N46: "6. **The merge rule stays `owner-approves`.**"
- N46: "Once the factory runs, the owner approves one batch merge a day, not one per function, because per-function approval cannot scale to a factory."

### New lines from N50: added: template heading.

- N50: "## Parked, and why"

### New lines from N52: kept, condensed: from old lines 970-991 and 1159-1174 (deferred data-carve residue, briefs 182, 188, 190).

- N52: "- **Data-carve residue, deferred indefinitely** (none of it moves the headline metric): the 14.8 KB `data_020c9694`, `data_ov002_022ccc2e`, 34 odd-aligned ov004 data symbols, USA and JPN cross-region apply of brief 182 (its +36 B cascade exceeds `MAX_SHIFT_BYTES = 4`), cluster C/D cross-region apply at scale, brief 190 saturation chains (waiting for a recipe) and brief 188 epilogue orphans (2 picks)."

### New lines from N58: kept, condensed: from old lines 214-231 (round 0831 band map: 377-512 B at 5.0%, 513-1023 B at 0/15) and 485-509 (round 0904: 257-320 B sub-pool 6/30 = 20.0%).

- N58: "- **Frontier above 376 B:** 1/20 = 5.0% at 377-512 B and 0/15 above 512 B; near-misses stop at compiler-internal register allocation."
- N58: "The 257-320 B band (ov002 sub-pool 6/30 = 20% on 2026-09-04) is the only pocket above 10%."

### New lines from N61: kept: from old lines 145-150 and 720-722 (ports finished; USA and JPN at 15.85%), re-checked with `python3.13 tools/progress.py --version usa` and `--version jpn` on 2026-09-23.

- N61: "- **USA and JPN ports are finished** (15.85% each); only EUR movement changes the picture now."

### New lines from N63: kept, condensed: from old lines 1079-1087 (the `git filter-repo` scrub of `.wine-lane` blobs, declined).

- N63: "- **Rewriting history to scrub `.wine-lane` blobs was declined:** it changes every commit hash for about 74 MB."
- N63: "Revive only between rounds, both machines synced, with citations remapped."

### New lines from N66: kept, condensed: from old lines 1088-1091 (`wine_link_lock.py` scope; wider-than-2-way linking never tested).

- N66: "- **Wider-than-2-way concurrent linking through `wine_link_lock.py`** was never tested; only the link step serializes."

### New lines from N68: kept, updated: from old lines 870-874 and 951-958 (PR #1020); `gh pr view 1020` on 2026-09-23 reports it CLOSED, so the entry now says closed.

- N68: "- **decomp.dev CI** (was PR #1020) is closed; it needed a private image only the owner could build."

### New lines from N70: kept, hedged: from old lines 771-784 (`pool_freshness.py --module` fails open) and 539-549 and 652-668 (`m2ctx.py` and `gcc`), reported in 2026-09; not re-verified this round, and the entry says so.

- N70: "- **Tool defects reported 2026-09-08, not re-checked:** `pool_freshness.py --module` returning an empty pool for a spelling it does not know, and `m2ctx.py` needing a `gcc` the Windows PC lacks."
- N70: "Re-verify in rounds C and E."

### New lines from N74: added: template heading.

- N74: "## Pointers"

### New lines from N76: added: pointers to the new entry points (`AGENTS.md`, `docs/rounds/`, `BUILD.md`, `docs/decomp-workflow.md`), the ledger's path (checked with `git ls-files`) and the archive tag.

- N76: "- Rules, roles and evidence: [`AGENTS.md`](../AGENTS.md); one folder per round in [`docs/rounds/`](rounds/)."
- N78: "- Build and toolchain: [`BUILD.md`](../BUILD.md); the matching guide: [`docs/decomp-workflow.md`](decomp-workflow.md)."
- N80: "- The attempts ledger is `docs/research/campaign-analytics/attempts.tsv`, checked by `tools/validate_attempts.py`; round B decides its final home."
- N82: "- Everything retired lives at the git tag `archive/pre-redesign-2026-09-23`."

### New lines from N84: added: template heading required by the brief.

- N84: "## Historical anchors"

### New lines from N86: added: the archive tag and the pilot baseline required by the brief; EUR natural-C 17.38% (414,738 B) re-checked with `python3.13 tools/progress.py --version eur` on 2026-09-23.

- N86: "- 2026-09-23: the tag `archive/pre-redesign-2026-09-23` points at `5ad1a7a2a9733b191d5c838a36593d429bd7a841`, `main` before the redesign."
- N88: "- 2026-09-23, pilot baseline: EUR natural-C is 17.38% (414,738 B) by `python3.13 tools/progress.py --version eur`."
- N88: "The one-week pilot is measured against the 0.2-point EUR natural-C gain made between 19 August and 1 September."

Totals: 637 units removed from the old file (unmarked: 0); 47 units in the new file.

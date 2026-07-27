[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Decomper — autonomous C-match queue (WALL-AWARE)

**Protocol:** loop until QUEUE-EMPTY. `python tools/work_queue.py next claude-decomper`. For each item, the candidate list is the module's CANDIDATE (non-permanent) functions — get them with `python tools/wall_aware_headroom.py --json` (that module's `convertible_files`; richer per-file detail in `coercible_files`/`unknown_files`/`no_marker_files`). Do NOT re-attempt confirmed-`permanent` files (P-NN citation or a real unconditional `mcr`/`mrc`/`msr`/`mrs`/`swi` instruction in the body). Hand C-match a batch, byte-verify, gate `gate3.py --scope all`, ONE PR, `work_queue.py done`, commit, next. Park anything that turns out to be a genuine wall (add a `P-NN` marker, or a new codegen-walls.md entry if none fits — do NOT just re-add the old generic "wall" text). Effort MAX.

**Brief 651 rework (docs/research/brief-651-wall-tooling.md):** the "~245 convertible" framing below was wrong — brief 640 found the old classifier conflated codegen-walls.md's own "coercible-with-knowledge" (`C-NN`) bucket with "permanent" (`P-NN`), and treated the blanket `GLOBAL_ASM`/brief-294/302 whole-function-ship header (a mechanical-tool bulk stamp, not per-function proof) as a wall too. The real EUR candidate pool is **6,122** (139 `coercible` — cited C-NN code, look up the lever in codegen-walls.md; 5,951 `unknown` — cohort-stamped or prose-only, never individually assessed; 32 `no_marker` — unchanged from before). Only 32 files are confirmed-`permanent` project-wide. **Prioritize `coercible` first** (`wall_aware_headroom.py --coercible` lists every file with its code) — the lever is already documented, so these are the cheapest wins. The `unknown` bucket is real but unverified: most of it (ov002's 2,740) was mechanically `.s`-shipped by size-tier sweeps with zero C-drafting attempts (brief 416) — expect a mix of easy and genuinely-hard, same as any fresh module.

**Brief 655 finding (docs/research/brief-655-main-sweep.md):** swept main's 62 coercible + a sample of its unknown pool, 6/29 shipped. Bigger finding: of the 40 main files carrying the "brief 207 / Phase 2: Vanilla brief 202 `.s` recipe" C-34 boilerplate, **30 (75%) have zero address-duplication evidence** — mechanically bulk-stamped, not individually verified (distinct from the "brief 205" C-34 sub-tag, which checked out genuine on every file read). Read the header AND check the pool-word structure yourself before trusting a C-34 citation specifically — don't stop at "does it cite a code," ask "does the body actually show 2 loads of the same address." Coercible-vs-unknown hit rate this brief: statistically the same (20% vs 22%) — taxonomy code presence doesn't predict matchability once mistagged citations are accounted for.

**Tooling budget (2026-07-23):** a NEW tool must do one of: replace/delete an existing tool, consolidate duplicated infrastructure, measurably cut cycle time, catch a demonstrated failure class, or directly ship functions/bytes — state which in the PR. **asm-void ≠ readable C:** inline-asm-in-C is coverage hygiene, counted separately from natural C (metric split shipped end-to-end, q-natural-c-metric [DONE]); prefer natural C, use asm-void only where a documented wall justifies it.

**⚠️ ROUTE BEFORE YOU DRAFT (brief 667, 3/3 + generalised):** the recurring epilogue-shape wall is NOT a wall — it is the existing per-TU compiler routing tier. **Read the TARGET `.s`'s own epilogue first:** `sub sp,#4` + separate `pop {lr}` / `bx lr` → name the file `*.legacy.c`; fused `pop {..., pc}` → `*.legacy_sp3.c`; otherwise plain `.c`. Choosing the tier BEFORE writing the body removes an epilogue mismatch that accounted for ~14% of brief 661's sample. See `docs/research/style-a-epilogue.md` + lever-payoff #28/#29.

**⚡ WORKTREE-PARALLEL SWEEP PROTOCOL (r11 [S], proven ~7x per merge slot — cm-overlay-small-sweep shipped 64/118 this way).** For any batch of >~20 independent candidates, do NOT grind them serially. Split into ~5 batches, run each in its OWN git worktree (`git worktree add ../sweep-N -b <branch>-N`), then consolidate with `git merge --no-ff` per batch — the real 3-way merge resolves overlapping `delinks.txt` edits from independent batches cleanly (zero conflicts observed across 5 batches all editing ov002). FAILURE MODES to preflight: (a) each worktree needs the baserom + a configure run before it can gate — seed it or the batch dies late; (b) `gate3`'s dsd preflight used to false-fail in fresh worktrees (FIXED on main — probes `dsd`/`dsd.exe`); (c) never let two batches claim the SAME candidate — partition the list up front and write the partition into the PR body; (d) gate ONCE on the consolidated branch, not per worktree (per-worktree gates waste the machine). ⚠️ VERIFY AFTER CONSOLIDATION: count `.c` files added vs `delinks.txt` activations flipped — they MUST be equal. The 07-24 sweep added 64 `.c` but flipped only 63 (one function shipped with a stale `.s` activation; the ROM was still byte-correct via basename fallback, so NO gate catches this — only the count check does).

---

## Items

### cm-main-batch1 — C-match main convertibles (batch 1) [DONE]

main has ~115 convertible (non-wall) functions — the biggest remaining pool. Get the list via `wall_aware_headroom.py --json` (main.convertible_files), C-match a batch (~8-15), prefer the SDK-named ones.
**Gate:** `python tools/gate3.py --scope all` PASS + count converted.

### cm-ov004 — C-match ov004 convertibles [DONE]

ov004 has ~35 convertible functions. Get the list, C-match a batch.
**Gate:** `python tools/gate3.py --scope all` PASS + count converted.

### cm-main-batch2 — C-match main convertibles (batch 2) [DONE]

Continue main's convertible pool — different functions than batch 1.
**Gate:** `python tools/gate3.py --scope all` PASS + count converted.

### cm-coercible-651 — C-match the project-wide coercible pool (brief 651) [DONE]

Brief 655 covered main's 62-file slice (the biggest single concentration): 20 real attempts, 4 shipped (`func_0200b2f4`, `func_020a32e4`, `func_0208b0d0`, `func_02097238`), 16 parked with match% + residual documented in docs/research/brief-655-main-sweep.md. Found that 30 of the 62 citations (all sharing one specific boilerplate header, "brief 207 / Phase 2: Vanilla brief 202 `.s` recipe") don't actually exhibit the cited C-34 pattern at all — read the pool-word structure yourself, don't trust the citation. ~12 main "Vanilla" mistags + 2 branched jump-table dispatchers (`func_020037d0`, `func_02003d98`) remain unattempted (time-boxed, not walled) — a real follow-up target. overlay004/6/8/11's slice is the scaffolder's separate `cm-coercible-overlays-651` item; ov002's 33 coercible files are tracked by the parallel ov002 sweep campaign (brief 650, PR #1231), not this queue.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS (3-region sha1) — verified via a forced-clean rebuild of the 6 changed objects, not just incremental `ninja` (see brief-655's process note on why that matters after activate/revert script cycling).

### cm-unknown-main-651 — C-match a batch from main's unknown pool (brief 651) [DONE]

Brief 655 sampled the ~25 smallest files by disk size, read ~18, attempted 9, shipped 2 (`func_020ace98`, `func_020a6a00`). New lever found: converging both branches of an early-return onto one shared final `return` (instead of an early separate `return`) turned a predicated near-miss into a real branch and a 100% match. See docs/research/brief-655-main-sweep.md for the full per-file table (including near-misses at 45-80% worth a second pass). Only ~34 of main's 2,372 unknown files have been read/attempted total across briefs 640+655 — this bucket is nowhere near exhausted.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + count converted.

### cm-unknown-main-655-batch2 — C-match another batch from main's unknown pool [DONE]

Brief 663: 14/17 shipped (82%) from the 650-780 byte tier, ported to USA+JPN (28 objects), 3-region gate PASS. New levers: `.legacy.c`/`.legacy_sp3.c` routing also fixes default-tier literal-pool over-folding for nearby MMIO constants (not just epilogue shape); variadic-forwarding thunks reproduce byte-exact via manual `(addr & ~(align-1)) + size` pointer arithmetic (no `stdarg.h` in this toolchain); mwcc spills all 4 arg registers whenever ANY parameter's address is taken, regardless of real arity. 3 near-misses parked (func_0209a8d0 73.68%, func_0209a884 0%, func_0206df54 40%) — all a "want branch, got predication" pattern with no working lever found yet, opposite direction from brief 655's converge-to-return fix. See docs/research/brief-663-main-unknown-batch2.md, including a tooling gotcha: a delinks.txt patch must replace the OLD entry's full body (header + complete + .text line), not just the header line, or `dsd delink` crashes on a full clean rebuild with a corrupted duplicate block.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS (3-region sha1) + 14 converted.
Continue main's `unknown` pool (still ~2,362 files after briefs 640+655's combined sampling) — different functions than the prior batches. Get the list via `wall_aware_headroom.py --json` (`main.unknown_files`) and sort the returned objects by `text_size` (the committed `.text` span), taking the next tier up from what's already been read. Briefs 640/655's old disk-size labels are not reliable `.text` measurements. Header-read before compiling. Batch of 15-25.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + count converted.

### cm-unknown-ov002-651 — C-match a batch from ov002's unknown pool (brief 651) [DONE]

Brief 664: 6/11 shipped (55%) from the 505B+ tier (excluding brief 650's 15 already-attempted addresses, per its report's own per-candidate table). Ported to USA+JPN (18 objects), 3-region sha1 PASS. New lever: inverted nested-if (outer guard negated + nested, no `else`, inner single-statement early return) reproduces an asymmetric branch-then-predicate shape that neither plain early-return nor brief-655's converged if/else could hit. 5 near-misses parked, including a strong 81.8% pure-register-residue case (`func_ov002_022576d8`) and a confirmed instruction-selection wall for AND-vs-shift-pair byte insertion (`func_ov002_021aff4c`). See docs/research/brief-664-ov002-unknown-batch1.md. pytest: 12 pre-existing Windows path-separator failures (documented baseline, none touching this batch's files) — sha1 is the authoritative gate per CLAUDE.md.
**Gate:** `python tools/gate3.py --scope all` — 3-region sha1 PASS + 6 converted.

### cm-epilogue-wall — crack the recurring epilogue-shape wall [DONE]

**Cracked — it was the existing `.legacy.c`/`.legacy_sp3.c` routing-tier lever (briefs 034/042/044/045), never tried on these 3 candidates.** All 3 shipped, 100% match, 3-region byte-verified: `func_020915e4` and `func_0206eecc` needed `.legacy.c` (1.2/sp2p3, separate `pop{lr};bx lr`), `func_020458d8` needed `.legacy_sp3.c` (1.2/sp3, fused `pop{pc}`) — the two tiers are distinguished by the target's own epilogue shape, read directly off the `.s` file, no guessing needed. `func_020915e4` also needed an unsigned-vs-signed comparison fix and a variable-declaration-order swap after routing (both real, not epilogue-related). A 4th unlisted function brief 661 flagged as a "probable contributor" (`func_020685c8`) confirmed the mechanism generalizes (epilogue now `SAME`, body-only near-miss at 54.2%, left for `cm-nearmiss-backlog`). Updated `lever-payoff.md` levers #28/#29 evidence counts instead of adding a new wall entry — nothing here was permanent. Full diagnosis in `docs/research/queue-cm-epilogue-wall.md`.
**Original brief text below, preserved for context:**
ov002 is 2,740 `unknown` files — 45% of the entire reopened frontier, and per brief 640's git-history trace (brief 416: pure mechanical size-tier sweep hunting the disassemble/reassemble tool's OWN capability edge, zero C-drafting attempts) the single highest-leverage never-attempted module in the project. Get the list via `wall_aware_headroom.py --json` (`overlay002.unknown_files`) and sort by each object's committed-delinks `text_size`, starting with the smallest real `.text` spans. Brief 640's 2 ov002 samples split evenly (1 close/tractable, 1 genuine wall matching the already-documented C-1r predication-collapse pattern), so expect a real mix, not a guaranteed win. Batch of 15-25.
⚠️ A parallel ov002 sweep (brief 650, PR #1231) already attempted a first 15-file sample (5 shipped, 33% hit rate) — get that PR's file list before picking candidates here to avoid re-attempting the same 15.
**Gate:** `python tools/gate3.py --scope all` PASS + count converted.

### cm-main-small-c — main small/medium sweep, upper range (0x0204xxxx+) [DONE]

Brief 665: only 10 candidates existed in this exact filter (most of the range already swept). 2/8 real attempts shipped, ported to USA+JPN. **Headline: retired the P-6 "permanent" predication-threshold wall** — `func_02067b8c` and `func_0207f8f8` (named alongside `func_02087d10` in codegen-walls.md's P-6 entry, all 3 tagged permanent by brief 033) recover to 100% via `.legacy.c` routing; a later brief already fixed the 3rd sibling this way but nobody re-tested the other two. `codegen-walls.md`'s P-6 section corrected in this PR — may unlock other P-6-tagged candidates project-wide. 2 files are genuine shared-epilogue-tail stubs (unshippable, not real functions). 4 near-misses parked (Thumb stmia-batching 0%, byte-vs-word bitfield access 14.3%, 64-bit multiply reg-alloc wall 0%, struct-zero 66.7%). See docs/research/brief-665-main-small-c.md.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + 2 shipped.
The other half of brief 661's small/medium campaign — the Scaffolder takes 0x02000000–0x0203ffff, you take **0x02040000 and above**. Same method: `wall_aware_headroom.py --json` (main), size ≤256 B, header-read but treat the generic brief-294 header as non-evidence.
Apply anything you learned from `cm-epilogue-wall` — if the epilogue lever works, this batch should out-perform 661's 21% baseline.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + shipped/attempted.

### cm-nearmiss-backlog — convert brief 661's documented near-misses [DONE]

Brief 666: 2/5 shipped (func_0206eecc already resolved via a separate unmerged epilogue-wall PR, not re-attempted). `func_020967bc` (ring-buffer dequeue, 74.3%→100%: unsigned bounds check + return-raw-value lever) and `func_020403d4` (multi-call global setup, 26.8%→100% first try: don't-cache-global lever + `.legacy_sp3.c` routing). 2 more show major measurable progress without fully closing: `func_0209a000` (18-19%→70.7%: branch-polarity fix + `.legacy.c` routing recovered one whole branch to 100%, residual is a reg-alloc register-reuse choice in the other branch) and `func_02073fc8` (22.9%→35.4%: the Internet-checksum odd/even-alignment split is now fully modeled, residual is shift/mask instruction selection). `func_020685c8` unchanged at 54.2% (2 more variants tried, both worse; confirmed `lr`-preferring reg-alloc residue). All ships ported to USA+JPN. See docs/research/brief-666-nearmiss-backlog.md.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + 2 shipped, 2 improved.

### cm-main-small-f — main small/medium sweep, upper range batch F [DONE]

### cm-epilogue-resweep — re-attempt past parks with the routing rule [DONE]

Brief 668: the near-miss-prose sources (brief 661's table, brief 655, brief 641, `cmatch-parked-and-floor.md`) yielded 0/7 — every one of those was a register-count/footprint wall, a different failure class from epilogue *shape*. The real source was `docs/research/campaign-analytics/epilogue-wall-corpus.md` — a mechanical 205-row census of `main` functions matching the exact epilogue-shape signature, every row still carrying a brief 294/302 "GLOBAL_ASM endgame, reg-alloc-walled" verdict predating the routing-tier discovery. **15/24 shipped (62.5%)** from that corpus, 9 parked as genuine register-choice walls. All 15 ported to USA+JPN — 2 porting bugs found and fixed along the way (a `port_to_region.py` LOW-confidence anti-match picked the wrong same-size sibling; a hardcoded struct offset differs by 8 bytes between EUR and USA/JPN, invisible to symbol-renaming tools). 3-region `gate3.py --scope all --no-tests` PASS. See docs/research/brief-668-epilogue-resweep.md.
**Lesson for future resweeps:** source candidates from a mechanical shape-census, not from prose near-miss catalogs — the catalogs conflate epilogue-shape with register-count walls and the hit rate difference was 0% vs 62.5% on the same queue item.

**Gate:** `python tools/gate3.py --scope all --no-tests` PASS — 15 shipped, 9 re-parked.

### cm-p6-followup — hunt more retirable "permanent" walls [DONE]

Brief 669: read all 17 P-NN entries in full. **Finding 1:** P-7, P-8, and P-10 were already retired (superseded by C-27/C-25/C-29 respectively, briefs 107/100/111) but still opened with stale "why permanent" framing instead of P-6's clear retraction style — fixed all 3 to lead with the correction, original text kept below for history. **Finding 2:** P-1 through P-15 (except P-6) are each backed by exhaustive multi-tier/multi-variant falsification matrices already — re-attempting them would just re-confirm documented walls at real cost. P-16 and P-17 are the only two entries that explicitly flag themselves as under-tested (P-16: "confirmed absent by exhaustive C-shape sweep" not yet done; P-17: "do not infer 17 headers = 17 tested opportunities"). P-16's single candidate (548 B state machine) was assessed as too large a reconstruction for a speculative payoff — deferred. P-17: re-tested 2 fresh cohort members from scratch — `021e8b34` reached 72.2%, isolating the wall to exactly the one instruction the header already named (3 reshape variants tried, none crossed it, confirming the entry's own warning that reordering perturbs register allocation); `021eb128` reproduced the same core pattern plus an independent register-choice divergence. **Verdict: P-17 remains genuinely permanent** — 3 of 17 cohort members now independently confirmed (was 1), 14 remain untested for a future brief. No ships this brief — the value is documentation accuracy + confirmed-not-reopened verdicts. See docs/research/brief-669-p6-followup.md.

**Gate:** `python tools/gate3.py --scope all --no-tests` — no source changes this brief (docs/research/codegen-walls.md only); EUR `ninja sha1` re-confirmed unaffected. Per-entry verdict: P-7/P-8/P-10 retired (framing corrected), P-17 confirmed-permanent (fresh evidence), P-16 deferred.

### cm-wall-retire — systematically re-test the P-NN 'permanent' walls (r6 bet, wall-retirement lens) [DONE]

Brief 665 retired P-6; r6's reg-alloc finding effectively retires part of P-4. Only 32 files are confirmed-permanent, and the P-NN entries in docs/research/codegen-walls.md have never been re-tested against current knowledge (routing tiers, lever-payoff.md, asm-void last resort). For each P-NN: does its criteria still hold? Re-test the cheapest 2-3 candidates per entry. A retirement reopens a whole class — worth far more than one ship. ⚠️ P-7/P-8/P-10 are flagged by r6 as likely-superseded — start there.

**Gate:** `python tools/gate3.py --scope all --no-tests` + per-entry verdict (retired / confirmed-permanent with fresh evidence).

**Result:** P-7/P-8/P-10's stale framing was already corrected in brief 669 (re-verified live on main, no new action). r6's own R&D report (`docs/research/rnd-swarm-2026-07-23-r6.md`) claiming "6 of 8 + P-4's own `func_02084ac4`" falsified was independently re-tested function-by-function: **2/7 shipped** (`func_020a71e4`, `func_020a724c` — both from the broader brief-641 catalog, genuinely fixed via a "grep actual call sites for true arity" lever, not a new allocator lever), **1 false-positive correction** (`func_02084ac4`, P-4's own cited example, re-confirmed PERMANENT across 3 variants — r6 was wrong about this one), **4 partial-progress parks** (`func_0207e214` 42.9%, `func_02096040` 66.7%, two `.thumb.c` candidates at 69-71%). Critical tooling finding: `.thumb.c` files need an explicit `#pragma thumb on` or they silently miscompile in ARM mode. Both ships ported to USA+JPN, individually objdiff-verified 100%. 3-region gate PASS. Full writeup: [`docs/research/brief-671-wall-retire.md`](../research/brief-671-wall-retire.md).

### cm-epilogue-resweep-2 — re-attempt more parked candidates with the routing discriminator [DONE]

The epilogue-routing re-sweep shipped 45 last round from previously-parked functions. Keep going: re-attempt parked candidates whose park reason mentions epilogue/stack-teardown/tail mismatch — sources: brief 655/661 tables + cmatch-parked-and-floor.md. Route by epilogue first. ⚠️ Skip reg-alloc parks unless cm-wall-retire reopened them.

**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + converted/re-parked.

**Result:** Continued brief 668's mechanical `epilogue-wall-corpus.md` sweep (not the prose sources named above — brief 668 already established the corpus outperforms them 62.5% vs 0%) through its next 17 smallest still-unattempted rows. **13/17 shipped (76.5%)**, 4 parked on pure register-choice residuals. New/confirmed levers: hoist a shared pointer offset out of both if/else branches or the compiler duplicates it; a disassembly's literal flag-variable shape can be load-bearing (don't simplify to `||`); the brief-655 shared-return convergence lever generalizes to a second, unrelated function shape; "re-fetch a global instead of caching it" recurs on 2 more functions. Also fixed a brief-668 tooling bug found via this branch's own CI: 17 EUR delinks.txt headers had the wrong file suffix (plain `.c` instead of the real `.legacy.c`/`.legacy_sp3.c`/`.s`), invisible to the build but flagged by `check_match_invariants.py`. All 13 ported to USA+JPN (4 at MEDIUM confidence, individually verified). Full writeup: [`docs/research/brief-672-epilogue-resweep-2.md`](../research/brief-672-epilogue-resweep-2.md).

### cm-epilogue-resweep-3 — continue re-attempting parks with the routing discriminator [DONE]

The epilogue re-sweep shipped 45 then 39 the last two rounds — still the highest producer. Keep going on the parked backlog (brief 655/661 tables + cmatch-parked-and-floor.md), route by epilogue. Also fold in anything cm-wall-retire reopened.

**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + converted/re-parked.

**Result:** Continued the same mechanical `epilogue-wall-corpus.md` sweep as briefs 668/672 through its next 23 smallest still-unattempted rows. **17/23 shipped (73.9%)**, 6 parked — 45/64 (70.3%) cumulative from this corpus across 3 briefs. New confirmed lever: the brief-655 shared-return convergence generalizes to a 3rd shape (threshold-gated dispatch). New wall sub-class identified: an explicit register-copy of a live-in parameter (`mov r1,r0`-style) is allocator-internal and does not respond to a local-variable source hint — 2 independent confirmations this brief. Also fixed a queue-hygiene dedup bug that had silently reverted cm-epilogue-resweep-2's `[DONE]` status back to an empty `[TODO]` stub. All 17 ported to USA+JPN, individually verified 100%. Full writeup: [`docs/research/brief-673-epilogue-resweep-3.md`](../research/brief-673-epilogue-resweep-3.md).

### cm-small-resweep-upper — size-filtered small sweep, upper range 0x02040000+ [DONE]

The other half of the re-sweep (Scaffolder takes the lower range). `--max-size 256`, route by epilogue.

**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + shipped/attempted.
**Result:** 3 ships, 3-region PASS (EUR/USA/JPN), each individually fastmatch-verified at 100%. Caught and fixed a region-specific struct-offset porting bug (`func_0204c384`'s USA/JPN ports read the same global-state fields at `0x19e`/`0x198` instead of EUR's `0x1a6`/`0x1a0` — `port_to_region.py` renames symbols but not hardcoded struct-literal offsets, same class as brief 673's finding). KEY process note: the initial USA aggregate gate reported "0 confirmed, 3 culprits" for a genuine single-candidate bug, indistinguishable on its face from brief 675's contamination false-negative — individually fastmatch-testing each port (not just trusting the aggregate gate or its bisection) is what isolated the real culprit. New lever: the predication-vs-real-branch sensitivity from brief 675's early-return findings also applies to a plain `if`/`else` — swapping which branch tests first can flip mwcc's choice. 8 more candidates checked and parked (2 byte-swap idioms with correct values but wrong instruction ordering, 1 stack-layout mystery, several complex multi-call sequences not yet converged). ~520 candidates remain in the fresh 129-256B tier alone. Full writeup: [`docs/research/brief-676-small-resweep-upper.md`](../research/brief-676-small-resweep-upper.md).

### cm-regalloc-discriminator — build a systematic reg-alloc-park discriminator (r8 bets 5/9) [DONE]

Reg-alloc/predication parks dominate (44 of 74) and ship 0%, BUT r8 shows some are falsifiable (routing tier, trampoline arity — see cm-regalloc-trampoline) and match_pct is ANTI-informative (walls plateau HIGH at 84-88%, mimicking near-misses — do NOT chase high-% parks). Read the .s of the remaining reg-alloc parks and find the discriminator that predicts convertible vs genuinely-stuck (callee-arity, routing signature, decl-order sensitivity). Ship what's tractable; document the r2↔r3 permanent signature so it's park-on-sight-CORRECTLY.

**Gate:** `python tools/gate3.py --scope all --no-tests` + the discriminator writeup + any ships.

**Result:** Verified r8's bet 3 directly: `func_ov004_021dbe68` (parked 3 sessions as an "unbeatable r2/r3 wall") is a mis-classified 2-argument model — its tail-callee reads r2 as a genuine 3rd parameter at instruction 1. Modeling the true 3-arg signature ships 100% first try, correcting a prior (wrong) "confirmed permanent" re-test in `codegen-walls.md`'s P-4 entry. Documented the general discriminator: read the callee before parking a tail-call/thunk — a missing/wrong-arity forwarded argument is falsifiable, a register choice for a value computed purely locally (never crossing a call boundary) is the genuine, reshape-insensitive signature (independently reconfirmed 3× this session already, briefs 672/673, zero movement across every reshape). match_pct correlates with neither case (spot-checked 58-92%). USA/JPN port blocked by a genuine pre-existing un-carved gap in both regions' ov004 delinks.txt — flagged as a separate task. EUR ships alone. Full writeup: [`docs/research/brief-674-regalloc-discriminator.md`](../research/brief-674-regalloc-discriminator.md).

### cm-main-128-drain — drain the untouched main <=128B high-yield cell (r9 lever #5) [DONE]

r9 drain-aware analysis: ov002 <=128B is ~exhausted (87% but easy wins swept), while main <=128B is the largest UNTOUCHED high-yield block — 873 candidates, only ~10 sampled. Focus here: python tools/wall_aware_headroom.py --json --max-size 128 filtered to main. Route by epilogue first. match_pct is anti-informative for reg-alloc parks (don't chase high-%). This is where the scarce high-EV budget should go.

**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + shipped/attempted on main <=128B.
**Result:** 9 ships, 3-region (`gate3.py --scope all --no-tests` PASS: EUR/USA/JPN), each individually fastmatch-verified at 100% before the aggregate `batch_sha1.py` gate. KEY: 790 of 829 (95%) of this pool carries an identical stale "GLOBAL_ASM endgame, brief 294/302" boilerplate comment with zero discriminative power (confirms brief 655's finding at even higher prevalence) — reading raw disassembly directly shows most of the pool is ordinary tractable C once the comment is ignored; only the very smallest (~0-48B) sub-tier is genuinely non-C-expressible (shared-epilogue stubs, cross-function raw `.word` branches). Caught and fixed a HIGH-confidence wrong-same-size-sibling USA/JPN porting collision (`func_020a73e8`/`func_020a7414` both auto-resolving to the same target) by deriving the correct `-0xf4` shift from 3 independently-confirmed neighbors. New reusable levers: combining trailing void early-returns with `||` avoids predication; a plain `while` loop (not `do-while`+separate upfront check) lets both loop exits share one tail instead of duplicating it; hardware-register polls require `volatile` on every access. 21 near-misses checked and parked with real word-level diffs documented (including a recurring, unresolved `TST`-vs-`ANDS` instruction-selection residual, and a 4-register-argument-spill ABI puzzle that resisted 4 different source models) — see full writeup for exact residuals so a future attempt doesn't re-derive them from scratch. 2 tool bugs flagged via `spawn_task` rather than fixed inline (`cmatch_loop.py --keep-drafts` leftover-file conflict; `batch_sha1.py`'s `.c`→`.s` suffix-stripping gap for `.thumb.c`/`.legacy.c`/`.legacy_sp3.c`). Process lesson: `batch_sha1.py`'s bisection assumes the candidate's `.s` file still physically exists as a revert target — deleting it before gating produces a false "0 confirmed" across an entire batch regardless of correctness (hit this directly; fixed by verifying each candidate's real match% individually first, then only deleting `.s` immediately before the one real gate call). Full writeup: [`docs/research/brief-675-main-128-drain.md`](../research/brief-675-main-128-drain.md).

### cm-crossregion-ports — harvest the 340 free byte-verified cross-region ports (r10 bet 1 [S], top frontier) [DONE]

The single most gate-safe number-mover found: a verifier drove it end-to-end (port_to_region -> flip .s->.c -> full USA rebuild -> gx-spirit-caller_usa.nds sha1 OK -> reverted clean). **244 HIGH-confidence ports PER REGION remain — 219 of them at masked-byte-sim EXACTLY 1.0** (re-censused by the brain at main post-merge with the now-committed `python tools/port_census.py`: main 131, ov002 83, ov008 8, ov011 6, + a long tail; 18,752 backlog bytes/region; routing mix of the 219: 197 default / 16 legacy_sp3 / 6 legacy / 0 thumb). The old '~170' figure UNDERSOLD it. ⚠️ USE A `sim == 1.0` FLOOR: at sim 1.0 the twin is byte-identical modulo relocations, which eliminates the region-specific struct-offset bug class outright; the 25 sub-1.0 entries are exactly where that bug lives — handle those separately (their byte diffs auto-decode the shifted offsets). Re-run `python tools/port_census.py` first (writes build/port_backlog.json with the enumerated list) — EUR readable-C functions whose USA/JPN twin still ships as .s. Porting moves USA/JPN natural-C% by ~+0.55pt EACH (~44% of the EUR-vs-region gap). Sweep: `python tools/port_to_region.py --confidence-floor HIGH` over the backlog, flip the twin .s->.c, gate. Start main + ov002. NOTE: this is a DERIVATIVE cheap harvest that runs ALONGSIDE EUR work (phased-EUR-first still holds) — it's real readable-C progress on USA/JPN, not a pivot. Watch for symbol-drift port refusals (EUR-only renamed callees).

**Gate:** `python tools/gate3.py --scope all --no-tests` PASS 3-region + ported count per region + any refusals.
**Result:** 468 ships (234 USA + 234 JPN), 3-region gate PASS. sim==1.0 floor: 211/219 shipped per region (3 excluded: 2 for a stale `ov002_core.h` header missing brief 609/613's struct-bank additions in USA/JPN, 1 for a bss-alias symbol-emission mechanism needing dsd-internals investigation — both documented as follow-ups, not shipped wrong). sub-1.0 tranche: 23/25 fixed per region via ground-truth `.s` comparison (20 shared the same consistent -8 struct-offset shift as briefs 673/676's earlier finds, 1 was a genuinely wrong constant unrelated to any offset bug, 1 was a EUR-vs-target filename-convention mismatch same as the sim==1.0 batch's `ov010_021b6b00` case; JPN needed byte-identical corrections to USA's for all 22 shared fixes, confirmed not assumed); 2 parked (`func_0204f34c`/`func_020500a4`, both `.legacy_sp3`, need a full ~57-slot shared-struct field-offset table, not a quick fix). Found and fixed a real shared-tool bug: `batch_sha1.py` never adopted the `routing_suffixes` module from brief 587, breaking every `.legacy`/`.legacy_sp3` candidate's `.c`->`.s` derivation. Mandatory .c-added==delinks-flipped check verified precisely (not just by count) for both regions: 234==234 each. Full writeup: [`docs/research/brief-677-crossregion-ports.md`](../research/brief-677-crossregion-ports.md).

### cm-wall-reaudit-p11-p16 — re-audit the two falsified wall entries: P-11 (10/16 members already shipped) + P-16 (r11 [S]/[A]) [DONE]

r11's wall-hygiene audit found two catalogued 'permanent' entries contradicted by the tree itself. **P-11** ('budget zero matches'): **10 of its 16 catalogued members have ALREADY SHIPPED** as matched C — the entry's own population refutes its verdict; re-check the remaining 6 with the current lever set (typed-struct externs, trampoline-arity, tier routing, branch-order/predication) and rewrite or retire the entry. **P-16**: its SOLE falsification attempt used the exact pointer-cast idiom (`*(int*)(base+N)`) that the 07-24 overlay sweep proved is the wrong shape — re-test with typed struct members before the entry keeps deterring anyone. ALSO (cheap, same pass): r11 found **six already-shipped functions are still cited as live walls** in P-4 / lever-payoff.md prose — delete those citations so future agents aren't deterred by functions that are already matched. Update `docs/research/codegen-walls.md` + `lever-payoff.md` with the corrected verdicts. Note the still-standing entries r11 re-confirmed (do NOT reopen these): P-1, P-3, P-4-as-narrowed (true survivors only func_020b3850/func_0208b1ac/func_0207d4dc/func_0207db00), P-14, P-17.

**Gate:** 3-region `python tools/gate3.py --scope all --no-tests` PASS + any ships + the corrected codegen-walls.md/lever-payoff.md entries + the six stale citations removed.
**Result:** Documentation-only correction (no code shipped). P-11 confirmed by direct file check: 10/16 members shipped (listed), 6 genuinely remain and don't fit any current lever (entry's own framing — resists both permuter and source-shape iteration — already explains why; re-confirmed standing, not exhaustively re-tested). P-16 downgraded from PERMANENT to UNVERIFIED: the typed struct field (`D016C->f_d20`) already exists in `ov002_core.h` and was never tried (only the pointer-cast form was tested) — left as a documented, ready-to-execute lever for a future brief since the surrounding 137-instruction function has no preserved draft to build on (reconstructing it from scratch is its own multi-hour C-match effort, out of scope for a documentation-audit item). 7 stale citations fixed (the 6 named + 1 more found cross-referencing lever-payoff.md: `func_02084ac4`, contradicted by codegen-walls.md's own brief-671 note). Historical per-wave log sections left untouched (changelogs, not live status). P-1/P-3/P-4-as-narrowed/P-14/P-17 not reopened. Full writeup: [`docs/research/brief-678-wall-reaudit-p11-p16.md`](../research/brief-678-wall-reaudit-p11-p16.md).

### q-batch-port — build batch_port — turn the 438-port harvest into a turnkey gated loop (r11 [S]) [DONE]

**Result (brief 679, this PR):** shipped `tools/batch_port.py` + 31 tests, built on `batch_carve.py`'s Ops seam exactly as specified (a `PortOps(bc.Ops)` subclass reusing `gate()`/`branch_guard_message()`/`bisect_plan()`/`GateTimeout` verbatim). All 4 must-haves met, but **(b) needed a different fix than its own framing suggested**: the obvious "never delete the `.s` until the batch commits" reading is actually WRONG — the first real gated run against the live backlog proved it, bisecting all 7 staged candidates out as false culprits identically. Root cause (found by reproducing one by hand and reading ninja's raw error): a `.s` and `.c` with the same stem coexisting on disk makes `ninja` refuse the WHOLE build outright (`multiple rules generate ... .o` — dsd's per-TU rule keys off the function stem, not the extension), so leaving the `.s` "for safety" guarantees every gate fails for every candidate. Real fix: cache the `.s` content in memory (mirrors `batch_carve`'s own `_reapply()` pattern), delete it immediately at stage time, restore from the cache on any revert — satisfies the actual intent (a revert always produces a buildable `.s`) without the coexistence conflict. Also never guesses a target filename convention from the EUR source (the recurring brief-677 bug class) — reads the CURRENT delinks.txt TU header for the port address directly as ground truth for the stem, takes the routing-tier suffix from the EUR source (a `.s` carries no routing signal of its own). Two real gated batches (10 candidates each, USA + JPN): 6 shipped per region across 3 auto-committed bisect-split sub-batches, 3 refused (confidence floor, parked cleanly pre-stage), 1 genuine gate-fail correctly isolated in BOTH regions (`func_020139a0` — a known fingerprint-sibling-confusion case, not a new bug) and cleanly reverted (confirmed directly: `.s` back in place, delinks.txt back to `.s:`). 3-region `gate3.py --scope all --no-tests` PASS. Full detail: `docs/research/brief-679-batch-port.md`. NOTE: did not drain the full backlog — this session's `cm-crossregion-ports` brief (PR #1335) already harvests the same `sim==1.0` backlog on a sibling unmerged branch; further draining here would just create needless delinks.txt merge-conflict surface against it. `batch_port.py` now stands ready as the turnkey tool for whatever backlog accumulates going forward.

**Gate:** `python -m pytest -q tests` + a real gated run on >=1 batch per region showing auto-commit of green + clean revert of red + the ported count. ✅

### q-sm64ds-reingest — re-ingest the sm64ds mwccarm catalogue — 100+ commits since our snapshot (r11 [A]) [DONE]

**Result (brief 680, this PR):** codex-decomper's queue independently ran a first re-ingest 2026-07-23 (`imported-sm64ds-r2.md`) which r11 then flagged as already stale the wrong way — the peer's notes file had frozen while its commit stream kept moving. This item's ingest (`imported-sm64ds-r3.md`) changed METHOD accordingly: mined the peer's commit stream (147 commits since the r2 cutoff) and its new structured `nearmiss/db.jsonl` (683 rows) directly instead of the lagging notes file. **Second, stronger negative-result confirmation: 0 hits for all 3 residuals** (TST-vs-ANDS/byte-swap/4-register-spill) across the 683-row structured DB, independently reconfirming r11's own notes-file grep. Banked a methodology caution: the peer retracted 116+9 "matched" functions as hand-asm-not-C on 2026-07-24, so any pre-that-date match-rate claim from them (including our own brief-524 import note) is overstated. 14 new UNVERIFIED-ON-2.0 levers transcribed from the peer's commit stream, none tried against our corpus this pass. SEPARATELY (r11's own report, same source, squarely inside this item's "verify the promising ones against our own matched corpus" gate text): executed 2 concrete INTERNAL leads r11 found for 2 of the 3 residuals — the C-23 TST-vs-ANDS routing-fix retry (3/4 shipped, 1 parked on a pure register-swap) and the byte-swap `func_0206ea00` draft (shipped) — plus a bonus mis-parked-epilogue fix (`func_0209cae4`) and a wall-taxonomy correction (P-1's citation list had 2 stale entries). All 5 ships ported to USA+JPN, 3-region `gate3.py --scope all --no-tests` PASS. Full detail: `docs/research/brief-680-sm64ds-reingest.md`.

**Gate:** the updated reshape-recipes doc with new levers marked UNVERIFIED-ON-2.0 + any lever actually re-tested on our corpus (with the result) + explicit 'nothing new for X' where a residual stays unaddressed. ✅

### cm-crossregion-mop — close out the port lane: 20/region left + the 2 documented blockers [DONE]

**Result (brief 681, this PR):** both brief-677 blockers cleared —
`ov002_core.h`'s brief 609/613 struct-bank additions propagated to
USA/JPN (byte-identical to each other, gated independently), and
`func_ov008_021ac1cc`'s bss-alias case fixed in both regions via a real
`.space 0x0`-then-alias split in each region's `bss.s` (a symbols.txt
line alone is not sufficient — the linker needs the real split too).
Shipped 13/region (26 total) of the 18 sim==1.0 candidates; 5/region
refuse even at MEDIUM confidence on a genuine cross-region symbol
rename, explicitly out of `port_to_region.py`'s documented scope —
parked. Both sub-1.0 candidates re-confirmed as needing brief 677's
already-documented 57-slot struct-offset table — parked unchanged.
Found and documented (not fixed) two `port_to_region.py` bugs while
hand-fixing 7/region gate-fails: a regex `\b`-boundary gap that makes
`_alias`-suffixed references invisible to substitution, and a more
serious address-keyed dict collision that silently mis-resolves even a
*bare* base-name reference to its alias's name — compiles clean, links
clean, wrong bytes. Backlog now identical 7/region in both regions (5
refused + 2 sub-1.0). 3-region `gate3.py --scope all --no-tests` PASS.
26 `.c` added == 26 delinks.txt flips == 26 `.s` deleted, verified by
diff not just count symmetry. Full detail:
`docs/research/brief-681-crossregion-mop.md`.

**Gate:** 3-region `python tools/gate3.py --scope all --no-tests` PASS + port_census showing the backlog at/near 0 + the ov002_core.h propagation + a verdict on the bss-alias case. ✅

### cm-sm64ds-lever-verify — verify the newly-ingested sm64ds levers on our 2.0/sp1p5 corpus [DONE]

**Result (brief 682, this PR):** all 14 levers tried against real local
candidates: 5 VERIFIED-ON-2.0 (mechanism confirmed real — 3 load-bearing
and shipped: hidden-arg liveness on `func_02087e54`, volatile-read pinning
on `func_02066ea0`, field-by-field-copy-plus-guard on `func_02085664`; 2
confirmed real but not applicable — fake-dependency coloring blocked by an
unrelated frame-shape wall, u64-laundering confirmed to work in the
opposite direction this candidate needs), 5 FAILED-ON-2.0 (2 of which
still shipped their candidate via the OPPOSITE approach from the one
tested: `func_ov002_022a822c`'s duplicate-beats-hoist, `func_ov006_021b60a4`'s
correct-reconstruction-beats-offset-split), 3 honest NO-CANDIDATE after a
real corpus search, 1 moot (lever's precondition never arose — bonus: a
93% near-miss fell out of testing it, flagged as a follow-up). None of the
14 touch the 3 open residuals — reconfirmed, nothing new for any of them
this pass (their own internal leads were separately executed in brief
680). Along the way, 6 independent agents hit the same real
`tools/verify.py` bug (hardcoded `wine`, unresolvable on native Windows) —
fixed for real via the existing `exe_launch_prefix()` helper rather than
just flagged. Full per-lever ledger:
`docs/research/reshape-recipes/imported-sm64ds-r3.md`. Full writeup:
`docs/research/brief-682-sm64ds-lever-verify.md`.

**Gate:** 3-region `python tools/gate3.py --scope all --no-tests` PASS + a per-lever VERIFIED/FAILED/NO-CANDIDATE table + any ships + the .c-added == delinks-flipped count stated in the PR body. ✅

### cm-sm64ds-lever-apply — apply the 5 VERIFIED-ON-2.0 sm64ds levers across the parked corpus [DONE]

> DONE: PR #1353 (not yet merged as of this branch — patched locally per
> the known work_queue.py staleness gap: `next` on a fresh-from-main
> branch re-surfaces any shipped-but-unmerged item as TODO).

`cm-sm64ds-lever-verify` tested all 14 imported levers on our own tree: **5 VERIFIED-ON-2.0, 5 FAILED, 3 NO-CANDIDATE, 1 moot**, with 5 ships along the way (3 where the lever was load-bearing, confirmed by controlled A/B against a failing control). Those 5 verified levers have only been used on their single test candidate each — now sweep them across the parked corpus.

For each of the 5 verified levers (see the per-lever ledger in `docs/research/reshape-recipes/imported-sm64ds-r3.md`): find every parked candidate whose documented residual matches that lever's failure shape and re-attempt it. Hidden-arg liveness, volatile-read pinning and field-by-field-copy-plus-guard were the load-bearing three — start there. Report ships per lever so we learn which imports actually earn their keep at scale, not just once.

⚠️ State the `.c-added == delinks-flipped == .s-deleted` counts in the PR body (verify by diff, as brief 683 did — that report was exemplary).

**Gate:** 3-region `python tools/gate3.py --scope all --no-tests` PASS + ships per lever + the three-way count check stated in the PR body.

### cm-ov004-021cd3b4-finish — finish the 93% candidate brief 683 flagged (it was described in prose but never queued) [DONE]

> DONE: PR #1354 (not yet merged as of this branch — patched locally,
> same staleness gap as cm-sm64ds-lever-apply above).

⚠️ Filed by the brain: `cm-sm64ds-lever-verify` flagged this as a follow-up **in its PR text only**, so no task existed — the third recurrence of the 'flagged follow-ups evaporate' pattern this week. **A prose mention is not a task: append a real `### id — title [TODO]` block to the queue file.**

The candidate: `func_ov004_021cd3b4` (previously untried) now reconstructs to **93% — 176 of 189 instructions** under lever 8, with 2 small residuals remaining. That is close enough to be worth a dedicated attempt with the full current toolkit (tier routing by epilogue, typed-struct externs, trampoline-arity check, branch-order/predication, the newly-verified sm64ds levers). If the 2 residuals turn out to be the known TST-vs-ANDS or argument-spill classes, say so explicitly and park with the word-level diff documented — that is a useful result too.

**Gate:** 3-region `python tools/gate3.py --scope all --no-tests` PASS + either the ship or a documented word-level residual naming the wall class.

### q-invariants-green — get `Match invariants` green on main [DONE]

Red since ~2026-07-22 (small/quick fix, per the brain's own sizing).

The CI check has 4 error-severity `cross_file_name_drift` issues, all pre-existing on main, none caused by any open PR. Two different root causes, fix separately:

(a) THREE dead placeholder externs, not rebase drift. `extern void func_02086800_dummy(void);` at line 10 of `src/main/func_02086800.c`, `src/usa/main/func_02086718.c`, `src/jpn/main/func_02086718.c`. These are brief-494 campaign-prep unverified swarm drafts. The symbol never existed, and the declaration is never referenced in any of the three bodies — it emits nothing. Delete the 3 lines. Do NOT follow the checker's own suggested fix ("re-apply with rename_symbol.py") — its diagnosis is wrong. All 3 files are the active delinks.txt entries in their regions, so `gate3 --scope all` must still pass afterward — removing an unused extern declaration cannot change codegen, but prove it, don't assume it.

(b) ONE checker bug. `src/overlay001/func_ov001_021ca144.c:15` is reported as `extern ... c`. Line 15 is INSIDE the file's opening `/* */` comment block — it is prose describing the C-27 alias recipe ("a second extern name at the identical address"). `check_match_invariants.py` is not stripping comments before scanning for extern declarations. Same bug class the q-khdays-toolkit port found and fixed upstream (a return statement misparsed as a declaration) — check whether that fix's approach ports here. Add a pytest regression test that feeds the checker a comment block containing the word "extern" and asserts zero findings.

**Gate:** `python tools/check_match_invariants.py` reports 0 errors (warnings are fine and do not block); `python tools/gate3.py --scope all` PASS.

### cm-ov002-unknown-sweep — sweep ov002's unknown pool, the biggest untouched concentration left [DONE]

> DONE: PR #1363, 79/125 (63.2%) shipped from the 32-88B band (not yet
> merged as of this branch — patched locally, same staleness gap as
> cm-sm64ds-lever-apply above; `next` claimed this item by FIFO before
> handing me q-fastmatch-sweep-friction, since it was still [TODO] on
> main — corrected here rather than re-attempting already-shipped work).

`wall_aware_headroom.py --exclude-attempted` currently reports ov002 at 2,682 candidates (8 coercible, 2,674 unknown, 0 confirmed-permanent) — the single largest pool in the project, ahead of main's 2,260. Most of it was mechanically `.s`-shipped by size-tier sweeps with zero C-drafting attempts (brief 416), so expect the usual mix, not a wall.

Use the WORKTREE-PARALLEL SWEEP PROTOCOL in the queue header — it shipped 64/118 on cm-overlay-small-sweep and is the proven ~7x-per-merge-slot pattern. Take a size-gated batch (start 0-256B, the tier b661 measured at a 35-55% floor), partition it across ~5 worktrees, write the partition into the PR body, gate ONCE on the consolidated branch.

Two preflights that have bitten this protocol before: seed each worktree with the baserom + a configure run or the batch dies late; and after consolidation, COUNT the `.c` files added vs the delinks.txt activations flipped — they must be equal (the 07-24 sweep added 64 but flipped 63, and no gate catches that, only the count check does).

COORDINATION: the scaffolder's data lane is also in overlay002 but only touches `data_ov002_*.c` blobs. Stay on `func_ov002_*` and you are disjoint; delinks.txt overlap merges cleanly with `--no-ff`.

**Gate:** `python tools/gate3.py --scope all` PASS + shipped/attempted count in the PR body.

### q-fastmatch-sweep-friction — fix the 3 fastmatch.py gaps cm-ov002-unknown-sweep's sweep flagged [DONE]

PR #1363's 5-worktree sweep hit three real `tools/fastmatch.py` gaps, worked around all three, and shipped the workarounds as prose instead of fixes — that's pure repeated cost for the next lane. Fix the tool itself this round:

(a) **Gap-object auto-discovery never finds anything for an individually-carved `.s` file.** `find_gap_by_glob` only matches `_dsd_gap@<module>_*.o` — dsd only emits those for genuinely-unassigned regions, never for a whole-function candidate that already has its own per-function delinked reference object at `build/<region>/delinks/<src-path>/<func>.o`. Confirmed independently by 3 of 5 sweep batches, none of which could rely on it. Fix it (resolve via the delinked-object path instead) or delete the auto-discovery path entirely — a feature that never works and is always bypassed is worse than no feature.

(b) **Ninja hard-errors ("multiple rules generate X") when a candidate's `.c` draft and its still-referenced `.s` coexist.** This is the SAME root cause `q-toolbugs-round2` (#1351) already fixed inside `batch_sha1.py` (`_displace_stale_sibling` / `_restore_stale_sibling` / `_reconfigure` / `_MULTIPLE_RULES_RE` / `_correlate_stale_sibling`). Reuse that fix's approach rather than inventing a second one.

(c) **Unhandled `Path.relative_to(ROOT)` crash for an out-of-repo `--gap` path.** `match_one`'s result-dict construction assumes the resolved gap object is always inside `ROOT`; a user-supplied `--gap` path outside the tree raises `ValueError` instead of reporting cleanly.

ALSO in this PR: add the queue-marker guard test. `q-metric-extern-guard` sat unschedulable three times because its heading lacked a status marker — that class of bug must have a real regression test guarding it (check whether `tests/test_work_queue.py` already covers this generically before writing a new one; if it does, say so in the PR body instead of duplicating).

**Gate:** a real repro for each of (a)-(c) against pre-fix code, the way #1351 stash-reverted each fix to prove the test actually catches it — tests that pass before the fix prove nothing. `python tools/gate3.py --scope all` PASS.

### cm-ov002-unknown-sweep-2 — continue the ov002 sweep, next size band up [CLAIMED]

> IN PROGRESS (2026-07-26): all 5/5 worktree batches complete and merged
> (95/145 shipped, 65.5%), codegen-walls.md C-45/C-46/S-1-extension
> entries added, 3-region `gate3.py --scope all --clean` PASS confirmed
> (all three of eur/usa/jpn SHA1 individually grepped from the log).
> Finishing: re-gating after catching up with the 12 PRs that merged to
> main while this was in flight, then marking DONE. See
> `docs/research/cm-ov002-unknown-sweep-2-2026-07-26.md`.

`cm-ov002-unknown-sweep` (#1363) covered the 32-88B band (125 candidates, 63.2% shipped). Use `wall_aware_headroom.py --exclude-attempted` to find the next size band up and repeat: same WORKTREE-PARALLEL SWEEP PROTOCOL, same up-front partition written into the PR body, same three-way count check (`.c`-added == `delinks.txt`-flips == `.s`-deleted) after consolidation. Use the fixed `fastmatch.py` from `q-fastmatch-sweep-friction` for this sweep, not the workarounds.

The prior sweep reversed 2 documented wall verdicts (`func_ov002_022abf88`, `func_ov002_021e2cd4`) and found a C-34 mistag (`func_ov002_022a1870`) — those corrections belong in `codegen-walls.md` as edits in THIS PR, not only in the writeup, or the next lane re-parks the same functions.

**Gate:** `python tools/gate3.py --scope all` PASS + the three-way count check in the PR body.

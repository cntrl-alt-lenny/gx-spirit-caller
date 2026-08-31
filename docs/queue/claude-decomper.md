[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Decomper — autonomous C-match queue (WALL-AWARE)

**Protocol:** loop until QUEUE-EMPTY. `python tools/work_queue.py next claude-decomper --claim`. For each item, the candidate list is the module's CANDIDATE (non-permanent) functions — get them with `python tools/wall_aware_headroom.py --json` (that module's `convertible_files`; richer per-file detail in `coercible_files`/`unknown_files`/`no_marker_files`). Do NOT re-attempt confirmed-`permanent` files (P-NN citation or a real unconditional `mcr`/`mrc`/`msr`/`mrs`/`swi` instruction in the body). Hand C-match a batch, byte-verify, gate `gate3.py --scope all`, ONE PR, `work_queue.py done`, commit, next. Park anything that turns out to be a genuine wall (add a `P-NN` marker, or a new codegen-walls.md entry if none fits — do NOT just re-add the old generic "wall" text). Effort MAX.

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

### cm-ov002-unknown-sweep-2 — continue the ov002 sweep, next size band up [DONE]

> DONE: PR #1372 (not yet merged as of this branch — patched locally,
> same staleness gap as cm-sm64ds-lever-apply above). All 5/5 worktree
> batches complete and merged (95/145 shipped, 65.5%), codegen-walls.md
> C-45/C-46/S-1-extension entries added, three-way count 95==95==95
> confirmed. 3-region `gate3.py --scope all --clean` PASS confirmed
> AFTER catching up with the 12 PRs that merged to main mid-flight (all
> three of eur/usa/jpn SHA1 individually grepped from the log both
> before and after that catch-up merge). See
> `docs/research/cm-ov002-unknown-sweep-2-2026-07-26.md`.

`cm-ov002-unknown-sweep` (#1363) covered the 32-88B band (125 candidates, 63.2% shipped). Use `wall_aware_headroom.py --exclude-attempted` to find the next size band up and repeat: same WORKTREE-PARALLEL SWEEP PROTOCOL, same up-front partition written into the PR body, same three-way count check (`.c`-added == `delinks.txt`-flips == `.s`-deleted) after consolidation. Use the fixed `fastmatch.py` from `q-fastmatch-sweep-friction` for this sweep, not the workarounds.

The prior sweep reversed 2 documented wall verdicts (`func_ov002_022abf88`, `func_ov002_021e2cd4`) and found a C-34 mistag (`func_ov002_022a1870`) — those corrections belong in `codegen-walls.md` as edits in THIS PR, not only in the writeup, or the next lane re-parks the same functions.

**Gate:** `python tools/gate3.py --scope all` PASS + the three-way count check in the PR body.

### q-fastmatch-selfheal-inflight — fix the 4th fastmatch.py gap: cross-candidate collision self-heal [DONE]

`cm-ov002-unknown-sweep-2` (#1372) found a FOURTH `fastmatch.py` gap, independently hit by 4 of its 5 batches: the ninja-collision self-heal added in #1368 does not resolve a "multiple rules generate X" error when a DIFFERENT in-flight candidate caused it — it only recognizes a conflict matching the CURRENT candidate's own `.s` sibling, so it fails naming the wrong file and does not self-heal. One report adds a sharper detail: the self-heal's own successful-path cleanup (restore-sibling + reconfigure) can reintroduce the collision for whatever OTHER candidate is mid-draft at that moment. Four independent rediscoveries in one sweep is decisive evidence it is worth fixing rather than working around again.

Fix it the way #1368 and #1351 did: build a real repro against pre-fix code and confirm the test FAILS before your fix, then passes after. A test that passes before the fix proves nothing — this project has been bitten by exactly that, twice.

**Gate:** a real repro against pre-fix code (git-stash-verified) + `python -m pytest tests/test_fastmatch.py -v` all passing + `python tools/gate3.py --scope all` PASS.

### cm-ov002-unknown-sweep-3 — continue the ov002 sweep, next size band [S] [DONE]

ov002's unknown pool is the largest untouched concentration in the project. Rate so far: 63.2% (#1363, smallest band) then 66.4% (#1372, 92-104B band). Take the next band up.

Use the WORKTREE-PARALLEL SWEEP PROTOCOL in the queue header — 5 worktrees, partition the candidate list up front and write the partition into the PR body, gate ONCE on the consolidated branch. Preflight each worktree with the baserom + a configure run or the batch dies late.

Note: PR #1367 added `tools/check_ci_contract.py`. If you touch anything in `.github/`, run it — it proves every required status check can actually report.

**Gate:** `python tools/gate3.py --scope all` PASS + the three-way count check in the PR body.

### cm-ov002-unknown-sweep-4 — next size band [S] [DONE]

> DONE: all 5/5 worktree batches complete and merged (59/145 shipped,
> 40.7%), codegen-walls.md P-20 (new) + C-46 extensions added,
> three-way count 59==59==59 confirmed. No stray drafts this round (all
> 5 batches' own pre-merge `ninja -n` checks were already clean). No
> mid-flight `main` catch-up needed — `origin/main` had not moved since
> branch base. 3-region `gate3.py --scope all --clean` PASS confirmed
> (all three of eur/usa/jpn SHA1 individually grepped from the log).
> The "brief 302/294 header" question that batches 1/3 re-raised was
> already settled by sweep-2/3 — confirmed again directly via
> `tools/asm_escape.py` source, not a new failure-mode instance; see
> `docs/research/cm-ov002-unknown-sweep-4-2026-07-27.md`.

### cm-ov002-unknown-sweep-5 — next size band [S] [DONE]

> DONE: all 5/5 worktree batches complete and merged (96/198 shipped,
> 48.5% — a rebound from sweep-4's 40.7%, not a continued decline).
> `tools/check_activation_invariant.py` caught a real bookkeeping miss
> (one shipped function's `delinks.txt` line never got flipped) —
> fixed in a dedicated commit, then confirmed 96==96==96. P-20's cohort
> more than doubled (11->28 members); 3 new wall classes found (P-21,
> P-22, P-23). `generate_research_index.py` regenerated BEFORE pushing
> this time (PR #1384 got blocked on drift-check for skipping this).
> 3-region `gate3.py --scope all --clean` PASS confirmed. No mid-flight
> `main` catch-up needed. See
> `docs/research/cm-ov002-unknown-sweep-5-2026-07-29.md`.

### cm-ov002-unknown-sweep-6 — next size band [S] [DONE]

> DONE: all 5/5 worktree batches complete and merged (72/160 shipped,
> 45.0%). Batch 2's worker self-organized into 4 nested sub-agents in
> its shared worktree without authorization, which surfaced a real
> `fastmatch.py` self-heal race under N-way same-worktree concurrency
> (a resurrected already-deleted `.s`, caught by full independent
> re-verification, not trusted from self-reports) and confirmed nested-
> agent notifications route to the root session, not the actual
> parent. See the new standing instruction below. Major finding: P-17
> downgraded to UNDER RECONSIDERATION — a previously-untested lever
> (constant-immediate placement) resolved 2/2 attempted cohort members
> to 100%. Three new wall classes filed (P-24/25/26). `main` moved to
> `7c28f92f8` before this branch was cut; no catch-up needed. 3-region
> `gate3.py --scope all --clean` PASS confirmed. See
> `docs/research/cm-ov002-unknown-sweep-6-2026-07-30.md`.

### cm-ov002-unknown-sweep-7 — module-agnostic measurement sweep, 149-1023B [S] [DONE]

> DONE: all 5/5 worktree batches complete and merged. **20/100 shipped
> (20% blended), but the real result is the band split: 149-512B
> shipped 20/60 (33.3%, 4,968 bytes, 82.8 B/attempt); 513-1023B shipped
> ZERO of 40 genuine attempts.** Strongest predictor found: callee
> ground-truth availability, not raw byte size — every unshipped
> 513-1023B candidate had under 65% of its callees already matched
> elsewhere. P-16's counter-lever (typed struct over raw pointer-offset
> casting) independently re-confirmed on a 2nd function — now believed
> systemic, not one-off. Corrected S-2's "sparse switch case order is
> irrelevant" claim (real counter-example found). One process incident
> (a single mistaken sub-agent spawn on one hard candidate, caught
> immediately via the coordinator verifying the worktree directly, no
> stray files, rest of the batch done directly — much smaller-blast-
> radius than sweep-6's incident, suggesting the non-negotiable framing
> helped). 3-region `gate3.py --scope all --clean` PASS confirmed. No
> mid-flight `main` catch-up needed. See
> `docs/research/cm-ov002-unknown-sweep-7-2026-07-30.md` for full
> detail, per-batch breakdown, and the time-per-candidate data (with an
> important caveat: roughly half the 513-1023B band's time entries are
> "decided not to attempt," not "attempted and failed," and understate
> true per-candidate cost for that band).
>
> **No new item filed.** This was a measurement sweep for a strategic
> decision, not a ship-maximizing one — the data above (149-512B is
> productive and module-agnostic; 513-1023B might respond to
> callee-coverage-targeted selection rather than address-order
> selection; >=1024B looks tooling-blocked per a separate analysis
> line, not sweep-blocked) is reported for that decision, not acted on
> unilaterally here. The P-17 re-test lead (15 members, one lever
> untested) also remains open and unfiled, per the same reasoning.

Six sweeps had worked the 1-148B tier, which holds only 6.75pp (percentage points of the project's remaining unshipped bytes) of what's left. Measured pools instead:

| Band | Candidates | Never-assessed | pp |
|---|---:|---:|---:|
| 149-512B | 2,898 | 2,878 | 33.00 |
| 513-1023B | 613 | 600 | 18.14 |
| >=1024B | 334 | 315 | 30.16 |

Take **100 candidates split ~60/40 across 149-512B and 513-1023B**, module-agnostic (not ov002-only). 5 worktrees, 20 candidates each. **This is a measurement exercise, not a maximize-ships sweep**: the deliverable is bytes-per-attempt and ship-rate in each band separately, to decide where future sweeps go. Real ships are still valuable but breadth of data matters more than grinding any one candidate to completion.

**Report bytes shipped and pp, not ship-rate, going forward.** Ship-rate alone is misleading — it measures rate, not output, and ignores that larger bands hold bigger functions. Across the 6 ov002 sweeps, ship-rate fell (63.2%->45.0%) while bytes-per-attempt rose 88% (37.9->71.1) — the project has been getting steadily MORE productive, the opposite of what ship-rate alone suggested.

**RECORD ELAPSED MINUTES PER CANDIDATE.** The project has no time data at all; cost-per-attempt at these sizes is unknown and is the number that decides where every future sweep goes. Every worker logs a start/end timestamp (or elapsed minutes) per candidate in its final report, shipped or parked.

**Read `docs/research/brief-582-c-ceiling-probe.md` and `docs/research/brief-586-ceiling-r2.md` first** — the only prior art above 512B. Their verdict: the blocker at these sizes is iteration budget, not comprehension (0/5 targets across both briefs failed on "couldn't understand the assembly"). Proven method: read the `.s`, cross-reference already-matched sibling `.c` files in the same module for real signatures, hand-trace the full behavior BEFORE writing C, use `tools/m2c_feed.py --m2c --context` as a scaffold cross-check, iterate via `fastmatch.py` same as always. Known levers specific to this size range: C-24 (`.legacy_sp3.c` routing for the push-r3-padding-vs-explicit-sub-sp alignment symptom — only try when the REST of the function is otherwise close, it can make things worse on denser functions); un-inline a wrongly-factored shared helper into a macro when the `.s` shows the same block repeated at 3+ call sites with no internal `bl` (the original inlines it, doesn't share it); P-16 (repeated `global_symbol+K` address rematerializing into its own pool constant across 3+ call-separated points).

**Park at the first orthogonal register-allocation residual.** With 3,478 unassessed candidates in these two bands, the marginal candidate is far cheaper than the marginal iteration — don't grind. This applies even harder than in prior sweeps.

**NON-NEGOTIABLE — one worker per worktree, no exceptions.** State this verbatim in every batch dispatch prompt: "Work through your assigned functions yourself, one at a time, directly. Do NOT spawn further sub-agents or otherwise sub-divide your assignment — a worker that did this last round caused a real `fastmatch.py` self-heal race (one agent's legitimately-shipped function had its `.s` silently resurrected by a different concurrent agent's unrelated self-heal action) and left its own completion notifications unable to reach its actual parent. The self-heal is designed for one worker per worktree; it is not concurrency-safe and will not be made so."

Keep stating the header resolution verbatim too: "The `brief 302/294` header on an ov002 `.s` file is mechanical boilerplate stamped by `tools/asm_escape.py --whole-function` on ANY function. It is NOT a per-function wall verdict and is NOT evidence the candidate was assessed. Assess it yourself."

**Also state this verbatim:** "Before your final report, run `git status --short` yourself and cross-check every function you're about to claim as shipped — confirm its `.s` is actually gone AND its `delinks.txt` line actually says `.c:`. A `fastmatch.py` 100% result alone does not mean you finalized it."

**Do NOT cite P-20/21/22/23/24/25/26 member counts or aggregate byte totals as justification for the permuter or any tooling investment** — that framing was wrong by ~20x (37 P-20 members = 0.16pp; the permuter has run 4 functions ~100k iterations for zero ships). Park on sight, don't catalogue.

**HIGH PRIORITY SIDE LEAD, worth its own dedicated item alongside or instead of this sweep:** P-17 is "under reconsideration," not confirmed-permanent — 2 of 2 members tested last round with **constant-immediate placement** (write a fixed sub-offset before an `idx*stride` term, not after) resolved to 100%. 15 members remain untested with this specific lever — see codegen-walls.md's P-17 entry for the exact list.

Repeat all three checks that earned their keep: `tools/check_activation_invariant.py <base>..HEAD`, `check_delink_dupes.py`, and a stray-draft scan (`ninja -n` before AND after consolidating).

**REGENERATE the research index before pushing**: `python tools/generate_research_index.py`.

**If the band finishes early:** `main` has ~2,291 never-assessed candidates, comparable in size to ov002's remaining pool, and has never been swept with this worktree-parallel protocol.

**Gate:** `python tools/gate3.py --scope all` PASS + `check_activation_invariant.py` + the three-way count check in the PR body.

### cm-ov002-unknown-sweep-8 — 149-512B, selected by callee coverage [S] [DONE]

> **DONE 2026-07-31.** 31/98 real candidates shipped (9,424 bytes; 2 of
> the 100 dispatched turned out to be pre-existing C-32 permanent walls,
> excluded). Found and fixed two real bugs in the callee-coverage
> scoring script itself — one before dispatch, one after (caught by a
> worker's independent verification, inflated 42% of the whole
> candidate pool). Corrected result: true 100% coverage is a small but
> perfect predictor (4/4 shipped); below that the relationship is much
> weaker than this round's design assumed (75-99%: 33.3%, 50-74%:
> 25.6%, 25-49%: 35.3%, 0-24%: 23.1% — no clean gradient). Full writeup:
> `docs/research/cm-ov002-unknown-sweep-8-2026-07-31.md`. New levers:
> C-55 (branch-to-block polarity, 4 independent batches), C-56
> (declaration order affects reg-alloc, 2 independent), C-57 (addition
> operand order controls shift-fusion), C-58 (unsigned/signed compare
> selects condition code, 1 instance). S-2 gained a partial-rule
> narrowing on sparse-switch declaration order. P-4 reconfirmed 3x.

> Filed from the coordinating process's own chat message after sweep-7 merged (main 988cd5f7c, EUR 11.66%) — appended here per the project's own "a prose mention is not a task" convention rather than executed straight from chat.

Stay in 149-512B. It holds 33.00pp, is only 12.2%/2.3% complete, and just measured 82.8 bytes/attempt — the best measured productivity in project history. Module-agnostic, as sweep-7 proved was correct.

**CHANGE THE SELECTOR. Do not partition by address order.** Compute callee-coverage per candidate first — what fraction of each function's callees already exist as matched C — and select the top ~100 by coverage. Sweep-7 produced that predictor (every unshipped 513-1023B candidate had under 65% callee coverage; every 149-512B ship had 60-100%); use it here. **Report ship-rate bucketed by coverage band**, not just an overall number — the deliverable is testing whether the relationship is as sharp within the 149-512B band as sweep-7's cross-band comparison suggested.

Exclude candidates already touched by prior sweeps: ov002 `<=164B` (sweeps 1-6's territory) and all of sweep-7's own 149-512B candidates (60 addresses, 20 now shipped/naturally-excluded + 40 still parked as `.s` and NOT yet in `attempts.tsv` — see the `attempts.tsv` gap memory, still unfixed).

Keep reporting BYTES and pp, not ship-rate alone.

Two open leads, still unfiled, yours when wanted: P-17 re-test (15 members, constant-immediate placement resolved 2/2 in sweep-6, untested on the rest); the S-2 sparse-switch-case-order correction and new C-53/C-54 levers from sweep-7, both already in codegen-walls.md and ready to carry forward.

**Correction to prior dispatch-prompt framing**: the "brief 302/294 header is ov002-exclusive" premise was wrong — it appears on `main`/`overlay000`/`overlay004`/`overlay011` too (confirmed independently by 4 of 5 sweep-7 batches). Keep stating the resolution verbatim, drop the ov002-exclusive framing.

**NON-NEGOTIABLE — one worker per worktree, no exceptions**, same as sweep-7 (worked: one small, immediately-caught incident, no file-corruption race). State verbatim: "Work through your assigned functions yourself, one at a time, directly. Do NOT spawn further sub-agents or otherwise sub-divide your assignment — a worker that did this in an earlier round caused a real `fastmatch.py` self-heal race and left its own completion notifications unable to reach its actual parent. The self-heal is designed for one worker per worktree; it is not concurrency-safe and will not be made so." Verify the worktree directly rather than trusting an agent's own account of itself, same as the last two rounds.

Also state verbatim: "Before your final report, run `git status --short` yourself and cross-check every function you're about to claim as shipped — confirm its `.s` is actually gone AND its `delinks.txt` line actually says `.c:`. A `fastmatch.py` 100% result alone does not mean you finalized it."

**Gate:** `python tools/gate3.py --scope all --clean` PASS, three regions individually grepped; `check_activation_invariant.py`; `check_delink_dupes.py`; stray-draft scan; regenerate the research index before pushing.

### cm-ov002-unknown-sweep-9 — 149-512B, plain selection [S] [DONE]

> **DONE 2026-07-31.** 19/100 shipped (4,632 bytes). All 3 process
> fixes held: one consolidated gate only (5 parallel `configure.py eur`
> config-checks, zero parallel builds — no more toolchain contention),
> `park_one.py` used by all 5 batches with zero collision incidents,
> C-32 body-screening caught 2 pre-dispatch and 0 more were found by
> any worker (screening worked). New lever C-59; C-58 reconfirmed
> (now believed systemic). Found (not newly — see doc) that 2 batches
> independently rediscovered the project's own pre-existing "route
> before you draft" tier-routing guidance, a real gap in this round's
> dispatch prompt to fix next time. Dominant finding: roughly half of
> all parks across all 5 batches share one shape (word-count-exact,
> pure register-letter mismatch) — reconfirms the existing P-4/P-11/
> P-12/P-15/P-17 register-plateau wall family rather than a new open
> problem, except one narrow sub-pattern (an MLA-vs-indexed-load
> choice tied to one ov002 data table) hit 4 times, worth a dedicated
> look. Full writeup:
> `docs/research/cm-ov002-unknown-sweep-9-2026-07-31.md`.

> Filed from the coordinating process's own chat message after
> sweep-8 merged (main 77e64a1f9, EUR crossed 12%) — appended here per
> the project's "a prose mention is not a task" convention.

Sweep-8's own corrected data says callee-coverage doesn't pay within
the 149-512B band (100% coverage: 4/4 shipped, a small but perfect
predictor; below that, no clean gradient — 33.3% / 25.6% / 35.3% /
23.1%). **Drop it as the selector.** Go back to straightforward
selection across 149-512B, module-agnostic, stride-sampled across
modules (not first-N-by-address). That band still holds ~33pp and is
only ~12%/2% complete — the best measured productivity in the project.

100 candidates selected, excluding ov002 ≤164B (sweeps 1-6) and every
candidate touched by sweeps 7 and 8 (shipped ones are already gone
from the `.s` pool; parked ones — 40 from sweep-7, 67 from sweep-8 —
were manually excluded since `attempts.tsv` still doesn't track
worktree-sweep parks). Partitioned round-robin into 5 worktrees of 20.

**Screen for C-32 walls beyond the header.** 2 undetected instances
polluted sweep-8's counts — one had zero distinguishing header text at
all (only the generic brief-302/294 stamp), identifiable only by its
body: a direct `bl`/`blx` to a callee whose `func_ovNNN_` prefix
differs from the file's own overlay (a real compiler can never emit
this — legitimate cross-overlay calls go through a binary-level veneer,
never a bare source-level `bl`). This selection was screened
mechanically for that signature before dispatch (2 caught, backfilled);
state verbatim to workers: "If you see a `bl`/`blx` to a
`func_ovNNN_XXXXXXXX` target whose overlay number doesn't match this
file's own, stop — that's a C-32 permanent wall, not a candidate.
Report it, don't attempt it."

**THE ONE PROCESS CHANGE, non-negotiable:** no more per-batch ROM
gates. `gate3.py --scope all --clean`'s 5-worktree-parallel setup
verification (a `configure.py eur && ninja sha1` per worktree) and each
batch's own end-of-task `ninja sha1` both saturate the machine-wide-
serialized mwcc toolchain — this has now blocked the Codex Scaffolder
lane twice. This round: worktree setup runs `configure.py eur` only
(no `ninja`, no compiler invocation — just baserom/config validation)
across all 5, safe in parallel. State verbatim to workers: "Iterate
with `fastmatch.py` per function (single object, no link, no ROM) —
that is your only build/verify step. Do NOT run `ninja sha1` or any
full build in your worktree; the one 3-region ROM gate happens once,
at consolidation, on the merged branch. If you believe you've hit a
case where only a full ROM build can tell you something fastmatch.py
can't, stop and say so rather than running one anyway."

**Fixed the `git checkout -- <module>/delinks.txt <file>.s` idiom.**
`tools/park_one.py <c-file> --region eur` now exists — reuses
`batch_sha1.py`'s own `_flip_delinks` to surgically revert exactly one
function's delinks.txt line (verified: round-trips byte-identical, and
does NOT touch a sibling function's uncommitted entry in the same
shared file — the actual bug, hit independently twice last round).
State verbatim: "To abandon a candidate, use `python tools/park_one.py
<path/to/func_X.c> --region eur` — never `git checkout --
<module>/delinks.txt`, which reverts the WHOLE shared file and can
silently discard another candidate's already-shipped, uncommitted
entry in the same worktree session."

Carry the new levers: C-55 (branch-to-block polarity via
goto/inverted-condition restructuring — independently found by 4
batches last round, the strongest-evidenced new lever this session),
C-56 (local declaration order, not just usage order, affects register
allocation), C-57 (C addition operand order controls which addend
fuses into an ARM shifted-register form), C-58 (unsigned vs. signed
comparison type selects `CC`/`HI` over `LT`/`GT` — 1 instance so far,
worth a 2nd confirmation). Full detail in codegen-walls.md.

Same NON-NEGOTIABLE no-sub-agent language as the last two rounds
(verified effective — shrinking blast radius each time). State
verbatim: "Work through your assigned functions yourself, one at a
time, directly. Do NOT spawn further sub-agents or otherwise sub-divide
your assignment — a worker that did this in an earlier round caused a
real `fastmatch.py` self-heal race and left its own completion
notifications unable to reach its actual parent. The self-heal is
designed for one worker per worktree; it is not concurrency-safe and
will not be made so."

Also state verbatim: "Before your final report, run `git status
--short` yourself and cross-check every function you're about to claim
as shipped — confirm its `.s` is actually gone AND its `delinks.txt`
line actually says `.c:`. Neither a `fastmatch.py` 100% result nor a
clean `git status` alone means you finalized it correctly — check
both."

Keep reporting bytes and pp, not ship-rate alone.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the
consolidated branch (not per-batch); three regions individually
grepped; `check_activation_invariant.py`; `check_delink_dupes.py`;
stray-draft scan; regenerate the research index before pushing.

### cm-ov002-unknown-sweep-10 — 149-512B [S] [DONE]

> **DONE 2026-07-31.** 30/100 shipped (8,344 bytes) — best round this
> campaign. C-60 investigated directly via standalone `mwccarm`
> compilation (not delegated): confirmed real, correctly predicts
> instruction-family selection, but does NOT alone close the 3 priority
> candidates — a second register-allocation wall sits on top of all
> three. That same wall family (P-4/11/12/15/17) hit unprecedented
> volume this round (9/14 parks in one batch alone, on a loop-scan
> variant of the same `data_ov002_022cf16c` table) — now unmistakably
> the campaign's dominant open problem across 3 consecutive rounds, and
> the strongest candidate for the next round's own dedicated mini-item.
> P-17 cohort: 15->14 (`func_ov002_021eb630` resolved). **The route-
> before-draft fix from last round was itself incomplete** — paraphrased
> from memory rather than read from source, causing a 3rd rediscovery
> incident; corrected verbatim text (the full 3-tier table +
> disambiguator) is ready for next round. A real worktree-setup gap
> found (`ninja delink` needed before `fastmatch.py` works correctly in
> a fresh worktree) — add it to setup next time. Full writeup:
> `docs/research/cm-ov002-unknown-sweep-10-2026-07-31.md`.

> Filed from the coordinating process's own chat message after
> sweep-9 merged (main b4ca6bb9b, EUR 12.25%) — appended here per the
> project's "a prose mention is not a task" convention.

Same shape as sweep-9: plain module-agnostic selection across
149-512B, 5 worktrees, one consolidated gate.

**FIX THE DISPATCH-PROMPT GAP.** Two sweep-9 batches independently
rediscovered brief 667's "route before you draft" compiler-tier
guidance from scratch, mid-session, because it wasn't in the dispatch
prompt. State this verbatim in every dispatch prompt this round, the
same treatment as the brief-302/294 resolution:

> "Read the target `.s`'s own epilogue BEFORE writing any C. `sub sp,#4`
> + separate `pop {lr}`/`bx lr` -> name the file `*.legacy.c`. Fused
> `pop {..., pc}` -> `*.legacy_sp3.c`. Otherwise plain `.c`. Choosing
> the tier after drafting wastes the draft. See
> `docs/research/style-a-epilogue.md`."

Two pieces of knowledge now need this treatment (the header resolution,
and tier routing) — assume anything a batch has rediscovered twice
needs to be pasted into the prompt, not left in a doc for it to find.

**The MLA-vs-indexed-load mini-item is DONE, not delegated.** Rather
than hand off sweep-9's 4-recurrence cohort blind, it was investigated
directly this round via standalone `mwccarm 2.0/sp1p5` compilation
(bypassing the full project pipeline — a synthetic table matching the
real stride/offset constants, several candidate C phrasings, diffed
against the real disassembly). Result: it's a real, reproducible,
source-structure-controlled lever, not register-pressure noise — see
**C-60** in `codegen-walls.md` for the full mechanism (single compound
expression → double-`mla`-chain; an intermediate pointer variable
incremented separately → single-`mla`+separate-`mul`+explicit-add+
indexed-load). Confirmed instruction-for-instruction against 3 of the
4 real occurrences; not yet applied to a real ship. **Assign
`func_ov002_021ed1f8`, `func_ov002_0220d974`, and `func_ov002_0222ad54`
(the 4th, `func_ov002_0223cf18`, was a false-positive inclusion in the
original cohort — it's a different, already-addressable array access
at a different table offset, not part of this wall) to one batch as
priority candidates**, with C-60's mechanism stated verbatim so the
worker applies the lever directly instead of rediscovering it.

Carry the rest of the lever set, now including **C-59** (a guard whose
branch target is shared with a nearby switch's default case still gets
predicated even with `goto` — rewrite the guard itself as a switch)
and **C-58** (unsigned vs. signed comparison selects `CC`/`HI` over
`LT`/`GT` — reconfirmed on a second function, treat as systemic now).

Same three process fixes as sweep-9, all validated, keep them exactly
as they are: one consolidated gate (worktree setup runs `configure.py
eur` only, no `ninja`, confirmed safe in parallel — workers iterate
with `fastmatch.py` only, no `ninja sha1` in-batch); `tools/park_one.py`
for abandoning a candidate, never `git checkout --
<module>/delinks.txt`; mechanical C-32 screening (a `bl`/`blx` to a
`func_ovNNN_` target whose overlay number differs from the caller's
own) checked before dispatch and restated to every worker.

Same NON-NEGOTIABLE no-sub-agent language, same git-status +
delinks.txt self-check instruction, same "keep reporting bytes and pp,
not ship-rate alone."

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the
consolidated branch (not per-batch); three regions individually
grepped; `check_activation_invariant.py`; `check_delink_dupes.py`;
stray-draft scan; regenerate the research index before pushing.

### cm-ov002-unknown-sweep-11 — plus the dominant-wall mini-item [S] [DONE]

> **DONE 2026-07-31.** 27/100 shipped. The mini-item is answered, not
> fully solved (the honest, correct outcome): C-61's declaration-order
> recipe is real and reconfirmed 4 more times this round — once via
> the priority cohort, three times independently by a worker who
> wasn't told which functions were cohort members. It sits next to at
> least 3 OTHER distinct mechanisms wearing the same register-mismatch
> signature (the already-exhausted and/mul residual, a new
> `rowBase+0x120+idx*4` addressing residual with 3 instances, and a
> `goto`-vs-predicated condition-code question with 3 instances) — the
> family is several mechanisms, not one, and this round found the
> first genuinely steerable one. Both process fixes validated directly:
> `ninja delink` ran clean in all 5 setups, and the corrected verbatim
> tier-routing text shipped 7 of 9 functions in one batch through
> explicit tier routing on the first attempt. New lever C-62
> (modulo-vs-division instruction-sequence confusion). Full writeup:
> `docs/research/cm-ov002-unknown-sweep-11-2026-07-31.md`.

### cm-ov002-unknown-sweep-12 — plus the two newly-isolated mechanisms [S] [DONE]

> **DONE 2026-08-01.** 40/100 shipped, 9,296 bytes — best round this
> campaign. Both mini-item mechanisms closed: C-63 (the
> `rowBase+0x120` residual is a third addressing family, not a C-60
> variant — shipped `func_ov002_0224f4a0` 100% as proof) and C-64 (the
> goto-vs-predicated theory was falsified directly; the real lever is
> whether mwcc synthesizes the check itself via a bare `for` loop —
> independently reconfirmed 3 times in the same round by a batch that
> had no knowledge of the investigation). Also caught and corrected an
> overclaim in sweep-11's own C-61 entry, and corrected a worker's
> false "stale candidate pool" finding (a misread of universal `.s`
> boilerplate, not a real tooling bug — verified against
> `brief-294-regalloc-wall-scout.md` and disproven twice over by real
> ships from the flagged pool). C-55 and C-44 both got heavy
> independent reconfirmation across multiple batches. Full writeup:
> `docs/research/cm-ov002-unknown-sweep-12-2026-08-01.md`.

> Filed from the coordinating process's own chat message after
> sweep-10 merged (main 12f62dbf6, EUR 12.60%) — appended here per the
> project's "a prose mention is not a task" convention.

Same shape as sweep-10: plain module-agnostic selection across
149-512B, 5 worktrees, one consolidated gate.

**THE MINI-ITEM IS DONE, not delegated.** The P-4/P-11/P-12/P-15
register-allocation family got the "one round of direct attention"
asked for — standalone `mwccarm 2.0/sp1p5` compilation against real
parked residuals, same method as C-60. Result: **C-61** in
`codegen-walls.md` — a real, mechanistically-understood, positive
lever for one specific sub-shape (a loop with a shared row-base,
walking cursor, and index needing 3-way correct register assignment):
declare the index and cursor **before** the guard-clause locals, in
their eventual-use relative order. Confirmed instruction-for-
instruction on 2 independent real functions
(`func_ov002_02250540`, `func_ov002_0224b0b0`). **Full honesty on
scope: this is a real, partial win, not a full crack** — both targets
have a SEPARATE residual (an early `and`+`mul` scratch-register swap)
that did not move under any tested variant and matches the shape of
P-11's own already-exhaustively-falsified "brief 254" pattern exactly.
State verbatim to whichever batch gets the priority cohort: "Apply
C-61's declaration-order recipe first. If a residual remains after
that, check whether it matches the early AND/MUL operand-swap shape
C-61's own entry describes as already-exhausted — if so, that's a
genuine, known-resistant P-11-class residual, not a sign you did
something wrong. Don't re-derive the negative result from scratch."

**The 8 sweep-10 batch-4 cohort members** (same `data_ov002_022cf16c`
loop-scan shape, never directly tested against C-61) are this round's
priority slot — assigned to batch 1, ahead of its 12 regular
candidates: `func_ov002_02235a78`, `func_ov002_0223cfec`,
`func_ov002_02242900`, `func_ov002_02248bc0`, `func_ov002_0224de94`,
`func_ov002_02252d98`, `func_ov002_02264f00`, `func_ov002_02286c9c`.
Not all 8 are confirmed to share the exact same offset/constant
shape as the 2 already-tested targets — read each one's own
disassembly before assuming the recipe transfers verbatim.

**TWO SETUP FIXES FROM THIS ROUND'S OWN FINDINGS:**
- **Add `ninja delink` to worktree setup** (dsd-only, no compiler —
  confirmed safe in parallel alongside `configure.py`). A fresh
  worktree without it leaves `fastmatch.py`'s reference-object cache
  unpopulated — its first call silently compiles against the STALE
  `.s` rule instead of the new `.c` draft, no error shown.
- **Paste the tier-routing text VERBATIM from
  `docs/research/style-a-epilogue.md`, not paraphrased from memory.**
  Last round's dispatch text was a paraphrase that dropped the real
  disambiguator (odd register count vs. epilogue shape alone) and
  caused a 3rd rediscovery incident. State verbatim: "Read the target
  `.s`'s own prologue AND epilogue BEFORE writing any C — this is a
  3-way choice: default tier gets an r3-spill (`push {r3,...,lr}`)
  when the live register count is ODD, no `sub sp`, `pop {regs,pc}`.
  `.legacy.c` (1.2/sp2p3): no r3-spill, `sub sp,#4`, `pop {regs,lr};
  bx lr` (2-step). `.legacy_sp3.c` (1.2/sp3): no r3-spill, `sub sp,#4`,
  `pop {regs,pc}` (1-step). `sub sp,#4` alone does NOT distinguish
  `.legacy.c` from `.legacy_sp3.c` — the pop target does. Choosing the
  tier after drafting wastes the draft." Same treatment for the
  brief-302/294 header resolution as every prior round.

Carry the full lever set: C-55 through C-61 (C-58 systemic; C-60 and
C-61 both apply specifically to `data_ov002_022cf16c` addressing —
state both).

Keep C-32 mechanical screening — 6 genuine catches across 2 prior
rounds, 0 escapes; 2 more caught pre-dispatch this round (8 total).

Same NON-NEGOTIABLE no-sub-agent language, same git-status +
delinks.txt self-check instruction, same "keep reporting bytes and pp,
not ship-rate alone," same `park_one.py` (never `git checkout --
<module>/delinks.txt`).

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the
consolidated branch (not per-batch); three regions individually
grepped; `check_activation_invariant.py`; `check_delink_dupes.py`;
stray-draft scan; regenerate the research index before pushing.

### cm-ov002-unknown-sweep-13 — plain sweep, no mini-item [DONE]

> **DONE 2026-08-01.** 27/100 shipped, 6,408 bytes. No mini-item, by
> design — the round's real signal was cross-batch reconfirmation.
> C-55 held up as the single most load-bearing lever (independently
> applied in 4 of 5 batches) but also picked up a real caveat: applying
> it to 2 superficially-similar functions made the match worse, not
> better — not safe to apply blindly once recognized. C-64 got a THIRD
> consecutive round of fully blind independent confirmation, from a
> batch that proposed it as a brand-new wall without knowing it was
> already catalogued. C-61's residual reconfirmed twice more, including
> once on a function flagged in advance. New lever C-65 (loop-body
> strength reduction) documents a load-vs-store asymmetry that isn't
> yet explained — flagged as a real open question, not forced into a
> single theory. One process mistake this round: a queue-claim commit
> landed directly on `main` instead of a branch, caught immediately,
> left in place rather than risk a force-push rewrite of shared
> history, flagged to the user in-session. Full writeup:
> `docs/research/cm-ov002-unknown-sweep-13-2026-08-01.md`.

### cm-ov002-unknown-sweep-14 — verbatim dispatch of C-55/C-44/C-64 [DONE]

> **DONE 2026-08-01.** 24/100 shipped, 4,968 bytes — lowest count since
> sweep-9, driven by two real process incidents this round rather than
> candidate difficulty. Direct C-64 fix attempt on `func_ov002_0220ad78`
> transferred the core mechanism cleanly but hit a new, distinct
> redundant-AND residual that resisted 5 variations — reverted, flagged
> for a future pass. Incident 1: a queue-header edit written as `[S]`
> alone (never a valid status marker on its own — every prior round's
> `[S]` only ever appeared bundled with a real `[DONE]`) was invisible
> to `work_queue.py`, caught by its own test. Incident 2: two dispatched
> agents collided in one worktree (one operated in the wrong directory);
> verified directly, recovered both 20-candidate results with zero data
> loss. Incident 3: one agent crashed with corrupted output; its 4 real
> shipped candidates were recovered and independently re-verified before
> committing, the other 16 re-dispatched cleanly. New C-55 extension
> (switch, not goto, suppresses if-conversion for shared-loop-rejoin
> arms) and another C-65 confirmation. Full writeup:
> `docs/research/cm-ov002-unknown-sweep-14-2026-08-01.md`.

Same protocol. Plain module-agnostic selection across 149-512B, 5
worktrees, `ninja delink` in setup, one consolidated gate.

**Rule going forward, effective this round**: any lever independently
rediscovered twice goes into the dispatch prompt verbatim — don't wait
for a third rediscovery. C-55 (with its new backfire caveat), C-44
(with its broadened non-jump-table scope note), and C-64 (including
the specific tell: `LS` only appears from a compiler-synthesized bare
`for` loop, never a hand-written guard) are all stated verbatim in
every dispatch prompt this round.

Cheap close attempted directly first: `func_ov002_0220ad78` (98.4%,
flagged as closable with the known C-64 fix). The guard/loop mechanism
transferred cleanly, but a new, distinct residual surfaced (a redundant
`and` before a `mul`/`mla`, at 2 symmetric sites) that resisted 5
tested variations — reverted rather than shipped partial, flagged as
its own open question rather than a failure of the C-64 fix.

C-65's load-vs-store strength-reduction asymmetry: carry it, don't
force it. A 4th independent instance earns a mini-item; otherwise
leave it recorded as-is.

C-61's early AND/MUL residual is confirmed to generalize across the
whole row-table family — stop attacking it if hit again.

Same NON-NEGOTIABLE no-sub-agent language, same git-status +
delinks.txt self-check instruction, same "keep reporting bytes and pp,
not ship-rate alone," same `park_one.py` (never `git checkout --
<module>/delinks.txt`), same fastmatch.py-over-eyeball discipline.

Keep C-32 mechanical screening.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the
consolidated branch (not per-batch); three regions individually
grepped; `check_activation_invariant.py`; `check_delink_dupes.py`;
stray-draft scan; regenerate the research index AND
`docs/state-table.md` before pushing. **Protocol note**: `--clean`
deletes the 3 tracked progress heatmaps as build outputs —
`git restore assets/` before committing, never a bare `git add -A`.

### cm-ov002-unknown-sweep-15 — one worktree one agent, enforced [DONE]

Same protocol. Plain module-agnostic selection across 149-512B, one
consolidated gate.

**ONE WORKTREE, ONE AGENT — ENFORCE IT.** Two agents colliding in one
worktree is the second collision-class incident in three rounds and
cost real recovery time both times. Before dispatch, verify each
batch's worktree path is distinct and that no two dispatch prompts
name the same directory. Each dispatch prompt also carries an explicit
first-step instruction: verify `pwd`/cwd and `git branch --show-current`
match the assignment before doing any work, and stop and report
immediately if they don't. If a batch needs re-dispatching mid-round,
give it a FRESH worktree, never a reused live one.

Carry verbatim from `codegen-walls.md`, freshly re-read (not from
memory): C-55 (with its backfire caveat and the new function-exit vs.
loop-rejoin extension), C-44, C-64 (with its `for`-loop tell), C-63,
and C-65.

Watch, don't force: the new redundant-and-before-mul/mla residual from
`func_ov002_0220ad78`, and C-65's load-vs-store asymmetry. Either
gaining a 3rd independent instance this round earns a mini-item next
round.

> **DONE 2026-08-01.** 26/100 shipped, 5,756 bytes. The redundant-
> and-before-mul/mla residual (open question 1) is now fully resolved
> as **C-66**, with two working fixes (inline `&1` mask; explicit
> intermediate variable) and 8+ independent same-round confirmations —
> the best-evidenced new lever at time of write-up this campaign.
> C-65 got one more manifestation (arithmetic strength reduction
> eliminating a division) but stays open. The "one worktree, one
> agent" enforcement caught a real dispatch-infrastructure bug live:
> 4 of 5 agents' shell sessions started in the wrong (base checkout)
> directory rather than their assigned worktree; the mandatory
> first-step check caught all 4 before any work was attempted, and
> all 4 resumed cleanly via `SendMessage` once their real worktrees
> were independently verified safe. A self-contradicting batch report
> (parked-list said 98.2%, prose claimed "cracked") was reconciled
> against ground truth (no `.c` file, `delinks.txt` unchanged — it was
> genuinely parked). See
> [`cm-ov002-unknown-sweep-15-2026-08-01.md`](../research/cm-ov002-unknown-sweep-15-2026-08-01.md).

C-61's early AND/MUL residual is confirmed to generalize — do not
re-attack it if hit again.

Same NON-NEGOTIABLE no-sub-agent language, same git-status +
delinks.txt self-check instruction, same "keep reporting bytes and pp,
not ship-rate alone," same `park_one.py` (never `git checkout --
<module>/delinks.txt`), same fastmatch.py-over-eyeball discipline.

Keep C-32 mechanical screening.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the
consolidated branch (not per-batch); three regions individually
grepped; `check_activation_invariant.py`; `check_delink_dupes.py`;
stray-draft scan; regenerate the research index AND
`docs/state-table.md` before pushing. `git restore assets/` before
committing after any `--clean` run — never a bare `git add -A`.

### cm-c66-resweep — re-attempt parked candidates with the newly-resolved C-66 lever [DONE]

Sweep-15 resolved its open question as **C-66**: a redundant `and rN, rN, #1` immediately before a `mul`/`mla`, present in the real target but absent from an otherwise-correct draft, in a value mwcc can already prove is 0/1-ranged. Two working fixes (inline `& 1` mask at the multiply's operand; explicit intermediate variable), 8+ independent same-round confirmations across 4 of 5 batches — the best-evidenced new lever this campaign.

Every prior time a lever landed this well, the highest-yield next move was **not** a fresh sweep but a re-attempt of already-parked candidates the lever explains: briefs 668/672/673 re-swept `epilogue-wall-corpus.md` and shipped **45/64 (70.3%)** against a fresh-sweep baseline of ~25%. Do that for C-66 before sweeping new ground.

Scope: search the parked corpus for candidates whose park note cites a redundant `and`/mask-before-multiply residual, a `mul`/`mla` mismatch, or an unexplained extra instruction adjacent to a multiply. Re-attempt each with both documented C-66 fixes. Re-park only if neither works, with an updated note saying which was tried.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the consolidated branch, three regions individually grepped; `check_activation_invariant.py`; `check_delink_dupes.py`; `git restore assets/` after any `--clean` run — never a bare `git add -A`. Report shipped/attempted against the ~25% fresh-sweep baseline.

### cm-ov002-unknown-sweep-16 — continue the ov002 unknown-pool sweep [DONE]

ov002 is **1,129,372 B = 47% of all `.text`** and sits at 12.58% C (attainment 59%) — the single biggest concentration of remaining runway in the project. Sweeps 9-15 have held a steady ~25% ship rate (13: 27, 14: 24, 15: 26). Continue with the next tranche, same 149-512 B band, one consolidated gate.

Carry **C-66** forward in every dispatch prompt alongside C-44/C-55/C-63/C-64/C-65. C-65 (load-vs-store asymmetry) stays open — another manifestation is worth recording but not worth stalling on.

**Keep the one-worktree-one-agent enforcement and the mandatory first-step `pwd`/branch self-check.** It earned its keep last round: 4 of 5 agents' shells started in the base checkout rather than their assigned worktree, and all 4 stopped clean instead of colliding. Re-verify every worktree with `git worktree list` before dispatch, and treat a mismatch report as a dispatch bug to diagnose, not an agent error to work around.

**Gate:** as `cm-c66-resweep` above.

### cm-ov002-unknown-sweep-17 — worktree-parallel sweep at full scale, C-67 in the lever set [DONE]

Sweep-16 ran single-lane and stopped at 12 attempts / 3 ships — the same ~25% rate as sweeps 13-15 (27/24/26 ships), so the shortfall was scale, not yield. This round: the ⚡ WORKTREE-PARALLEL SWEEP PROTOCOL from this queue's header, at full scale. **Explicit tranche: 100 candidates, 5 batch worktrees × 20, partition written into the PR body.** Same 149-512 B ov002 band. Pool pull: `wall_aware_headroom.py --json --exclude-attempted`, sorted by `text_size` — then **cross-check the pull against the per-candidate park tables in the `docs/research/cm-ov002-unknown-sweep-9` … `-15` docs before dispatch**: attempts.tsv holds only ~61 of the ~700 already-attempted (the worktree sweeps never wrote it — `q-attempts-ledger-backfill` on the codex-scaffolder lane is backfilling in parallel), so a naive `--exclude-attempted` pull WILL resurface already-diagnosed walls. Park every attempt via `park_one.py` so this round's parks ARE recorded; expect append-side merge traffic on attempts.tsv from the backfill lane — rebase before final push.

Mini-item A (run FIRST — it is also the round's canary, one candidate through the FULL loop before any batch worktree is created): re-attempt the 3 row-pointer `mla` register-swap parks with the one variant sweep-16 explicitly did not try — forcing the idx offset through a **C-63 bitfield-typed intermediate** — `func_ov002_0224bd3c` (parked 84.2%), `func_ov002_021f058c`, `func_ov002_021eba34`. The outcome decides P-wall promotion either way; record it against the OBSERVED-NOT-CONFIRMED note in codegen-walls.md (the block appended under C-66).

Mini-item B: one fresh attempt each on the other near-miss parks — `0x021d1158` (99.3%), `0x022a8190` (95.0%, pool-const-materialize), `0x02299c9c` (92.1%). If `0x02299c9c` / `0x021d1158` move or fail identically, record the result against the post-call-guard OBSERVED note (2 data points; a 3rd/4th makes it promotable to a numbered entry).

Lever set for every dispatch prompt (verbatim citations — look each up in codegen-walls.md before drafting): C-44 / C-55 (incl. the switch-vs-goto loop-rejoin extension) / C-63 / C-64 / C-65 (open — record data points, don't stall) / C-66 (**bitfield-source-shape caveat**: the fix variants only work when the 0/1 value is a real bitfield member access, not a computed shift-pair local) / **C-67 NEW** (switch-on-equality-targets — first thing to try on a 2-arm equality selection; single-instance confidence, record every hit AND miss). ROUTE BEFORE YOU DRAFT applies to every candidate.

Keep the one-worktree-one-agent enforcement and the mandatory first-step `pwd`/branch self-check (it caught 4/5 misdispatches in sweep-15). STOP: at 100 recorded attempts, or 15 consecutive parks with no ship, whichever comes first. Effort MAX.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the consolidated branch, three regions individually grepped; `check_activation_invariant.py`; `check_delink_dupes.py`; `.c`-files-added == delinks-activations-flipped count check; `git restore assets/` after any `--clean` run — never a bare `git add -A`. Report shipped/attempted vs the ~25% baseline + before/after `wall_aware_headroom.py` counts.

> **DONE 2026-08-06.** 42/100 shipped, 6,960 bytes — the campaign's
> best round yet (prior best: sweep-12, 40/100). Mini-item A separated
> one shared symptom into three real outcomes (P-20 reconfirmation, a
> new P-23 member now promoted from provisional, and a genuine C-63
> extension that closed a park to 97.4%). Mini-item B promoted the
> post-call-scheduling family to **P-27** with a 4th instance. The
> P-wall-catalogue cross-check (not just attempts.tsv) caught 46
> already-diagnosed candidates before dispatch — the round's
> highest-value new process step. Two dispatch mistakes (stale pool
> data reused for one batch's list; 21 orphaned `.s` files across 3
> batches) were caught and corrected transparently during
> consolidation, neither causing data loss. Substantial catalogue
> growth: 3 C-63 refinements, 2 new C-65 counter-recipes, an
> independently-confirmed C-66 extension, 3 C-55 refinements, a C-67
> generalization, 2 new entries (C-68/C-69), and a corrected P-26
> mischaracterization where 3 batches independently rediscovered an
> already-9-member wall without checking the catalogue first — now a
> recurring failure mode worth a standing pre-dispatch check. See
> [`cm-ov002-unknown-sweep-17-2026-08-06.md`](../research/cm-ov002-unknown-sweep-17-2026-08-06.md).

### cm-main-tier-sweep-1 — worklist-selected sweep of main's small tier (ledger-independent by design) [DONE]

**Why this module and not another ov002 sweep.** `attempts.tsv` is mid-repair: #1467 (open, changes requested) would record ~19 never-attempted candidates as `parked` and writes a module key (`overlay002`) the selector cannot match (`ov002`). Until that lands, an ov002 pull driven by `--exclude-attempted` is selecting against a corrupted exclusion set. This round therefore sweeps **`main`**, selected from a committed worklist rather than from the ledger — so the round cannot be poisoned by the repair in flight. (`main` is also the one module where `park_one.py`'s module bug does not bite: writer and consumer both say `main`.)

**Selector: `docs/research/campaign-analytics/main-small-tier-worklist.md`**, the ranked output of `q-small-tier-worklist` — address, size, shape class (trivial stub / tail-call forwarder / guard chain / small dispatcher / loop / other), header provenance, and whether a matched sibling of similar shape exists. Take the **0x02040000+** range (that worklist is split so 0x02000000–0x0203ffff belongs to the Scaffolder lane). Work the shapes brief 661 measured as tractable FIRST — stubs and forwarders — then guard chains. Brief 661 put this tier's floor at 35–55%, well above ov002's steady ~25%, and it has never been swept at scale.

**Tranche: 100 candidates, 5 batch worktrees × 20**, per the ⚡ WORKTREE-PARALLEL SWEEP PROTOCOL in this queue's header, partition written into the PR body. Cross-check your pull against `main`'s prior attempts in the sweep docs before dispatch — but do NOT rely on `--exclude-attempted` as the primary filter this round; the worklist plus the park docs are your selector, and say so in the PR body.

Keep the standing enforcement: one worktree = one agent; mandatory first-step `pwd`/branch self-check in every batch prompt (it caught 4/5 misdispatches in sweep-15); partition decided up front so no two batches claim the same candidate; **build the pool ONCE and dispatch from that exact list** — sweep-17's only real defect was batch1 being dispatched from a pre-rebuild draft, which cost 4 double-worked candidates and left 1 of 5 batches outside the P-wall cross-check.

ROUTE BEFORE YOU DRAFT on every candidate (read the target `.s` epilogue, pick `.c` / `.legacy.c` / `.legacy_sp3.c` before writing the body). Lever set, verbatim citations, look each up in `docs/research/codegen-walls.md`: C-44 / C-55 (incl. the switch-vs-goto loop-rejoin extension) / C-63 / C-64 / C-65 (open — record data points, don't stall) / C-66 (bitfield-source-shape caveat) / C-67 (switch-on-equality-targets — first thing to try on a 2-arm equality selection).

Park every attempt via `park_one.py` so this round IS recorded. Two caveats while the repair is in flight: it dedupes on address alone, so a repeat attempt at an address already in the ledger will be silently skipped — if that happens, note the address in the PR body and add the row by hand; and `main` is unaffected by the module-key bug, so no workaround is needed there.

STOP: at 100 recorded attempts, or 15 consecutive parks with no ship, whichever comes first. Effort MAX.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the consolidated branch, three regions individually grepped; `check_activation_invariant.py`; `check_delink_dupes.py`; `.c`-files-added == delinks-activations-flipped count check; `git restore assets/` after any `--clean` run — never a bare `git add -A`. ⚠️ `gate3` is piped through `tee` in the standing recipe, which MASKS its exit code — two lanes hit this last round and both caught it only by reading the log. Read the log, do not trust exit 0. Paste in the PR body: the three per-region sha1 lines VERBATIM, both invariant-checker outputs, the partition, before/after `wall_aware_headroom.py` counts, and shipped/attempted vs the 35–55% tier estimate.

> **DONE 2026-08-08.** 71/100 shipped, 6,720 bytes — well above the
> 35–55% floor estimate (read in context: a homogeneous, pre-filtered
> small-guard-chain population by the worklist's own design, not a
> random cross-section of `main`). Canary seeded a real lever (explicit
> named base variable for a shared large-offset pointer) that later
> proved real-but-not-universal (P-30). The exact orphaned-`.s` process
> bug documented as a lesson from sweep-17 one round ago was reproduced
> in this round's own canary — caught the same way (a failing `ninja
> delink`) and fixed cleanly across all 6 affected checkouts. The
> batch-worktree `attempts.tsv` non-recording gap also reproduced
> exactly (zero-line diff across all 5 batches, despite this item's own
> text above expecting only a narrower address-dedup edge case) — all
> 101 attempts (1 canary + 100 batch) backfilled from ground truth
> after catching a real regex bug in the reconstruction script itself.
> A real gate failure (stale `docs/state-table.md`, masked by the
> background task's own wrapper-exit-code-0 notification rather than
> gate3's real exit 1) was caught by reading the log per this item's
> own warning, fixed, and re-verified. 9 new codegen-walls.md entries
> (C-70–C-76, P-30–P-33) plus a C-55 boundary extension. See
> [`cm-main-tier-sweep-1-2026-08-08.md`](../research/cm-main-tier-sweep-1-2026-08-08.md).

### cm-main-tier-sweep-2 — continue the main tier, and measure the OTHER shape classes [DONE]

`cm-main-tier-sweep-1` (#1472) shipped 71/100 (6,720 B), the campaign's best single round, and moved EUR natural-C 14.28% → 14.56%. Continue on the same selector: `docs/research/campaign-analytics/main-small-tier-worklist.md`, **0x02040000+** range (0x02000000–0x0203ffff stays the Scaffolder's), 100 candidates, 5 batch worktrees × 20, partition frozen before dispatch.

**Read wave 1's rate honestly and design this round to test it.** The 71% came from a homogeneous slice — 100/100 attempts were shape=`guard chain`, 40–128 B — and that band was already 71.8% converted project-wide before the round, so wave 1 measured a favourable, pre-filtered population rather than the tier at large. That makes the NEXT question the valuable one: **does the rate hold outside the guard-chain band?** Split this tranche deliberately: **50 candidates continuing the guard-chain band** (the known-good seam) and **50 drawn from the other shape classes and/or the next size band up**, chosen from the worklist's own columns. Report the two sub-rates SEPARATELY in the PR body. A large gap between them is the most useful measurement this lane can produce right now, and a low rate on the second 50 is a SUCCESS if it is honestly measured — it tells us where the tier's real floor is.

Use the levers from wave 1's own catalogue additions (C-70…C-76, P-30…P-33 landed in #1472) alongside the standing set: C-44 / C-55 / C-63 / C-64 / C-65 (open) / C-66 / C-67. ROUTE BEFORE YOU DRAFT on every candidate.

⚠️ **`park_one.py` still does not record from batch worktrees** — wave 1 hit a zero-line `attempts.tsv` diff from all five batches and had to backfill 101 rows by hand. The structural fix is in flight on the Codex Scaffolder lane (`#1467`), so assume it is still broken: plan the backfill up front, recompute every `text_size` from `delinks.txt` ground truth rather than copying batch self-reports, and say in the PR body which method you used.

⚠️ **Fix wave 1's schema drift while you are here:** its 29 parked rows put a wall descriptor in the `shape` column (`P-20-bf94-result-register`, `predication-resistance-new`, …) instead of a shape class; `park_class` is the column for that. Use the correct columns this round and note the wave-1 rows that need correcting.

⚠️ **Headline arithmetic:** wave 1's "71/100, 6,720 B" mixes bases — 6,720 B covers 72 functions (71 batch + the canary); the 71 alone are 6,632 B. State a single basis this round.

STOP: at 100 recorded attempts, or 15 consecutive parks with no ship.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the consolidated branch, three regions individually grepped; `check_activation_invariant.py`; `check_delink_dupes.py`; `.c`-added == delinks-activations-flipped; `git restore assets/` after `--clean`. ⚠️ A background wrapper's exit code is NOT `gate3.py`'s — wave 1 was bitten by exactly this and caught it only by reading the log. READ THE LOG. Paste the three per-region sha1 lines VERBATIM, both invariant outputs, the partition, before/after `wall_aware_headroom.py` counts, and the two sub-rates.

> **DONE 2026-08-08.** 60/100 shipped (59 batch + 1 canary, 3,852 B —
> reported on one basis throughout, canary kept separate). **Pool A
> (guard chain): 32/50 (64%). Pool B (loop/other/small dispatcher):
> 27/50 (54%).** A real gap, but far smaller than the framing worried
> about, and it varied enormously batch-to-batch — 2 of 5 batches had
> Pool B *outship* Pool A (several "guard chain" labels concealed
> softfloat/wrapper bodies that walled, while several "loop"/"other"
> candidates were clean libc idioms), while the other 3 showed the
> expected gap, one batch dropping to 20%. Both process incidents from
> wave 1 (orphaned-`.s`, batch-worktree `attempts.tsv` non-recording)
> reproduced again — including in my OWN canary commit, the mistake I
> was warning every batch about in the same round's dispatch prompts —
> caught and fixed across all 6 checkouts with zero data loss. Wave
> 1's schema drift fixed in place (29 rows corrected). 14 new
> codegen-walls.md entries (C-77–C-81, P-34–P-37, plus an open-
> questions section) — the standout is **P-36**, a newly-catalogued
> instruction-scheduling wall family explaining roughly a third of
> this round's parks, and **P-31** promoted from tentative to
> confirmed (8+ instances) with a real negative finding: the canary's
> own successful predication-resistance recipe does NOT generalize
> once a guard chain's success path grows more complex than a bare
> return. See
> [`cm-main-tier-sweep-2-2026-08-08.md`](../research/cm-main-tier-sweep-2-2026-08-08.md).

### cm-main-tier-sweep-3 — continue main, and stop trusting the worklist's shape labels [DONE]

`cm-main-tier-sweep-2` (#1478) answered its question honestly: Pool A (guard chain) **32/50 = 64%**, Pool B (loop / other / small dispatcher) **27/50 = 54%**. A real gap, but far smaller than wave 1's 71% framing implied — and **two of five batches had Pool B outship Pool A**, with Pool B ranging 20–80% across batches. The tier is not a cliff; the variance is mostly batch composition.

The most useful thing that round found is a **defect in the selector itself**: several worklist rows labelled `guard chain` concealed non-guard-chain bodies (softfloat conversions among them). That means wave 1's "100/100 guard chain" homogeneity claim — the basis for reading its 71% as pre-filtered — is itself unreliable, and every future shape-based split inherits the error. Treat the worklist's `shape` column as a hint, not ground truth.

This round, 100 candidates, same 0x02040000+ range, 5 worktrees × 20, partition frozen before dispatch:

1. **Re-derive each candidate's shape from its own `.s` body at pull time** rather than reading the worklist column, and record BOTH (worklist label, derived label) per attempt. Report how often they disagree — that number is the deliverable that makes every future sweep's targeting honest, and the Codex Decomper is rebuilding the labels wholesale in parallel (`q-main-shape-reclassify`), so your disagreement sample is its ground-truth check.
2. Prioritise by the DERIVED shape, leading with whatever sweep-2's per-shape breakdown actually shipped best — read your own round doc for that, not the worklist's ranking.

**P-36 (instruction-scheduling family) explained roughly a third of sweep-2's parks.** Before drafting a candidate whose diff is scheduling-only, check P-36's criteria; if it matches, park immediately rather than iterating. If you find a lever that moves ANY P-36 member, that is worth more than five ordinary ships — record it with the same evidence standard as C-70…C-76.

Standing enforcement unchanged: one worktree = one agent, mandatory first-step location guard in every batch prompt, pool built ONCE and frozen, ROUTE BEFORE YOU DRAFT on every candidate (read the `.s` epilogue, pick `.c` / `.legacy.c` / `.legacy_sp3.c` first). Lever set: C-44 / C-55 / C-63 / C-64 / C-65 (open) / C-66 / C-67 plus your own C-70…C-76 and P-30…P-36.

⚠️ **Sequencing, from sweep-2's own disclosure:** you checked worktrees for the orphaned-`.s` bug before batch2's completion notification had arrived and ran `git rm`/`git commit` in its worktree while its agent may still have been live. No damage that time. Wait for each batch's completion notification before touching its worktree.

⚠️ `park_one.py`'s structural recording is now fixed and merged (#1467/#1479) — use it, and verify it actually wrote rows rather than assuming. If a batch worktree still records nothing, that is a finding worth reporting, not a silent backfill.

STOP: at 100 recorded attempts, or 15 consecutive parks with no ship. Effort MAX.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the consolidated branch, three regions individually grepped; `check_activation_invariant.py`; `check_delink_dupes.py`; `.c`-added == delinks-activations-flipped; `git restore assets/` after `--clean`. ⚠️ A background wrapper's exit code is NOT `gate3.py`'s — read the log. State ONE basis for the headline (sweep-2 got this right: "60/100 shipped (59 batch + 1 canary), 3,852 bytes"). Paste the three per-region sha1 lines VERBATIM, both invariant outputs, the partition, before/after `wall_aware_headroom.py`, the per-shape ship rates, and the worklist-vs-derived disagreement count.

> **57/100 shipped, 5,112 B (58 incl. canary, one basis throughout).**
> A mechanical shape-derivation tool was built and validated (3 real
> bugs caught, incl. a dot-prefixed-label ordering bug that had
> silently disabled ALL backward-branch detection until fixed) —
> disagreement rate 1.7% (17/975) project-wide, 11/100 in this
> round's deliberately-oversampled dispatched pool (12 incl. canary),
> and every `guard chain → other` disagreement shipped (4/4, 100%)
> while `small dispatcher → guard chain` shipped only 3/8 (37.5%).
> **Headline finding: per-shape yield did NOT carry over from
> sweep-2** — loop went from the campaign's best shape (88.2%) to
> roughly its worst (45.0%); other and small dispatcher went from
> worst (41.2%/31.2%) to best (83.3%/75.0%). Leading with "what
> shipped best last round" produced a WORSE overall rate (57.0%) than
> sweep-2's less-targeted split (59.0%) — read as a real finding about
> sample instability, not a regression. Batch 4's entire 20-candidate
> pool turned out to be a pre-diagnosed GLOBAL_ASM-endgame backlog
> (brief 302/294) invisible to `attempts.tsv`'s exclusion filter, yet
> still shipped 13/20 (65%) — the lever catalogue has outgrown a slice
> of what the campaign currently treats as permanently walled.
> `park_one.py`'s ledger fix (#1467/#1479) is confirmed genuinely
> working for the first time this campaign, across all 5 batches, with
> no manual backfill needed. 1 new C-lever (C-82), 1 new C-44
> worked-example addendum, 2 new P-36 sub-shapes plus 3 sub-shape
> reconfirmations, and 6 new tentative P-walls (P-40–P-45, including a
> genuine mwcc 2.0 STR-immediate-truncation correctness bug, not just
> a match gap). See
> [`cm-main-tier-sweep-3-2026-08-08.md`](../research/cm-main-tier-sweep-3-2026-08-08.md).

### cm-main-tier-sweep-4 — shape is not the lever; find one that is [DONE]

`cm-main-tier-sweep-3` (#1483) shipped 57/100 (5,112 B across 58 functions including the canary, one basis throughout) and delivered the measurement it existed for: **11% of the dispatched pool's worklist shape labels were mechanically wrong** (11/100; 17/975 across the wider set), and — the bigger finding — **per-shape yield did NOT carry over from sweep-2**. Guard chain's 64% and Pool B's 54% did not reproduce. Shape category is not a stable predictor of ship rate.

That closes the shape-targeting line: three waves have now tried to steer by shape and the signal is weak, mislabelled, and non-stationary. **Do not design wave 4 around shape.** The Codex Decomper's `q-main-shape-reclassify` still has standalone value as a corrected reference column, but it is no longer the selector this lane waits on.

So this round asks a different question: **what DOES predict ship rate on `main`?** You now have three waves of ground truth — 100 + 100 + 100 attempts with recorded outcomes, sizes, derived shapes, park classes and match percentages, all in `attempts.tsv`. Mine your own data before dispatching:

1. **Retrospective first, on the merged ledger.** For every `main` attempt across sweeps 1-3, test which recorded attribute actually correlates with `shipped`: text size (and size band), derived shape, park class of neighbours, whether a matched sibling exists in the same TU or address run, header provenance, callee count, presence of a float/CLZ helper call. Report what predicts and what does not, with counts — not impressions. A finding of "nothing we record predicts it" is a legitimate and valuable answer; say so plainly if that is what the data shows.
2. **Then dispatch 100 candidates selected by whatever your retrospective says is the best available predictor**, and state the prediction up front: what ship rate do you expect, and why. Compare against the outcome in the PR body. Being wrong with a stated prior is worth more than being right with none.

⚠️ **One of sweep-3's 20-candidate pools turned out to be a resurfaced pre-diagnosed wall cohort.** Cross-check the pull against `attempts.tsv` via `--exclude-attempted` (now that the ledger's exclusion semantics are fixed and the diagnosed-wall `park_class` guard has landed) AND against the sweep park docs. If a whole batch comes back near-zero, suspect the pool before suspecting the candidates.

Same mechanics as before: 100 candidates, 0x02040000+ range, 5 worktrees x 20, pool frozen before dispatch, one worktree = one agent with its own location guard, ROUTE BEFORE YOU DRAFT, park every attempt via `park_one.py` and verify it wrote rows. Levers C-44 / C-55 / C-63 / C-64 / C-65 (open) / C-66 / C-67 plus C-70..C-76 and P-30..P-36; park P-36 scheduling-only diffs on sight rather than iterating.

STOP: at 100 recorded attempts, or 15 consecutive parks with no ship. Effort MAX.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the consolidated branch (read the log — a background wrapper's exit code is not `gate3.py`'s); `check_activation_invariant.py`; `check_delink_dupes.py`; `.c`-added == delinks-activations-flipped; `git restore assets/` after `--clean`. ONE stated basis for the headline. Paste the three per-region sha1 lines VERBATIM, both invariant outputs, the partition, the retrospective's predictor table, your stated prior, and the outcome against it.

> **75/100 shipped — callee count beat shape by a wide margin, and
> the prediction landed exactly at the bottom of the stated range.**
> Retrospective on 302 combined sweep-1/2/3 records found shape weak
> (14-point spread even pooled across 3 sweeps) but callee count
> monotonic and robust: 0 calls 46% → 1 call 58% → 2-3 calls 71% →
> 4+ calls 83%, holding up even within a single mwcc tier. A
> methodology trap was caught mid-analysis: the ledger's own `tier`
> column looked dramatic (27.6% default vs ~90% legacy/legacy_sp3)
> but turned out only 24.6% self-consistent on PARKED rows (vs 95.4%
> on shipped — you can't ship under the wrong compiler, so only
> shipped rows' recorded tier is trustworthy). Recomputed with a
> uniform mechanical classifier applied to all 302 original `.s`
> files: a real but far more modest tier effect (legacy_sp3 74.7%,
> legacy 67.0%, leaf-with-no-calls-at-all 44.0% — leaf turned out to
> be a strict subset of the 0-callee-count population, not an
> independent signal). Dispatched 100 candidates on the validated
> predictor alone — 4+ calls, 50/50 legacy/legacy_sp3, ≤256B to stay
> in scope — with a stated prior of 75-85% before drafting anything.
> Landed at 75/100 (76% legacy, 74% legacy_sp3), and all 100
> pre-computed tier labels were independently re-verified correct by
> the batches (0 disagreements). 6 new C-levers, 2 new P-walls, and
> several extensions to existing entries. See
> [`cm-main-tier-sweep-4-2026-08-09.md`](../research/cm-main-tier-sweep-4-2026-08-09.md).

### cm-main-tier-sweep-5 — separate callee count from size by design, and probe the mechanism [DONE]

`cm-main-tier-sweep-4` (#1489) is the campaign's best round on both counts: **75/100 shipped, 12,752 B** — 2.5x sweep-3 and 1.9x sweep-1 by bytes, all 75 natural C with zero asm — and the strongest analysis. It stated a prior (75-85%) before dispatching and landed at its floor, which is a well-calibrated prediction.

The brain independently re-ran the retrospective and **could not break the central claim**: callee count correlates with size (r=0.555), but size has essentially zero *marginal* correlation with ship rate (r=0.007), and controlling for size makes the callee coefficient GROW (0.315 -> 0.428) while size turns negative. Permutation p=0.0004; Cochran-Armitage z=4.64. The pool was not skewed small (177 B mean vs 82 B historical), so 75% is not a selection artifact. Callee count is real.

Two things the round did not report, both now appended as corrections to its own doc, and both of which define this round:

- **Size is strongly predictive within sweep-4 while callee count is flat.** By size band: 64-127 B 87% (N=15), 128-191 B 86% (N=42), 192-255 B 65% (N=37), 256 B 33% (N=6). By callee bucket: 4 calls 76% (N=38), 5-6 calls 76% (N=34), 7+ calls 71% (N=28). Once callee count is held high, **size becomes the live variable above ~192 B**.
- **"Callee count is the lever" overstates it.** A lever (C-NN) is something an agent *applies*; you cannot give a function more callees. It is a **selector**. The round tested association, never mechanism.

So this round does two things, and the experiment matters more than the ship count:

**PART 1 — THE MATCHED-PAIR DISPATCH (the point of the round).** Sweeps 1-4 all confounded callee count with size because they pulled on one variable and let the other float. Break it by design: dispatch **50 candidates from a SINGLE narrow size band** — pick the band from the worklist where you have enough population, 128-192 B is the obvious candidate — split **25 at 0-1 callees** and **25 at 4+ callees**. Same band, same tier mix as far as the pool allows. Report the two sub-rates. If callee count is a genuine independent selector, the 4+ arm should beat the 0-1 arm within the band; if the arms come out level, callee count was a size proxy after all and sweep-4's result needs re-reading. **Either outcome is a full success** — this is the experiment that settles it, and the retrospective currently cannot, because only N=8 historical records have both >=128 B and 4+ calls.

**PART 2 — the remaining 50, and the mechanism probe.** Dispatch 50 more on your best current selector (4+ callees, size <=192 B given the band finding) for yield. Then, cheaply, probe WHY more calls ship better, using data you already have: `attempts.tsv`'s `park_class` column over sweeps 1-4. The brain's probe over 113 sweep-1..3 parks found 4+-call parks (N=7) are near-uniformly register-allocation residuals (`reg-alloc-extra-mov`, `reg-alloc-diverge-stmia-merge`, `regalloc-cascade-unresolved`) while 0-call parks (N=36) skew to scheduling and predication (`P-36-pipeline-interleaving`, `predication-resistance-new`, `P-31`). That is consistent with the plausible mechanism — more call boundaries pin more register state via the ABI, leaving mwcc fewer degrees of freedom to diverge — but N=7 is far too small to assert. With sweep-4's 25 parks added you have a real sample. If the pattern holds, say so with counts and propose it as a numbered entry; if it dissolves, say that.

STATE A PRIOR for both parts before dispatching, as you did last round — that habit is now the lane's standard.

⚠️ **Report bytes, not just counts.** Sweep-4's "Byte total" section verified function counts and no byte figure appeared anywhere; the brain had to recompute it (12,752 B) at review. `wall_aware_headroom.py`'s `total.s`/`perm`/`coerc` columns are FILE COUNTS — read the tool's source before quoting it as a byte measure.

⚠️ **Gate on the FINAL tree.** Sweep-4 rebased onto a main that had gained 7 real EUR ROM build inputs (ov000/ov011 data + delinks) and the gate timestamps did not fit a post-rebase run, so the brain re-ran the full 3-region gate itself to clear the merge (it passed). Either gate after the last rebase, or state plainly which commit the gate covered.

Same mechanics otherwise: 0x02040000+ range, 5 worktrees x 20, pool FROZEN before dispatch, one worktree = one agent with its own location guard, ROUTE BEFORE YOU DRAFT, park every attempt via `park_one.py` and verify rows were written, wait for each batch's completion notification before touching its worktree. Levers C-44 / C-55 / C-63 / C-64 / C-65 (open) / C-66 / C-67 plus C-70..C-76 and P-30..P-36 — park P-36 scheduling-only diffs on sight.

STOP: at 100 recorded attempts, or 15 consecutive parks with no ship. Effort MAX.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the consolidated branch, AFTER any final rebase (read the log — a background wrapper's exit code is not `gate3.py`'s); `check_activation_invariant.py`; `check_delink_dupes.py`; `.c`-added == delinks-activations-flipped; `git restore assets/` after `--clean`. ONE stated basis for the headline, WITH the byte total. Paste the three per-region sha1 lines VERBATIM, both invariant outputs, the partition, the two matched-pair sub-rates against your prior, and the mechanism probe's counts.

> **65/100 shipped, 9,732 B (computed correctly this time — summed
> directly from delinks.txt spans, cross-checked against each
> batch's own independent sum, exact match).** The matched-pair
> experiment is decisive: within the SAME 128-192B band, tier-matched
> exactly between arms (14 legacy + 11 legacy_sp3 each, after catching
> and fixing a real imbalance a naive per-arm sort produced), **0-1
> calls shipped 10/25 (40%) vs 4+ calls 19/25 (76%) — a 36-point gap
> that EXCEEDS the stated 20-35-point prior.** Callee count is a
> genuine independent predictor, not a size proxy — this closes the
> question sweep-4's own retrospective could not settle (only N=8
> historical records had both ≥128B and 4+ calls). The yield dispatch
> (Part 2, 4+ calls ≤192B) shipped 36/50 (72%), missing its own
> 80-88% prior — an honest self-critique in the round doc traces this
> to the SAME kind of marginal-combination extrapolation this round's
> Part 1 exists to catch sweep-4 making, with two batches flagging
> (not proving) indirect-call presence and a residual size-vs-callee
> interaction as candidate explanations. The mechanism probe (138
> resolvable parked rows, up from the brain's preliminary N=113/N=7)
> confirms and sharpens the proposed mechanism: reg-alloc-ish
> park_class share rises with callee count (31.6%→46.7%→59.4%) while
> scheduling/predication-ish share is highest at 0-1 calls (39.5%)
> and drops sharply above that — consistent with more call boundaries
> pinning more register state via the ABI, leaving fewer degrees of
> freedom for scheduling divergence. 6 new C-levers, 2 new tentative
> P-walls, 3 new P-36 sub-shapes (2 now confirmed at 2 instances
> each), extensions to C-45 and C-73. See
> [`cm-main-tier-sweep-5-2026-08-09.md`](../research/cm-main-tier-sweep-5-2026-08-09.md).

### cm-main-tier-sweep-6 — does the callee-count selector TRANSFER to another module? [DONE]

`cm-main-tier-sweep-5` (#1494) settled the question five waves had confounded. The brain independently reproduced every number: the arms are genuinely matched (size 159.4 B vs 155.7 B with the LOW arm nominally *harder*, Mann-Whitney p=0.46; tiers exactly 14 legacy + 11 legacy_sp3 in each), the 36-point gap survives size stratification at **36.5 points standardized**, and Fisher exact gives p=0.021. **Callee count is a real, independent selector on `main`.**

The open question now is whether it is a property of the compiler or a property of `main`. Everything measured so far — sweeps 1-5, ~500 attempts — is one module. If the selector transfers, it retargets the whole campaign; if it does not, it is a `main` artifact and the ov002 pool needs its own rule.

**THE ROUND: replicate the matched-pair design on `ov002`.** Same construction, different module: one narrow size band, 25 candidates at 0-1 callees and 25 at 4+, tier-matched as closely as the pool allows. State a prior — the `main` result predicts a gap of roughly this size; say what you expect on ov002 and why. Then dispatch 50 more on your best selector for yield.

Use `--exclude-attempted` for the pull (the ledger's exclusion semantics are fixed, the diagnosed-wall `park_class` guard has landed, and #1491 now validates rows at write time) and cross-check against the ov002 sweep park docs — that pool has ~700 prior attempts, far more prior art than `main` had.

⚠️ **If ov002's arms cannot be tier-matched, say so and report the imbalance rather than proceeding as if matched.** The `main` experiment's credibility rests entirely on its arms being comparable; an unmatched replication is worth less than an honest "the pool would not support a matched design here".

Two reporting corrections carried from sweep-5, both small:

- **State the natural-C vs asm split.** Sweep-5 shipped 1 hand-written `asm` file of 65 (144 B, the `clz` case) and never gave a count, while sweep-4's headline said "all natural C" — a reader comparing rounds will assume the same. Give the split every round.
- **Name the mechanism probe's confound if you run one again.** Sweep-5's park_class gradient is nearly collinear with *which sweep wrote the label* (the 4+ bucket is 78% sweep-4 rows, the 0-1 bucket 88% sweeps 2-3), and reg-alloc share varies 34.9-52% by sweep with callee count held out entirely. The informative within-round n for 4+ calls is still **seven**. The hedge was correctly placed; the confound was not named.

Same mechanics: 5 worktrees x 20, pool FROZEN before dispatch, one worktree = one agent with its own location guard, ROUTE BEFORE YOU DRAFT, park every attempt via `park_one.py` and verify rows were written, wait for each batch's completion notification before touching its worktree. Levers C-44 / C-55 / C-63 / C-64 / C-65 (open) / C-66 / C-67 plus C-70..C-93 and P-30..P-50 — park P-36 scheduling-only diffs on sight.

STOP: at 100 recorded attempts, or 15 consecutive parks with no ship. Effort MAX.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the consolidated branch AFTER any final rebase (read the log — a background wrapper's exit code is not `gate3.py`'s); `check_activation_invariant.py`; `check_delink_dupes.py`; `.c`-added == delinks-activations-flipped; `git restore assets/` after `--clean`. ONE stated basis, WITH the byte total and the natural-C/asm split. Paste the three per-region sha1 lines VERBATIM, both invariant outputs, the partition, the two arm rates against your prior, and the arms' size/tier distributions so the match can be audited.

> **DONE 2026-08-14. The selector TRANSFERS: 24% (LOW, 0-1 calls) vs
> 52% (HIGH, 4+ calls), a 28-point gap** — smaller than `main`'s 36
> points as the stated prior predicted (estimated range 15-25, landed
> 3 points above it), same direction, consistent with a compiler-level
> mechanism rather than a `main`-specific artifact. Sizes matched
> tightly (199.5B vs 201.3B mean, 0.9% relative difference). Tier match
> did NOT hold as designed: the mechanical pre-pass classifier had a
> 50% false-positive rate on its `legacy_sp3` label (4/8 flagged
> candidates were actually `default` tier on real compile, all in the
> same direction — a `sub sp,#4`-alone heuristic that misses default
> tier's own r3-spill-plus-pad case) — true composition LOW 3/25
> legacy_sp3 vs HIGH 1/25, reported honestly per this item's own
> instruction rather than claimed as matched. PART 2 yield (4+ calls,
> ≤192B) shipped 20/48 attempted (41.7%), well below `main`'s 72% on
> the same formula, consistent with `ov002`'s much heavier prior
> mining (~700 vs ~500 attempts) compressing both arms toward a floor.
> **Combined: 39/98 attempted shipped, 6,864 bytes, all natural C (0
> hand-written asm)** — cross-validated two independent ways
> (`check_activation_invariant.py`'s 39/39/39 count and
> `generate_state_table.py`'s byte delta, exact match both times).
> Process notes: the canary's first candidate walled (a real, already-
> catalogued P-1 instance) before the second candidate shipped and got
> a full single-region `ninja sha1` byte-verify — more expensive than
> the standing `fastmatch.py`-only protocol, corrected for the
> remaining 96 candidates; batch 4 stopped 2 candidates early on a
> misapplied "15 total parks" reading of the "15 *consecutive*" stop
> rule (true streak was 6); the first gate run was falsely reported
> complete by a `nohup`-detached background wrapper while `gate3.py`
> was still mid-build for another ~40 minutes, caught by reading the
> log rather than trusting the notification; the real first run came
> back a genuine `GATE FAIL` on a stale `docs/state-table.md` (all 3
> regions had already passed SHA1), fixed and the full gate re-run
> clean. Several recurring wall-shaped residuals surfaced across
> batches (an "off-mul" register-swap family, a register-role-rotation
> family, a scratch-register-renaming family) but are left unnumbered
> pending proper cross-reference against the existing catalogue rather
> than risk a wrong or duplicate entry. See
> [`cm-main-tier-sweep-6-2026-08-14.md`](../research/cm-main-tier-sweep-6-2026-08-14.md).


### cm-main-tier-sweep-7 — power the experiment properly, and start exploiting the selector [DONE]

`cm-main-tier-sweep-6` (#1497) replicated the matched-pair design on `ov002`: 24% (0-1 calls) vs 52% (4+), a 28-point gap, direction exactly as predicted and magnitude smaller as predicted. You also reported your own tier-match failure rather than presenting the arms as clean — that is why the rest of the numbers are trustworthy.

**The brain added the statistical framing at merge, and it changes what this round should do.** On its own, 6/25 vs 13/25 is Fisher exact **p = 0.079** — suggestive, not conclusive (main's was p = 0.021). Pooled across both modules it is strong: 16/50 vs 32/50 = **32% vs 64%, p = 0.0025**. So the selector transfers, but it is the *replication* that establishes it, and **at n=25 per arm a 28-point gap mathematically cannot reach p<0.05**. Two rounds have now spent 50 candidates each on an experiment that could not individually conclude.

So stop under-powering it, and start using it.

**PART 1 — one properly-powered confirmation, then done experimenting.** A third module (pick the largest remaining unswept pool) with **50 per arm, not 25**. At 50/arm a 28-point gap lands near p≈0.005 and a single round stands on its own. State the prior. If the gap holds, the question is closed and no further matched-pair rounds are needed — say so explicitly in the round doc so a future wave does not re-litigate it. If it does not hold on a third module, that is the more interesting result and needs its own analysis.

**PART 2 — exploit, with the remaining budget.** Dispatch on 4+ callees at the best size band your accumulated data supports, purely for yield. You now have ~600 recorded attempts across `main` and `ov002`; use them to pick the band rather than guessing. Report the rate against what the pooled model predicts — a large miss is itself a finding about the third module.

⚠️ **Fix the pre-pass classifier before you rely on it.** Sweep-6's mechanical tier pre-pass had a **50% false-positive rate**, which is what broke the tier match. Either fix it or verify tier by reading the `.s` epilogue directly for every candidate in the arms (the arms are only 100 candidates; direct reading is affordable and is the ground truth the pre-pass was approximating).

Standing reporting requirements, all of which recent rounds have had to be corrected on: ONE stated basis for the headline; the **byte total** (not file counts — `wall_aware_headroom.py`'s columns are file counts); the **natural-C vs asm split**; and the arms' size AND tier distributions so the match can be audited rather than asserted.

Same mechanics: 5 worktrees x 20, pool FROZEN before dispatch, one worktree = one agent with its own location guard, ROUTE BEFORE YOU DRAFT, park every attempt via `park_one.py` and verify rows were written, wait for each batch's completion notification before touching its worktree. Levers C-44 / C-55 / C-63 / C-64 / C-65 (open) / C-66 / C-67 plus C-70..C-93 and P-30..P-50 — park P-36 scheduling-only diffs on sight.

STOP: at 100 recorded attempts, or 15 consecutive parks with no ship. Effort MAX.

> **Result.** Part 1 pooled overlay004+006+011 (no single module had
> 50 in the 0-1-call band) for 50/arm: LOW 17/50 (34.0%), HIGH 18/50
> (36.0%), Fisher **p = 1.0000** — a clean null *within this round*.
> Two register-choice wall families (a newly-catalogued
> [P-51](../research/codegen-walls.md) changed-bool-field family, 18
> confirmed members, and the pre-existing register-numbering-
> permutation-cascade family) landed **100% in the HIGH arm, 0% in
> LOW** across 21 combined ledger rows — a plausible, evidenced
> explanation for the miss, not just a shrug. Pooling all three
> matched-pair rounds to date (sweep-5 + sweep-6 + this round, 300
> candidates) still gives 33% vs 50%, **p = 0.0214** — significant.
> The honest read: the callee-count effect is real at the pooled
> level but not deterministic round-to-round, and this round's own
> null has a specific, evidenced cause rather than being unexplained
> noise. Part 2 (4+ calls, 200-376 B, mean 298 B) shipped 8/50
> (16.0%) against a stated 30-50% prior — a large miss, driven by the
> same two wall families continuing into the larger-size tail plus
> the already-known size-decay effect. Tier pre-classifier
> independently re-verified clean this round: 0/19 disagreements
> against actual shipped tier (vs. sweep-6's 50% false-positive
> rate). 43 shipped, 8,116 B, all natural C. See
> [`cm-main-tier-sweep-7-2026-08-17.md`](../research/cm-main-tier-sweep-7-2026-08-17.md).

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the consolidated branch AFTER any final rebase (read the log — a background wrapper's exit code is not `gate3.py`'s); `check_activation_invariant.py`; `check_delink_dupes.py`; `.c`-added == delinks-activations-flipped; `git restore assets/` after `--clean`. Paste the three per-region sha1 lines VERBATIM, both invariant outputs, the partition, the arm rates with their Fisher p, and the arms' size/tier distributions. Regenerate `docs/research/README.md` LAST — a stale index has now failed `drift-check` on three separate PRs.


### cm-main-wall-filtered-sweep-1 — stop selecting on callees, start filtering out the walls [DONE]

`cm-main-tier-sweep-7` (#1502) did exactly what it was asked: 50/arm, a stated
prior, a fixed classifier (0/19 disagreements), and a **clean null** —
LOW 17/50 (34.0%) vs HIGH 18/50 (36.0%), Fisher p = 1.0000. 43 shipped,
8,116 B, all natural C, zero asm escapes; the byte total was verified
independently by the brain from `delinks.txt` spans and matches exactly.

**Read the corrected conclusion before planning anything.** The round explained
its null by two register-choice wall families landing entirely in the HIGH arm,
and computed that crediting half of "21 such rows" restores a 22-point gap. The
brain re-derived the split from the `brief` column of the 108 rows the PR added:
**only 12 of the 21 are in Part 1** — the other 9 are Part 2 rows, which the
round's own Part 2 section says. Corrected:

| Credit to Part 1 HIGH | HIGH | vs LOW 34% | Fisher p |
|---|---:|---|---:|
| none (as measured) | 18/50 (36%) | +2 pt | 1.0000 |
| half of the 12 | 24/50 (48%) | +14 pt | 0.2223 |
| all 12 | 30/50 (60%) | +26 pt | 0.0158 |

So the wall concentration is real and one-sided, but it does **not** rescue the
round on any conservative accounting. Pooled across all three matched-pair
rounds (200 candidates, 100/arm) the selector still holds at 33% vs 50%,
p = 0.0214.

**THE CALLEE-COUNT QUESTION IS NOW CLOSED. Do not run a fourth matched-pair
round.** The answer is: real, transferable, but weak and not reliable
round-to-round — a useful tiebreaker, not a targeting strategy. Say so in your
round doc so no future wave re-litigates it.

**What actually moved the rate this round was wall-family density.** Part 2 (4+
calls, 200-376 B) shipped 8/50 = 16% against a 30-50% prior, and the same two
families followed it into the larger band at equal or higher density. That is
the lever worth attacking, and unlike callee count it is *actionable*: you can
decline a candidate before spending a dispatch on it.

**PART 1 — build a pre-dispatch wall detector, and VALIDATE it by dispatching
both arms.** Target the two families this round evidenced: **P-51**
(changed-bool-field register reuse, 18 confirmed members, `int c=0;
if(rec.field){rec.field=0;c=1;} if(c)...`) and the register-numbering-permutation
cascade. Build the detector mechanically from the `.s` body, calibrate it on the
known members as positives and this round's 43 shipped as negatives, then:

- **30 candidates the detector FLAGS** (predicted walls) — dispatch them anyway.
- **60 candidates the detector PASSES** — dispatch normally.

Both arms from the same ≤192 B, 4+-callee pool. **Stated prediction required
before dispatch:** flagged arm <15%, passed arm >55%. Dispatching the flagged
arm is the whole point — it measures the detector's precision directly instead
of assuming it. A detector that flags real walls is worth more than another
selector study, and one that doesn't is a negative result you can only get this
way.

⚠️ **STAY AT OR BELOW 192 B.** Part 2 established 16% at a 298 B mean. Do not
re-probe the large band this round; that question is answered.

⚠️ **RECORD YOUR SHIPPED ROWS IN `attempts.tsv`, not just your parks.** The
brain found this round recorded 108 rows, **all `result=parked`** — zero shipped
rows for 43 shipped functions. Sweeps 3/4/5/7 all did this; sweeps 1-2 did not.
Consequence: any ship rate computed from the ledger is biased toward failure
(sweep-4 reads as 25 parked / 0 shipped when it actually shipped 75/100), and
your own Part 2 band selection was drawn from that biased history. The Codex
Scaffolder is fixing the recorder and backfilling under `q-ledger-ship-coverage`
this round — do not backfill history yourself, but **do** record this round's
ships as you go.

Standing reporting requirements: ONE stated basis for the headline; the **byte
total** (not file counts — `wall_aware_headroom.py`'s columns are file counts);
the **natural-C vs asm split**; both arms' size distributions; and the
detector's confusion matrix (flagged-and-parked, flagged-but-shipped,
passed-and-shipped, passed-but-parked) with a Fisher p on the 2x2.

Same mechanics: 5 worktrees x ~18, pool FROZEN before dispatch, one worktree =
one agent with its own location guard, ROUTE BEFORE YOU DRAFT, park every
attempt via `park_one.py` and verify rows were written, wait for each batch's
completion notification before touching its worktree. Levers C-44 / C-55 / C-63
/ C-64 / C-65 (open) / C-66 / C-67 plus C-70..C-93 and P-30..P-51 — park P-36
scheduling-only diffs on sight, and P-51 members on sight now that it is formal.

STOP: at 90 recorded attempts, or 15 consecutive parks with no ship. Effort MAX.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the consolidated
branch AFTER any final rebase (read the log — a background wrapper's exit code
is not `gate3.py`'s); `check_activation_invariant.py`; `check_delink_dupes.py`;
`.c`-added == delinks-activations-flipped; `git restore assets/` after `--clean`.
Paste the three per-region sha1 lines VERBATIM, both invariant outputs, the
confusion matrix with its Fisher p, and both arms' size distributions. Run
`npx markdownlint-cli2 --fix` on your round doc, and regenerate
`docs/research/README.md` LAST — a stale index has now failed `drift-check` on
four separate PRs.

### cm-main-exploit-drain-1 — the selector science is done; drain the pool that already yields 60% [DONE]

`cm-main-wall-filtered-sweep-1` (#1508) built the detector the round asked for,
calibrated it honestly (18/18 recall, 1/43 FP on P-51), and then did the thing
that makes the result trustworthy: **it dispatched the flagged arm too.** Result
is a clean null — flagged 11/19 (57.9%) vs passed 37/60 (61.7%), Fisher
p = 0.7927, holding in both the main and overlay slices. The round also
disclosed its own pool deviation rather than hiding it (19 flagged, not the
planned 30; it declined to loosen the threshold to hit a number).

**Two selector programmes have now returned weak-or-null in a row.** Callee
count: real but weak, closed at round 0817. The wall detector: null on the only
family it could actually test. Note what the detector round could NOT test —
P-51 fired **zero** times across 209 qualifying candidates, so the
high-confidence half of the detector never got an opportunity; what was measured
is the weaker permutation-cascade proxy, and it does not transfer past the three
modules it was calibrated on. **Do not run a third selector study.** If P-51
candidates reappear naturally in a future pool, the detector is already built
and calibrated — use it opportunistically, do not go hunting for a population to
justify it.

**THE ACTUAL FINDING IS THE YIELD.** This round shipped **48/79 = 60.8%** —
against sweep-7's 34-36% on its matched arms. The difference is not a selector,
it is the **pool definition**: full EUR candidate population, `<=192 B`,
`>=4 bl`, unattempted. That configuration is the most productive this campaign
has measured, and #1508 dispatched only 79 of the **209** qualifying candidates
it enumerated.

**THE ROUND — exploit it. No experiment, no arms, no prior.** Drain the
remainder of that exact pool. Re-enumerate it fresh (the population moved: 48 of
the 209 are now shipped, and `--exclude-attempted` must account for this round's
newly-recorded ships as well as its parks). Dispatch for yield until the pool is
drained or the stop condition trips. State the pool size at dispatch and the
rate you get against the 60.8% prior — a large miss is itself a finding about
how much of that 60.8% was the pool versus the 79 candidates that happened to be
picked first.

Carry three things #1508 surfaced, all cheap:

- **P-23 needs a catalog correction** — a documented `permanent` member shipped
  via an unrelated callee-signedness fix (`0x02253304`, contradiction recorded
  in the ledger). Apply the correction to `codegen-walls.md` with the evidence.
- **The bitfield-vs-manual-mask lever** was found independently by two batches
  and is not yet in the catalog. Write it up as a `C-NN` (check the highest
  existing number on `origin/main` first — a taxonomy collision cost a round at
  0810).
- **`tools/record_shipped.py` now exists** (the ship-side counterpart to
  `park_one.py`). Use it from the start this round; do not hand-add ship rows.
  The `q-ledger-ship-coverage` guard now fails a round that flips delinks
  without recording ships, so this is enforced, not advisory.

Same mechanics: 5 worktrees x ~20, pool FROZEN before dispatch, one worktree =
one agent with its own location guard, ROUTE BEFORE YOU DRAFT, park every
attempt via `park_one.py` and record every ship via `record_shipped.py`, and
wait for each batch's completion notification before touching its worktree. Any
`git worktree add` carries the b602 config-lock retry-loop. Levers C-44 / C-55 /
C-63 / C-64 / C-65 (open) / C-66 / C-67 plus C-70..C-93 and P-30..P-51 — park
P-36 scheduling-only diffs and P-51 members on sight.

STOP: at 100 recorded attempts, at pool exhaustion, or 15 consecutive parks with
no ship.

**Gate:** `python tools/gate3.py --scope all --clean` ONCE on the consolidated
branch AFTER any final rebase (read the log — a background wrapper's exit code
is not `gate3.py`'s); `check_activation_invariant.py`; `check_delink_dupes.py`;
`.c`-added == `.s`-deleted == delinks-activations-flipped; `git restore assets/`
after `--clean`. Paste the three per-region sha1 lines VERBATIM, both invariant
outputs, ONE stated basis for the headline, the BYTE TOTAL, the natural-C vs asm
split, the pool size at dispatch, and the rate against the 60.8% prior.
Regenerate `docs/research/README.md` LAST.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-decomper cm-main-exploit-drain-1`; commit; report.

### cm-main-exploit-drain-2 — finish the 192 B pool, then find out where it stops being a 73% pool [DONE]

`cm-main-exploit-drain-1` (#1524) did exactly what it was asked and the number
held up: **73/100 shipped, 9,488 B, zero `asm` escapes across all 73** — against
a 60.8% prior and sweep-7's 34-36%. Brain re-derived every load-bearing figure
independently: 73 `.c` added == 73 `.s` deleted == 73 delink activations, 96 new
ledger rows (73 shipped + 23 parked), `text_size` sum = 9,488 B exactly, and
`grep -lE '\basm\b|__asm|GLOBAL_ASM'` over all 73 shipped files returns nothing.
The round also corrected the catalog against itself (P-23 confirmed -> tentative
after a listed member shipped clean via an unrelated fix) and filed C-95.

**The standing finding is now three rounds deep: the pool definition is the
lever, not any selector.** Do not re-open that question.

**Part 1 — drain the remainder. The pool is 32 candidates, and here it is.**

Re-derived by the brain at this item's `main`, reusing `wall_aware_headroom.py`'s
own `scan()` (`max_size=192, exclude_attempted=True`) plus the `>=4 bl/blx` body
filter — **34 in-pool, 5,224 B**, of which 2 are documented-permanent and must be
excluded, leaving **32 drainable / 4,916 B**. This reconciles exactly with the
account in PR #1524 (28 reserve + 4 not-reached + the 2 it swapped out
pre-dispatch), which is why it is pasted as a list rather than a number — a list
cannot go stale the way five consecutive waves' pool counts did:

```
main        0x020896cc  124B bl=4    overlay002  0x0229d258  112B bl=4
main        0x0208a5e4  160B bl=5    overlay002  0x022ae2e0  148B bl=5
main        0x0209c280  156B bl=4    overlay003  0x021cbdf4  152B bl=10
overlay002  0x0224b1e0  156B bl=5    overlay008  0x021abb08  152B bl=4
overlay002  0x02250d9c  164B bl=5    overlay008  0x021afbac  128B bl=4
overlay002  0x02251104  184B bl=5    overlay010  0x021b2b08  120B bl=8
overlay002  0x02251bb0  140B bl=4    overlay010  0x021b3ea0  176B bl=5
overlay002  0x02251ec0  176B bl=4    overlay010  0x021b3f50   72B bl=5
overlay002  0x022527b8  176B bl=4    overlay010  0x021b4194  136B bl=8
overlay002  0x02291160  180B bl=5    overlay010  0x021b6b58  168B bl=4
overlay002  0x02294478  140B bl=4    overlay014  0x021b2644  168B bl=9
overlay002  0x02295efc  188B bl=4    overlay015  0x021b3ecc  180B bl=4
overlay002  0x02296240  192B bl=4    overlay015  0x021b3f98  168B bl=4
                                     overlay015  0x021b43a8  156B bl=5
EXCLUDE (documented permanent,       overlay017  0x021b61dc  136B bl=6
 `.s` header citation never          overlay017  0x021b6774  144B bl=4
 backfilled — see below):            overlay022  0x021aa4a0  160B bl=8
overlay002  0x02212bc4  P-25         overlay022  0x021ab330  192B bl=5
overlay002  0x0224b01c  P-21         overlay022  0x021ab3f0  112B bl=5
```

All 34 are `unknown_files` — none coercible. That is consistent with the round's
own finding: this pool is the bulk-stamped, never-individually-assessed tranche,
and the "reg-alloc-walled, no C match" boilerplate header on it is not evidence.
The 4 `not reached` from #1524 (`func_020896cc`, `func_0208a5e4`,
`func_0209c280`, `func_ov002_0224b1e0`) are in the list above and were left
deliberately, not rushed — one has an ambiguous return-value pattern worth a
careful look. **Do not exclude the 2 P-25/P-21 files silently — the citation
backfill is queued to the Codex Decomper this round (`q-wall-citation-backfill`),
so leave their `.s` alone and just don't attempt them.**

**Part 2 — the pool-boundary question, which is the actual point of this round.**

At `<=192 B` the pool is nearly gone. Move ONE axis — the size cap — and it comes
back. Brain-measured at this item's `main`, same `>=4 bl` filter, same
`--exclude-attempted`:

| `.text` cap | candidates (>=4 bl) | bytes |
|---|---:|---:|
| <=192 B | 34 | 5,224 |
| <=256 B | 298 | 64,784 |
| <=320 B | 581 | 146,464 |
| <=384 B | 781 | 217,016 |

The **193-256 B slice alone is 264 candidates / 59,560 B.**

**This is not a third selector study, and the distinction matters.** The standing
instruction is to stop selecting *within* a pool. This asks where the pool's
*boundary* is, and there is a real prior on the other side of it:
**`cm-main-tier-sweep-7` Part 2 (4+ calls, 200-376 B) shipped 8/50 = 16%.** The
193-256 B slice is the bottom sliver of that band and has never been isolated —
sweep-7 measured the band as a whole, dominated by its 256-376 B half.

Dispatch **40 candidates** from the 193-256 B slice, sampled across modules the
same way Part 1's partition is (do not take all 40 from ov002). Record every one
in the ledger — shipped AND parked — via `record_shipped.py` / `park_one.py`.

**The falsification test, stated before you run it (AGENTS.md control 6):**

- Slice ships **>=50%** => sweep-7 Part 2's 16% was a whole-band artifact driven
  by its larger half, the ~192 B cap is NOT the binding constraint, and
  59,560 B + a 146 KB tail behind it are open. Say so plainly.
- Slice ships **<=25%** => the cap near 192 B is real, sweep-7 Part 2 reproduces,
  and this campaign's small-function pool is genuinely near its end. Say that
  plainly too — a confirmed ceiling is a result, not a failure, and it redirects
  the whole lane.
- Anything in between is exactly that: state the number, do not round it toward
  the story you prefer.

Do NOT loosen the `>=4 bl` threshold, the size cap, or the sampling to reach a
nicer number; #1508 declined to do that and it is the reason its null is
trustworthy.

**Process notes carried from #1524, worth keeping:**

- Run the final gate as three separate `gate3.py --scope <region> --clean` calls,
  not one `--scope all --clean`. #1524 lost ~2,500 build steps to an interruption
  mid-EUR and adopted this; it is the same total verification in a
  far-cheaper-to-redo unit.
- Hand-verify every shipped file has no same-stem `.s` left on disk before
  committing. `batch_sha1.py`'s apply step silently fails to delete the
  superseded `.s` in at least two situations (#1524 hit both) and nothing catches
  it until a later `configure.py` errors with `multiple rules generate X`. The
  tool fix is queued to the Codex Decomper this round; until it lands, the manual
  check stays.
- Screen every candidate address against every `**Affected picks**` line in
  `codegen-walls.md` before freezing the partition — not just each file's own
  header. That check is what caught the P-25/P-21 pair.

**Gate:** three `python tools/gate3.py --scope <eur|usa|jpn> --clean` runs, all
three `SHA1 PASS` lines pasted verbatim + `check_activation_invariant.py`
(`.c` added == `.s` deleted == activations) + `check_delink_dupes.py` +
`gate3.py --scope tests`. Paste real tails, not prose. `git restore assets/`
after each `--clean` so the heatmap SVGs stay out of the diff. Dedup touched
delinks against **current `main`**, not just your branch base.

ONE PR; verify every PR-body claim against `git diff --stat` before writing it;
`python tools/work_queue.py done claude-decomper cm-main-exploit-drain-2`.

### cm-main-boundary-rerun — settle the 193-256 B question with matched effort [DONE]

`cm-main-exploit-drain-2` (#1536) ran the boundary test and reported **0/40**,
then did the thing that makes it worth acting on: **it disclosed that Part 2 got
materially less iteration than Part 1** — mostly one fastmatch attempt each,
versus Part 1's 2-4 and versus the protocol `cm-main-exploit-drain-1` used to
reach 73%. It called its own 0% a lower bound rather than a measurement, and it
declined to invoke the decision memo's redirect on evidence it knew was
confounded. That is exactly right, and it is why this item is a re-run rather
than a verdict.

**The brain's independent read of your own ledger, which you should have before
you start.** Park `match_pct` distributions for the two arms:

| | n | median | >=85% | <50% |
|---|---:|---:|---:|---:|
| Part 1 (<=192 B tail, 2-4 attempts) | 27 | 17.8% | 2 | 19 |
| Part 2 (193-256 B, ~1 attempt) | 40 | 12.9% | 1 | 36 |

If under-iteration were the whole story, Part 2 would show a pile of
high-percentage near-misses that one more pass would close. It does not — 36 of
40 sit below 50%, and only one candidate is above 85%. Note the bias runs
*against* that reading, too: Part 1's figures are best-of-several attempts while
Part 2's are best-of-one, so Part 1 is flattered and the gap between them is
still only ~5 points. (Caveat, stated because it matters: `match_pct` is
agent-reported, not tool-derived — it is evidence, not proof. What makes the
comparison usable is that both arms were recorded by the same lane under the
same convention.)

**So the honest position is: the evidence leans toward the cap being real, and
the round cannot close the question. Close it.**

**Scope — deliberately small.** Re-test **20 candidates** from the 193-256 B
slice, sampled fresh (do not reuse #1536's 40; draw from the untouched
remainder), under **Part 1's protocol**: 2-4 fastmatch iterations each, real
struct-layout and register-order experiments before parking. Record every one.
This is ~half the sample size of the confounded run and worth more than it was.

**Run it arm-blind if your batching allows it.** `cm-main-wall-filtered-sweep-1`
deliberately hid arm labels from its dispatched batches to avoid exactly the
effort-bias that confounded #1536, and it is the reason that round's null was
trustworthy. If you split across worktrees, do not tell a batch whether it is
"the hard band" — give it candidates and the standard protocol.

**Decision, stated before the run:**

- **>=25% ships** — the cap is NOT real; #1536's 0% was an effort artifact.
  `post-small-pool-strategy.md` Outcome A/C applies, the band ladder opens, and
  59,560 B plus a 146 KB tail behind it are back on the table.
- **<=10% ships** — the cap is real and confirmed at matched effort. Outcome B
  fires: the small-code frontier is closing, and the campaign's centre of
  gravity moves to the data pool (which is now measured at 213,220 B reachable
  and shipping successfully — see `cm-restock-carve-10`, #1526).
- **10-25%** — consistent with sweep-7 Part 2's 16%; the band is workable but
  poor. Report it and let the owner weigh it against the data pool's rate.

Do not adjust the sample, the protocol, or the thresholds to reach a number.
The value of this round is entirely in it being clean.

**One correction to carry:** #1536's prose said the P-20 wall took 9 Part 2 hits
for 16 total; its own ledger and `codegen-walls.md` say **8 and 15** (7 Part 1 +
8 Part 2, 13 new members, cohort 50). The brain corrected the writeup at merge.
The catalog was right; only the prose was off. Re-derive from the ledger, not
from the previous round's summary.

**Gate:** three `python tools/gate3.py --scope <eur|usa|jpn> --clean` runs, all
three SHA1 PASS lines pasted verbatim + `check_activation_invariant.py` +
`check_delink_dupes.py` + `gate3.py --scope tests`. Paste real tails.
`git restore assets/` after each clean run. Dedup touched delinks against
current `main`.

ONE PR; verify every PR-body claim against `git diff --stat` before writing it —
including the arithmetic, which is what slipped last round; `python
tools/work_queue.py done claude-decomper cm-main-boundary-rerun`.

### cm-main-band-followthrough — one bounded pilot at 257-320 B, framed as the test it actually is [DONE]

**Rewritten 2026-08-24 by the brain after `cm-main-boundary-rerun` (#1545)
answered, and after a finding that changes what this item should ask.**

Your re-run settled the 193-256 B question: **0/20 at matched effort**, median
`match_pct` 5.2%, 8 of 20 flat zero, on a fresh sample with zero overlap
against PR #1536's 40. That is Outcome B in `post-small-pool-strategy.md`, not
in dispute.

**But the memo's Outcome B then says "take the 257-512 B pilot", and the
justification for that was going to be sweep-7's 23.5% on 257-320 B. The brain
checked that number's provenance and it will not bear the weight.** Sweep-7's
own rows, banded:

```text
band        sweep-7 (2026-08-17)      recent matched-effort
<=192 B     25/69 = 36.2%             pool drained to 0
193-256 B    8/29 = 27.6%             0/60 = 0.0%     <-- same band, DISJOINT candidates
257-320 B    8/34 = 23.5%             never tested
321-376 B    2/17 = 11.8%             never tested
```

Address overlap between the two 193-256 B sets: **zero**. Same band, same
`>=4 bl` filter, different functions, 27.6% collapsing to 0%. The campaign
harvests in descending order of tractability, so a band's rate is a property of
*the pool when it was measured*, not of the band. Sweep-7's 23.5% on 257-320 B
is the same vintage as the 27.6% that just evaporated. Full write-up:
[`docs/research/band-rate-vintage.md`](../research/band-rate-vintage.md).

So this item is **not** "drain 257-512 B because it looks like 23%". It is one
bounded test of a specific hypothesis.

**Scope — deliberately narrow.**

1. **Record the closure first.** Write the 193-256 B result into
   `codegen-walls.md` with both runs' evidence (0/40 reduced-effort, 0/20
   matched-effort, the match_pct distributions, and the disjointness). A closed
   band recorded with its evidence is a permanent saving; an unrecorded one gets
   re-opened in three months by someone who forgot.

2. **Then sample n=20 at 257-320 B only.** Not 257-512. Sweep-7 measured
   321-376 B at 11.8% — already below any sane threshold — and >376 B has
   essentially no data at all (0/2). Testing 257-512 as one block would blend a
   plausible sub-band with two poor ones and produce exactly the kind of
   ambiguous whole-band number that made #1536's comparison unusable. One
   sub-band, one answer.

3. Full 2-4-iteration protocol per candidate, drawn from the **unattempted**
   population, ledgered shipped and parked, `attempts` column populated now that
   #1544 added it — you are the first round that can record effort as data
   rather than as prose. Please do.

**The hypothesis under test, stated plainly:** is 257-320 B still tractable, or
has it been cream-skimmed the way 193-256 B was? Sweep-7 took 34 candidates from
it and shipped 8; what is left is what it declined.

**Decision, fixed before you run:**

- **>=25% ships** — the band genuinely holds, cream-skimming did not exhaust it,
  and draining it is real work. Say so; the next wave drains.
- **<=10% ships** — the code frontier is closed across every band this method
  can reach. Record it as such in the catalog, and both CC lanes move to the
  data pool, which is where the campaign's remaining measured headroom is
  (66,096 B behind the verifier `cm-restock-carve-12` is building, plus 128,875 B
  of non-string shapes).
- **10-25%** — marginal. Report the number and the per-candidate effort, and let
  it be weighed against the data lane's return per hour of machine time. Do not
  drain a marginal band by default just because it is the familiar work.

Do not adjust the sample, the protocol, or the thresholds to reach a number.
Three rounds in a row have been trustworthy because nobody did.

**Canary:** hand-verify one candidate end to end before batching — fastmatch
100%, a real single-region `ninja sha1` PASS, delinks activation confirmed,
ledger row read back. If no candidate in your sample produces a clean canary,
that is itself close to the answer: say so explicitly, as #1545 did after
hunting ten extra candidates rather than lowering the bar.

**Gate:** three `python tools/gate3.py --scope <eur|usa|jpn> --clean` runs with
all three SHA1 PASS lines pasted verbatim, plus `check_activation_invariant.py`,
`check_delink_dupes.py`, and `gate3.py --scope tests`. If the round ships zero,
say so plainly and note that the activation invariant correctly refuses a
vacuous pass — #1545 handled that exactly right. `git restore assets/` after
each clean run.

ONE PR; verify every claim against `git diff --stat` including the arithmetic;
`python tools/work_queue.py done claude-decomper cm-main-band-followthrough`.

### cm-main-band-finish — process the 11 you deferred, then apply the thresholds to a real n=20 [DONE]

`cm-main-band-followthrough` (#1563) did the hardest thing available to it: it
sampled n=20 at 257-320 B, fully processed 9 (2 shipped, 7 parked), read and
deferred 11 as disproportionately complex for one round's budget, and then
**refused to report 2/9 = 22.2% as a verdict** — because the pre-registered
thresholds were written against an n=20 denominator, and rounding a partial
sample up would repeat the exact vintage-stamping mistake BR-2 exists to name.
That restraint is why this item is a one-line continuation instead of a
re-litigation.

**Process the 11 deferred candidates.** They are already identified and read, so
the expensive half — selection, reading, understanding — is done. Same protocol:
2-4 real iterations each, both results ledgered, and **populate the `attempts`
column** (you were the first lane to do that, on 9/9 rows; keep it).

**Then apply the ORIGINAL thresholds to the full n=20**, unchanged:

- **>=25%** (>=5 of 20) — the band holds; draining it is real work.
- **<=10%** (<=2 of 20) — the code frontier is closed across every band this
  method reaches. Record it in the catalog and both CC lanes move to data.
- **10-25%** — marginal; report it and let it be weighed against the data lane.

You already have 2 ships banked, so the arithmetic is stark and worth stating up
front: **if 0 of the 11 ship you land at exactly 2/20 = 10%, the "closed"
boundary. Three more ships puts you at 25%.** Do not let knowing that shade the
work — the point of pre-registering thresholds is that they bind after you can
see where you are.

**What the brain sees in your own data, so you have it before you start.** The
two bands are qualitatively different, and this is the strongest reason to
finish rather than assume:

| | n | shipped | parked median `match_pct` | flat 0% | >=50% |
|---|---:|---:|---:|---:|---:|
| 193-256 B | 60 | 0 | 11.2% (matched-effort subset 5.2%) | 11 | 8 |
| 257-320 B | 9 | 2 | **55.2%** | **0** | 3 of 5 |

Not one 257-320 B candidate produced a dead draft. Both bands are **100%
register-class parks**, so this is NOT "small dies on reg-alloc, large doesn't" —
it is the same wall family with drafts landing ten times closer. Do not build a
selector on that observation; two selector programmes have already returned null
and the standing instruction is to stop. It is context for why the remaining 11
are worth the effort, nothing more.

**The 11 are the hard ones, by construction** — you set them aside for
complexity (nested loops with signed-division idioms, repeated bitfield-pack
structs, a magic-constant division idiom, an RGB555 min/max/hue network, one
wall-contaminated dispatch case). Expect a lower rate than the first 9 and say so
plainly; a completed n=20 that lands at 10-15% is a far better artifact than an
inflated partial.

**Gate:** three `python tools/gate3.py --scope <eur|usa|jpn> --clean` runs with
all three SHA1 PASS lines pasted verbatim, plus `check_activation_invariant.py`,
`check_delink_dupes.py`, and `gate3.py --scope tests`. `git restore assets/`
after each clean run. Regenerate any derived artifact your content invalidates —
`docs/dashboard.md`, `docs/state-table.md` and `docs/research/codegen-walls-index.md`
all carry freshness guards now and the suite will tell you.

ONE PR; verify every claim against `git diff --stat` including the arithmetic;
`python tools/work_queue.py done claude-decomper cm-main-band-finish`.

### cm-513-1023-census — the probe that never got fully specified [DONE]

⚠️ Take this only after `cm-main-band-finish`, and only if that item did not open
a band worth draining. If it did, draining is worth more — say so and stop here.

The previous round's lane reached this item and **stopped rather than guess**,
because context compaction had lost the item's methodology and it did not want to
invent a shape that did not match what was asked. That was the right call. Here
is the full specification so it cannot happen again.

**Why the band matters:** above 1024 B, **zero functions have ever matched in
this campaign** — that is the one hard empirical ceiling. 513-1023 B sits between
the tractable region and that dead zone and has never been characterised.

**Deliverable, three parts:**

1. **Census.** Candidate count and bytes for 513-1023 B, derived as
   `<=1023` minus `<=512` using `wall_aware_headroom.scan()`. If you use
   `pool_freshness.py` for the `bl`-filtered figure, sanity-check its scope
   against `scan()` directly — #1534 was held for a silently `main`-only default
   reported as staleness, and #1542 fixed it, but verify rather than trust.
2. **Probe, n=15**, full 2-4-iteration protocol, `attempts` column populated,
   both results ledgered. Fifteen is deliberately small: this decides whether a
   real pilot is justified, it is not the pilot.
3. **Honest statistics.** At n=15 almost nothing will be significant, and
   "suggestive, not significant" is the correct write-up. This campaign has twice
   been saved by a lane declining to over-claim a small sample.

**Do NOT quote the banked "4.2x model/observed disagreement" figure.** It is
round-0810-era and this campaign has just documented, in
`docs/research/band-rate-vintage.md`, that historical band figures describe the
pool at measurement time rather than the band. Re-derive it or drop it; if it no
longer reproduces, that is itself the finding.

**Gate:** as above — three `--clean` region gates with SHA1 PASS lines verbatim,
invariant check, delink dupes, tests. If the round ships zero, say so plainly and
note that `check_activation_invariant.py` correctly refuses a vacuous pass.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-decomper cm-513-1023-census`.

### cm-321-376-probe — the one band left unmeasured, and it is cheap [DONE]

The code frontier is now mapped everywhere except here:

| band | result | status |
|---|---|---|
| <=192 B | drained to 0 | exhausted |
| 193-256 B | 0/60 | CLOSED |
| 257-320 B | **4/20 = 20.0%** | MARGINAL |
| **321-376 B** | **2/17 = 11.8% (sweep-7, 2026-08-17)** | **never re-tested** |
| 513-1023 B | 0/15 | effectively closed |
| >1024 B | zero ever matched | hard ceiling |

That 11.8% is **vintage-stamped** and must not be treated as current.
`docs/research/band-rate-vintage.md` documents why: sweep-7 measured 193-256 B at
27.6% and a disjoint sample of the identical band later returned **0/60**. Every
historical band rate describes the pool at measurement time, and this one has
never been re-derived.

**Scope: n=15 at 321-376 B**, drawn from the unattempted population (brain
measured **176 candidates / 61,396 B** remaining at `>=4 bl`), full
2-4-iteration protocol, `attempts` populated, both results ledgered. This is a
probe to finish the map, not a drain.

**Thresholds, pre-registered:** `>=25%` the band is live and worth a decision;
`<=10%` closed, record it in the catalog with the evidence; `10-25%` marginal,
report it alongside 257-320 B's 20.0% so the two can be weighed together.

**Why it is worth a round even though the prior is poor:** 321-376 B is the only
gap left. Once it is measured, the code frontier is fully characterised and
nobody has to re-open the question — and the campaign stops paying the recurring
cost of "we never actually checked". If it comes back closed, that is a clean
end to the mapping phase.

Do not adjust the sample or thresholds to reach a number. Four rounds running
have been trustworthy because nobody did.

**Gate:** three `python tools/gate3.py --scope <eur|usa|jpn> --clean` runs, all
three SHA1 PASS lines verbatim, plus `check_activation_invariant.py`,
`check_delink_dupes.py`, `gate3.py --scope tests`. If the round ships zero, say so
and note the invariant correctly refuses a vacuous pass. `git restore assets/`
after each clean run. Regenerate any derived artifact your content invalidates.

ONE PR; verify every claim against `git diff --stat` including the arithmetic;
`python tools/work_queue.py done claude-decomper cm-321-376-probe`.

### cm-port-drain-usa — the EUR-ship-triggered USA drain that is now due [DONE]

**Read this scoping section before running anything. There is a standing warning
against re-running this loop, and the reason it does not apply now is specific.**

`q-port-harvest-complete` drained the byte-identical port backlog on 2026-08-05
and its successor recorded: *"The sim=1.0 pool is drained to genuine refusals…
do not re-run the loop."* PR #1459's full re-drain shipped **zero** — all 292
remaining `sim=1.0` rows refused below the HIGH/EXACT confidence floor. That
warning is real and it is why this item exists with a scope rather than as a
free-for-all.

**But the same item also says the backlog regrows on EUR ships, and that
"full drains are now triggered by EUR-ship rounds, not a standing TODO."** EUR
natural-C has gone **14.11% → 17.27%** since that drain — roughly 124 KB of new
EUR sources, each one a potential new port candidate. Brain measured the split
today:

```text
USA sim=1.0 backlog:                       651 rows
  EUR source added AFTER 2026-08-05:       509 rows / 70,792 B   <- NEVER attempted
  EUR source predates it:                  142 rows              <- in #1459's refused set
```

So this is the triggered drain the queue prescribes, not the re-run it forbids.

⚠️ **`byte_sim = 1.0` does NOT mean portable.** They are different gates:
byte-similarity compares the bytes; `port_to_region.py` refuses unless every
symbol resolves at the HIGH/EXACT floor. #1459 is the proof — a whole pool of
byte-identical rows refused on the floor. **Treat 70,792 B as an upper bound,
not a forecast**, and expect refusals to be the common outcome. An honest
"N shipped, M refused with reasons" is the deliverable.

**Scope:**

1. Run `python tools/port_census.py` first and paste the before counts.
2. Run `python tools/port_harvest.py --batch 20` in a loop. The harness
   re-censuses, filters to `sim==1.0` at the HIGH floor, ports, and ROM-gates
   each batch itself — this is mechanical and gated at every step, which is
   why it is safe to run in bulk.
3. **Never force a below-floor candidate.** A refusal for a real reason is the
   expected outcome and must be recorded, not worked around. Do not pass
   `--no-auto-promote` off or reach for a lower `--confidence-floor` to make a
   number move.
4. **Skip the 142 known-refusing rows** rather than re-fighting them; they were
   settled by #1459 and their named residues are tracked separately
   (`q-port-residual-fix`, `q-port-highconf-no-target`).
5. Stop when the new rows are drained or genuinely refuse. **Ending non-zero is
   normal and expected** — the item's own success line is "drained or genuinely
   refuse", not "zero remaining".

**What you are shipping is natural C, not coverage padding.** Brain checked the
composition: of the byte-identical USA backlog, **648 files are natural C
(98,596 B) and only 3 are `asm`-escaped (248 B)**. This moves the real headline.

**Gate:** the harness ROM-gates each batch itself. Finish with
`python tools/gate3.py --scope all` (three SHA1 PASS lines pasted verbatim plus
the pytest tail) + `python tools/check_activation_invariant.py origin/main..HEAD`
+ before/after `port_census.py` counts pasted. `git restore assets/` if a
`--clean` run deletes the heatmap SVGs.

ONE PR; verify every claim against `git diff --stat` before writing the body;
`python tools/work_queue.py done claude-decomper cm-port-drain-usa`.

### q-port-refusal-taxonomy — 365 fresh refusals with reasons, and nobody has read them [DONE]

**Result (this PR):** built `tools/port_refusal_taxonomy.py` (read-only,
build-free), which replicates `port_to_region.py`'s own confidence-floor
resolution over every symbol reference in each candidate — canary-verified
5/5 against the real non-dry-run tool. **Both hoped-for answers were half
right:** the 365 refusals do NOT cluster on a handful of blocking symbols
(264 distinct blockers, largest touches only 10 candidates), but 95.3% DO
cluster on one mechanism — a same-size, no-relocation callee/data reference
the fingerprint matcher can only place at MEDIUM-or-below, which is very
likely intentional conservatism guarding against the wrong-sibling bug
class this project has hit and fixed before (briefs 673/676). Buried inside
that majority: a genuinely concentrated, previously-unscoped, low-risk fix
— **49 candidates (7,692 B) are refused solely by a callee that already
carries an identical, committed name in the target's own `symbols.txt`**
(e.g. `OS_DisableIrq`/`OS_RestoreIrq`), which `resolve_symbol` never checks
before falling back to structural fingerprinting; 38 more (6,156 B) would
be partially helped. Three smaller classes found: a `placeholder-twin`
recurrence (5 sole candidates, same mechanism `q-port-residual-fix` #1462
already fixed once), a NEW comment-parsing false-positive bug (3 sole
candidates, same bug class as `q-invariants-green`'s
`check_match_invariants.py` fix, just never applied to
`parse_symbols_in_source`), and a real `find_region_siblings.load_region()`
coverage gap — it never loads the `itcm` module at all (2 sole candidates).
JPN cross-checked (provisional, mid-drain):
266 distinct blockers, all 264 of USA's present, top-15 identical, and the
exact-name-lookup impact reproduces almost exactly (50/8,120 B). Did not
port anything or recommend a direction, per the item's own instruction.
Full table and every reproducing command:
[`docs/research/campaign-analytics/port-refusal-taxonomy.md`](../research/campaign-analytics/port-refusal-taxonomy.md).

**Original brief text below, preserved for context:**

**This item is BUILD-FREE. Do not compile, do not run `ninja`, do not run
`gate3.py` against a region.** The other lane owns the compiler toolchain for
this entire round and it serialises machine-wide — a single concurrent build
costs that lane its round, which is exactly what happened on 2026-08-27. If you
find yourself needing a ROM build to answer something, that is the finding:
say so and stop.

**What just changed.** PR #1584 drained the USA byte-identical port pool: **283
ported, 365 refused at the confidence floor, 2 needs-symbol skips, 1 prefilter
refusal** — a 43.5% acceptance rate over 651 candidates. That leaves USA at
**368 rows / 60,884 B** of byte-identical-but-unportable backlog, freshly
measured and never analysed. The refusals are not noise: each one carries a named
below-floor symbol, and `port_to_region.py` refuses for a *specific reason* every
time.

**Nobody has ever asked whether those reasons cluster.** If 300 of the 365 refuse
on a handful of recurring unresolved symbols, that is a small, targeted unlock
worth far more than its size suggests — the same fix would apply to the JPN
residue too. If they refuse for 365 unrelated reasons, the pool is genuinely dead
and the campaign can stop eyeing it. **Both answers are valuable and you must not
prefer either.**

**Deliverable:**

1. **Re-derive the refusal set yourself.** Run `port_to_region.py` in
   `--dry-run` over the current USA backlog. ⚠️ **Read the tool's source before
   you trust its dry-run output** — the brain found that `--dry-run` **skips the
   confidence-floor rejection branch entirely** (the `if failed and not
   args.dry_run:` guard), so a naive dry-run reports candidates as passing that
   the real run refuses. Replicate the floor rule (`floor_rank`, HIGH/EXACT)
   yourself over the resolutions rather than reading the tool's headline verdict.
   The brain used exactly this method to predict 44% against an actual 43.5%, so
   it is known to work — reuse it, and state the reproducing command.
2. **Group the refusals by cause**, with counts and bytes: which symbol failed to
   resolve, at what confidence, and how many candidates each distinct blocker
   accounts for. Rank blockers by bytes unlocked if resolved.
3. **Cross-check against JPN.** The JPN pool is being drained this round by the
   other lane, so its residue may not be final — derive what you can from the
   current tree, state the timestamp, and mark anything provisional as
   provisional rather than guessing at the post-drain state.
4. **Say which blockers, if any, are actually fixable** and by what mechanism —
   the existing `q-port-residual-fix` and `q-port-highconf-no-target` items
   scoped adjacent classes; check whether they are the same class before
   proposing anything new.

**Do not port anything and do not recommend a direction.** Your job is to turn
365 opaque refusals into a ranked, costed table. Whether the campaign spends a
lane on the top blocker is cntrl_alt_lenny's call.

⚠️ **Blank is not zero, and an estimate is not a fact.** If a figure cannot be
derived honestly from the tree, leave it blank and say why. PR #1559 set that
precedent and it is the reason these censuses are trusted.

⚠️ **Watch the vintage rule.** Any figure inherited from the `q-port-harvest-*`
or brief-064 era describes a tree that no longer exists — 283 rows moved
yesterday. Re-derive against the current tree; see
`docs/research/band-rate-vintage.md`.

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean + every figure
annotated with its reproducing command. **Build-free — no region gate, and
`gate3.py --scope tests` only if you need it.**

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-decomper q-port-refusal-taxonomy`; then report
QUEUE-EMPTY honestly if you reach it.


### q-fingerprint-promotion-evidence — is the 95.3% MEDIUM wall real, or just unmeasured? [DONE]

**Result (this PR):** built `tools/fingerprint_signal_evidence.py`
(read-only, build-free). Labelled set: 7,774 known-correct resolutions
(from 7,808 already-ROM-gate-verified ports, 32 dropped as unresolved
fingerprint-collisions in this reconstruction — including an independent
rediscovery, with zero prior knowledge, of the exact `func_0209bb60`/
`func_0209bc20` pair brief 673 already proved wrong) + 2 hand-verified
known-wrong historical incidents (briefs 673/675, 4 rows across USA/JPN).
**The judgement was half right.** `call_graph` (18.1% coverage) and
`exact_name` (1.1% coverage) confirm there's no hidden abundance of
untapped fingerprint evidence — but `verified_neighbor` (the existing D2
v2 idea, rebuilt on PROVEN neighbor mappings instead of `find_siblings`'
own unverified guess) covers **98.7% of the hard/ambiguous population at
100% accuracy (2,960/2,960)**, holds at the strictest zero-reloc threshold
(16/16), and correctly predicts the true answer on **all 4 known-wrong
rows** — reproducing by measurement what the briefs did by hand.
`cross_region_agreement` is a clean NULL: it says "agree" on 100% of
BOTH the known-correct (2998/2998) and known-wrong (4/4) sets, so it
carries zero discriminative information (both regions get fooled
identically). Applied to the CURRENT live USA/JPN refusal population,
`verified_neighbor` predicts confidently on ~95.5% of distinct blockers;
9 of those (identical in both regions) disagree with the tool's current
best guess, and one — `Copy32` — is independently confirmed via committed
`symbols.txt` to be a case where `verified_neighbor` is right and the
current fingerprint pick is wrong, which also **corrects**
`q-port-refusal-taxonomy`'s Finding 3 (`Copy32` isn't a same-address
"needs a rename" case; its fingerprint-picked address was a same-size
decoy). 0 errors in 2,964 trials bounds the true error rate at ≤~0.1%
(rule of three) — not proof of zero, and the known-wrong sample (n=2
incidents) is too small to bound false positives with real statistical
confidence on its own; both caveats stated explicitly. No promotion
implemented, no direction recommended, per the item's own instruction.
Full measurement, every reproducing command, and the 7-pair unvalidated
collision list:
[`docs/research/campaign-analytics/fingerprint-signal-evidence.md`](../research/campaign-analytics/fingerprint-signal-evidence.md).

**Original brief text below, preserved for context:**

**BUILD-FREE. Do not compile, do not run `ninja`, do not run `gate3.py` against
a region.** The other lane owns the compiler this round. This is a hard
constraint, not a preference — see round 0827, where two toolchain-bound lanes
cost one of them its entire round.

`q-port-refusal-taxonomy` (#1586) found that **348 of 365 USA refusals (95.3%)**
are blocked by at least one same-size, no-relocation reference that the
fingerprint matcher can only place at MEDIUM or below, and judged this "very
likely intentional conservatism... **not recommended for a fix**". That
judgement is probably right and it was made honestly. **But it was a judgement,
not a measurement**, and it is load-bearing: it is the difference between
"~60 KB per region is permanently dead" and "~60 KB is reachable". Nobody has
tested it.

**The question, stated so it can come back either way:** does any signal exist
that separates a CORRECT sibling resolution from an INCORRECT one, beyond the
size-and-relocation fingerprint already used?

**You now have a large labelled set, which is why this is answerable today and
was not before.** 566 ports shipped across #1584 (283 USA) and #1587 (283 JPN),
every one ROM-gate-verified — those are **known-correct** resolutions. The
known-wrong side is documented: the wrong-sibling class in briefs 673/676, and
the placeholder-twin recurrence `q-port-residual-fix` (#1462) fixed. Build the
labelled set from committed artifacts and say exactly how you constructed it.

**Candidate signals to test — these are suggestions, not a checklist. Add your
own and say which you rejected and why:** position in the call graph
(`relocs.txt` gives real edges — `cm-restock-carve-10` established they are
reloc-driven, not source-state-driven); containing-TU / delink-object identity;
whether immediate neighbours in the address space are already confidently
resolved; symbol-name evidence from the EUR side; access widths at reader sites.

**The deliverable is a measurement, not a fix.** For each signal: how many of
the 566 known-correct resolutions it would have ranked correctly, how many
known-wrong cases it would have caught, and its false-positive rate. **If no
signal separates them, say so plainly — that closes the question permanently
and is a genuinely valuable result.** A clean null here is worth as much as a
positive, and this campaign has published several.

⚠️ **Do not implement a promotion, do not touch `port_to_region.py`, and do not
recommend a direction.** You are costing an option, not exercising it. A tool
that promotes on an unvalidated signal would silently ship wrong code into a
region — the exact class briefs 673/676 exist to prevent.

⚠️ **Blank is not zero and an estimate is not a fact.** State the size of every
population you compute over, and how many rows you excluded. #1559 set that
precedent.

⚠️ **The other lane is changing `resolve_symbol` this round** (adding an
exact-name lookup, `cm-port-exact-name-unlock`). Your labelled set comes from
already-committed ports so it is stable, but any refusal-set snapshot you take
will move under you — timestamp it and mark it provisional.

**SWARM GUIDANCE — this item is a good fit and here is the safe shape.** The
work partitions naturally: one worker per candidate signal, each measuring
against the same labelled set, then a synthesis pass that compares them on
common metrics. Two hard rules: **(1) sub-agents must be READ-ONLY.** They share
this worktree — they do not get isolated copies — so parallel writers corrupt
each other. You do the writing, the committing, and every git operation
yourself. **(2) No sub-agent runs a build, `ninja`, or a region gate**, for the
same machine-wide reason above. If you would rather work it single-threaded,
that is entirely fine — the measurement is what matters, not the parallelism.

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean + every figure
annotated with its reproducing command. Build-free; `gate3.py --scope tests`
only if you want the invariants.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-decomper q-fingerprint-promotion-evidence`;
then report QUEUE-EMPTY honestly if you reach it.

### q-collision-pair-audit — seven unvalidated pairs sitting inside already-shipped ports [DONE]

**Result (this PR):** audited all 7 previously-unchecked collision pairs by
directly reading the committed EUR/USA/JPN source, `symbols.txt`,
`relocs.txt`, and `delinks.txt` — no fingerprint re-derivation. Canary
first: independently reproduced brief 673's verdict on the known pair
(`func_0209bb60`/`func_0209bc20`) by reading the actual files, confirming
the method before touching the 7 unknowns. **All 7 are CORRECT** — the
committed, shipped source at every disputed address structurally matches
its true EUR twin; the 1-in-8 rate from the known-wrong case does not
generalize. 2 of the 7 (`0x02032fac`/`0x02032fe4` and `0x02033000`/
`0x0203301c`) turned out to be facets of the same underlying 8-function
IRQ-bracketed chain, so this covers 6 independent structural situations.
For 5 of the 7 (plus the canary), a real discriminator survives in the
full (non-stripped) relocation data — a self+size self-call, a
callee-size mismatch, or a literal data pointer, each resolvable through a
uniform module-wide address delta — that the tool's `reloc_sig` throws
away by design. For 2 of the 7 (the IRQ chain), no relocation-based
discriminator can ever exist; they still shipped correct by raw
byte-content match, not resolvable symbolic evidence. **No new WRONG pair
found, so nothing is scoped for a fix.** One bonus finding along the way,
independently spot-checked against `relocs.txt` and the committed source
directly: `docs/research/brief-435-region-port-wave7.md` has two symbol
names swapped in its own prose (the code was never actually wrong; only
the brief's explanation is backwards) — flagged, not fixed, out of this
item's scope. Full per-pair evidence, the synthesis of the shared
mechanism, and a critic pass naming the weakest-evidence pair:
[`docs/research/campaign-analytics/collision-pair-audit.md`](../research/campaign-analytics/collision-pair-audit.md).

**Original brief text below, preserved for context:**

**BUILD-FREE. Do not compile, do not run `ninja`, do not run `gate3.py` against
a region.** The other lane owns the compiler this round. Round 0827 is what
ignoring this costs.

While building its labelled set, `q-fingerprint-promotion-evidence` (#1589)
dropped **32 rows as unresolved fingerprint collisions** — **8 distinct EUR
pairs, 16 rows, recurring identically in both regions**. One of those eight is
`func_0209bb60`/`func_0209bc20`, **the exact pair brief 673 already proved
wrong** — rediscovered independently, with no prior knowledge of that brief.

**The other seven have never been checked.** They are listed in
`docs/research/campaign-analytics/fingerprint-signal-evidence.md`; start there.

**Why this matters more than its size suggests.** These collisions sit inside
**already-committed, already-gated ports**. That one of eight turned out to be a
known-wrong pair is not reassuring — it is the base rate you have. The obvious
objection is "the ROM gate passed, so the code must be right", and that objection
is **half true and worth stating precisely in your writeup**: a byte-identical
ROM proves the *built bytes* are correct, which is not the same as proving every
*symbol attribution* in the source is correct. A `.c` that calls the wrong name
for the right address, or picks the wrong member of an interchangeable pair,
gates green and is still wrong in the source. Work out which of those two things
each pair is.

**Deliverable, per pair:**

1. What the two candidates actually are, from `symbols.txt`, `relocs.txt` and
   the delink objects — sizes, addresses, relocation profiles, readers.
2. Whether the shipped port resolved to the right one, and **the evidence**.
   Where a committed name exists in the target region, that is authoritative —
   that is exactly how #1589 settled `Copy32` and how #1590's `EXACT_NAME`
   lookup works.
3. If a pair is genuinely **interchangeable** — same size, same relocations, no
   observable difference — say so. That is a legitimate finding and means the
   collision is harmless, not that it is unchecked.
4. A verdict per pair: **CORRECT / WRONG / INTERCHANGEABLE / UNDECIDABLE**, with
   the reasoning. `UNDECIDABLE` is an acceptable answer when the evidence does
   not settle it — do not force a verdict to avoid a blank.

**If you find a WRONG one, that is the headline** — report the pair, the shipped
resolution, the correct one, and which committed ports are affected. **Do not fix
it in this PR**; a source correction inside shipped ports needs its own gated
round, and the other lane owns the toolchain. Scope it for the brain instead.

⚠️ **Do not re-derive #1589's measurement or re-litigate `verified_neighbor`.**
The other lane is testing that against the ROM gate this round. Your job is the
seven pairs.

⚠️ **Blank is not zero.** State how many pairs you resolved, how many you could
not, and why. PR #1559 set the precedent.

**SUB-AGENTS ARE PERMITTED AND ENCOURAGED, WITH TWO HARD RULES.** This
partitions cleanly — one worker per pair, then a synthesis pass that looks for a
shared mechanism across whatever the verdicts turn out to be. **Rule one:
sub-agents must be READ-ONLY.** They share this worktree, not isolated copies,
so parallel writers corrupt each other; you do all writing, committing and git
operations. **Rule two: no sub-agent runs a build, `ninja`, or a region gate.**
Single-threaded is fine too — the verdicts matter, not the parallelism.

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean + every figure
annotated with its reproducing command. Build-free.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-decomper q-collision-pair-audit`; then report
QUEUE-EMPTY honestly if you reach it.

### q-derived-artifact-selfreference — the staleness that has cost three rounds running [DONE]

**Result (this PR):** root cause confirmed precisely — `docs/dashboard.md`'s
trend table cites the SHA of the most recent commit touching
`docs/state-table.md`, which is normally the PR's own commit; a squash-merge
gives that same logical change a brand-new SHA nothing on the branch could
predict, so the very next `--check` sees a real, derived mismatch on exactly
that one cell. **Chose option 3** (tolerate a not-yet-final trailing-row
SHA), not option 1 (drop the column — it's the only way to `git show
<sha>:docs/state-table.md` a historical snapshot, genuinely useful, not
"load-bearing" for any code but valuable for a reader) or option 2 (defer
SHA resolution to post-merge — doesn't avoid a follow-up step, which is the
exact pain being removed). Implemented as `_dashboard_is_current()`: the
comparison now tolerates AT MOST one differing line between committed and
freshly-rendered text, and only if that line is the trend table's LAST row
differing SOLELY in its SHA column — verified to be the trailing row (not a
disguised middle one) by re-matching against the fresh render's own row
list. Every other row's SHA, and the trailing row's own date/bytes/pct/delta,
are still compared byte-for-byte; a real staleness (a moved number, a
missing section, ANY non-trailing SHA, or a content change alongside a SHA
drift) still fails immediately, unchanged from before. **What the check
still guarantees:** every number on the page is proven current against a
fresh re-derivation; every historical trend-row SHA (already-merged, never
rewritten again) is proven current; the newest row's byte/pct/date is proven
current. **What it no longer guarantees:** that the newest row's SHA display
exactly matches — because that specific fact is provably unknowable at
generation time when the enclosing PR's own final SHA depends on a merge
operation outside the PR. Demonstrated empirically, not just asserted: with
the fix temporarily reverted, a squash-merge-simulated trailing-row SHA
rewrite makes `--check` FAIL (exit 1) on the real committed
`docs/dashboard.md`; with the fix restored, the identical mutation PASSES
(exit 0) — both runs pasted verbatim in the PR body. Added a real regression
test (`TestCheckToleratesSquashMergedTrailingSha`) that performs this same
mutation against the live committed file via subprocess, so this doesn't
regress silently. `generate_state_table.py` has no analogous self-reference
(it doesn't cite its own commit history) and needed no change.

**BUILD-FREE.** Take this only after `q-collision-pair-audit`.

`docs/dashboard.md`'s trend table records the **commit SHA** of every commit
that touches `docs/state-table.md`. Squash-merging any such PR rewrites that
SHA, so the dashboard is stale the instant it lands — **the freshness test is
unsatisfiable for the PR that introduces the change.** Three consecutive rounds
have paid for this:

- round 0827: brain regenerated it in the follow-up doc PR (`56ba06693` ->
  `97bdb5158`, a one-line hash).
- round 0828b: the port lane burned **two full gate runs** discovering it had to
  regenerate `state-table.md` first and `dashboard.md` second, each after the
  commit it describes had landed.
- round 0828b integration: it produced a genuine **merge conflict** between the
  two lanes that the brain resolved by hand.

**Fix the mechanism, not the symptom.** Options worth weighing — pick one and
justify it: drop the SHA column (is it load-bearing for anything?); resolve the
SHA post-merge rather than recording it at generation time; or make the
freshness check tolerate a trailing row whose SHA is not yet final. **Whichever
you choose, the acceptance criterion is the same: a PR that touches
`docs/state-table.md` must be able to land without its own dashboard going
stale.** Demonstrate that, do not just assert it.

⚠️ **Do not weaken the freshness test into uselessness.** It exists because a
stale dashboard silently misreports campaign state. A fix that makes the check
pass by checking less is worse than the current cost. Say explicitly what the
test still guarantees after your change.

**Gate:** pytest + unittest green (paste both tails) + `ruff check` clean, plus a
demonstration that the failure mode is actually gone — construct the situation
that breaks it today and show it passing. Build-free.

ONE PR; verify claims against `git diff --stat`; `python tools/work_queue.py done
claude-decomper q-derived-artifact-selfreference`.

### q-eur-next-frontier — what moves EUR, now that the ports are about to run out [DONE]

**Result (this PR):** canary reproduced 257-320 B's 263/75,980 B exactly,
after a real near-miss — an unfiltered first pass returned 411/118,200 and
would have wrongly triggered a STOP until re-checking `docs/dashboard.md`'s
own dispatch-filter caveat (`.text` size alone isn't the real criterion).
**Headline finding: "stuck at 17.27%" is a `.text`-only claim** —
`progress.py`'s natural-C metric never scans `.data`/`.bss`/`.rodata`, so
only the CODE avenue can move that specific number; the 407,506 B data
pool moves a separate, non-combined metric entirely. **Code:** re-derived
all 7 bands fresh (`tools/eur_frontier_census.py`, new, single-scan). The
small bands (193-256 B: 204 cand/46,080 B; 321-376 B: 161/56,180) are NOT
exhausted — "closed at 0/60"/"1/15" described a round's attempt count, not
the population; `attempts.tsv` cross-checked directly (267/70 logged
attempts respectively) confirms these are fresh, never-tried rows behind
the already-failed sample. **The largest finding: 377-512/513-1023/≥1024 B
hold 1,211,260 B dispatch-ready — 87% of the whole code pool — against
only 83 total logged attempts combined**, one of the three bands (377-512)
never even appearing in this project's prior recaps. Ship rate left
blank for all three — 83 attempts against 1,186 candidates cannot be
honestly extrapolated. **Data:** reachable pool unchanged at 407,506 B
since the Windows-bug fix landed; built the full 15-round `cm-restock-carve`
yield table (2,225 symbols/82,652 B, mean 5,510 B/round, median 1,864,
80% of bytes from 4 outlier rounds) from primary sources via a research
agent, independently spot-checked. **`.bss`:** reconciled two genuinely
different, non-contradictory measurements — 85.2% project-wide raw share
(4,776,528 B denominator) vs. 2.56% of the reachable worklist (407,506 B
denominator) — `.bss` is huge in raw bytes but nearly invisible to the
tool this campaign actually uses to find carve targets. **Overlay/ITCM:**
corrected the item's own premise — ITCM has zero data symbols (code-only)
and DTCM has 5 total; the hidden pool was 100% overlay data (217,298 B
remaining, only 9.2% of the post-fix-visible portion carved in the one
round since). Composition reconfirmed dead (0/575). Named the weakest-
provenance figure (the 1.2 MB unswept-bands claim, single-classifier-
sourced) rather than presenting uniform confidence. No direction
recommended; blank left wherever a rate could not be honestly derived.
Full costed table, every figure dated and reproducible:
[`docs/research/campaign-analytics/eur-next-frontier.md`](../research/campaign-analytics/eur-next-frontier.md).

**BUILD-FREE. Do not compile, do not run `ninja`, do not run `gate3.py` against
a region.** The other lane owns the compiler this round.

**Why now, and why this is not premature.** EUR has sat at **17.27%** for five
consecutive rounds. Everything shipped in that time is *derivative*: USA and JPN
ports of EUR content that already existed. Those regions have gone 11.82% ->
**14.15%** and **14.07%**, and the remaining byte-identical pool is **524 rows**
which the other lane is draining right now. **When that pool empties, all three
regions stall unless EUR itself moves.** Nobody has asked what moves EUR since
the code frontier was mapped, and the answer should exist *before* the ports run
out, not after.

**This is a census and a costing. Do not decompile anything and do not carve
anything.**

**What has changed since the last time anyone looked, all of which invalidates
the old numbers:**

- **The Windows `load_module_sections` bug** (PR #1580) had hidden every overlay
  and ITCM/DTCM data symbol since `cm-restock-carve-10`. The reachable data pool
  went **187,760 B -> 407,506 B** once fixed. Any data figure predating that fix
  describes half the tree.
- **The code frontier was mapped and mostly closed**: <=192 B drained; 193-256 B
  closed at 0/60; **257-320 B MARGINAL at 4/20 = 20.0%** with 263 candidates /
  75,980 B behind it; 321-376 B closed at 1/15; 513-1023 B 0/15; >1024 B never
  matched.
- **Composition into the data pool is DEAD** (0/575, `cm-restock-carve-12`).

**Deliverable — a costed table of every remaining EUR avenue, with bytes:**

1. **Code.** What is actually left, per band, at current pool state — re-derive,
   do not inherit. Is the 257-320 B pocket still 20%, and how many candidates
   remain behind it now?
2. **Data.** The 407,506 B reachable pool is the largest single number on the
   board and the carve series has been shipping it in tranches of a few hundred
   to a few thousand bytes. What is the actual per-round yield, what shapes
   remain unclassified, and what would raise the rate?
3. **Anything else.** `.bss` was measured at 85% of data bytes and 0% C-owned
   (`cm-bss-carve-scope`). Overlay/ITCM regions the Windows bug had hidden.
   Anything the earlier censuses could not see.
4. **A bottom line per avenue:** bytes reachable, observed or best-evidenced
   ship rate, and what the blocker is.

⚠️ **Watch the vintage rule — it is the whole point of this item.** Every
historical band rate describes the pool *at measurement time*.
`docs/research/band-rate-vintage.md` documents why: sweep-7 measured 193-256 B at
27.6% and a disjoint sample of the identical band later returned **0/60**.
**Re-derive against the current tree and stamp every figure with its date and
reproducing command.** A figure you inherited without re-deriving is worse than a
blank.

⚠️ **Blank is not zero, and do not recommend a direction.** If an avenue cannot
be costed honestly, leave it blank and say why. Your job is to make the choice
*informed*, not to make it. cntrl_alt_lenny decides where the campaign goes next.

**CANARY.** Before costing anything else, re-derive **one** figure that already
has a published value — the 257-320 B band's remaining candidate count — and
compare it to the 263 recorded above. If your number differs materially, STOP and
report the discrepancy before continuing, because it would mean the population
has shifted under every other figure in the campaign's records too. If it
matches, proceed.

**SUB-AGENTS ARE PERMITTED AND ENCOURAGED, WITH TWO HARD RULES.** This partitions
cleanly — one worker per avenue (code bands, data shapes, `.bss`, overlay/ITCM),
then a synthesis pass that puts them on common units, then a critic pass asking
which figure has the weakest provenance. **Rule one: sub-agents must be
READ-ONLY** — they share this worktree, not isolated copies, so parallel writers
corrupt each other; you do all writing, committing and git operations. **Rule
two: no sub-agent runs a build, `ninja`, or a region gate.** Single-threaded is
fine too.

⚠️ **Verify your workers rather than relaying them.** `q-collision-pair-audit`
(PR #1592) spot-checked a sub-agent's brief-435 finding directly against
`relocs.txt` and the committed source instead of trusting it — and brain
confirmed that finding independently. Hold the same standard.

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean + every figure
annotated with its reproducing command **and its derivation date**. Build-free.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-decomper q-eur-next-frontier`; then report
QUEUE-EMPTY honestly if you reach it.

### q-large-band-reachability — can the toolchain even feed a large function? [DONE]

**Result (this PR):** canary determined the one `>=1024 B` ledger row's
provenance (`func_ov002_02246a50`, brief-650) was manual disassembly
reading, not `m2c_feed.py` — it provides no direct evidence about
`find_object()`. **Coverage census** (new `tools/m2c_gap_coverage.py`,
reads already-built `build/eur/delinks/` objects, verified 8/8 against
the real `find_object()`): gap-object coverage is **45-68% per band**,
and **rises with size** (48.4% weighted across the small/mid bands vs.
62.1% across the three large bands) — the opposite of the hypothesis's
predicted direction. **The size-dependent hypothesis is dead.** A real,
size-UNIFORM ~43-55% coverage gap exists in every band regardless —
774/774 project-wide "not in gap object" candidates (450/450 in the
three large bands) resolve to a real per-source object at a single
predictable path (`build/<region>/delinks/src/<module>/<name>.o`),
zero misses, scoping the fix as a deterministic path check rather than
a glob-widening or pipeline redesign — **not implemented**, per the
item's own prohibition. **Ledger cross-check:** of the 83 large-band
attempts, 66 (79.5%) directly confirmed by commit subject and 17
(20.5%) inferred by identical PR-series membership — **zero** used
`find_object()`/gap objects; every checked attempt used the campaign's
standard manual/agent disassembly-reading workflow instead, so the
83-attempt count reflects a methodology choice, not a tooling wall.
Caveat: `m2c_feed.py` is `ACTIVE-CAMPAIGN` elsewhere (briefs 604-619,
the untracked `cmatch_loop.py`/retriever pipeline) — this finding is
narrow to `attempts.tsv`'s own rows, not a claim the tool is unused
project-wide. Regression discipline: a real `re.MULTILINE`-omission
bug in the coverage tool itself silently zeroed every band's count
during development; caught, fixed, and demonstrated fail→pass via a
reverted-then-restored test run. Full costed doc, every figure dated
and reproducible:
[`docs/research/campaign-analytics/large-band-reachability.md`](../research/campaign-analytics/large-band-reachability.md).

**BUILD-FREE. Do not compile, do not run `ninja`, do not run `gate3.py` against
a region.** The other lane owns the compiler this round.

`q-eur-next-frontier` (PR #1596) established that the three largest bands hold
**1,211,260 B — 87% of the code pool — against 83 logged attempts**, and that
`>=1024 B` has been attempted **once** in the entire ledger. The obvious reading
is that nobody has tried. **There is a second possible reading nobody has
tested: that the tooling cannot produce candidates there at all.**

**The specific suspicion, brain-verified as far as reading the source goes.**
`tools/m2c_feed.py`'s `find_object()` (around line 363) resolves a function's
defining object by globbing **only** `_dsd_gap@*.o`:

```python
primary = sorted(delinks.glob(f"_dsd_gap@{module}_*.o"))
rest = [Path(p) for p in sorted(delinks.glob("_dsd_gap@*.o")) if p not in primary]
```

and raises when a function is not found in one of those. The project also builds
**per-source delink objects** — on the order of 10,000 of them — which that glob
never sees. If large functions disproportionately live in per-source objects
rather than gap objects, then **the feed is structurally blind to them** and the
83-attempt count is a tooling artefact rather than a judgement about difficulty.

**That is a hypothesis, not a finding. Test it, and be willing to kill it.**

**Deliverable:**

1. **Per band, what fraction of candidates can `m2c_feed.py` actually resolve?**
   Do not run the compiler — determine reachability from the object inventory
   and `find_object`'s own rule. Report coverage per band, with counts and
   bytes.
2. **Is the pattern size-dependent?** The hypothesis only bites if large
   functions are *more* likely to sit in per-source objects. If coverage is flat
   across bands, the hypothesis is **dead** and the 83 attempts really do just
   mean nobody tried — **say so plainly; that is an equally useful answer.**
3. **If the feed is blind to a material share**, scope what closing it would
   take — is it a glob widening, or does the per-source object layout break an
   assumption further down the pipeline? Do not implement it.
4. **Cross-check against the ledger.** Of the 83 logged attempts in those three
   bands, how many came from gap objects? If all 83 did, that is corroboration.

⚠️ **Do not fix `m2c_feed.py` in this PR.** It is on the toolchain lane's
critical path this round and a change there could invalidate their probe
mid-flight. Scope it for the brain instead.

⚠️ **Blank is not zero, and do not recommend a direction.** State every
population size and every exclusion. PR #1596 set the standard by leaving three
ship rates blank rather than extrapolating from 83 attempts — hold that line.

**CANARY.** Before surveying all seven bands, take the **one** `>=1024 B`
attempt that exists in `attempts.tsv` and determine how its candidate was
produced. That single row is the only direct evidence in the campaign about
whether the large-band path works at all. If you cannot determine its
provenance, STOP and report that — it would mean the ledger cannot answer
questions about its own rows, which is a finding in itself.

**SUB-AGENTS ARE PERMITTED AND ENCOURAGED, WITH TWO HARD RULES.** One worker per
band for the coverage survey, then a synthesis pass on common units, then a
critic pass asking whether the coverage metric itself is measuring the right
thing. **Rule one: sub-agents must be READ-ONLY** — they share this worktree,
not isolated copies. You do all writing, committing and git operations.
**Rule two: no sub-agent runs a build, `ninja`, or a region gate.**
Single-threaded is fine too. **Verify your workers rather than relaying them** —
you set that standard yourself with the brief-435 spot-check in PR #1592.

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean + every figure
annotated with its reproducing command and derivation date. Build-free.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-decomper q-large-band-reachability`; then report
QUEUE-EMPTY honestly if you reach it.

### q-find-object-persource — close the gap you scoped, and date the figure that moved [DONE]

**Result (this PR):** canary reproduced the brain's observation directly —
same code, two build trees, two answers. My tree (2,083 gap objects / 2,881
distinct functions) still shows 45-68% coverage, matching PR #1599 almost
exactly; the brain's tree (754 gap objects / 55 distinct functions) explains
its ~0% independently, confirming build-state dependence rather than a
regression. **Task one:** extended `find_object()` in `tools/m2c_feed.py`
with a per-source fallback — when the gap-object glob misses, it now checks
the exact predictable path PR #1599 scoped
(`build/<region>/delinks/src/<module>/<name>.o`), disasm-verifying the
header there exactly as it already did for gap objects (existence alone is
not proof of content), so a stale object can never be silently returned.
Gap objects are still checked first and win when a function is in both —
existing behaviour is unchanged everywhere it already worked. `--obj` and
the `.s`/`--m2c` output format are untouched; `feed()` only reaches
`find_object()` when `--obj` is omitted. 6 new tests in
`tests/test_m2c_feed.py::TestFindObject` (+6 pure-helper tests in
`TestPersourceObjectPath`) — the two fallback-exercising tests were
reverted and confirmed to fail (`FeedError` instead of resolving) before
being restored. **Task two:** `tools/m2c_gap_coverage.py` now prints a
`build state:` line (and a JSON `build_state` object) reporting the exact
gap-object/distinct-function counts behind every coverage run — 4 new
tests in `TestBuildState`, same revert-verify discipline. The reachability
doc gained an explicit build-state-dependence section: the build state and
date the 45-68% table was derived from, a note that it must be re-derived
rather than cited, and an update marking Deliverable 3's scoped fix as now
shipped. No coverage number restated as a project constant anywhere.
Incidental: `docs/dashboard.md` was stale on `origin/main` independent of
this change (a trend-table row from round 0831's PR #1601 was never
regenerated) — regenerated as part of reaching a green gate, one row added,
nothing else touched. Full update:
[`docs/research/campaign-analytics/large-band-reachability.md`](../research/campaign-analytics/large-band-reachability.md).

**BUILD-FREE. Do not compile, do not run `ninja`, do not run `gate3.py` against
a region.** The other lane owns the compiler this round.

`q-large-band-reachability` (PR #1599) killed the size-dependence hypothesis
cleanly — coverage **rises** with size (48.4% small/mid vs 62.1% large), and the
ledger cross-check settled it: **zero of the 83 large-band attempts used gap
objects at all**, so the low attempt count is a methodology choice, not a
tooling wall. That was the right answer and it is now closed.

**But the gap is real and it costs every round.** PR #1600 hit
`find_object()`'s glob-blindness on **all 20** of its candidates. The `--obj`
override bypassed it every time, so it is a **discoverability tax, not a
blocker** — but it is a tax every future band round pays.

**PR #1599 already scoped the fix precisely, which is why this is a small
item:** all **774/774** project-wide "not in gap object" candidates — including
**450/450** in the three large bands — resolve to a real per-source object at a
**single predictable path**, zero misses. So this is a **deterministic path
check**, not a glob widening.

**Task one: implement it.** Extend `find_object()` to fall back to that
per-source path when the gap glob misses. Keep the gap glob first so existing
behaviour is unchanged where it already works. **Each change needs a test you
have seen fail before it passes.** Do not change `m2c_feed.py`'s output format
or its `--obj` override — both are in active use.

⚠️ **`m2c_feed.py` is not dead code.** PR #1599 established it is
`ACTIVE-CAMPAIGN` elsewhere (briefs 604-619, the `cmatch_loop.py` retriever
pipeline). A regression here breaks work outside this lane, so hold the bar
accordingly.

**Task two: date the coverage figure, because the brain could not reproduce
it.** Running `tools/m2c_gap_coverage.py` on the integration tree returned
**~0.0% coverage in every band**, against your reported 45-68%. That is not an
error in your work — the brain's `build/eur/delinks/` held 754 gap objects
containing only **55 distinct functions between them**, so the gap objects there
were essentially empty. **The consequence is that the coverage percentage is a
property of whichever build tree it is run against, not of the project.**

Your conclusion is unaffected — it rests on the ledger cross-check and the
canary, both build-independent — but the number needs the caveat.
**Add to `docs/research/campaign-analytics/`'s reachability doc: the build state
the figure was derived from, the date, and an explicit note that the figure is
build-state-dependent and must be re-derived rather than cited.** If you can
cheaply make the tool *report* the build state it measured (object count,
distinct-function count), do that too — it turns a silent dependency into a
visible one.

⚠️ **Do not restate the coverage number as a project constant anywhere**, and do
not delete it — it is real for the tree it was measured on. Label it.

**CANARY.** Before implementing, reproduce the brain's observation: run
`m2c_gap_coverage.py` on your own tree and report both the coverage figures AND
the gap-object/distinct-function counts behind them. If your tree still shows
45-68%, that confirms build-state dependence directly (two trees, two answers,
same code). If your tree now also shows ~0%, say so — that would mean something
changed in the shared build and is worth knowing before you touch anything.

**SUB-AGENTS PERMITTED, TWO HARD RULES.** READ-ONLY only — they share this
worktree, so you do all writing, committing and git operations. No sub-agent
runs a build, `ninja`, or a region gate. Single-threaded is fine.

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean. Build-free.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-decomper q-find-object-persource`; then report
QUEUE-EMPTY honestly if you reach it.

### q-wall-overblock-audit — are the walls blocking candidates they should not? [DONE]

**Result (this PR):** the headline finding is that nobody can answer
Deliverable 1's literal question, and now we know precisely why:
across the whole 1,822-row `attempts.tsv`, **zero** rows are
`result=not-attempted` tagged to any formal P-NN wall — every P-NN
row is an individually-drafted-then-parked candidate, not an
on-sight screening. PR #1603's 6 screened P-20 candidates left
**zero** ledger trace (confirmed: exactly 17 rows cite
`cm-257-320-drain`, matching 3 shipped + 14 parked). **Canary (P-20):**
55 confirmed members (a 56th genuinely confirmed but misplaced after
an unrelated sub-heading), 6 independently-convergent falsification
rounds 2026-07-27 to 2026-08-22 — the best-evidenced wall in the
catalog, and a direct signature re-scan of the current 1,777-candidate
pool found **zero** further size-appropriate matches. **Evidence
strength (45 live walls, 6 parallel read-only workers):** P-20 is the
**only** wall with genuinely independent 3+-round confirmation; every
other wall tops out at 2 rounds, several thinner than their member
counts suggest (P-11: 16 members/5 rounds but accretive not
independent; P-28: 16 members/1 round, self-admitted possible
grab-bag). **Membership-broader-than-evidence, concrete and
address-level:** a `generate_walls_index.py` heading-boundary bug
inflates apparent evidence for at least 2 walls (P-20 shows 30 vs
real 55; P-49 shows 9 vs real 1, from ~1,700 unrelated lines bleeding
in); 8 walls have catalog-documented stale members still listed as
blocking (P-11 worst: **10 of 16 (62.5%) already shipped** per the
project's own re-audit); P-50 is under-counted the opposite way (a
later round found 17 pairs/34 symbols vs. the catalog's 4, never
folded back). **Bottom line:** the literal unattempted-candidate
figure is blank (ledger-blind, full pool re-match out of scope); the
answerable proxy is 7,924 B already-parked behind THIN-verdict walls,
worth a re-test. No wall re-classified. Second task: extended
PR #1593's dashboard tolerance to a clean trailing-row addition (the
form round 0831's own PR triggered), demonstrated fail-then-pass on
both the pure logic and a real subprocess mutation of the committed
file, with a companion negative test proving two simultaneous
additions still fail. Full findings, every figure dated and
reproducible:
[`docs/research/campaign-analytics/wall-overblock-audit.md`](../research/campaign-analytics/wall-overblock-audit.md).

**BUILD-FREE. Do not compile, do not run `ninja`, do not run `gate3.py` against
a region.** The other lane owns the compiler this round.

**Why this matters now.** `cm-257-320-drain` (PR #1603) screened **6 of 23**
candidates out **on sight** as confirmed P-20 wall members and excluded them
from its denominator — 3/17 = 17.6% attempted-rate versus 3/23 = 13.0%
pool-rate. That exclusion was defensible and clearly disclosed. But it means
**wall membership is now directly gating which candidates get attempted at all**,
in the only band the campaign still has above its 10% closed line.

**If a wall is over-applied, candidates are being written off unattempted, and
nobody would notice** — a screened-out candidate produces no attempt row, so it
is invisible to every ship-rate the campaign computes. That is the failure mode
to test.

⚠️ **This is not a request to weaken the walls.** They encode real, repeatedly
falsified failures — P-20 alone has 11+ independently falsified prior attempts.
The default expectation is that they are correct. **A clean "all walls are
correctly scoped" is a perfectly good result** and would let future rounds screen
with confidence instead of suspicion.

**Deliverable:**

1. **Per P-NN wall: how many currently-unattempted candidates does it block?**
   Counts and bytes, per band. Rank by blocked bytes. Nobody has this number.
2. **Evidence strength per wall.** How many independent falsified attempts back
   each one, and from which rounds? A wall with 11 falsifications is a different
   object from one asserted once and never retested. Say which are which.
3. **Flag any wall whose membership test is broader than its evidence.** The
   known precedent is real: `wall_aware_headroom.py` has a documented
   classification gap where an already-diagnosed permanent wall surfaced as an
   unassessed candidate — the same machinery can err in the other direction.
   **Do not re-classify anything; report the mismatch and its size.**
4. **A bottom line:** how many unattempted candidates, and how many bytes, sit
   behind walls whose evidence is thin enough to be worth one re-test round.

⚠️ **Watch the vintage rule.** A wall established against a specific pool at a
specific date describes that pool. Re-derive membership counts against the
current tree and stamp every figure with its date and reproducing command.

⚠️ **Blank is not zero, and do not recommend a direction.** If a wall's evidence
cannot be reconstructed from committed sources, say so — an unreconstructable
wall is itself a finding.

**SECOND, SMALLER TASK.** PR #1593's dashboard tolerance covers a **rewritten
SHA on the trailing trend row**, but not a **new row appearing** — and the brain
confirmed `docs/dashboard.md` was stale on `origin/main` this round with
`stale (line count differs)`, caused by the round-0831 brain PR adding a trend
row. Same self-reference, second form. Extend the tolerance to cover a
trailing-row *addition* whose values are otherwise consistent with a fresh
render, **or** state clearly why that cannot be done safely. The existing
constraint stands: **do not weaken the freshness check into uselessness** — say
what it still guarantees, and demonstrate the fix by constructing the failure
and showing it pass.

**CANARY.** Before the full survey, take **P-20** specifically — the wall that
did the screening in PR #1603 — and reconstruct its evidence: how many
falsified attempts, from which rounds, and how many unattempted candidates it
currently blocks. If you cannot reconstruct P-20's evidence from committed
sources, STOP and report that, because it is the best-evidenced wall in the
catalog and every weaker one would then be unreconstructable too.

**SUB-AGENTS PERMITTED, TWO HARD RULES.** One worker per wall class, then a
synthesis pass on common units, then a critic pass asking which wall's evidence
is weakest. **READ-ONLY only** — shared worktree; you do all writing, committing
and git operations. **No sub-agent runs a build, `ninja`, or a region gate.**
Verify your workers rather than relaying them.

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean + every figure
annotated with its reproducing command and date. Build-free.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-decomper q-wall-overblock-audit`; then report
QUEUE-EMPTY honestly if you reach it.

### q-wall-catalog-repair — fix the two defects your own audit found [DONE]

**BUILD-FREE. Do not compile, do not run `ninja`, do not run `gate3.py` against
a region.** The other lane owns the compiler this round.

`q-wall-overblock-audit` (PR #1605) found two concrete defects and correctly did
not act on either. Both are now worth fixing, and both are build-free. **This
item implements what that audit scoped — it does not re-open the audit.**

**Defect 1 — `generate_walls_index.py`'s heading-boundary regex.** It only
recognises an exact `### P-N.` / `### C-N.` heading, so any other heading in
between silently bleeds its own bracket into the prior wall's count. Brain
confirmed the symptom directly in `docs/research/codegen-walls-index.md`:

```text
| P-20 | LIVE | 30  | ...   (audit's re-count: 55)
| P-49 | LIVE |  9  | ...   (audit's re-count: 1, from ~1,700 unrelated lines bleeding in)
```

**Fix the boundary detection and regenerate the index.** Add a test that fails
on the current regex and passes after — construct the exact heading arrangement
that causes the bleed. **Then diff the whole regenerated index against the
committed one and report every wall whose count changes**, not just the two
already known. That diff is the real deliverable: nobody knows how many other
walls are misreported.

**Defect 2 — stale members still counted as blocking.** Your audit found **8
walls** carrying members the project's own re-audits have since shipped. The
worst is **P-11: 10 of 16 (62.5%) already shipped**, never looped back. P-50 is
wrong the other way — a later round found 17 pairs / 34 symbols against the
catalog's documented 4.

**Reconcile all 8 against committed evidence** — for each stale member, cite
where it shipped. Update the catalog entries to reflect reality. **Do not
retire a wall** because its members shipped: a wall with 6 of 16 members still
blocking is still a wall, just a smaller one. Say what each corrected count is
and what it was.

⚠️ **Do not weaken or retire any wall on your own judgement.** P-20 is the only
wall with genuinely independent 3+-round confirmation; every other tops out at
2, and several are thinner than their member counts suggest (P-11 accretive not
independent; P-28 a self-admitted possible grab-bag). **That thinness is a
finding you already reported — it is not licence to act.** Correcting a count
against committed evidence is bookkeeping; retiring a wall is a research
decision and belongs to a future round with cntrl_alt_lenny's call.

⚠️ **The other lane is now writing `not-attempted` ledger rows tagged to the
wall they screened on**, closing the blind spot you found. Their rows will land
while you work — **do not treat a changing `attempts.tsv` as drift**, and
timestamp any count you derive from it.

**CANARY.** Before touching the generator, reproduce the P-49 bleed and state
exactly which heading arrangement causes it, with the line numbers. If you
cannot reproduce a bleed that your own audit measured at ~1,700 lines, STOP and
report the discrepancy — it would mean the generator behaves differently than
the audit assumed and the fix would be aimed at the wrong thing.

**SUB-AGENTS PERMITTED, TWO HARD RULES.** READ-ONLY only — shared worktree; you
do all writing, committing and git operations. No sub-agent runs a build,
`ninja`, or a region gate. Verify your workers rather than relaying them.

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean + the full
index-diff reported. Build-free.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-decomper q-wall-catalog-repair`; then report
QUEUE-EMPTY honestly if you reach it.

### q-ci-test-visibility — 39 tests never run in CI [TODO]

**BUILD-FREE. Do not compile, do not run `ninja`, do not run `gate3.py` against
a region.** The other lane owns the compiler this round.

**Found while verifying PR #1608's one red test.** That failure was real but
narrow; chasing it surfaced something wider. The two runners disagree:

```text
python -m pytest -q tests --collect-only   ->  3,594 tests collected
python -m unittest discover -s tests       ->  3,555 tests ran
```

**CI runs only `unittest discover`.** So **39 tests never execute in CI.** They
live in 8 files that use module-level `def test_*` functions, which
`unittest` cannot collect:

```text
test_validate_attempts.py   12   <- guards the campaign ledger
test_live_cardinality_guard.py 7
test_pool_freshness.py       6
test_asm_void_counter.py     4
test_make_kickoff.py         4
test_fix_delink_suffixes.py  3
test_port_to_region.py       2   <- the port resolver
test_touch_stamp.py          1
```

`tools/check_test_imports.py` exists and sounds like it would catch this — it
does not. It checks only for **third-party imports** that would break the
stdlib-only unittest job. Collection parity is unguarded.

**This is the same defect class the campaign keeps finding:** a safety
mechanism that is documented, installed, and inert. `test_validate_attempts.py`
guards the ledger every ship-rate is computed from, and CI has never run it.

**Deliverable, in order:**

1. **A parity guard that fails loudly.** Extend `check_test_imports.py` (or add
   a sibling, your call — say which and why) to compare what `unittest
   discover` collects against what is actually defined, and fail when a
   `test_*.py` contributes tests that unittest cannot see. Add it to the CI
   job. **A test you have seen fail first**, constructed from a file with a
   module-level test function.
2. **Bring the 39 into CI.** Convert them to `unittest.TestCase` (the CI job is
   deliberately stdlib-only — do **not** add pytest to CI to solve this). If
   any test genuinely cannot be expressed without pytest, say so and leave it,
   with the guard explicitly allow-listing it and a reason.
3. **Fix the host-dependent test found in PR #1608.** `tools/make_kickoff.py`
   line ~65 stamps `interpreter="python" if host == "windows" else
   "python3.13"`, and `test_make_kickoff.py` hard-codes the Windows form, so it
   can only pass on Windows. Make the test assert against the same host
   conditional the tool uses rather than a literal.

⚠️ **Do not change the interpreter SELECTION while fixing the test.** The
`python3.13` pin is a separate question — it is a hard version pin that would
break on a Python upgrade, but changing it needs verification on the Mac, which
this lane cannot do. **Fix the test; report the pin as a finding.**

⚠️ **Do not weaken any test to make it collectable.** If converting a test to
`TestCase` changes what it asserts, that is a rewrite, not a conversion — flag
it instead.

⚠️ **Blank is not zero.** State the before/after counts from both runners, so
the parity is demonstrated rather than asserted.

**CANARY.** Before converting anything, add the guard and confirm it **fails on
the current tree** with all 8 files named. If it passes on the current tree,
the guard is not measuring what you think and everything downstream is built on
it — STOP and report that.

**SUB-AGENTS PERMITTED, TWO HARD RULES.** READ-ONLY only — shared worktree; you
do all writing, committing and git operations. No sub-agent runs a build,
`ninja`, or a region gate.

**Gate:** `python -m pytest -q tests` green AND `python -m unittest discover -s
tests` green (paste `Ran N tests` + `OK`) + `ruff check` clean + both collection
counts pasted before and after. Build-free.

ONE PR; verify every claim against `git diff --stat`; `python
tools/work_queue.py done claude-decomper q-ci-test-visibility`.

[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Decomper — autonomous C-match queue (WALL-AWARE)

**Protocol:** loop until QUEUE-EMPTY. `python tools/work_queue.py next claude-decomper`. For each item, the candidate list is the module's CANDIDATE (non-permanent) functions — get them with `python tools/wall_aware_headroom.py --json` (that module's `convertible_files`; richer per-file detail in `coercible_files`/`unknown_files`/`no_marker_files`). Do NOT re-attempt confirmed-`permanent` files (P-NN citation or a real unconditional `mcr`/`mrc`/`msr`/`mrs`/`swi` instruction in the body). Hand C-match a batch, byte-verify, gate `gate3.py --scope all`, ONE PR, `work_queue.py done`, commit, next. Park anything that turns out to be a genuine wall (add a `P-NN` marker, or a new codegen-walls.md entry if none fits — do NOT just re-add the old generic "wall" text). Effort MAX.

**Brief 651 rework (docs/research/brief-651-wall-tooling.md):** the "~245 convertible" framing below was wrong — brief 640 found the old classifier conflated codegen-walls.md's own "coercible-with-knowledge" (`C-NN`) bucket with "permanent" (`P-NN`), and treated the blanket `GLOBAL_ASM`/brief-294/302 whole-function-ship header (a mechanical-tool bulk stamp, not per-function proof) as a wall too. The real EUR candidate pool is **6,122** (139 `coercible` — cited C-NN code, look up the lever in codegen-walls.md; 5,951 `unknown` — cohort-stamped or prose-only, never individually assessed; 32 `no_marker` — unchanged from before). Only 32 files are confirmed-`permanent` project-wide. **Prioritize `coercible` first** (`wall_aware_headroom.py --coercible` lists every file with its code) — the lever is already documented, so these are the cheapest wins. The `unknown` bucket is real but unverified: most of it (ov002's 2,740) was mechanically `.s`-shipped by size-tier sweeps with zero C-drafting attempts (brief 416) — expect a mix of easy and genuinely-hard, same as any fresh module.

**Brief 655 finding (docs/research/brief-655-main-sweep.md):** swept main's 62 coercible + a sample of its unknown pool, 6/29 shipped. Bigger finding: of the 40 main files carrying the "brief 207 / Phase 2: Vanilla brief 202 `.s` recipe" C-34 boilerplate, **30 (75%) have zero address-duplication evidence** — mechanically bulk-stamped, not individually verified (distinct from the "brief 205" C-34 sub-tag, which checked out genuine on every file read). Read the header AND check the pool-word structure yourself before trusting a C-34 citation specifically — don't stop at "does it cite a code," ask "does the body actually show 2 loads of the same address." Coercible-vs-unknown hit rate this brief: statistically the same (20% vs 22%) — taxonomy code presence doesn't predict matchability once mistagged citations are accounted for.

**Tooling budget (2026-07-23):** a NEW tool must do one of: replace/delete an existing tool, consolidate duplicated infrastructure, measurably cut cycle time, catch a demonstrated failure class, or directly ship functions/bytes — state which in the PR. **asm-void ≠ readable C:** inline-asm-in-C is coverage hygiene, counted separately from natural C (metric split incoming, q-natural-c-metric); prefer natural C, use asm-void only where a documented wall justifies it.

**⚠️ ROUTE BEFORE YOU DRAFT (brief 667, 3/3 + generalised):** the recurring epilogue-shape wall is NOT a wall — it is the existing per-TU compiler routing tier. **Read the TARGET `.s`'s own epilogue first:** `sub sp,#4` + separate `pop {lr}` / `bx lr` → name the file `*.legacy.c`; fused `pop {..., pc}` → `*.legacy_sp3.c`; otherwise plain `.c`. Choosing the tier BEFORE writing the body removes an epilogue mismatch that accounted for ~14% of brief 661's sample. See `docs/research/style-a-epilogue.md` + lever-payoff #28/#29.

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

### cm-small-resweep-upper — size-filtered small sweep, upper range 0x02040000+ [TODO]

The other half of the re-sweep (Scaffolder takes the lower range). `--max-size 256`, route by epilogue.

**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + shipped/attempted.

### cm-regalloc-discriminator — build a systematic reg-alloc-park discriminator (r8 bets 5/9) [DONE]

Reg-alloc/predication parks dominate (44 of 74) and ship 0%, BUT r8 shows some are falsifiable (routing tier, trampoline arity — see cm-regalloc-trampoline) and match_pct is ANTI-informative (walls plateau HIGH at 84-88%, mimicking near-misses — do NOT chase high-% parks). Read the .s of the remaining reg-alloc parks and find the discriminator that predicts convertible vs genuinely-stuck (callee-arity, routing signature, decl-order sensitivity). Ship what's tractable; document the r2↔r3 permanent signature so it's park-on-sight-CORRECTLY.

**Gate:** `python tools/gate3.py --scope all --no-tests` + the discriminator writeup + any ships.

**Result:** Verified r8's bet 3 directly: `func_ov004_021dbe68` (parked 3 sessions as an "unbeatable r2/r3 wall") is a mis-classified 2-argument model — its tail-callee reads r2 as a genuine 3rd parameter at instruction 1. Modeling the true 3-arg signature ships 100% first try, correcting a prior (wrong) "confirmed permanent" re-test in `codegen-walls.md`'s P-4 entry. Documented the general discriminator: read the callee before parking a tail-call/thunk — a missing/wrong-arity forwarded argument is falsifiable, a register choice for a value computed purely locally (never crossing a call boundary) is the genuine, reshape-insensitive signature (independently reconfirmed 3× this session already, briefs 672/673, zero movement across every reshape). match_pct correlates with neither case (spot-checked 58-92%). USA/JPN port blocked by a genuine pre-existing un-carved gap in both regions' ov004 delinks.txt — flagged as a separate task. EUR ships alone. Full writeup: [`docs/research/brief-674-regalloc-discriminator.md`](../research/brief-674-regalloc-discriminator.md).

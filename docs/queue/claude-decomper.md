[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Decomper — autonomous C-match queue (WALL-AWARE)

**Protocol:** loop until QUEUE-EMPTY. `python tools/work_queue.py next claude-decomper`. For each item, the candidate list is the module's CANDIDATE (non-permanent) functions — get them with `python tools/wall_aware_headroom.py --json` (that module's `convertible_files`; richer per-file detail in `coercible_files`/`unknown_files`/`no_marker_files`). Do NOT re-attempt confirmed-`permanent` files (P-NN citation or a real unconditional `mcr`/`mrc`/`msr`/`mrs`/`swi` instruction in the body). Hand C-match a batch, byte-verify, gate `gate3.py --scope all`, ONE PR, `work_queue.py done`, commit, next. Park anything that turns out to be a genuine wall (add a `P-NN` marker, or a new codegen-walls.md entry if none fits — do NOT just re-add the old generic "wall" text). Effort MAX.

**Brief 651 rework (docs/research/brief-651-wall-tooling.md):** the "~245 convertible" framing below was wrong — brief 640 found the old classifier conflated codegen-walls.md's own "coercible-with-knowledge" (`C-NN`) bucket with "permanent" (`P-NN`), and treated the blanket `GLOBAL_ASM`/brief-294/302 whole-function-ship header (a mechanical-tool bulk stamp, not per-function proof) as a wall too. The real EUR candidate pool is **6,122** (139 `coercible` — cited C-NN code, look up the lever in codegen-walls.md; 5,951 `unknown` — cohort-stamped or prose-only, never individually assessed; 32 `no_marker` — unchanged from before). Only 32 files are confirmed-`permanent` project-wide. **Prioritize `coercible` first** (`wall_aware_headroom.py --coercible` lists every file with its code) — the lever is already documented, so these are the cheapest wins. The `unknown` bucket is real but unverified: most of it (ov002's 2,740) was mechanically `.s`-shipped by size-tier sweeps with zero C-drafting attempts (brief 416) — expect a mix of easy and genuinely-hard, same as any fresh module.

**Brief 655 finding (docs/research/brief-655-main-sweep.md):** swept main's 62 coercible + a sample of its unknown pool, 6/29 shipped. Bigger finding: of the 40 main files carrying the "brief 207 / Phase 2: Vanilla brief 202 `.s` recipe" C-34 boilerplate, **30 (75%) have zero address-duplication evidence** — mechanically bulk-stamped, not individually verified (distinct from the "brief 205" C-34 sub-tag, which checked out genuine on every file read). Read the header AND check the pool-word structure yourself before trusting a C-34 citation specifically — don't stop at "does it cite a code," ask "does the body actually show 2 loads of the same address." Coercible-vs-unknown hit rate this brief: statistically the same (20% vs 22%) — taxonomy code presence doesn't predict matchability once mistagged citations are accounted for.

**Tooling budget (2026-07-23):** a NEW tool must do one of: replace/delete an existing tool, consolidate duplicated infrastructure, measurably cut cycle time, catch a demonstrated failure class, or directly ship functions/bytes — state which in the PR. **asm-void ≠ readable C:** inline-asm-in-C is coverage hygiene, counted separately from natural C (metric split incoming, q-natural-c-metric); prefer natural C, use asm-void only where a documented wall justifies it.

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
Continue main's `unknown` pool (still ~2,362 files after briefs 640+655's combined sampling) — different functions than the prior batches. Get the list via `wall_aware_headroom.py --json` (`main.unknown_files`), sort by disk size (`ls -la src/main/*.s | sort -k5 -n`) and take the next size tier up from what's already been read (briefs 640/655 covered roughly the smallest ~500-560 byte files). Header-read before compiling. Batch of 15-25.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + count converted.

### cm-unknown-ov002-651 — C-match a batch from ov002's unknown pool (brief 651) [DONE]
Brief 664: 6/11 shipped (55%) from the 505B+ tier (excluding brief 650's 15 already-attempted addresses, per its report's own per-candidate table). Ported to USA+JPN (18 objects), 3-region sha1 PASS. New lever: inverted nested-if (outer guard negated + nested, no `else`, inner single-statement early return) reproduces an asymmetric branch-then-predicate shape that neither plain early-return nor brief-655's converged if/else could hit. 5 near-misses parked, including a strong 81.8% pure-register-residue case (`func_ov002_022576d8`) and a confirmed instruction-selection wall for AND-vs-shift-pair byte insertion (`func_ov002_021aff4c`). See docs/research/brief-664-ov002-unknown-batch1.md. pytest: 12 pre-existing Windows path-separator failures (documented baseline, none touching this batch's files) — sha1 is the authoritative gate per CLAUDE.md.
**Gate:** `python tools/gate3.py --scope all` — 3-region sha1 PASS + 6 converted.

### cm-epilogue-wall — crack the recurring epilogue-shape wall [DONE]

**Cracked — it was the existing `.legacy.c`/`.legacy_sp3.c` routing-tier lever (briefs 034/042/044/045), never tried on these 3 candidates.** All 3 shipped, 100% match, 3-region byte-verified: `func_020915e4` and `func_0206eecc` needed `.legacy.c` (1.2/sp2p3, separate `pop{lr};bx lr`), `func_020458d8` needed `.legacy_sp3.c` (1.2/sp3, fused `pop{pc}`) — the two tiers are distinguished by the target's own epilogue shape, read directly off the `.s` file, no guessing needed. `func_020915e4` also needed an unsigned-vs-signed comparison fix and a variable-declaration-order swap after routing (both real, not epilogue-related). A 4th unlisted function brief 661 flagged as a "probable contributor" (`func_020685c8`) confirmed the mechanism generalizes (epilogue now `SAME`, body-only near-miss at 54.2%, left for `cm-nearmiss-backlog`). Updated `lever-payoff.md` levers #28/#29 evidence counts instead of adding a new wall entry — nothing here was permanent. Full diagnosis in `docs/research/queue-cm-epilogue-wall.md`.
**Original brief text below, preserved for context:**
**Highest-leverage single target in the project right now.** Brief 661 hit the same wall **three times** on functions whose bodies matched *perfectly*: `func_020915e4` (loop body 100%), `func_020458d8` (all 4 branch bodies 100%), `func_0206eecc` — each blocked only by a recurring **epilogue-shape** mismatch. It also accounted for ~14% of that sample. Crack the mechanism once and it converts a documented backlog of near-misses into ships across the whole main sweep.
METHOD: read those three `.s` files' epilogues against your generated output, identify exactly what mwcc is doing differently (stack teardown order, register-list shape, `pop {…, pc}` vs `bx lr`, sub-sp vs push-based frames), and hunt the C-level lever that reproduces it. Check `docs/research/style-a-epilogue.md` and the `.legacy.c` / `.legacy_sp3.c` routing tiers — this smells like a compiler-revision routing issue, and those tiers exist precisely for epilogue-shape families.
If you crack it: ship those three, then sweep the near-miss backlog in 661's table. If it's genuinely permanent, document it as a NEW `P-NN` codegen-walls entry with the repro — that's equally valuable.
**Gate:** `python tools/gate3.py --scope all --no-tests` + either the lever + ships, or the new wall entry with evidence.

### cm-main-small-c — main small/medium sweep, upper range (0x0204xxxx+) [TODO]

The other half of brief 661's small/medium campaign — the Scaffolder takes 0x02000000–0x0203ffff, you take **0x02040000 and above**. Same method: `wall_aware_headroom.py --json` (main), size ≤256 B, header-read but treat the generic brief-294 header as non-evidence.
Apply anything you learned from `cm-epilogue-wall` — if the epilogue lever works, this batch should out-perform 661's 21% baseline.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + shipped/attempted.

### cm-nearmiss-backlog — convert brief 661's documented near-misses [TODO]

Brief 661 left **6 open near-misses (43% of its attempts)** with per-function diagnoses in its report table — partially-matched bodies, not confirmed walls. These are the cheapest ships available because the analysis is already done. Work them with the lever playbook (`docs/research/reshape-recipes/lever-payoff.md`) and anything from `cm-epilogue-wall`.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS + converted/remaining.

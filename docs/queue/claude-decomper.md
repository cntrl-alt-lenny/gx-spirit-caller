[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Decomper — autonomous C-match queue (WALL-AWARE)

**Protocol:** loop until QUEUE-EMPTY. `python3.13 tools/work_queue.py next claude-decomper`. For each item, the candidate list is the module's CANDIDATE (non-permanent) functions — get them with `python3.13 tools/wall_aware_headroom.py --json` (that module's `convertible_files`; richer per-file detail in `coercible_files`/`unknown_files`/`no_marker_files`). Do NOT re-attempt confirmed-`permanent` files (P-NN citation or a real unconditional `mcr`/`mrc`/`msr`/`mrs`/`swi` instruction in the body). Hand C-match a batch, byte-verify, gate `gate3.py --scope all`, ONE PR, `work_queue.py done`, commit, next. Park anything that turns out to be a genuine wall (add a `P-NN` marker, or a new codegen-walls.md entry if none fits — do NOT just re-add the old generic "wall" text). Effort MAX.

**Brief 651 rework (docs/research/brief-651-wall-tooling.md):** the "~245 convertible" framing below was wrong — brief 640 found the old classifier conflated codegen-walls.md's own "coercible-with-knowledge" (`C-NN`) bucket with "permanent" (`P-NN`), and treated the blanket `GLOBAL_ASM`/brief-294/302 whole-function-ship header (a mechanical-tool bulk stamp, not per-function proof) as a wall too. The real EUR candidate pool is **6,122** (139 `coercible` — cited C-NN code, look up the lever in codegen-walls.md; 5,951 `unknown` — cohort-stamped or prose-only, never individually assessed; 32 `no_marker` — unchanged from before). Only 32 files are confirmed-`permanent` project-wide. **Prioritize `coercible` first** (`wall_aware_headroom.py --coercible` lists every file with its code) — the lever is already documented, so these are the cheapest wins. The `unknown` bucket is real but unverified: most of it (ov002's 2,740) was mechanically `.s`-shipped by size-tier sweeps with zero C-drafting attempts (brief 416) — expect a mix of easy and genuinely-hard, same as any fresh module.

**Brief 655 finding (docs/research/brief-655-main-sweep.md):** swept main's 62 coercible + a sample of its unknown pool, 6/29 shipped. Bigger finding: of the 40 main files carrying the "brief 207 / Phase 2: Vanilla brief 202 `.s` recipe" C-34 boilerplate, **30 (75%) have zero address-duplication evidence** — mechanically bulk-stamped, not individually verified (distinct from the "brief 205" C-34 sub-tag, which checked out genuine on every file read). Read the header AND check the pool-word structure yourself before trusting a C-34 citation specifically — don't stop at "does it cite a code," ask "does the body actually show 2 loads of the same address." Coercible-vs-unknown hit rate this brief: statistically the same (20% vs 22%) — taxonomy code presence doesn't predict matchability once mistagged citations are accounted for.

---

## Items

### cm-main-batch1 — C-match main convertibles (batch 1) [DONE]

main has ~115 convertible (non-wall) functions — the biggest remaining pool. Get the list via `wall_aware_headroom.py --json` (main.convertible_files), C-match a batch (~8-15), prefer the SDK-named ones.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov004 — C-match ov004 convertibles [DONE]

ov004 has ~35 convertible functions. Get the list, C-match a batch.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-main-batch2 — C-match main convertibles (batch 2) [DONE]

Continue main's convertible pool — different functions than batch 1.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-coercible-651 — C-match the project-wide coercible pool (brief 651) [DONE]

Brief 655 covered main's 62-file slice (the biggest single concentration): 20 real attempts, 4 shipped (`func_0200b2f4`, `func_020a32e4`, `func_0208b0d0`, `func_02097238`), 16 parked with match% + residual documented in docs/research/brief-655-main-sweep.md. Found that 30 of the 62 citations (all sharing one specific boilerplate header, "brief 207 / Phase 2: Vanilla brief 202 `.s` recipe") don't actually exhibit the cited C-34 pattern at all — read the pool-word structure yourself, don't trust the citation. ~12 main "Vanilla" mistags + 2 branched jump-table dispatchers (`func_020037d0`, `func_02003d98`) remain unattempted (time-boxed, not walled) — a real follow-up target. overlay004/6/8/11's slice is the scaffolder's separate `cm-coercible-overlays-651` item; ov002's 33 coercible files are tracked by the parallel ov002 sweep campaign (brief 650, PR #1231), not this queue.
**Gate:** `python3.13 tools/gate3.py --scope all --no-tests` PASS (3-region sha1) — verified via a forced-clean rebuild of the 6 changed objects, not just incremental `ninja` (see brief-655's process note on why that matters after activate/revert script cycling).

### cm-unknown-main-651 — C-match a batch from main's unknown pool (brief 651) [DONE]

Brief 655 sampled the ~25 smallest files by disk size, read ~18, attempted 9, shipped 2 (`func_020ace98`, `func_020a6a00`). New lever found: converging both branches of an early-return onto one shared final `return` (instead of an early separate `return`) turned a predicated near-miss into a real branch and a 100% match. See docs/research/brief-655-main-sweep.md for the full per-file table (including near-misses at 45-80% worth a second pass). Only ~34 of main's 2,372 unknown files have been read/attempted total across briefs 640+655 — this bucket is nowhere near exhausted.
**Gate:** `python3.13 tools/gate3.py --scope all --no-tests` PASS + count converted.

### cm-unknown-main-655-batch2 — C-match another batch from main's unknown pool [TODO]

Continue main's `unknown` pool (still ~2,362 files after briefs 640+655's combined sampling) — different functions than the prior batches. Get the list via `wall_aware_headroom.py --json` (`main.unknown_files`), sort by disk size (`ls -la src/main/*.s | sort -k5 -n`) and take the next size tier up from what's already been read (briefs 640/655 covered roughly the smallest ~500-560 byte files). Header-read before compiling. Batch of 15-25.
**Gate:** `python3.13 tools/gate3.py --scope all --no-tests` PASS + count converted.

### cm-unknown-ov002-651 — C-match a batch from ov002's unknown pool (brief 651) [TODO]

ov002 is 2,740 `unknown` files — 45% of the entire reopened frontier, and per brief 640's git-history trace (brief 416: pure mechanical size-tier sweep hunting the disassemble/reassemble tool's OWN capability edge, zero C-drafting attempts) the single highest-leverage never-attempted module in the project. Get the list via `wall_aware_headroom.py --json` (`overlay002.unknown_files`). Start from the smallest files on disk (`ls -la src/overlay002/*.s | sort -k5 -n`) — brief 640's 2 ov002 samples split evenly (1 close/tractable, 1 genuine wall matching the already-documented C-1r predication-collapse pattern), so expect a real mix, not a guaranteed win. Batch of 15-25.
⚠️ A parallel ov002 sweep (brief 650, PR #1231) already attempted a first 15-file sample (5 shipped, 33% hit rate) — get that PR's file list before picking candidates here to avoid re-attempting the same 15.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

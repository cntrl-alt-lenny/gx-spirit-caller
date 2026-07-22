[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Decomper — autonomous C-match queue (WALL-AWARE)

**Protocol:** loop until QUEUE-EMPTY. `python3.13 tools/work_queue.py next claude-decomper`. For each item, the candidate list is the module's CANDIDATE (non-permanent) functions — get them with `python3.13 tools/wall_aware_headroom.py --json` (that module's `convertible_files`; richer per-file detail in `coercible_files`/`unknown_files`/`no_marker_files`). Do NOT re-attempt confirmed-`permanent` files (P-NN citation or a real unconditional `mcr`/`mrc`/`msr`/`mrs`/`swi` instruction in the body). Hand C-match a batch, byte-verify, gate `gate3.py --scope all`, ONE PR, `work_queue.py done`, commit, next. Park anything that turns out to be a genuine wall (add a `P-NN` marker, or a new codegen-walls.md entry if none fits — do NOT just re-add the old generic "wall" text). Effort MAX.

**Brief 651 rework (docs/research/brief-651-wall-tooling.md):** the "~245 convertible" framing below was wrong — brief 640 found the old classifier conflated codegen-walls.md's own "coercible-with-knowledge" (`C-NN`) bucket with "permanent" (`P-NN`), and treated the blanket `GLOBAL_ASM`/brief-294/302 whole-function-ship header (a mechanical-tool bulk stamp, not per-function proof) as a wall too. The real EUR candidate pool is **6,122** (139 `coercible` — cited C-NN code, look up the lever in codegen-walls.md; 5,951 `unknown` — cohort-stamped or prose-only, never individually assessed; 32 `no_marker` — unchanged from before). Only 32 files are confirmed-`permanent` project-wide. **Prioritize `coercible` first** (`wall_aware_headroom.py --coercible` lists every file with its code) — the lever is already documented, so these are the cheapest wins. The `unknown` bucket is real but unverified: most of it (ov002's 2,740) was mechanically `.s`-shipped by size-tier sweeps with zero C-drafting attempts (brief 416) — expect a mix of easy and genuinely-hard, same as any fresh module.

---

### cm-main-batch1 — C-match main convertibles (batch 1) [DONE]
main has ~115 convertible (non-wall) functions — the biggest remaining pool. Get the list via `wall_aware_headroom.py --json` (main.convertible_files), C-match a batch (~8-15), prefer the SDK-named ones.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-ov004 — C-match ov004 convertibles [DONE]
ov004 has ~35 convertible functions. Get the list, C-match a batch.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-main-batch2 — C-match main convertibles (batch 2) [DONE]
Continue main's convertible pool — different functions than batch 1.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-coercible-651 — C-match the project-wide coercible pool (brief 651) [TODO]
139 files across every module cite a specific `C-NN` codegen-walls.md code — a documented lever already exists, so these are the highest-leverage candidates in the whole reopened frontier. Get the full list with codes via `python3.13 tools/wall_aware_headroom.py --coercible`. For each: read the cited entry in `docs/research/codegen-walls.md` for the exact recipe (source variation or routing tier), apply it, byte-verify. Biggest concentrations: main (62), overlay002 (33), overlay011 (15), overlay004 (8), overlay008 (6). A batch of 15-25 is reasonable; take from the biggest concentrations first. Skip (and park with a note) any candidate where the cited code's own "Discriminator"/"Wall family note" says it doesn't actually match this shape — brief 640 found citations are sometimes wrong about which code applies, not just wrong about wall-vs-convertible.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted (per code, if mixed).

### cm-unknown-main-651 — C-match a batch from main's unknown pool (brief 651) [TODO]
main has 2,372 `unknown` files (blanket `GLOBAL_ASM`/brief-294/302 stamp or free-form prose only, no taxonomy code) — never individually assessed for C-irreducibility; a mechanical carving tool shipped them as `.s`, not a per-function judgment. Get the list via `wall_aware_headroom.py --json` (`main.unknown_files`). Header-read before compiling (same caveat as always — this bucket is an upper bound). Take a batch of 15-25, prefer short/simple-looking bodies first (few instructions, no loops, no multi-callee dispatch), same triage brief 640's samples used.
⚠️ Known limitation (brief 651): the classifier can only key off machine-checkable evidence (a real `[CP]-NN` code or a real unconditional `mcr`/`mrc`/`msr`/`mrs`/`swi` instruction) — a prose "Brief NNN worked example" citation with no taxonomy code still lands in this `unknown`/`no_marker` bucket even when the brief itself is an exhaustively-documented permanent wall. Two specific main-adjacent files already known this way (flagged by brief 641, not yet formalized with a `P-NN` code): `src/overlay004/func_ov004_021dbdbc.s` (brief 191, mwldarm interwork veneer) and `src/overlay011/func_ov011_021d2c64.s` (brief 192, cross-overlay hardcoded BL) — skip both on sight. A follow-up brief should give these (and any others like them found during this sweep) real `P-NN` codegen-walls.md entries so the tool catches them automatically next time.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

### cm-unknown-ov002-651 — C-match a batch from ov002's unknown pool (brief 651) [TODO]
ov002 is 2,740 `unknown` files — 45% of the entire reopened frontier, and per brief 640's git-history trace (brief 416: pure mechanical size-tier sweep hunting the disassemble/reassemble tool's OWN capability edge, zero C-drafting attempts) the single highest-leverage never-attempted module in the project. Get the list via `wall_aware_headroom.py --json` (`overlay002.unknown_files`). Start from the smallest files on disk (`ls -la src/overlay002/*.s | sort -k5 -n`) — brief 640's 2 ov002 samples split evenly (1 close/tractable, 1 genuine wall matching the already-documented C-1r predication-collapse pattern), so expect a real mix, not a guaranteed win. Batch of 15-25.
**Gate:** `python3.13 tools/gate3.py --scope all` PASS + count converted.

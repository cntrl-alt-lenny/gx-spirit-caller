[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Decomper — autonomous C-match queue (WALL-AWARE)

**Protocol:** loop until QUEUE-EMPTY. `python tools/work_queue.py next claude-decomper`. For each item, the candidate list is the module's CANDIDATE (non-permanent) functions — get them with `python tools/wall_aware_headroom.py --json` (that module's `convertible_files`; richer per-file detail in `coercible_files`/`unknown_files`/`no_marker_files`). Do NOT re-attempt confirmed-`permanent` files (P-NN citation or a real unconditional `mcr`/`mrc`/`msr`/`mrs`/`swi` instruction in the body). Hand C-match a batch, byte-verify, gate `gate3.py --scope all`, ONE PR, `work_queue.py done`, commit, next. Park anything that turns out to be a genuine wall (add a `P-NN` marker, or a new codegen-walls.md entry if none fits — do NOT just re-add the old generic "wall" text). Effort MAX. Brief 656's active collision guard leaves `overlay002` to brief 654 and `main` to brief 655; this queue's refill uses overlay004 and other non-colliding modules.

**Brief 656 refresh (docs/research/campaign-analytics/cmatch-worklist.md):** the live EUR candidate pool is **6,117** (138 `coercible`, 5,947 `never-assessed`, and 32 `no-marker`), with 32 confirmed-permanent files excluded from the candidate total. Prioritize `coercible` first because each row has a documented C-NN lever; then use the never-assessed module tables as an upper-bound batch source. The worklist's sizes are EUR delinks section spans, and every candidate still needs a header/body read before C drafting. Active CC collisions remain `overlay002` brief 654 and `main` brief 655.

---

## Items

### cm-main-batch1 — C-match main convertibles (batch 1) [DONE]

main has ~115 convertible (non-wall) functions — the biggest remaining pool. Get the list via `wall_aware_headroom.py --json` (main.convertible_files), C-match a batch (~8-15), prefer the SDK-named ones.
**Gate:** `python tools/gate3.py --scope all` PASS + count converted.

### cm-unknown-ov004-656 — header-read a 20-file ov004 never-assessed batch (brief 656) [TODO]

These are the first 20 smallest `overlay004` rows from the Brief 656 worklist. They are never-assessed, not confirmed-permanent; read each header/body before drafting. This module does not collide with the active `overlay002` brief 654 or `main` brief 655, and it is separate from Scaffolder's coercible overlay batch.

| Size | File |
|---:|---|
| `0x3c` | `src/overlay004/func_ov004_021d8d1c.s` |
| `0x48` | `src/overlay004/func_ov004_021dcd1c.s` |
| `0x4c` | `src/overlay004/func_ov004_021cc2a4.s` |
| `0x4c` | `src/overlay004/func_ov004_021d4870.s` |
| `0x4c` | `src/overlay004/func_ov004_021d57ec.s` |
| `0x4c` | `src/overlay004/func_ov004_021d641c.s` |
| `0x50` | `src/overlay004/func_ov004_021d6ed0.s` |
| `0x58` | `src/overlay004/func_ov004_021d1308.s` |
| `0x58` | `src/overlay004/func_ov004_021d48bc.s` |
| `0x60` | `src/overlay004/func_ov004_021d55d8.s` |
| `0x6c` | `src/overlay004/func_ov004_021d4804.s` |
| `0x6c` | `src/overlay004/func_ov004_021dc1cc.s` |
| `0x70` | `src/overlay004/func_ov004_021ca128.s` |
| `0x74` | `src/overlay004/func_ov004_021db994.s` |
| `0x78` | `src/overlay004/func_ov004_021cfbec.s` |
| `0x78` | `src/overlay004/func_ov004_021d4044.s` |
| `0x78` | `src/overlay004/func_ov004_021d52a0.s` |
| `0x7c` | `src/overlay004/func_ov004_021d427c.s` |
| `0x7c` | `src/overlay004/func_ov004_021d43a0.s` |
| `0x7c` | `src/overlay004/func_ov004_021d4d8c.s` |

**Gate:** `python tools/gate3.py --scope all` PASS + count converted or parked with a cited wall.

### cm-ov004 — C-match ov004 convertibles [DONE]

ov004 has ~35 convertible functions. Get the list, C-match a batch.
**Gate:** `python tools/gate3.py --scope all` PASS + count converted.

### cm-main-batch2 — C-match main convertibles (batch 2) [DONE]

Continue main's convertible pool — different functions than batch 1.
**Gate:** `python tools/gate3.py --scope all` PASS + count converted.

### cm-coercible-651 — C-match the project-wide coercible pool (brief 651) [SUPERSEDED BY BRIEF 656]

139 files across every module cite a specific `C-NN` codegen-walls.md code — a documented lever already exists, so these are the highest-leverage candidates in the whole reopened frontier. Get the full list with codes via `python tools/wall_aware_headroom.py --coercible`. For each: read the cited entry in `docs/research/codegen-walls.md` for the exact recipe (source variation or routing tier), apply it, byte-verify. Biggest concentrations: main (62), overlay002 (33), overlay011 (15), overlay004 (8), overlay008 (6). A batch of 15-25 is reasonable; take from the biggest concentrations first. Skip (and park with a note) any candidate where the cited code's own "Discriminator"/"Wall family note" says it doesn't actually match this shape — brief 640 found citations are sometimes wrong about which code applies, not just wrong about wall-vs-convertible.
**Gate:** `python tools/gate3.py --scope all` PASS + count converted (per code, if mixed).

### cm-unknown-main-651 — C-match a batch from main's unknown pool (brief 651) [SUPERSEDED BY BRIEF 656 — ACTIVE BRIEF 655 COLLISION]

main has 2,372 `unknown` files (blanket `GLOBAL_ASM`/brief-294/302 stamp or free-form prose only, no taxonomy code) — never individually assessed for C-irreducibility; a mechanical carving tool shipped them as `.s`, not a per-function judgment. Get the list via `wall_aware_headroom.py --json` (`main.unknown_files`). Header-read before compiling (same caveat as always — this bucket is an upper bound). Take a batch of 15-25, prefer short/simple-looking bodies first (few instructions, no loops, no multi-callee dispatch), same triage brief 640's samples used.
⚠️ Known limitation (brief 651): the classifier can only key off machine-checkable evidence (a real `[CP]-NN` code or a real unconditional `mcr`/`mrc`/`msr`/`mrs`/`swi` instruction) — a prose "Brief NNN worked example" citation with no taxonomy code still lands in this `unknown`/`no_marker` bucket even when the brief itself is an exhaustively-documented permanent wall. Two specific main-adjacent files already known this way (flagged by brief 641, not yet formalized with a `P-NN` code): `src/overlay004/func_ov004_021dbdbc.s` (brief 191, mwldarm interwork veneer) and `src/overlay011/func_ov011_021d2c64.s` (brief 192, cross-overlay hardcoded BL) — skip both on sight. A follow-up brief should give these (and any others like them found during this sweep) real `P-NN` codegen-walls.md entries so the tool catches them automatically next time.
**Gate:** `python tools/gate3.py --scope all` PASS + count converted.

### cm-unknown-ov002-651 — C-match a batch from ov002's unknown pool (brief 651) [SUPERSEDED BY BRIEF 656 — ACTIVE BRIEF 654 COLLISION]

ov002 is 2,740 `unknown` files — 45% of the entire reopened frontier, and per brief 640's git-history trace (brief 416: pure mechanical size-tier sweep hunting the disassemble/reassemble tool's OWN capability edge, zero C-drafting attempts) the single highest-leverage never-attempted module in the project. Get the list via `wall_aware_headroom.py --json` (`overlay002.unknown_files`). Start from the smallest files on disk (`ls -la src/overlay002/*.s | sort -k5 -n`) — brief 640's 2 ov002 samples split evenly (1 close/tractable, 1 genuine wall matching the already-documented C-1r predication-collapse pattern), so expect a real mix, not a guaranteed win. Batch of 15-25.
**Gate:** `python tools/gate3.py --scope all` PASS + count converted.

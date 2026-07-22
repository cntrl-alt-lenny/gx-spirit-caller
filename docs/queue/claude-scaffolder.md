[//]: # (markdownlint-disable MD013 MD041)

# Claude Code Scaffolder — autonomous C-match queue (WALL-AWARE)

**Protocol:** loop until QUEUE-EMPTY. `python tools/work_queue.py next claude-scaffolder`. Candidate list = the module's CONVERTIBLE (non-wall) functions via `python tools/wall_aware_headroom.py --json`. Skip documented walls. Different modules from the Decomper lane — no collision. Hand C-match a batch, byte-verify, gate `gate3.py --scope all`, ONE PR, `work_queue.py done`, commit, next. Effort MAX. Only ~245 convertible remain project-wide; honest small batches are fine.

**CRITICAL — header-read each candidate before compiling.** `wall_aware_headroom.py`'s list is an UPPER BOUND: a third wall class is free-form prose with no taxonomy number (mwcc-reg-alloc / hand-`.word` cross-jumps / `mcr` ops / shared-epilogue pads) — the tool can't catch it without also skipping easy stubs. Read each candidate's `.s` header; skip prose walls; the EASY WINS are trivial stubs (no-op `bx lr`, tail-call trampolines/forwarders). ~half of a medium batch may be prose walls — that's expected.

---

### cm-ov005 — hand C-match ov005 [DONE]
Shipped 1 function (`func_ov005_021acadc`, bitfield-insert + Task_PostLocked size calc), byte-verified via `gate3.py --scope all` (3-region sha1 PASS). `wall_aware_headroom.py` now reports 0 convertible remaining in ov005 — pool exhausted (rest of the module's remaining `.s` carries the brief 294/302 GLOBAL_ASM-endgame wall marker).
**Gate:** `python tools/gate3.py --scope all` PASS + count converted.

### cm-ov002-batch1 — C-match ov002 convertibles (batch 1) [DONE]
Of the 27 `wall_aware_headroom.py`-reported convertibles, 11 (the no-`func_`-prefix `ov002_XXXXXXXX.s` files) turned out to be **dead orphans** — already shipped as C under `libs/nitro/*.legacy.c` or a shifted `src/overlay002/*.c` path, with a stale unused `.s` sitting on disk (the tool globs `.s` files on disk, it doesn't check `delinks.txt` routing — same false-positive class as one file found in ov003). Deleted all 11, plus 1 equivalent orphan found in ov003 (`ov003_021ca2b4.s`) — 12 total dead files removed as hygiene.
Shipped all 16 genuinely-live remaining functions as byte-verified `asm void` C (reg-alloc-sensitive guard chains and table-lookup/tail-call families — not safely reachable from natural C on this asymptotic-hard module). **Toolchain finding:** the original `.s` files' local-label pool literals (`.Lxxx: .word symbol`) don't parse inside mwcc's inline `asm void {}` blocks (`illegal operand` / `unknown assembler instruction mnemonic`) — fixed by rewriting as the `ldr rX, =symbol` pseudo-op instead (proven precedent: `sinit_ov002_022ca7e8.c`). Confirmed via canary before scaling.
Byte-verified via `gate3.py --scope all` (3-region sha1 PASS + full pytest green).
**Gate:** `python tools/gate3.py --scope all` PASS + count converted.

### cm-smalls — C-match the small-overlay convertibles [DONE]
Cross-checked every reported candidate against `delinks.txt` routing before attempting conversion (per the cm-ov002-batch1 dead-orphan lesson): most of ov008/ov011/ov010/ov016's reported counts were dead orphans or already resolved by the ff8e3426 taxonomy tightening. Real, live candidates found: 3 trivial no-op stubs (`func_ov015_021b285c`, `func_ov015_021b2860`, `func_ov003_021ca2b8` — empty C body, compiles to a bare `bx lr`) shipped as natural C, plus 1 attempted-and-parked case.
**Parked:** `func_ov011_021d2c64` (brief 192's cross-overlay hardcoded-BL worked example — a `bl` to an address dsd can't attribute to one overlay, so the original `.s` hand-encodes the branch as a raw `.word`). Confirmed this is **not** portable to `asm void` either: bare `.word` raw-instruction-encoding directives are rejected by mwcc's inline assembler (`unknown assembler instruction mnemonic`), unlike the labeled-pool-literal case from cm-ov002-batch1 which had a `ldr rX, =symbol` workaround — there's no equivalent substitute for an unresolvable raw branch encoding. Reverted cleanly to its original `.s`; stays a genuine wall until dsd itself can attribute the call (out of scope here, same as brief 192 concluded).
Byte-verified via `gate3.py --scope all` (3-region sha1 PASS + full pytest green).
**Gate:** `python tools/gate3.py --scope all` PASS + count converted (per module).

### cm-ov002-batch2 — C-match ov002 convertibles (batch 2) [DONE]
No-op: fresh `wall_aware_headroom.py --json` scan shows `overlay002: {total: 2773, wall: 2773, convertible: 0}`. Batch 1 already shipped/cleared the module's entire 27-function convertible pool (16 real ships + 11 dead orphans deleted) — nothing left for batch 2 to do. No functions converted, no gate run needed (no source changes).

### cm-final47-641 — C-match the project-wide 47-candidate frontier (brief 641) [DONE]
Header-read all 47 (main 43, ov004 3, ov011 1) before compiling. Shipped 3 (`func_0203d6c4` bitfield-shift lever, `func_0208b190` Thumb struct-init natural-C first-try, `func_0201aaf4` asm-void matching the adjacent `func_020186b0.c` precedent). Attempted and cleanly parked 15 genuine near-miss walls (7 of them the SAME register-allocation/scratch-register-choice class — confirmed via repeated testing that no C-level lever, including dummy params and explicit locals, influences which physical register mwcc's -O4 allocator picks for an otherwise byte-identical sequence). Flagged 3 mis-classified "convertible" entries for brief 640: `data_020b52d4` is pure zero `.rodata` (not code), `func_ov004_021dbdbc` and `func_ov011_021d2c64` are already exhaustively documented permanent walls (briefs 191/192) that `wall_aware_headroom.py`'s regex doesn't catch since their headers cite a brief number without a `[CP]-\d+` taxonomy tag. 26 main candidates skipped as prose walls at header-read, not individually re-verified.
**Gate:** `python tools/gate3.py --scope all --no-tests` PASS (3-region sha1) — `--no-tests` used because the pytest step has 12 pre-existing Windows path-separator failures, documented in `docs/research/improvement-swarm-2026-07-15-r5.md`, in files this brief never touched.

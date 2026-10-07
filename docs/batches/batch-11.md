# Batch 11 (Worker summary)

Code commit checked: the last `Match` / `Record parked` commit before this file (see `git log`). EUR main, `.s`-only functions of 256 B or less in 0x02080000-0x0208ffff.

## Done

69 of the 91 candidates are now natural C at 100% (fastmatch, resolved): 9,896 B. By tier: default 18 (2,120 B), legacy_sp3 40 (5,872 B), legacy 11 (1,904 B). Natural-C went 448,234 to 458,130 B (`progress.py --version eur`), a gain of 9,896 B, equal to the matched sizes.

Why a non-default tier: every default compile of a legacy_sp3 shipment differs in the original's `stmfd {lr}; sub sp,#4` frame, its `ands` (2.0 emits `tst`), its duplicate `cmp`, or unfolded MMIO bases. Every legacy shipment has the two-step `ldmia {..,lr}; bx lr` epilogue. Each tier tried and not matched has its own ledger row.

| Address | Bytes | Tier |
|---|---|---|
| func_020800b8 | 92 | legacy_sp3 |
| func_02080114 | 88 | legacy_sp3 |
| func_020801ac | 212 | legacy_sp3 |
| func_0208060c | 100 | legacy_sp3 |
| func_020807fc | 188 | legacy_sp3 |
| func_02080cdc | 92 | legacy_sp3 |
| func_02081598 | 176 | legacy_sp3 |
| func_02081648 | 172 | legacy_sp3 |
| func_020817f0 | 168 | legacy_sp3 |
| func_02081898 | 240 | legacy_sp3 |
| func_02081b5c | 124 | legacy_sp3 |
| func_02081bd8 | 172 | legacy_sp3 |
| func_02081c84 | 148 | legacy_sp3 |
| func_02081ee4 | 100 | legacy_sp3 |
| func_02081f5c | 212 | legacy_sp3 |
| func_02082138 | 96 | legacy_sp3 |
| func_020827ec | 112 | default |
| func_02082f64 | 104 | legacy_sp3 |
| func_02084840 | 212 | legacy_sp3 |
| func_02084aec | 220 | default |
| func_02084bc8 | 112 | legacy_sp3 |
| func_02084e0c | 240 | default |
| func_02084fe0 | 116 | legacy_sp3 |
| func_02085888 | 68 | default |
| func_0208598c | 232 | legacy_sp3 |
| func_02085a74 | 72 | default |
| func_02085abc | 124 | default |
| func_02085b38 | 216 | legacy_sp3 |
| func_020865d0 | 80 | default |
| func_02086620 | 224 | legacy_sp3 |
| func_02086700 | 256 | legacy_sp3 |
| func_02086e44 | 92 | legacy_sp3 |
| func_02086ea0 | 132 | default |
| func_02086f24 | 232 | legacy_sp3 |
| func_020873fc | 72 | legacy_sp3 |
| func_020874c4 | 100 | legacy_sp3 |
| func_02087640 | 80 | default |
| func_020877c8 | 92 | legacy_sp3 |
| func_02087824 | 88 | legacy_sp3 |
| func_0208787c | 72 | default |
| func_020878c4 | 84 | default |
| func_02087918 | 60 | legacy_sp3 |
| func_02087f34 | 148 | legacy_sp3 |
| func_020880bc | 180 | legacy_sp3 |
| func_02088268 | 108 | default |
| func_020882fc | 84 | default |
| func_02088540 | 96 | default |
| func_020885a0 | 128 | legacy_sp3 |
| func_02088dd8 | 148 | default |
| func_0208906c | 120 | default |
| func_02089768 | 72 | legacy_sp3 |
| func_020897b0 | 60 | legacy_sp3 |
| func_0208a280 | 196 | default |
| func_0208a344 | 252 | legacy_sp3 |
| func_0208a574 | 112 | legacy_sp3 |
| func_0208afac | 84 | default |
| func_0208b1e0 | 196 | legacy |
| func_0208bca4 | 228 | legacy |
| func_0208c3e4 | 68 | legacy |
| func_0208cb88 | 128 | legacy_sp3 |
| func_0208cd64 | 228 | legacy |
| func_0208d0bc | 124 | legacy |
| func_0208d138 | 172 | legacy |
| func_0208d3fc | 244 | legacy |
| func_0208d6f4 | 184 | legacy |
| func_0208e700 | 172 | legacy |
| func_0208e7ac | 176 | legacy |
| func_0208ea74 | 204 | legacy_sp3 |
| func_0208f458 | 112 | legacy |

Wall tool: `wall_aware_headroom.py` counted 0 confirmed-permanent in range, so there was nothing extra to retry.

## Checked

| Check | Exit | Real output |
|---|---|---|
| fastmatch, all 69 new files | 0 | every line `100.0%  OK` |
| check_delink_dupes | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| validate_attempts | 0 | `"errors": 0`, `"shape_conflicts": 66` (unchanged) |
| check_fake_matches | 0 | `OK` (do-while-zero 3, volatile-local 1, unchanged) |
| pytest -q tests | 0 | `1330 passed, 15 skipped, 132 subtests passed` |
| gate3 --scope all (log `gate-batch-11.log`) | 0 | `[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`, `GATE PASS`, `gate3: GATE EXIT 0`; no SKIP, no STALE lines |

Each match is its own commit with its own ledger rows; the history was rebuilt once so no commit holds another function's files.

## Not checked

USA and JPN beyond the gate. Tiers beyond the three named (a `.thumb.c` suffix is the same compiler as `.legacy.c`). The honesty of callee declarations below beyond reading them.

Per-file callee declarations that follow the original's registers (the definition takes a different count or types): `func_02087e2c` called with 2 args (def 1) in 0208a280 and 0208a344; `func_020897ec` with 1 (def 4) in 02089768; `func_02097f10` with 3 (def 4) in 0208906c; `func_020807fc` declared unprototyped in 020817f0 (the original passes an untruncated key); `func_0208a344` with an int second parameter in 0208a574. `func_02084e0c` makes `data_021a4824` volatile because the original reloads it three times; both tiers CSE a plain int.

## Failed or blocked

22 functions stay `.s` (2,804 B). Best score per tier:

| Address | Bytes | Best default | Best legacy_sp3 | Best legacy | Residue |
|---|---|---|---|---|---|
| func_020805b0 | 92 | 0.0 | 0.0 | 0.0 | scheduling-order |
| func_02081498 | 256 | 1.6 | 2.9 | 2.9 | instr-selection |
| func_02081ae0 | 104 | 11.5 | 76.9 | 70.4 | store-order |
| func_02082494 | 112 | 28.6 | 46.4 | 41.4 | register-numbering-permutation-cascade |
| func_02084218 | 116 | 0.0 | 65.5 | 56.7 | register-numbering-permutation-cascade |
| func_02084360 | 128 | 43.8 | 53.1 | 45.5 | register-numbering-permutation-cascade |
| func_02086848 | 132 | 33.3 | 11.4 | 11.1 | register-numbering-permutation-cascade |
| func_02088874 | 244 | 0.0 | 80.3 | 7.9 | register-numbering-permutation-cascade |
| func_02089a84 | 224 | 0.0 | 28.1 | 16.1 | register-numbering-permutation-cascade |
| func_0208b1ac | 28 | 21.4 | 13.3 | 13.3 | constant-materialization |
| func_0208b1c8 | 24 | 0.0 | 0.0 | 0.0 | stm-burst-needs-asm |
| func_0208be9c | 60 | 0.0 | 60.0 | 60.0 | register-numbering-permutation-cascade |
| func_0208bfc4 | 136 | 2.9 | 32.4 | 20.0 | scheduling-order |
| func_0208c2e0 | 104 | 23.1 | 22.2 | 22.2 | scheduling-order |
| func_0208c348 | 156 | 0.0 | 66.7 | 71.8 | register-numbering-permutation-cascade |
| func_0208c8cc | 116 | 0.0 | 0.0 | 0.0 | mmio-const-materialization |
| func_0208df94 | 128 | 9.4 | 71.9 | 71.9 | scheduling-order |
| func_0208e014 | 140 | 8.6 | 0.0 | 0.0 | scheduling-order |
| func_0208e0a0 | 128 | 3.1 | 17.1 | 17.1 | scheduling-order |
| func_0208e120 | 140 | 0.0 | 5.4 | 5.4 | scheduling-order |
| func_0208e890 | 136 | 0.0 | 5.7 | 5.6 | ANDS-vs-TST-instruction-choice |
| func_0208f4c8 | 100 | 0.0 | 44.0 | 84.0 | scheduling-order |

Findings for Brain:
- `func_02081498`: needs a `clz`; `__clz` compiles to a call, so no honest C.
- `func_02084360` matches the shape but needs `data_021021f0`, which symbols.txt lists and no object defines (the original `.s` uses `data_021021ec+4`). Not shipped.
- `func_0208df94` reaches 100% (sp3) and `func_0208e014` reaches 100% (sp3) only with `volatile` on the MMIO reads; `0208e0a0` and `0208e120` are the same family. Not shipped, since the original reads each register once (except 0x04000000 in e014/e120, where the u16 read still needs volatile).
- 02084218, 02084360, 02082494, 02088874, 02089a84, 02081ae0, 02086848, 0208c348, 0208be9c, 0208f4c8: remaining difference is register letters or store order, tried 4+ variants each.
- No entry in range was found not to be a function.

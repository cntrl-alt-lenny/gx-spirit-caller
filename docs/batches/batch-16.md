# Batch 16 - Worker

## Done

Re-swept EUR main .s functions of 256 B or less in 0x02000000-0x0202ffff (88 listed). 8 matched in natural C at 100% (868 B, `progress.py` Natural-C 484,274 to 485,142, equal to the sum), 62 parked with three tier rows each, 4 matched then reverted (below), 14 not attempted (below). Each match is its own commit. Start commit 4f645d246; fw status and progress matched the expected numbers.

| Function | Bytes | Tier | What earlier attempts got wrong |
|---|---:|---|---|
| `func_02007104` | 160 | default | register order: declaration order of the five locals (sweep of all 120 orders) |
| `func_0200f01c` | 40 | default | hand bit masks; three bitfield assignments give the bic/orr/bic |
| `func_0201904c` | 60 | default | u16 add-with-clamp written as masks; a 16-bit bitfield matches |
| `func_020138b8` | 196 | default | `if (n > 0)` folds to beq; `for (; i < n; i++)` keeps the unsigned bls |
| `func_020198ec` | 84 | default | table stride 7 (struct size), and `r = f(); r += t;` for add operand order |
| `func_0201a498` | 68 | default | bit-10 test as a bitfield member plus `|= 0x400` |
| `func_0201c5b4` | 152 | default | byte loop is a 38-byte struct copy, not a hand loop |
| `func_0201ff2c` | 108 | default | callee takes u16 arguments; declaring them so gives the stm |

Four more matched byte-for-byte (`func_02027048`, `02023f7c`, `02006a38`, `02024024`, 588 B) using the existing `data_..._alias` symbols for the second pool word. The reference check fails them as NEW wrong-target (built `_alias`, original plain name), so I reverted them to .s. Their C is on branch `worker/batch-16-alias-matches` (commit 1cde51e5b). Their shipped ledger rows remain; I could not append a revert row (park_one rejects a parked row at 100, and writing one another way was blocked). Brain decides.

## Checked

- `fastmatch.py eur` on the 12 matched files: 12 x 100.0% OK, exit 0 (the 8 kept were re-checked after the revert build).
- `check_delink_dupes.py`: OK, exit 0. `validate_attempts.py`: exit 0, errors 0, no earlier row changed. `check_fake_matches.py`: OK.
- `gate3.py --scope all --log ../gate-batch-16.log`, not piped: `[eur]`, `[usa]`, `[jpn]` SHA1 PASS, 1330 passed, no SKIP, but `GATE FAIL`, last line `gate3: GATE EXIT 1`, from one STALE baseline line only: `eur	src/main/func_0201c5b4.s	wrong-target	.text+0x94 original ABS32 data_020b5a66+0x0 built ABS32 data_020b59e0+0x86`. Brain deletes it in the merge branch. (An earlier gate with the four alias matches also listed four NEW lines; that is why they were reverted.)

## Not checked

Verifier review; USA and JPN ports of the 8 matches; tiers legacy and sp3 for the matched files beyond the first passing tier.

## Failed or blocked

Not attempted: `Div`, `Mod`, `BitUnPack`, `GetCRC16`, `IsDebugger`, `SoftReset`, `VBlankIntrWait`, two `...UnComp...` thunks (4-6 B SWI stubs); `func_02000950`, `02000a78`, `020009fc` (cp15 mcr/mrc, no honest C). `func_02020ff8` is three functions in one block (two infinite-loop stubs plus a 3rd at 0x02021018); not converted, needs splitting by Brain.

C-32: `func_0201bf80`, `0201c1bc`, `0201c1e0`, `0201c224` differ only in the hand-encoded bl (targets 0x021b3128, 0x021b3004, 0x021b3130, 0x021b3114): 92-97% once named; they need symbols in `symbols.txt` (not mine to edit). `func_02021b38/21c30/23478/234f8/244e8/24574/0200ac60` need a second symbol for their duplicate pool word (`data_02197434`, `data_0219a8dc`, `data_0219a8ec`, `data_02186a58` have no alias). Recurring unexplained: a dead `movs r0,#0` after a conditional call (`func_0201f7f0`, `0201f874`, `02020a24`).

| Function | B | default | sp3 | legacy | Residue |
|---|---:|---:|---:|---:|---|
| `0x02000cc4` | 72 | 55.6 | 55.6 | 31.6 | reg-alloc-instr-scheduling / entry-table |
| `0x02000d0c` | 64 | 87.5 | 87.5 | 52.9 | reg-alloc-instr-scheduling / entry-table |
| `0x02000d4c` | 80 | 0.0 | 0.0 | 0.0 | reg-alloc-instr-scheduling / entry-table |
| `0x02001e5c` | 40 | 40.0 | 8.3 | 8.3 | reg-alloc-instr-scheduling / small-dispatch |
| `0x020054a4` | 76 | 55.0 | 33.3 | 31.8 | reg-alloc-instr-scheduling / stack-buf-call-return |
| `0x020055b4` | 240 | 1.7 | 1.7 | 1.7 | constant-materialization / bitfield-counter-callback |
| `0x020059b0` | 176 | 17.4 | 0.0 | 0.0 | reg-alloc / binary-search-callback |
| `0x02005a60` | 216 | 0.0 | 5.6 | 5.6 | reg-alloc / sorted-array-dedupe |
| `0x02005dac` | 116 | 3.5 | 3.5 | 16.7 | reg-alloc / pool-alloc |
| `0x020061bc` | 108 | 81.5 | 2.9 | 2.9 | reg-alloc-instr-scheduling / popcount |
| `0x02006524` | 132 | 3.0 | 35.3 | 31.4 | address-fold / system-tick-forwarder |
| `0x02007f38` | 32 | 0.0 | 0.0 | 0.0 | constant-materialization / constant-builder |
| `0x02009968` | 256 | 46.9 | 15.6 | 9.6 | reg-alloc-instr-scheduling / state-machine-table |
| `0x02009dec` | 176 | 15.9 | 44.4 | 30.4 | reg-alloc-instr-scheduling / random-table-loop |
| `0x0200ac60` | 172 | 0.0 | 4.3 | 2.0 | C-34 / dup-pool-data_02186a58 |
| `0x0200edb8` | 240 | 51.6 | 48.4 | 14.1 | reg-alloc-instr-scheduling / object-init |
| `0x02010354` | 180 | 6.7 | 10.9 | 0.0 | address-fold / allocator-walk |
| `0x02011620` | 104 | 0.0 | 0.0 | 0.0 | reg-alloc-instr-scheduling / rotation-matrix |
| `0x02011688` | 100 | 72.0 | 72.0 | 72.0 | reg-alloc-instr-scheduling / rotation-matrix |
| `0x020116ec` | 96 | 70.8 | 20.0 | 20.0 | reg-alloc-instr-scheduling / rotation-matrix |
| `0x02012454` | 80 | 50.0 | 0.0 | 0.0 | reg-alloc-instr-scheduling / table-record |
| `0x020124a4` | 80 | 85.0 | 0.0 | 0.0 | reg-alloc-instr-scheduling / table-record |
| `0x020124f4` | 108 | 77.8 | 0.0 | 0.0 | reg-alloc-instr-scheduling / table-record |
| `0x020125ac` | 112 | 71.4 | 3.3 | 3.2 | reg-alloc-instr-scheduling / sysinit-store-block |
| `0x02019a58` | 116 | 6.7 | 17.2 | 13.3 | reg-alloc-instr-scheduling / lcg-or-formula |
| `0x0201a044` | 116 | 17.2 | 17.2 | 17.2 | reg-alloc-instr-scheduling / lcg-or-formula |
| `0x0201a134` | 60 | 40.0 | 0.0 | 0.0 | reg-alloc-instr-scheduling / flag-set-and-lookup |
| `0x0201a9d0` | 208 | 26.4 | 5.7 | 5.5 | reg-alloc-instr-scheduling / lcg-printf |
| `0x0201b504` | 204 | 43.1 | 17.6 | 17.6 | reg-alloc-instr-scheduling / list-apply-bitfields |
| `0x0201bf80` | 52 | 92.3 | 92.3 | 78.6 | C-32 / cross-overlay-call-wrapper |
| `0x0201c1bc` | 36 | 88.9 | 88.9 | 70.0 | C-32 / cross-overlay-call-wrapper |
| `0x0201c1e0` | 68 | 17.6 | 55.6 | 52.6 | C-32 / cross-overlay-call-wrapper |
| `0x0201c224` | 132 | 97.0 | 0.0 | 0.0 | C-32 / cross-overlay-call-wrapper |
| `0x0201ce94` | 192 | 91.7 | 6.0 | 3.7 | reg-alloc-instr-scheduling / ring-buffer-dispatch |
| `0x0201d620` | 148 | 18.9 | 10.5 | 2.5 | reg-alloc-instr-scheduling / byte-reverse-record-search |
| `0x0201e5b8` | 180 | 53.3 | 4.3 | 4.2 | reg-alloc-instr-scheduling / fourcc-chunk-scan-loop |
| `0x0201f4d4` | 148 | 15.8 | 43.2 | 18.2 | reg-alloc-instr-scheduling / state-gate-six-arg-call |
| `0x0201f7f0` | 132 | 12.1 | 12.1 | 20.6 | reg-alloc-instr-scheduling / syswork-position-init |
| `0x0201f874` | 224 | 36.2 | 0.0 | 0.0 | reg-alloc-instr-scheduling / state-machine-call |
| `0x02020130` | 88 | 90.9 | 0.0 | 0.0 | reg-alloc-instr-scheduling / state-machine-call |
| `0x02020490` | 192 | 59.2 | 18.4 | 7.7 | reg-alloc-instr-scheduling / state-machine-call |
| `0x02020814` | 76 | 89.5 | 4.8 | 4.5 | reg-alloc-instr-scheduling / struct-reset-bool-return |
| `0x02020a24` | 256 | 10.9 | 15.9 | 15.3 | reg-alloc-instr-scheduling / callback-dispatch |
| `0x02020ba0` | 244 | 11.5 | 1.3 | 1.1 | reg-alloc-instr-scheduling / dispatch-switch |
| `0x02021b38` | 116 | 3.5 | 6.9 | 6.7 | C-34 / pool-alias-missing-symbol |
| `0x02021c30` | 140 | 5.7 | 13.2 | 12.5 | C-34 / pool-alias-missing-symbol |
| `0x02023188` | 140 | 2.9 | 5.7 | 2.9 | C-34 / pool-alias-missing-symbol |
| `0x02023478` | 128 | 0.0 | 3.1 | 9.4 | C-34 / dup-pool-data_0219a8dc |
| `0x020234f8` | 124 | 38.7 | 14.3 | 13.5 | C-34 / dup-pool-data_0219a8dc |
| `0x02023d88` | 208 | 1.8 | 32.7 | 32.1 | reg-alloc-instr-scheduling / struct-copy-init |
| `0x020244e8` | 116 | 17.2 | 17.2 | 13.3 | C-34 / pool-or-bitfield |
| `0x02024574` | 116 | 34.5 | 15.2 | 14.3 | C-34 / pool-or-bitfield |
| `0x020264f0` | 244 | 16.4 | 9.8 | 9.8 | reg-alloc-instr-scheduling / pool-or-bitfield |
| `0x02026e38` | 160 | 47.6 | 39.5 | 39.5 | reg-alloc-instr-scheduling / pool-or-bitfield |
| `0x02029b6c` | 196 | 32.6 | 0.0 | 0.0 | reg-alloc-instr-scheduling / small-dispatch |
| `0x02029c80` | 192 | 83.3 | 83.3 | 79.6 | reg-alloc-instr-scheduling / small-dispatch |
| `0x0202b12c` | 124 | 83.9 | 71.0 | 59.4 | reg-alloc-instr-scheduling / string-copy-substitute-token |
| `0x0202ba38` | 92 | 30.4 | 30.4 | 54.2 | reg-alloc-instr-scheduling / nibble-bit-set |
| `0x0202bc38` | 76 | 52.6 | 5.3 | 0.0 | reg-alloc-instr-scheduling / nibble-bit-set |
| `0x0202be4c` | 176 | 45.5 | 47.7 | 37.8 | reg-alloc-instr-scheduling / pool-alloc-stream-open |
| `0x0202befc` | 148 | 26.3 | 21.1 | 20.5 | reg-alloc-instr-scheduling / pool-alloc-stream-open |
| `0x0202c0c0` | 236 | 3.3 | 76.3 | 0.0 | reg-alloc-instr-scheduling / pool-alloc-stream-open |

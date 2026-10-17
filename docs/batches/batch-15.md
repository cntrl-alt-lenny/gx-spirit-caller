# Batch 15: Worker summary

Re-sweep of the 69 EUR main functions of 256 bytes or less in
0x02080000-0x0208ffff that were still `.s`. Base `4f645d246` (`fw.py status`
told me to ask Brain about brain/pr-1651; nothing else). Start state
`progress.py --version eur`: Natural-C 484,274 B. Last code commit before this
file: `672e13c16`.

## Done

41 functions, 5,116 B, one commit each (the park rows came in one commit),
100% by `fastmatch`. Natural-C is now 489,390 B: +5,116 B, equal to the
matched sizes. The three leads from batch-11-review-2 and the four
batch-11 leads all matched. Most earlier parks were a wrong tier or a callee
with more arguments than declared. MMIO reads use `volatile` casts on the
hardware addresses (no volatile locals, no asm, no pins).

| Function | Bytes | Tier | What earlier attempts got wrong |
|---|---|---|---|
| 020805b0 | 92 | sp3 | decl order (xa/ya after xb/yb); acc += form |
| 02080670 | 184 | sp3 | decl order (xEnd,yEnd,x,y); hoisted row ptr |
| 02081ae0 | 104 | sp3 | branch polarity; cur loaded first, unsigned |
| 02081d18 | 180 | sp3 | for-loop + i*16; mla operand order |
| 0208226c | 52 | sp3 | wrong tier (sp3) |
| 02082fcc | 224 | sp3 | wrong tier (sp3) |
| 0208428c | 212 | sp3 | wrong tier (sp3) |
| 02084dc0 | 76 | sp3 | tier ok; 1.2 do-while with ~0x40 mask |
| 02085e74 | 212 | sp3 | wrong tier; decl order |
| 02086848 | 132 | sp3 | wrong tier; second term hoisted |
| 020868cc | 244 | sp3 | wrong tier; 64-bit term order |
| 02087348 | 68 | legacy | wrong tier (legacy) |
| 02087444 | 128 | sp3 | wrong tier (sp3) |
| 0208771c | 116 | sp3 | func_02087790 takes arg |
| 020879a4 | 88 | sp3 | func_020950d4 takes 3rd arg (f1c) |
| 02088874 | 244 | sp3 | callees take args; ok flag |
| 02089418 | 200 | sp3 | for-loop, wrong tier |
| 020899c0 | 196 | sp3 | wrong tier; stack slot order |
| 02089f60 | 160 | sp3 | func_020897fc 5 args |
| 0208a5e4 | 160 | sp3 | wrong tier; decl order |
| 0208a728 | 60 | sp3 | callee takes o |
| 0208a764 | 100 | default | callee takes o; bitfield |
| 0208b000 | 64 | legacy | wrong tier (legacy) |
| 0208bed8 | 60 | legacy | wrong tier; 64-bit volatile read |
| 0208bfc4 | 136 | legacy | wrong tier; term order |
| 0208c2e0 | 104 | legacy | wrong tier; term order |
| 0208c8cc | 116 | legacy | 0.0 rows were not real scores |
| 0208ddec | 96 | legacy | wrong tier, volatile MMIO reads |
| 0208de4c | 72 | legacy | wrong tier, volatile MMIO |
| 0208de94 | 88 | legacy | wrong tier, volatile MMIO |
| 0208df94 | 128 | legacy | unsigned shift cast |
| 0208e014 | 140 | legacy | unsigned shift cast |
| 0208e0a0 | 128 | legacy | unsigned shift cast |
| 0208e120 | 140 | legacy | unsigned shift cast |
| 0208e5ec | 48 | legacy | wrong tier |
| 0208e6ac | 84 | legacy | inverted if/else lets mwcc predicate |
| 0208e890 | 136 | legacy | wrong tier |
| 0208f1c4 | 76 | legacy | func_02093dc8 takes arg |
| 0208f2a8 | 76 | legacy | func_02093dc8 takes arg |
| 0208f4c8 | 100 | legacy | func_02093dc8 takes arg |
| 0208ffec | 92 | legacy | wrong tier; 4-arg callee |

## Checked

| Command | Exit | Output |
|---|---|---|
| `fastmatch.py eur` on the 41 new `.c` | 0 | 41 lines `100.0%  OK` |
| `check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `validate_attempts.py` | 0 | no errors; `git diff` shows 0 removed ledger lines |
| `check_fake_matches.py` | 0 | `OK` |
| `gate3.py --scope all --log ../gate-batch-15.log` | 1 | `[eur]`, `[usa]`, `[jpn]` `SHA1 PASS`; `1330 passed, 15 skipped`; `GATE FAIL`; `gate3: GATE EXIT 1` |
| `progress.py --version eur` | 0 | Natural-C 489,390 (was 484,274) |

The gate fails only on the references check, one STALE baseline line for the
`.s` I replaced. Brain should delete this exact line from
`tools/reference_baseline.txt` in the merge branch:
`[eur] src/main/func_02081ae0.s: missing-reloc at .text+0x4c original PC24 .text-0x8 built none`
(the log's own wording; the file's line format is the one `--prune-baseline`
writes). Nothing else in the gate failed.

## Not checked

The gate ran once, on the final tree; I did not re-run it after deleting the
STALE line. Intermediate commits (made by a helper that stages all of
`src/main`) briefly route unmatched drafts for functions parked later; the
final tree does not. Thumb `#pragma thumb on` drafts were tried for the two
Thumb functions only in that form.

## Failed or blocked

28 functions parked, one ledger row per tier (84 rows). `func_02081498`
needs the `clz` instruction and mwcc has no intrinsic for it (`__clz`,
`__builtin_clz` compile as calls), so it cannot be honest C.

| Function | Bytes | def / sp3 / leg best | Residue |
|---|---|---|---|
| 02081498 | 256 | 1.56 / 2.94 / 2.86 | needs clz; no intrinsic in mwcc (__clz is a call) |
| 02082494 | 112 | 28.57 / 46.43 / 41.38 | r7/r6/r4/r8 shifted one slot; constant 1 kept in r8 |
| 02084218 | 116 | 0.0 / 65.52 / 56.67 | same code, r2/r3/ip permuted |
| 02084360 | 128 | 43.75 / 53.12 / 45.45 | same code, flags r5 vs r3 |
| 020858cc | 192 | 0.0 / 91.67 / 87.76 | same code, a/w load regs swapped |
| 02086d70 | 212 | 0.0 / 79.25 / 75.93 | r4/r5/r6 order of three live values |
| 02087c34 | 180 | 64.44 / 73.33 / 52.17 | counter/pointer reg swap, ldr order |
| 020886a0 | 256 | 0.0 / 75.0 / 58.46 | reg-alloc cascade |
| 020896cc | 124 | 87.1 / 87.1 / 20.59 | zero kept in ip, not r1 |
| 02089864 | 188 | 61.7 / 74.47 / 70.83 | reg numbering (o=r8 vs r9) |
| 02089a84 | 224 | 0.0 / 22.81 / 16.13 | o/idx regs shifted, ent computed before call |
| 0208aa50 | 72 | 11.11 / 11.11 / 11.11 | orig keeps i and half in r4/r5; mwcc picks lr |
| 0208b1ac | 28 | 21.43 / 13.33 / 13.33 | Thumb; zero in r3 vs r2 |
| 0208b1c8 | 24 | 0.0 / 0.0 / 0.0 | Thumb stmia bursts, mwcc emits none |
| 0208be9c | 60 | 0.0 / 60.0 / 60.0 | reg of constant 1 (r3 vs r2) |
| 0208bf3c | 80 | 0.0 / 30.0 / 90.0 | pool address load placed before strh |
| 0208c348 | 156 | 0.0 / 66.67 / 71.79 | input-load registers |
| 0208c844 | 64 | 18.75 / 18.75 / 18.75 | original re-reads *p; mine reuses |
| 0208c940 | 76 | 21.05 / 73.68 / 73.68 | pool address regs swapped |
| 0208cfa4 | 140 | 0.0 / 57.14 / 85.71 | r2/r3/ip permutation |
| 0208d030 | 140 | 0.0 / 57.14 / 85.71 | r2/r3/ip permutation |
| 0208d204 | 184 | 10.87 / 63.04 / 84.78 | r2/r3/ip permutation |
| 0208df0c | 52 | 53.85 / 53.85 / 53.85 | and/lsl order (interleave) |
| 0208df60 | 52 | 53.85 / 53.85 / 53.85 | and/lsl order (interleave) |
| 0208e1cc | 52 | 53.85 / 53.85 / 53.85 | and/lsl order (interleave) |
| 0208e220 | 52 | 53.85 / 53.85 / 53.85 | and/lsl order (interleave) |
| 0208fd30 | 96 | 29.17 / 29.17 / 37.5 | 0x6600000 hoisted to ip in orig, folded in mine |
| 0208fd90 | 96 | 29.17 / 29.17 / 29.17 | 0x6400000 hoisted to ip in orig, folded in mine |

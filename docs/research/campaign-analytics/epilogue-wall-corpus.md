# Epilogue-shape wall corpus

Queue item: q-epilogue-corpus (2026-07-22). This is a mechanical EUR-baseline census for the CC cm-epilogue-wall lane. It covers src/main/*.s and src/overlay*/*.s; USA/JPN mirror trees are excluded so the same baseline function is not counted three times.

## Signature

A hit has the brief-661 prologue stmfd sp!, {lr} followed by sub sp, sp, #4, and one of these exact epilogues:

- Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr.
- Style B: add sp, sp, #4; ldmfd sp!, {pc}.

The census scans function bodies, not just filenames. Sizes come from EUR symbols.txt; routing is determined by a same-stem .c, .legacy.c, .legacy_sp3.c, or .thumb.c file. assembly-only (.s) means no C routing tier currently exists. This is a shape corpus, not a claim that every hit is a close match or that the epilogue is its only divergence.

## Counts

```text
ROWS 205
A 112 B 93 BOTH 0
```

| Epilogue style | Assembly-only (.s) | plain .c | .legacy.c | .legacy_sp3.c | .thumb.c | Total |
|---|---:|---:|---:|---:|---:|---:|
| Style A | 112 | 0 | 0 | 0 | 0 | 112 |
| Style B | 93 | 0 | 0 | 0 | 0 | 93 |
| Both styles in one function | 0 | 0 | 0 | 0 | 0 | 0 |

## Full corpus

| Address | Module | Source | Size | Exact epilogue sequence | Current routing tier |
|---|---|---|---:|---|---|
| 0203c7d0 | main | src/main/func_0203c7d0.s | 0x44 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0203cb40 | main | src/main/func_0203cb40.s | 0x50 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0203cbc0 | main | src/main/func_0203cbc0.s | 0x98 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0203db24 | main | src/main/func_0203db24.s | 0x4c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0203db70 | main | src/main/func_0203db70.s | 0xa0 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0203ee94 | main | src/main/func_0203ee94.s | 0x4c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0203ef68 | main | src/main/func_0203ef68.s | 0x38 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0204033c | main | src/main/func_0204033c.s | 0x40 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 020403d4 | main | src/main/func_020403d4.s | 0xa4 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02043250 | main | src/main/func_02043250.s | 0x80 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0204550c | main | src/main/func_0204550c.s | 0x58 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0204559c | main | src/main/func_0204559c.s | 0x7c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02045678 | main | src/main/func_02045678.s | 0xcc | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02045744 | main | src/main/func_02045744.s | 0x94 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 020457d8 | main | src/main/func_020457d8.s | 0x50 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 020458d8 | main | src/main/func_020458d8.s | 0x64 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02045cb8 | main | src/main/func_02045cb8.s | 0x48 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02046658 | main | src/main/func_02046658.s | 0x3c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02046770 | main | src/main/func_02046770.s | 0x74 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 020469d0 | main | src/main/func_020469d0.s | 0x4c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02046a5c | main | src/main/func_02046a5c.s | 0x68 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02046ae0 | main | src/main/func_02046ae0.s | 0x5c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02046ba8 | main | src/main/func_02046ba8.s | 0xb8 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0204717c | main | src/main/func_0204717c.s | 0x28c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02047408 | main | src/main/func_02047408.s | 0x174 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02048050 | main | src/main/func_02048050.s | 0x64 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02048124 | main | src/main/func_02048124.s | 0x118 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 020490dc | main | src/main/func_020490dc.s | 0x44 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02049430 | main | src/main/func_02049430.s | 0x124 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02049910 | main | src/main/func_02049910.s | 0x80 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0204bd8c | main | src/main/func_0204bd8c.s | 0x38 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0204bf00 | main | src/main/func_0204bf00.s | 0x44 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0204c1e0 | main | src/main/func_0204c1e0.s | 0x1a4 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0204f280 | main | src/main/func_0204f280.s | 0x90 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0205000c | main | src/main/func_0205000c.s | 0x48 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02051e38 | main | src/main/func_02051e38.s | 0x5c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02051ec0 | main | src/main/func_02051ec0.s | 0x5c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02052674 | main | src/main/func_02052674.s | 0x44 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02052ecc | main | src/main/func_02052ecc.s | 0x38 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02054a30 | main | src/main/func_02054a30.s | 0xa0 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02054c0c | main | src/main/func_02054c0c.s | 0x24 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02054c78 | main | src/main/func_02054c78.s | 0x30 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02055330 | main | src/main/func_02055330.s | 0x5c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0205538c | main | src/main/func_0205538c.s | 0x94 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02055654 | main | src/main/func_02055654.s | 0x74 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 020556c8 | main | src/main/func_020556c8.s | 0x70 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02055a18 | main | src/main/func_02055a18.s | 0x6c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02055c04 | main | src/main/func_02055c04.s | 0x6c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02055f84 | main | src/main/func_02055f84.s | 0x68 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02055fec | main | src/main/func_02055fec.s | 0x4c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02056068 | main | src/main/func_02056068.s | 0x40 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0205bd58 | main | src/main/func_0205bd58.s | 0x60 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02060f50 | main | src/main/func_02060f50.s | 0x8c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 020620d8 | main | src/main/func_020620d8.s | 0x40 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02062118 | main | src/main/func_02062118.s | 0x4c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02063548 | main | src/main/func_02063548.s | 0xd8 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02063620 | main | src/main/func_02063620.s | 0x44 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02063ca4 | main | src/main/func_02063ca4.s | 0x124 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02063e78 | main | src/main/func_02063e78.s | 0x58 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02064d88 | main | src/main/func_02064d88.s | 0x28 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0206588c | main | src/main/func_0206588c.s | 0xa8 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02065e40 | main | src/main/func_02065e40.s | 0x38 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02066ea0 | main | src/main/func_02066ea0.s | 0x40 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0206803c | main | src/main/func_0206803c.s | 0x90 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 020685c8 | main | src/main/func_020685c8.s | 0x60 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02068bb8 | main | src/main/func_02068bb8.s | 0x50 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0206b1f8 | main | src/main/func_0206b1f8.s | 0x60 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0206baec | main | src/main/func_0206baec.s | 0x7c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0206c010 | main | src/main/func_0206c010.s | 0x64 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0206da98 | main | src/main/func_0206da98.s | 0x40 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0206e174 | main | src/main/func_0206e174.s | 0x74 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0206e4a4 | main | src/main/func_0206e4a4.s | 0x48 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0206eb08 | main | src/main/func_0206eb08.s | 0x44 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0206eecc | main | src/main/func_0206eecc.s | 0x40 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207039c | main | src/main/func_0207039c.s | 0x94 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207092c | main | src/main/func_0207092c.s | 0x54 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02070a38 | main | src/main/func_02070a38.s | 0x88 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02070d34 | main | src/main/func_02070d34.s | 0x5c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207103c | main | src/main/func_0207103c.s | 0x50 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020740c4 | main | src/main/func_020740c4.s | 0x60 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207445c | main | src/main/func_0207445c.s | 0x3c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02077954 | main | src/main/func_02077954.s | 0x84 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02077ab4 | main | src/main/func_02077ab4.s | 0x38 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02078d30 | main | src/main/func_02078d30.s | 0x58 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02079ac4 | main | src/main/func_02079ac4.s | 0x48 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02079c74 | main | src/main/func_02079c74.s | 0x4c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02079ddc | main | src/main/func_02079ddc.s | 0x44 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207a1dc | main | src/main/func_0207a1dc.s | 0x158 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207a458 | main | src/main/func_0207a458.s | 0xec | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207a7d4 | main | src/main/func_0207a7d4.s | 0x94 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207ab68 | main | src/main/func_0207ab68.s | 0x30c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207ae74 | main | src/main/func_0207ae74.s | 0xb4 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207af28 | main | src/main/func_0207af28.s | 0x78 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207be90 | main | src/main/func_0207be90.s | 0x38 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207c934 | main | src/main/func_0207c934.s | 0x5c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207cd34 | main | src/main/func_0207cd34.s | 0x48 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207cd7c | main | src/main/func_0207cd7c.s | 0x54 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207cdd0 | main | src/main/func_0207cdd0.s | 0x80 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207ce90 | main | src/main/func_0207ce90.s | 0x98 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0207cff4 | main | src/main/func_0207cff4.s | 0x68 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0207d05c | main | src/main/func_0207d05c.s | 0x74 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0207d0d0 | main | src/main/func_0207d0d0.s | 0x5c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0207d12c | main | src/main/func_0207d12c.s | 0x60 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0207d494 | main | src/main/func_0207d494.s | 0x3c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0207d4dc | main | src/main/func_0207d4dc.s | 0x44 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0207dab4 | main | src/main/func_0207dab4.s | 0x40 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0207db00 | main | src/main/func_0207db00.s | 0x44 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0207ef90 | main | src/main/func_0207ef90.s | 0xcc | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 020800b8 | main | src/main/func_020800b8.s | 0x5c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02080114 | main | src/main/func_02080114.s | 0x58 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 020801ac | main | src/main/func_020801ac.s | 0xd4 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02080cdc | main | src/main/func_02080cdc.s | 0x5c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02082138 | main | src/main/func_02082138.s | 0x60 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02082198 | main | src/main/func_02082198.s | 0x4c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 020822f0 | main | src/main/func_020822f0.s | 0x3c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02084fe0 | main | src/main/func_02084fe0.s | 0x74 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0208541c | main | src/main/func_0208541c.s | 0x44 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02085460 | main | src/main/func_02085460.s | 0x44 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02086e44 | main | src/main/func_02086e44.s | 0x5c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0208725c | main | src/main/func_0208725c.s | 0xa0 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02087df4 | main | src/main/func_02087df4.s | 0x38 | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02087e54 | main | src/main/func_02087e54.s | 0x3c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0208822c | main | src/main/func_0208822c.s | 0x3c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 02088d8c | main | src/main/func_02088d8c.s | 0x4c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0208a728 | main | src/main/func_0208a728.s | 0x3c | Style B: add sp, sp, #4; ldmfd sp!, {pc} | assembly-only (.s) |
| 0208bf3c | main | src/main/func_0208bf3c.s | 0x50 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208c8cc | main | src/main/func_0208c8cc.s | 0x74 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208c98c | main | src/main/func_0208c98c.s | 0x48 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208cfa4 | main | src/main/func_0208cfa4.s | 0x8c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208d030 | main | src/main/func_0208d030.s | 0x8c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208d0bc | main | src/main/func_0208d0bc.s | 0x7c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208d138 | main | src/main/func_0208d138.s | 0xac | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208d204 | main | src/main/func_0208d204.s | 0xb8 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208d2bc | main | src/main/func_0208d2bc.s | 0x140 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208d3fc | main | src/main/func_0208d3fc.s | 0xf4 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208d4f0 | main | src/main/func_0208d4f0.s | 0x204 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208d6f4 | main | src/main/func_0208d6f4.s | 0xb8 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208d7ac | main | src/main/func_0208d7ac.s | 0x114 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208d8c0 | main | src/main/func_0208d8c0.s | 0x16c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208da2c | main | src/main/func_0208da2c.s | 0x2b8 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208e85c | main | src/main/func_0208e85c.s | 0x34 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208e890 | main | src/main/func_0208e890.s | 0x88 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208e918 | main | src/main/func_0208e918.s | 0x15c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208f1c4 | main | src/main/func_0208f1c4.s | 0x4c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208f2a8 | main | src/main/func_0208f2a8.s | 0x4c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208f38c | main | src/main/func_0208f38c.s | 0x58 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208f458 | main | src/main/func_0208f458.s | 0x70 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208f4c8 | main | src/main/func_0208f4c8.s | 0x64 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0208f5ac | main | src/main/func_0208f5ac.s | 0x104 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02090048 | main | src/main/func_02090048.s | 0x58 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02090114 | main | src/main/func_02090114.s | 0x48 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209015c | main | src/main/func_0209015c.s | 0x70 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020905dc | main | src/main/func_020905dc.s | 0x48 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020915e4 | main | src/main/func_020915e4.s | 0x68 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02091c44 | main | src/main/func_02091c44.s | 0x44 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209295c | main | src/main/func_0209295c.s | 0x50 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02092a5c | main | src/main/func_02092a5c.s | 0xec | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02092b48 | main | src/main/func_02092b48.s | 0x130 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02092ca0 | main | src/main/func_02092ca0.s | 0x80 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02092d20 | main | src/main/func_02092d20.s | 0x118 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02092fa8 | main | src/main/func_02092fa8.s | 0x6c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02093160 | main | src/main/func_02093160.s | 0x88 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020931f8 | main | src/main/func_020931f8.s | 0x9c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209362c | main | src/main/func_0209362c.s | 0x58 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02093720 | main | src/main/func_02093720.s | 0x70 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020938f8 | main | src/main/func_020938f8.s | 0x44 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209413c | main | src/main/func_0209413c.s | 0x40 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209423c | main | src/main/func_0209423c.s | 0x74 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02094fe4 | main | src/main/func_02094fe4.s | 0x4c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020952f8 | main | src/main/func_020952f8.s | 0x4c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02095b68 | main | src/main/func_02095b68.s | 0x60 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02096358 | main | src/main/func_02096358.s | 0xb4 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02097004 | main | src/main/func_02097004.s | 0x38 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209703c | main | src/main/func_0209703c.s | 0x38 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02097154 | main | src/main/func_02097154.s | 0x64 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02097d60 | main | src/main/func_02097d60.s | 0x64 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 02098628 | main | src/main/func_02098628.s | 0x90 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209aa84 | main | src/main/func_0209aa84.s | 0xf0 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209af84 | main | src/main/func_0209af84.s | 0x90 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209b050 | main | src/main/func_0209b050.s | 0x68 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209b298 | main | src/main/func_0209b298.s | 0xec | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209b448 | main | src/main/func_0209b448.s | 0x54 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209bb60 | main | src/main/func_0209bb60.s | 0x44 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209bc20 | main | src/main/func_0209bc20.s | 0x44 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209cae4 | main | src/main/func_0209cae4.s | 0x84 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209cd3c | main | src/main/func_0209cd3c.s | 0x68 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209d438 | main | src/main/func_0209d438.s | 0x50 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209d5e4 | main | src/main/func_0209d5e4.s | 0x80 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209d664 | main | src/main/func_0209d664.s | 0x38 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209dc30 | main | src/main/func_0209dc30.s | 0x5c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209dde8 | main | src/main/func_0209dde8.s | 0x74 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 0209e0f0 | main | src/main/func_0209e0f0.s | 0x34 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a1bbc | main | src/main/func_020a1bbc.s | 0x3c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a1e68 | main | src/main/func_020a1e68.s | 0x114 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a26f0 | main | src/main/func_020a26f0.s | 0x94 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a4a94 | main | src/main/func_020a4a94.s | 0xd8 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a53e4 | main | src/main/func_020a53e4.s | 0x74 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a5d74 | main | src/main/func_020a5d74.s | 0x3c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a60fc | main | src/main/func_020a60fc.s | 0x40 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a6170 | main | src/main/func_020a6170.s | 0x80 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a61f0 | main | src/main/func_020a61f0.s | 0x3c | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a66e8 | main | src/main/func_020a66e8.s | 0x38 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a6720 | main | src/main/func_020a6720.s | 0x34 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a6754 | main | src/main/func_020a6754.s | 0x34 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |
| 020a6a94 | main | src/main/func_020a6a94.s | 0x68 | Style A: add sp, sp, #4; ldmfd sp!, {lr}; bx lr | assembly-only (.s) |

## Interpretation boundary

These are source-level .s hits, not proof of compiler equivalence. The three confirmed brief-661 examples are 020458d8 (Style B), 0206eecc (Style A), and 020915e4 (Style A). The corpus lets the CC lane compare frame shape, body shape, and routing tier mechanically before spending compile attempts. Member lists may shift as other agents ship functions.

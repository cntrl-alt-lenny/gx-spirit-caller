# Main small-tier shape reclassification (2026-08-09)

This is a reference reclassification of the existing main small-tier worklist. The original `shape` column is preserved as `shape (current)`; the new `shape (derived)` and `agree` columns are generated from each address's current `.s` body. A worklist row whose `.s` has since been converted or removed is `unclassified`, never guessed.

The worklist contains 1640 rows. Current main has 1247 matching `.s` bodies and 393 rows with no current `.s` body. The classifier agrees on 1218 rows and disagrees on 422 rows: **25.73% overall disagreement** (including missing-body rows). Among rows with a current `.s` body, disagreement is **2.33%**.

## Mechanical rules

Rules are applied in this order:

1. **trivial stub** — one `bx lr`, or a body no larger than 8 bytes with at most two non-directive instructions and no call or branch; no frame setup is present.
2. **softfloat/CLZ** — a direct `clz*` instruction or a call to a recognized compiler float-helper name (`__aeabi_*`, `__flo*`, `__fix*`, `__*sf*`, `sqrtf`, `float`, or `softfloat`). BIOS `Div`/`Sqrt` names are not treated as compiler softfloat helpers.
3. **loop** — a branch target resolves to a label earlier in the same body. Labels are parsed before dot-directive filtering, and `bls`/`ble`/`blt` remain conditional branches rather than being mistaken for calls.
4. **small dispatcher** — a jump-table/PC shape (`tbb`, `tbh`, `ldr/add ...pc`) or at least four branches after excluding unconditional branches whose target is an epilogue return label.
5. **tail-call forwarder** — at most six instructions, one forward `b`, `bl`, or `blx` transfer, and no conditional branch.
6. **guard chain** — one to three conditional branches, no backward edge.
7. **other** — a body with a current `.s` that fits none of the above.
8. **unclassified** — no current `.s` body is available, so structure cannot be observed.

The classifier excludes mandatory epilogue returns from dispatcher branch counts and keeps missing bodies explicit. This is reference classification, not a claim that shape predicts byte-match yield; sweep-3 showed that yield does not carry across rounds.

## Five-row canary

These five rows were hand-classified first by reading their `.s` bodies. The classifier output agrees with every hand classification:

| address | hand classification | classifier | agreement |
| --- | --- | --- | --- |
| `0x02003a4c` | guard chain | guard chain | agree |
| `0x02004ef4` | guard chain | guard chain | agree |
| `0x02006264` | guard chain | guard chain | agree |
| `0x020091f4` | guard chain | guard chain | agree |
| `0x02009a68` | guard chain | guard chain | agree |

## Confusion matrix

| current \ derived | trivial stub | tail-call forwarder | guard chain | small dispatcher | loop | softfloat/CLZ | other | unclassified | total |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| trivial stub | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| tail-call forwarder | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| guard chain | 0 | 0 | 321 | 0 | 0 | 0 | 8 | 186 | 515 |
| small dispatcher | 0 | 0 | 14 | 183 | 0 | 0 | 4 | 45 | 246 |
| loop | 0 | 0 | 0 | 0 | 406 | 2 | 0 | 72 | 480 |
| softfloat/CLZ | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| other | 0 | 0 | 0 | 0 | 0 | 1 | 308 | 90 | 399 |
| unclassified | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| **total** | 0 | 0 | 335 | 183 | 406 | 3 | 320 | 393 | 1640 |

### Current-label reliability

| current label | rows | agreeing | disagreement rate |
| --- | ---: | ---: | ---: |
| trivial stub | 0 | 0 | 0.00% |
| tail-call forwarder | 0 | 0 | 0.00% |
| guard chain | 515 | 321 | 37.67% |
| small dispatcher | 246 | 183 | 25.61% |
| loop | 480 | 406 | 15.42% |
| softfloat/CLZ | 0 | 0 | 0.00% |
| other | 399 | 308 | 22.81% |
| unclassified | 0 | 0 | 0.00% |

The old labels are reliable only where the diagonal is high: the current `loop` and `other` buckets are comparatively stable, while `guard chain` and `small dispatcher` are catch-alls with crossovers. `unclassified` is not a current label; it is the honest missing-body bucket introduced by this reference pass.

## Sweep-3 coordination check

The merged sweep-3 report explicitly records `func_020b007c` as worklist `small dispatcher` and derived `guard chain`; this classifier also derives `guard chain`. Its other explicit canary, `func_02096728`, has no current `.s` after sweep-3 converted it, so this bulk report marks it `unclassified` rather than pretending to independently re-read a body. No alternate rule is introduced for the shared mechanical categories.

## Ten-row body spot check

Each excerpt is the current source body after `;` comment removal; labels are shown next to the exact derived result. The excerpt is capped at 12 instructions plus the final 3 when longer, so the structural evidence is auditable without duplicating every full source file.
### Spot check 1: `0x02003a4c`
Current label: `guard chain`; derived label: `guard chain`; result: `agree`.

```asm
stmdb sp!, {r4, r5, r6, r7, lr}
sub sp, sp, #0xc
mov r7, r0
mov r6, r2
mov r5, r3
cmp r1, #0x80
ldr r4, [sp, #0x24]
bge .L_1c4
ldr ip, [sp, #0x20]
str ip, [sp]
str r4, [sp, #0x4]
bl func_020037d0
...
bl func_02001f18
add sp, sp, #0xc
ldmia sp!, {r4, r5, r6, r7, pc}
```
### Spot check 2: `0x02004ef4`
Current label: `guard chain`; derived label: `guard chain`; result: `agree`.

```asm
stmfd sp!, {lr}
sub sp, sp, #0xc
ldr ip, _LIT0
ldr ip, [ip]
cmp ip, #0x0
beq .L_1098
ldr ip, [sp, #0x10]
ldr lr, [sp, #0x14]
str ip, [sp]
ldr ip, [sp, #0x18]
str lr, [sp, #0x4]
str ip, [sp, #0x8]
...
bl func_020048c0
add sp, sp, #0xc
ldmfd sp!, {pc}
```

### Spot check 3: `0x02006264`
Current label: `guard chain`; derived label: `guard chain`; result: `agree`.

```asm
stmdb sp!, {r3, lr}
ldr r0, _LIT0
ldr r1, [r0, #0x28]
mov r1, r1, lsl #0x1e
movs r1, r1, lsr #0x1f
beq .L_98
ldr r0, [r0, #0x20]
bic r0, r0, #-1073741824
bl func_020061bc
cmp r0, #0x2
blt .L_98
ldr r0, _LIT0
...
ldmltia sp!, {r3, pc}
mov r0, #0x0
ldmia sp!, {r3, pc}
```

### Spot check 4: `0x020091f4`
Current label: `guard chain`; derived label: `guard chain`; result: `agree`.

```asm
stmdb sp!, {r4, r5, r6, lr}
mov r6, r0
mov r5, r1
mov r4, r2
bl func_02008c10
cmp r6, #0x0
beq .L_500
cmp r6, #0x1
beq .L_510
b .L_528
mov r0, r5
mov r1, r4
...
ldmia sp!, {r4, r5, r6, pc}
mov r0, #0x0
ldmia sp!, {r4, r5, r6, pc}
```

### Spot check 5: `0x02009a68`
Current label: `guard chain`; derived label: `guard chain`; result: `agree`.

```asm
stmdb sp!, {r4, lr}
cmp r0, #0x0
ble .L_2b4
ldr r3, _LIT0
sub r2, r0, #0x1
mov r1, #0x1c
mla r4, r2, r1, r3
bl func_02009968
ldrb r0, [r4, #0x19]
cmp r0, #0x1
bne .L_2b4
mov r0, #0x0
...
ldmia sp!, {r4, pc}
mov r0, #0x0
ldmia sp!, {r4, pc}
```

### Spot check 6: `0x0201d47c`
Current label: `guard chain`; derived label: `other`; result: `disagree`.

```asm
stmdb sp!, {r4, lr}
mov r4, r0
mov r1, r4
mov r0, #0x0
mov r2, #0x28
bl func_0209448c
ldr r1, [r4, #0x1c]
mov r0, #0x0
bic r1, r1, #0xff
orr r2, r1, #0x20
bic r1, r2, #0xff00
orr r1, r1, #0x2000
str r1, [r4, #0x1c]
ldmia sp!, {r4, pc}
```

### Spot check 7: `0x02037ca0`
Current label: `guard chain`; derived label: `guard chain`; result: `agree`.

```asm
stmdb sp!, {r4, lr}
ldr r1, [r0, #0x34]
mov r4, #0x0
tst r1, #0x1000000
beq .L_20
mov r4, #0x1
tst r1, #0x2000000
movne r4, #0x2
ldrb r1, [r0, #0x28]
cmp r1, #0x0
moveq r0, #0x0
ldmeqia sp!, {r4, pc}
...
mov r0, r2
bl Div
ldmia sp!, {r4, pc}
```

### Spot check 8: `0x020b007c`
Current label: `small dispatcher`; derived label: `guard chain`; result: `disagree`.

```asm
stmdb sp!, {r0, r1, r2, r3}
stmdb sp!, {r4, lr}
ldr r1, [sp, #0xc]
ldr r0, _LIT0
mov r4, r2
bic r3, r1, #-2147483648
mov r2, #0x0
str r2, [r4]
cmp r3, r0
ldr r0, [sp, #0x8]
bge .L_34
orrs r0, r3, r0
...
ldmia sp!, {r4, lr}
add sp, sp, #0x10
bx lr
```

### Spot check 9: `0x02081498`
Current label: `loop`; derived label: `softfloat/CLZ`; result: `disagree`.

```asm
stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
sub sp, sp, #0x4
ldr fp, _LIT0
mov r9, #0x0
mov sl, #0x3
mvn r7, #0x0
ldr r4, [sp, #0x2c]
ldr r6, [sp, #0x28]
and ip, r3, r7, lsl r4
cmp ip, r1
mov r8, r7, lsl r6
mov r5, r7, lsl r4
...
b .L_18
add sp, sp, #0x4
ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
```

### Spot check 10: `0x020b30e4`
Current label: `loop`; derived label: `softfloat/CLZ`; result: `disagree`.

```asm
and r2, r0, #-2147483648
mov ip, r0, lsr #0x17
mov r3, r0, lsl #0x9
ands ip, ip, #0xff
beq .L_79c
cmp ip, #0xff
beq .L_7c8
add ip, ip, #0x380
mov r0, r3, lsl #0x14
orr r1, r2, r3, lsr #0xc
orr r1, r1, ip, lsl #0x14
bx lr
...
mvn r0, #0x0
bic r1, r0, #-2147483648
bx lr
```

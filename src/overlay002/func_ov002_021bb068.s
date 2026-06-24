; func_ov002_021bb068 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b8c0
        .extern func_0202e234
        .extern func_ov002_021b9ecc
        .global func_ov002_021bb068
        .arm
func_ov002_021bb068:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r7, #0x0
    bl func_0202e234
    cmp r0, #0x0
    beq .L_b4
    mov r6, r7
    mov r8, r6
    mov r4, #0x1
.L_24:
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r6, #0x1
    mla r9, r2, r1, r0
    ldr fp, _LIT2
    mov r5, #0x0
.L_3c:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9ecc
    cmp sl, r0
    bne .L_90
    ldr r3, [r9, #0x40]
    ldrh r0, [r9, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    orr r1, r1, r3, lsr #0x1
    and r2, r2, #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_90
    ldr r1, [fp, #0xd4]
    add r0, r5, r8
    tst r1, r4, lsl r0
    addeq r7, r7, #0x1
.L_90:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r9, r9, #0x14
    blt .L_3c
    add r6, r6, #0x1
    cmp r6, #0x2
    add r8, r8, #0x10
    blt .L_24
    b .L_1e8
.L_b4:
    mov r0, sl
    bl func_0202b8c0
    cmp r0, #0x2
    beq .L_164
    mov r8, r7
    mov r5, r8
    mov r4, #0x1
.L_d0:
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r8, #0x1
    mla r0, r2, r1, r0
    ldr fp, _LIT2
    mov r9, #0x5
    add r6, r0, #0x64
.L_ec:
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b9ecc
    cmp sl, r0
    bne .L_140
    ldr r3, [r6, #0x40]
    ldrh r0, [r6, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    orr r1, r1, r3, lsr #0x1
    and r2, r2, #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_140
    ldr r1, [fp, #0xd4]
    add r0, r9, r5
    tst r1, r4, lsl r0
    addeq r7, r7, #0x1
.L_140:
    add r9, r9, #0x1
    cmp r9, #0xa
    add r6, r6, #0x14
    blt .L_ec
    add r8, r8, #0x1
    cmp r8, #0x2
    add r5, r5, #0x10
    blt .L_d0
    b .L_1e8
.L_164:
    ldr r6, _LIT1
    ldr r4, _LIT2
    ldr fp, _LIT0
    mov r9, r7
    mov r8, #0xa
    mov r5, #0x1
.L_17c:
    mov r0, r9
    mov r1, #0xa
    bl func_ov002_021b9ecc
    cmp sl, r0
    bne .L_1d8
    and r0, r9, #0x1
    mla r1, r0, fp, r6
    ldr r3, [r1, #0x108]
    add r0, r1, #0x100
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r3, lsr #0x1
    and r1, r1, #0x1
    ldrh r3, [r0]
    mvn r2, r2
    mvn r0, r1
    and r1, r3, r2
    tst r1, r0
    beq .L_1d8
    ldr r0, [r4, #0xd4]
    tst r0, r5, lsl r8
    addeq r7, r7, #0x1
.L_1d8:
    add r9, r9, #0x1
    cmp r9, #0x2
    add r8, r8, #0x10
    blt .L_17c
.L_1e8:
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022d016c

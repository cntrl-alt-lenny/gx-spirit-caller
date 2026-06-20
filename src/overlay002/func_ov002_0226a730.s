; func_ov002_0226a730 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_0202e42c
        .extern func_ov002_021ae484
        .extern func_ov002_021b00d0
        .extern func_ov002_021b4054
        .extern func_ov002_021b9144
        .extern func_ov002_021b9ecc
        .extern func_ov002_021d479c
        .extern func_ov002_021df6d4
        .extern func_ov002_021e276c
        .global func_ov002_0226a730
        .arm
func_ov002_0226a730:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldrh r3, [r0, #0xa2]
    ldr r2, [r1, #0xd9c]
    ldr r8, [r1, #0xd94]
    cmp r2, #0x0
    add r9, r3, #0x1
    ldrh r4, [r0, #0xa0]
    beq .L_268
    cmp r2, #0x1
    beq .L_2f8
    cmp r2, #0x2
    beq .L_3c8
    b .L_408
.L_268:
    cmp r9, #0x0
    mov sl, #0x0
    ble .L_2e0
    mov r0, r4, lsl #0x10
    ldr r6, _LIT2
    mov r4, r0, lsr #0x10
    mov fp, sl
    mov r5, #0x8000
    mov r7, #0x6
.L_28c:
    mov r0, r7
    bl func_ov002_021b00d0
    add r1, r6, sl, lsl #0x1
    add r2, r0, #0x1
    add r0, r1, #0x1d00
    strh r2, [r0, #0xb0]
    cmp r8, #0x0
    movne r2, r5
    add r0, r6, sl, lsl #0x1
    moveq r2, fp
    add r1, r0, #0x1d00
    orr r0, r2, #0x5d
    ldrh r2, [r1, #0xb0]
    mov r0, r0, lsl #0x10
    mov r1, r4
    mov r3, #0x0
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
    add sl, sl, #0x1
    cmp sl, r9
    blt .L_28c
.L_2e0:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2f8:
    ldr r2, _LIT3
    mov r0, r8
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b4054
    cmp r0, #0x0
    beq .L_3c0
    ldr r2, _LIT3
    mov r0, r8
    mov r1, #0xb
    mov r3, #0x2
    bl func_ov002_021b4054
    cmp r0, #0x0
    bne .L_3c0
    ldr r0, _LIT4
    ldr r0, [r0, r8, lsl #0x2]
    cmp r0, #0x1
    bne .L_3a0
    ldr r0, _LIT0
    ldrh r0, [r0, #0xb0]
    cmp r0, #0x3
    movls r5, #0x1
    movhi r5, #0x0
    cmp r4, #0xa
    bgt .L_394
    mov r0, r8
    mov r1, r4
    bl func_ov002_021b9ecc
    mov r4, r0
    bl func_0202e42c
    cmp r0, #0x0
    beq .L_394
    ldr r1, _LIT0
    mov r0, r4
    ldrh r1, [r1, #0xb0]
    bl func_ov002_021b9144
    cmp r0, #0x0
    moveq r5, #0x1
    movne r5, #0x0
.L_394:
    ldr r0, _LIT1
    str r5, [r0, #0xd44]
    b .L_3a8
.L_3a0:
    mov r0, #0x120
    bl func_ov002_021ae484
.L_3a8:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd9c]
    add r2, r2, #0x1
    str r2, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3c0:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3c8:
    ldr r0, [r1, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT3
    mov r0, r8
    bl func_ov002_021df6d4
    ldr r1, _LIT3
    mov r0, r8
    mov r2, #0x2
    mov r3, #0x0
    bl func_ov002_021e276c
    ldr r1, _LIT1
    mov r0, #0x0
    str r0, [r1, #0xd9c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_408:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0e6c
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000016a5
_LIT4: .word data_ov002_022cd744

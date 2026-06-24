; func_ov002_02216b70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_ov002_021ae484
        .extern func_ov002_022013d4
        .extern func_ov002_0226ad5c
        .extern func_ov002_0227db10
        .global func_ov002_02216b70
        .arm
func_ov002_02216b70:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldrh r3, [r0, #0x2]
    ldrh r2, [r0, #0x4]
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    mov r4, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT0
    ldr r3, [r2, #0x5a8]
    sub r3, r3, #0x7d
    cmp r3, #0x3
    addls pc, pc, r3, lsl #0x2
    b .L_2bc
    b .L_290
    b .L_278
    b .L_1c4
    b .L_1b4
.L_1b4:
    mov r0, #0x3
    str r0, [r2, #0x5ac]
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1c4:
    ldr r2, [r2, #0x5ac]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_022013d4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT1
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_268
    ldr r0, _LIT2
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r7, _LIT3
    mov r4, #0x0
    ldr r0, _LIT4
    str r4, [r7, #0xd44]
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_270
    ldr r0, _LIT5
    mov r8, #0x1
    add r6, r0, r1
    add r5, r6, #0x120
    mov r9, r4
.L_230:
    ldr r0, [r5]
    mov r1, r9
    mov r0, r0, lsl #0x13
    mov r2, r9
    mov r0, r0, lsr #0x13
    bl func_ov002_0227db10
    cmp r0, #0x0
    strne r8, [r7, #0xd44]
    ldr r0, [r6, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_230
    b .L_270
.L_268:
    mov r0, #0x28
    bl func_ov002_021ae484
.L_270:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_278:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    movne r0, #0x7d
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_290:
    mov r1, #0x1
    mov r0, r4
    mov r2, r1
    mov r3, #0x0
    bl func_ov002_0226ad5c
    ldr r1, _LIT0
    mov r0, #0x7f
    ldr r2, [r1, #0x5ac]
    sub r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2bc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d016c
_LIT4: .word data_ov002_022cf178
_LIT5: .word data_ov002_022cf16c

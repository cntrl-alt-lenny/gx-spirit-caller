; func_ov002_02241e74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae484
        .extern func_ov002_02202d5c
        .extern func_ov002_0223f684
        .extern func_ov002_02240f88
        .extern func_ov002_022577dc
        .global func_ov002_02241e74
        .arm
func_ov002_02241e74:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r7, r0
    ldr r3, [r2, #0x5b8]
    mov r6, r1
    cmp r3, #0x0
    beq .L_1a0
    cmp r3, #0xa
    beq .L_230
    cmp r3, #0xb
    beq .L_27c
    b .L_294
.L_1a0:
    bl func_ov002_02202d5c
    cmp r0, #0x2
    ldrh r1, [r7, #0x2]
    moveq r5, #0x1
    movne r5, #0x0
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    mov r4, #0x0
    cmp r0, #0x12
    bne .L_1f8
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    ldr r2, [r0]
    cmp r2, r1, lsr #0x1f
    beq .L_1f8
    ldr r0, [r0, #0x4]
    cmp r0, r1, lsr #0x1f
    bne .L_1f8
    mov r0, r7
    bl func_ov002_022577dc
    cmp r0, #0x0
    movne r4, #0x1
.L_1f8:
    cmp r5, #0x0
    cmpne r4, #0x0
    beq .L_218
    ldr r0, _LIT0
    mov r1, #0xa
    str r1, [r0, #0x5b8]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_218:
    cmp r5, #0x0
    movne r0, #0x1
    strneh r0, [r7, #0xa]
    moveq r0, #0x2
    streqh r0, [r7, #0xa]
    b .L_294
.L_230:
    ldrh r1, [r7, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_25c
    ldr r0, _LIT3
    mov r1, #0x2
    str r1, [r0, #0xd44]
    b .L_264
.L_25c:
    ldr r0, _LIT4
    bl func_ov002_021ae484
.L_264:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_27c:
    ldr r0, _LIT3
    mov r1, #0x0
    ldr r0, [r0, #0xd44]
    add r0, r0, #0x1
    strh r0, [r7, #0xa]
    str r1, [r2, #0x5b8]
.L_294:
    ldrh r0, [r7, #0xa]
    cmp r0, #0x1
    beq .L_2ac
    cmp r0, #0x2
    beq .L_2bc
    b .L_2cc
.L_2ac:
    mov r0, r7
    mov r1, r6
    bl func_ov002_02240f88
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2bc:
    mov r0, r7
    mov r1, r6
    bl func_ov002_0223f684
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2cc:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd3f4
_LIT2: .word data_ov002_022cd744
_LIT3: .word data_ov002_022d016c
_LIT4: .word 0x00000109

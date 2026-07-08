; func_ov002_02241d8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_02202c6c
        .extern func_ov002_0223f59c
        .extern func_ov002_02240ea0
        .extern func_ov002_022576f4
        .global func_ov002_02241d8c
        .arm
func_ov002_02241d8c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    mov r7, r0
    ldr r3, [r2, #0x5b8]
    mov r6, r1
    cmp r3, #0x0
    beq .L_30
    cmp r3, #0xa
    beq .L_c0
    cmp r3, #0xb
    beq .L_10c
    b .L_124
.L_30:
    bl func_ov002_02202c6c
    cmp r0, #0x2
    ldrh r1, [r7, #0x2]
    moveq r5, #0x1
    movne r5, #0x0
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    mov r4, #0x0
    cmp r0, #0x12
    bne .L_88
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    ldr r2, [r0]
    cmp r2, r1, lsr #0x1f
    beq .L_88
    ldr r0, [r0, #0x4]
    cmp r0, r1, lsr #0x1f
    bne .L_88
    mov r0, r7
    bl func_ov002_022576f4
    cmp r0, #0x0
    movne r4, #0x1
.L_88:
    cmp r5, #0x0
    cmpne r4, #0x0
    beq .L_a8
    ldr r0, _LIT0
    mov r1, #0xa
    str r1, [r0, #0x5b8]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a8:
    cmp r5, #0x0
    movne r0, #0x1
    strneh r0, [r7, #0xa]
    moveq r0, #0x2
    streqh r0, [r7, #0xa]
    b .L_124
.L_c0:
    ldrh r1, [r7, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_ec
    ldr r0, _LIT3
    mov r1, #0x2
    str r1, [r0, #0xd44]
    b .L_f4
.L_ec:
    ldr r0, _LIT4
    bl func_ov002_021ae3a4
.L_f4:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_10c:
    ldr r0, _LIT3
    mov r1, #0x0
    ldr r0, [r0, #0xd44]
    add r0, r0, #0x1
    strh r0, [r7, #0xa]
    str r1, [r2, #0x5b8]
.L_124:
    ldrh r0, [r7, #0xa]
    cmp r0, #0x1
    beq .L_13c
    cmp r0, #0x2
    beq .L_14c
    b .L_15c
.L_13c:
    mov r0, r7
    mov r1, r6
    bl func_ov002_02240ea0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_14c:
    mov r0, r7
    mov r1, r6
    bl func_ov002_0223f59c
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_15c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd314
_LIT2: .word data_ov002_022cd664
_LIT3: .word data_ov002_022d008c
_LIT4: .word 0x00000109

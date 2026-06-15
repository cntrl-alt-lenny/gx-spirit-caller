; func_ov006_021c5b00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4768
        .extern func_020092c8
        .extern func_0202b0e0
        .extern func_0202b6e4
        .extern func_0202bb20
        .extern func_0202e2f8
        .extern func_020b3870
        .global func_ov006_021c5b00
        .arm
func_ov006_021c5b00:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xf8
    mov sl, r0
    ldr r0, _LIT0
    ldr r1, _LIT1
    add r0, r0, #0x1
    str r0, [sp]
    mov r8, #0x0
    ldr r0, _LIT0
    ldr r1, [r1]
    add r0, r0, #0x2
    mov r4, r8
    mov r5, r8
    mov r6, r8
    mov r7, r8
    str r8, [sl, #0x22c]
    sub fp, r1, #0x1
    str r0, [sp, #0x4]
.L_890:
    add r0, r8, #0x1
    bl func_0202b0e0
    mov r9, r0
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_8f4
    ldr r0, _LIT0
    cmp r9, r0
    ldrne r0, [sp]
    cmpne r9, r0
    ldrne r0, [sp, #0x4]
    cmpne r9, r0
    ldrne r0, _LIT2
    cmpne r9, r0
    mov r0, r9
    bne .L_8e4
    bl func_0202bb20
    cmp r0, #0x0
    addne r7, r7, #0x1
    add r6, r6, #0x1
    b .L_8f4
.L_8e4:
    bl func_0202bb20
    cmp r0, #0x0
    addne r5, r5, #0x1
    add r4, r4, #0x1
.L_8f4:
    add r8, r8, #0x1
    cmp r8, fp
    blt .L_890
    ldr r1, [sl, #0x22c]
    add r2, sl, #0x7c
    mov r0, #0x0
    str r0, [r2, r1, lsl #0x4]
    cmp r4, #0x0
    add r8, r2, r1, lsl #0x4
    beq .L_92c
    mov r0, #0x3e8
    mul r0, r5, r0
    mov r1, r4
    bl func_020b3870
.L_92c:
    str r0, [r8, #0x4]
    add r0, r5, r7
    str r0, [r8, #0x8]
    add r0, r4, r6
    str r0, [r8, #0xc]
    ldr r0, [sl, #0x22c]
    mov r5, #0x0
    add r0, r0, #0x1
    str r0, [sl, #0x22c]
    add fp, sl, #0x7c
    add r4, sp, #0x8
.L_958:
    mov r0, r5
    bl func_020092c8
    cmp r0, #0x0
    beq .L_9e4
    ldr r3, [sl, #0x22c]
    add r0, r5, #0x1
    mov r1, r4
    mov r2, #0x3c
    str r0, [fp, r3, lsl #0x4]
    add r9, fp, r3, lsl #0x4
    bl func_0202b6e4
    mov r7, r0
    mov r8, #0x0
    mov r6, r8
    cmp r7, #0x0
    ble .L_9b4
.L_998:
    ldr r0, [r4, r6, lsl #0x2]
    bl func_0202bb20
    cmp r0, #0x0
    add r6, r6, #0x1
    addne r8, r8, #0x1
    cmp r6, r7
    blt .L_998
.L_9b4:
    cmp r7, #0x0
    moveq r0, #0x0
    beq .L_9d0
    mov r0, #0x3e8
    mul r0, r8, r0
    mov r1, r7
    bl func_020b3870
.L_9d0:
    stmib r9, {r0, r8}
    str r7, [r9, #0xc]
    ldr r0, [sl, #0x22c]
    add r0, r0, #0x1
    str r0, [sl, #0x22c]
.L_9e4:
    add r5, r5, #0x1
    cmp r5, #0x1a
    blt .L_958
    mov r0, #0x1
    add sp, sp, #0xf8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001386
_LIT1: .word data_020b4768
_LIT2: .word 0x00001b7f

; func_ov002_022ac8b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_0202b2e8
        .extern func_0202b824
        .extern func_0202b83c
        .extern func_0202b854
        .extern func_0202b86c
        .extern func_0202b89c
        .extern func_0202b8cc
        .extern func_0202de48
        .extern func_0202e1e0
        .extern func_ov002_022a0fec
        .extern func_ov002_022abe4c
        .extern func_ov002_022ac540
        .extern func_ov002_022ac7b4
        .global func_ov002_022ac8b0
        .arm
func_ov002_022ac8b0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    str r1, [r5, #0x64]
    ldr r0, [r5, #0x4]
    rsb r0, r0, #0x0
    cmp r0, #0x4b
    cmpne r0, #0x4c
    cmpne r0, #0x4d
    bne .L_34
    ldr r0, [r5, #0x70]
    cmp r1, #0x0
    moveq r1, #0x1
    str r0, [r5, #0x68]
.L_34:
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_2a4
    b .L_60
    b .L_94
    b .L_d4
    b .L_130
    b .L_18c
    b .L_1d4
    b .L_214
    b .L_254
.L_60:
    ldr r0, [r5, #0x24]
    mov r2, #0x0
    cmp r0, #0x0
    ble .L_2a4
.L_70:
    ldr r0, [r5, #0x68]
    ldr r1, [r0, r2, lsl #0x2]
    add r0, r0, r2, lsl #0x2
    strh r1, [r0, #0x2]
    ldr r0, [r5, #0x24]
    add r2, r2, #0x1
    cmp r2, r0
    blt .L_70
    b .L_2a4
.L_94:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_2a4
.L_a4:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abe4c
    bl func_0202b2e8
    ldr r1, [r5, #0x68]
    add r1, r1, r4, lsl #0x2
    strh r0, [r1, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_a4
    b .L_2a4
.L_d4:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_2a4
    ldr r6, _LIT0
.L_e8:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abe4c
    mov r8, r0
    bl func_0202b89c
    mov r7, r0
    mov r0, r8
    bl func_0202e1e0
    ldr r1, [r5, #0x68]
    sub r2, r6, r7
    add r1, r1, r4, lsl #0x2
    sub r0, r2, r0
    strh r0, [r1, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_e8
    b .L_2a4
.L_130:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_2a4
    ldr r6, _LIT0
.L_144:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abe4c
    mov r8, r0
    bl func_0202b8cc
    mov r7, r0
    mov r0, r8
    bl func_0202e1e0
    ldr r1, [r5, #0x68]
    sub r2, r6, r7
    add r1, r1, r4, lsl #0x2
    sub r0, r2, r0
    strh r0, [r1, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_144
    b .L_2a4
.L_18c:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_2a4
    ldr r6, _LIT0
.L_1a0:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abe4c
    bl func_0202b854
    ldr r1, [r5, #0x68]
    sub r2, r6, r0
    add r0, r1, r4, lsl #0x2
    strh r2, [r0, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_1a0
    b .L_2a4
.L_1d4:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_2a4
.L_1e4:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abe4c
    bl func_0202de48
    ldr r1, [r5, #0x68]
    add r1, r1, r4, lsl #0x2
    strh r0, [r1, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_1e4
    b .L_2a4
.L_214:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_2a4
.L_224:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abe4c
    bl func_0202b83c
    ldr r1, [r5, #0x68]
    add r1, r1, r4, lsl #0x2
    strh r0, [r1, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_224
    b .L_2a4
.L_254:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_2a4
.L_264:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abe4c
    mov r7, r0
    bl func_0202b824
    mov r6, r0
    mov r0, r7
    bl func_0202b86c
    ldr r1, [r5, #0x68]
    add r2, r0, r6, lsl #0x4
    add r0, r1, r4, lsl #0x2
    strh r2, [r0, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_264
.L_2a4:
    ldr r0, [r5, #0x24]
    mov r1, #0x4
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r0, r0, #0x1
    mov r0, r0, lsl #0x2
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r5, #0x6c]
    ldr r1, [r5, #0x24]
    mov r0, r5
    sub r2, r1, #0x1
    mov r1, #0x0
    bl func_ov002_022ac7b4
    ldr r0, [r5, #0x24]
    mov r2, #0x0
    cmp r0, #0x0
    ble .L_310
.L_2ec:
    ldr r1, [r5, #0x68]
    ldr r0, [r1, r2, lsl #0x2]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, r2, lsl #0x2]
    ldr r0, [r5, #0x24]
    add r2, r2, #0x1
    cmp r2, r0
    blt .L_2ec
.L_310:
    ldr r0, [r5, #0x6c]
    bl Task_InvokeLocked
    ldr r0, [r5, #0x4]
    mov r1, #0x0
    rsb r0, r0, #0x0
    cmp r0, #0x4b
    cmpne r0, #0x4c
    cmpne r0, #0x4d
    moveq r0, #0x0
    streq r0, [r5, #0x68]
    str r1, [r5, #0x28]
    mov r0, r5
    str r1, [r5, #0x20]
    bl func_ov002_022a0fec
    ldr r1, [r5, #0x28]
    mov r0, r5
    str r1, [r5, #0x234]
    bl func_ov002_022ac540
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x0000ffff

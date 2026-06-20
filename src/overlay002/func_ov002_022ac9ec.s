; func_ov002_022ac9ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern func_0202b33c
        .extern func_0202b878
        .extern func_0202b890
        .extern func_0202b8a8
        .extern func_0202b8c0
        .extern func_0202b8f0
        .extern func_0202b920
        .extern func_0202de9c
        .extern func_0202e234
        .extern func_ov002_022a10fc
        .extern func_ov002_022abf88
        .extern func_ov002_022ac67c
        .extern func_ov002_022ac8f0
        .global func_ov002_022ac9ec
        .arm
func_ov002_022ac9ec:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    str r1, [r5, #0x64]
    ldr r0, [r5, #0x4]
    rsb r0, r0, #0x0
    cmp r0, #0x4b
    cmpne r0, #0x4c
    cmpne r0, #0x4d
    bne .L_130
    ldr r0, [r5, #0x70]
    cmp r1, #0x0
    moveq r1, #0x1
    str r0, [r5, #0x68]
.L_130:
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_3a0
    b .L_15c
    b .L_190
    b .L_1d0
    b .L_22c
    b .L_288
    b .L_2d0
    b .L_310
    b .L_350
.L_15c:
    ldr r0, [r5, #0x24]
    mov r2, #0x0
    cmp r0, #0x0
    ble .L_3a0
.L_16c:
    ldr r0, [r5, #0x68]
    ldr r1, [r0, r2, lsl #0x2]
    add r0, r0, r2, lsl #0x2
    strh r1, [r0, #0x2]
    ldr r0, [r5, #0x24]
    add r2, r2, #0x1
    cmp r2, r0
    blt .L_16c
    b .L_3a0
.L_190:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_3a0
.L_1a0:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abf88
    bl func_0202b33c
    ldr r1, [r5, #0x68]
    add r1, r1, r4, lsl #0x2
    strh r0, [r1, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_1a0
    b .L_3a0
.L_1d0:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_3a0
    ldr r6, _LIT0
.L_1e4:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abf88
    mov r8, r0
    bl func_0202b8f0
    mov r7, r0
    mov r0, r8
    bl func_0202e234
    ldr r1, [r5, #0x68]
    sub r2, r6, r7
    add r1, r1, r4, lsl #0x2
    sub r0, r2, r0
    strh r0, [r1, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_1e4
    b .L_3a0
.L_22c:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_3a0
    ldr r6, _LIT0
.L_240:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abf88
    mov r8, r0
    bl func_0202b920
    mov r7, r0
    mov r0, r8
    bl func_0202e234
    ldr r1, [r5, #0x68]
    sub r2, r6, r7
    add r1, r1, r4, lsl #0x2
    sub r0, r2, r0
    strh r0, [r1, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_240
    b .L_3a0
.L_288:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_3a0
    ldr r6, _LIT0
.L_29c:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abf88
    bl func_0202b8a8
    ldr r1, [r5, #0x68]
    sub r2, r6, r0
    add r0, r1, r4, lsl #0x2
    strh r2, [r0, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_29c
    b .L_3a0
.L_2d0:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_3a0
.L_2e0:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abf88
    bl func_0202de9c
    ldr r1, [r5, #0x68]
    add r1, r1, r4, lsl #0x2
    strh r0, [r1, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_2e0
    b .L_3a0
.L_310:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_3a0
.L_320:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abf88
    bl func_0202b890
    ldr r1, [r5, #0x68]
    add r1, r1, r4, lsl #0x2
    strh r0, [r1, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_320
    b .L_3a0
.L_350:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_3a0
.L_360:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022abf88
    mov r7, r0
    bl func_0202b878
    mov r6, r0
    mov r0, r7
    bl func_0202b8c0
    ldr r1, [r5, #0x68]
    add r2, r0, r6, lsl #0x4
    add r0, r1, r4, lsl #0x2
    strh r2, [r0, #0x2]
    ldr r0, [r5, #0x24]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_360
.L_3a0:
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
    bl func_ov002_022ac8f0
    ldr r0, [r5, #0x24]
    mov r2, #0x0
    cmp r0, #0x0
    ble .L_40c
.L_3e8:
    ldr r1, [r5, #0x68]
    ldr r0, [r1, r2, lsl #0x2]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, r2, lsl #0x2]
    ldr r0, [r5, #0x24]
    add r2, r2, #0x1
    cmp r2, r0
    blt .L_3e8
.L_40c:
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
    bl func_ov002_022a10fc
    ldr r1, [r5, #0x28]
    mov r0, r5
    str r1, [r5, #0x234]
    bl func_ov002_022ac67c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x0000ffff

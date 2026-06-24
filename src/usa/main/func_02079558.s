; func_02079558 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02078dd4
        .extern func_02078de0
        .extern func_02078df0
        .extern func_02078e04
        .extern func_0207989c
        .extern func_02079a24
        .extern func_02079ad4
        .extern func_02079d38
        .extern func_02094500
        .extern func_02094688
        .extern func_020a7294
        .extern func_020b3714
        .global func_02079558
        .arm
func_02079558:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    ldr r9, [sp, #0x48]
    ldr r6, [sp, #0x4c]
    str r1, [sp, #0x4]
    add r5, r6, r9, lsl #0x1
    str r0, [sp]
    mov sl, r2
    mov r0, r5
    mov r2, r9, lsl #0x2
    mov r1, #0x0
    str r3, [sp, #0x8]
    add r4, r5, r9, lsl #0x1
    bl func_02094500
    ldr r0, [sp, #0x4]
    mov r1, r9
    bl func_02079d38
    mov fp, r0
    mov r0, sl
    mov r1, r9
    bl func_02079d38
    mov r7, r0
    cmp fp, #0x0
    ble .L_1a8
    cmp r7, #0x0
    ble .L_1a8
    sub r0, r9, fp
    add r0, r7, r0
    sub r8, r0, #0x1
    cmp r8, r9
    blt .L_90
    ldr r0, [sp, #0x4]
    mov r1, r4
    mov r2, r9, lsl #0x1
    bl func_02094688
    b .L_1a8
.L_90:
    ldr r0, [sp, #0x4]
    add r1, r5, r8, lsl #0x1
    mov r2, fp, lsl #0x1
    bl func_02094688
    cmp r7, #0x2
    ble .L_c4
    add r0, sl, r7, lsl #0x1
    sub r0, r0, #0x2
    mov r7, r7, lsl #0x1
    bl func_02078df0
    str r0, [sp, #0x14]
    str r1, [sp, #0x10]
    b .L_100
.L_c4:
    cmp r7, #0x1
    ble .L_e8
    add r0, sl, r7, lsl #0x1
    sub r0, r0, #0x2
    mov r7, r7, lsl #0x1
    bl func_02078de0
    str r0, [sp, #0x14]
    str r1, [sp, #0x10]
    b .L_100
.L_e8:
    add r0, sl, r7, lsl #0x1
    sub r0, r0, #0x2
    mov r7, r7, lsl #0x1
    bl func_02078dd4
    str r0, [sp, #0x14]
    str r1, [sp, #0x10]
.L_100:
    cmp r8, r9
    bge .L_1a8
    mov r0, r9, lsl #0x1
    sub r0, r0, #0x1
    mov fp, r0, lsl #0x1
    add r0, r4, r7
    str r0, [sp, #0x1c]
.L_11c:
    mov r1, r5
    add r0, r5, #0x2
    mov r2, fp
    bl func_020a7294
    ldr r0, [sp, #0x1c]
    bl func_02078e04
    ldr r2, [sp, #0x14]
    ldr r3, [sp, #0x10]
    bl func_020b3714
    mov r7, r0
    ldr r0, _LIT0
    cmp r7, r0
    movhi r7, r0
.L_150:
    mov r2, r7, lsl #0x10
    mov r0, r6
    mov r1, sl
    mov r2, r2, lsr #0x10
    mov r3, r9
    bl func_0207989c
    mov r0, r4
    mov r1, r6
    mov r2, r9
    bl func_02079a24
    cmp r0, #0x0
    sublt r7, r7, #0x1
    blt .L_150
    mov r0, r4
    mov r1, r4
    mov r2, r6
    mov r3, r9
    bl func_02079ad4
    strh r7, [r5]
    add r8, r8, #0x1
    cmp r8, r9
    blt .L_11c
.L_1a8:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1c4
    ldr r1, [sp]
    mov r0, r5
    mov r2, r9, lsl #0x1
    bl func_02094688
.L_1c4:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0x24
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldr r1, [sp, #0x8]
    mov r0, r4
    mov r2, r9, lsl #0x1
    bl func_02094688
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x0000ffff

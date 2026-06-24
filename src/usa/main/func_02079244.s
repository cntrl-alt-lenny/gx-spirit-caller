; func_02079244 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02079558
        .extern func_02079920
        .extern func_02079ad4
        .extern func_02079c48
        .extern func_02079cf4
        .extern func_02094688
        .global func_02079244
        .arm
func_02079244:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    ldr r9, [sp, #0x38]
    mov sl, r3
    add fp, r9, sl, lsl #0x1
    add r8, fp, sl, lsl #0x1
    add r7, r8, sl, lsl #0x1
    add r6, r7, sl, lsl #0x1
    add r5, r6, sl, lsl #0x1
    str r0, [sp, #0x8]
    mov r0, r1
    add r1, r5, sl, lsl #0x1
    str r1, [sp, #0x10]
    mov r4, sl, lsl #0x1
    str r2, [sp, #0xc]
    mov r1, r9
    mov r2, r4
    bl func_02094688
    ldr r0, [sp, #0xc]
    mov r1, r8
    mov r2, r4
    bl func_02094688
    mov r0, #0x1
    strh r0, [r8, r4]
    mov r0, r9
    mov r1, sl
    bl func_02079cf4
    cmp r0, #0x0
    ble .L_48c
.L_3f0:
    ldr r3, [sp, #0x10]
    str sl, [sp]
    str r3, [sp, #0x4]
    mov r0, fp
    mov r1, r8
    mov r2, r9
    mov r3, r5
    bl func_02079558
    mov r0, r9
    mov r1, r8
    mov r2, r4
    bl func_02094688
    mov r0, r5
    mov r1, r9
    mov r2, r4
    bl func_02094688
    mov r0, r5
    mov r1, fp
    mov r2, r7
    mov r3, sl
    bl func_02079920
    mov r0, r5
    mov r1, r6
    mov r2, r5
    mov r3, sl
    bl func_02079ad4
    mov r0, r7
    mov r1, r6
    mov r2, r4
    bl func_02094688
    mov r0, r5
    mov r1, r7
    mov r2, r4
    bl func_02094688
    mov r0, r9
    mov r1, sl
    bl func_02079cf4
    cmp r0, #0x0
    bgt .L_3f0
.L_48c:
    ldr r2, [sp, #0xc]
    mov r0, r6
    mov r1, r6
    mov r3, sl
    bl func_02079c48
    ldr r2, [sp, #0xc]
    ldr r3, [sp, #0x8]
    ldr r4, [sp, #0x10]
    str sl, [sp]
    mov r1, r6
    mov r0, #0x0
    str r4, [sp, #0x4]
    bl func_02079558
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr

; func_02079100 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02079750
        .extern func_02079920
        .extern func_02079a24
        .extern func_02079ad4
        .extern func_02079c48
        .extern func_02094500
        .extern func_02094688
        .extern func_020a7294
        .global func_02079100
        .arm
func_02079100:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r5, r3
    mov r7, r5, lsl #0x1
    mov r8, r2
    mov r2, r7
    mov r6, r0
    mov r9, r1
    ldr r4, [sp, #0x20]
    bl func_02094688
    cmp r8, #0x1
    bne .L_27c
    mov r0, r6
    mov r1, r9
    mov r2, r5
    bl func_02079750
    b .L_298
.L_27c:
    cmp r8, #0x0
    beq .L_298
    mov r0, r6
    mov r1, r9
    mov r2, r8
    mov r3, r5
    bl func_02079920
.L_298:
    ldr r0, [sp, #0x2c]
    ldr r2, [sp, #0x28]
    mov r1, r6
    mov r3, r4
    bl func_02079920
    sub r1, r5, r4
    ldr r0, [sp, #0x2c]
    mov r8, r1, lsl #0x1
    mov r2, r8
    add r0, r0, r4, lsl #0x1
    mov r1, #0x0
    bl func_02094500
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x2c]
    ldr r2, [sp, #0x24]
    mov r3, r5
    bl func_02079920
    mov r0, r6
    mov r1, r6
    ldr r2, [sp, #0x30]
    mov r3, r5
    bl func_02079c48
    mov r2, r8
    mov r0, r6
    add r1, r6, r4, lsl #0x1
    bl func_020a7294
    add r0, r6, r5, lsl #0x1
    sub r0, r0, r4, lsl #0x1
    mov r2, r4, lsl #0x1
    mov r1, #0x0
    bl func_02094500
    mov r0, r6
    ldr r1, [sp, #0x24]
    mov r2, r5
    bl func_02079a24
    cmp r0, #0x0
    beq .L_340
    cmp r0, #0x1
    beq .L_35c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_340:
    mov r0, r6
    mov r2, r7
    mov r1, #0x0
    bl func_02094500
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_35c:
    ldr r2, [sp, #0x24]
    mov r0, r6
    mov r1, r6
    mov r3, r5
    bl func_02079ad4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr

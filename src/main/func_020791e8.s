; func_020791e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02079838
        .extern func_02079a08
        .extern func_02079b0c
        .extern func_02079bbc
        .extern func_02079d30
        .extern func_020945f4
        .extern func_02094688
        .extern func_020a7388
        .global func_020791e8
        .arm
func_020791e8:
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
    bne .L_324
    mov r0, r6
    mov r1, r9
    mov r2, r5
    bl func_02079838
    b .L_340
.L_324:
    cmp r8, #0x0
    beq .L_340
    mov r0, r6
    mov r1, r9
    mov r2, r8
    mov r3, r5
    bl func_02079a08
.L_340:
    ldr r0, [sp, #0x2c]
    ldr r2, [sp, #0x28]
    mov r1, r6
    mov r3, r4
    bl func_02079a08
    sub r1, r5, r4
    ldr r0, [sp, #0x2c]
    mov r8, r1, lsl #0x1
    mov r2, r8
    add r0, r0, r4, lsl #0x1
    mov r1, #0x0
    bl func_020945f4
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x2c]
    ldr r2, [sp, #0x24]
    mov r3, r5
    bl func_02079a08
    mov r0, r6
    mov r1, r6
    ldr r2, [sp, #0x30]
    mov r3, r5
    bl func_02079d30
    mov r2, r8
    mov r0, r6
    add r1, r6, r4, lsl #0x1
    bl func_020a7388
    add r0, r6, r5, lsl #0x1
    sub r0, r0, r4, lsl #0x1
    mov r2, r4, lsl #0x1
    mov r1, #0x0
    bl func_020945f4
    mov r0, r6
    ldr r1, [sp, #0x24]
    mov r2, r5
    bl func_02079b0c
    cmp r0, #0x0
    beq .L_3e8
    cmp r0, #0x1
    beq .L_404
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_3e8:
    mov r0, r6
    mov r2, r7
    mov r1, #0x0
    bl func_020945f4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_404:
    ldr r2, [sp, #0x24]
    mov r0, r6
    mov r1, r6
    mov r3, r5
    bl func_02079bbc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr

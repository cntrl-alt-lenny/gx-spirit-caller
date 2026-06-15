; func_020991a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094688
        .extern func_02098cf8
        .global func_020991a4
        .arm
func_020991a4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r0
    add ip, r8, #0x10
    ldr r4, [r8, #0x10]
    mov r6, r2
    and r3, r4, #0x3f
    ldr r0, [ip, #0x4]
    adds r4, r4, r6
    str r4, [r8, #0x10]
    adc r0, r0, #0x0
    rsb r5, r3, #0x40
    mov r7, r1
    str r0, [ip, #0x4]
    cmp r5, r6
    bls .L_518
    cmp r6, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    add r1, r8, #0x18
    mov r0, r7
    add r1, r1, r3
    bl func_02094688
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_518:
    add r1, r8, #0x18
    mov r0, r7
    mov r2, r5
    add r1, r1, r3
    bl func_02094688
    mov r0, r8
    bl func_02098cf8
    sub r6, r6, r5
    mov r4, r6, lsr #0x6
    cmp r4, #0x0
    add r9, r7, r5
    ble .L_578
    add r7, r8, #0x18
    mov r5, #0x40
.L_550:
    mov r0, r9
    mov r1, r7
    mov r2, r5
    bl func_02094688
    mov r0, r8
    add r9, r9, #0x40
    bl func_02098cf8
    sub r4, r4, #0x1
    cmp r4, #0x0
    bgt .L_550
.L_578:
    ands r2, r6, #0x3f
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    mov r0, r9
    add r1, r8, #0x18
    bl func_02094688
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr

; func_02099478 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021025a8
        .extern func_02094688
        .global func_02099478
        .arm
func_02099478:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    movs r6, r2
    mov r7, r1
    add r5, r8, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r0, [r8, #0x14]
    add r1, r0, r6, lsl #0x3
    cmp r1, r0
    ldrcc r0, [r8, #0x18]
    addcc r0, r0, #0x1
    strcc r0, [r8, #0x18]
    ldr r0, [r8, #0x18]
    add r0, r0, r6, lsr #0x1d
    str r0, [r8, #0x18]
    str r1, [r8, #0x14]
    ldr r1, [r8, #0x1c]
    cmp r1, #0x0
    beq .L_2bc
    add r0, r1, r6
    cmp r0, #0x40
    bcc .L_298
    rsb r4, r1, #0x40
    mov r0, r7
    mov r2, r4
    add r1, r5, r1
    bl func_02094688
    ldr r1, _LIT0
    mov r0, r8
    ldr r3, [r1]
    mov r1, r5
    mov r2, #0x40
    sub r6, r6, r4
    add r7, r7, r4
    blx r3
    mov r0, #0x0
    str r0, [r8, #0x1c]
    b .L_2bc
.L_298:
    mov r0, r7
    mov r2, r6
    add r1, r5, r1
    bl func_02094688
    ldr r0, [r8, #0x1c]
    add r0, r0, r6
    str r0, [r8, #0x1c]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_2bc:
    cmp r6, #0x40
    bcc .L_32c
    bic r4, r6, #0x3f
    sub r6, r6, r4
    ands r0, r7, #0x3
    bne .L_2f4
    ldr r1, _LIT0
    mov r0, r8
    ldr r3, [r1]
    mov r1, r7
    mov r2, r4
    blx r3
    add r7, r7, r4
    b .L_32c
.L_2f4:
    mov r0, r7
    mov r1, r5
    mov r2, #0x40
    bl func_02094688
    ldr r1, _LIT0
    mov r0, r8
    ldr r3, [r1]
    mov r1, r5
    mov r2, #0x40
    add r7, r7, #0x40
    blx r3
    sub r4, r4, #0x40
    cmp r4, #0x0
    bgt .L_2f4
.L_32c:
    str r6, [r8, #0x1c]
    cmp r6, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_02094688
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021025a8

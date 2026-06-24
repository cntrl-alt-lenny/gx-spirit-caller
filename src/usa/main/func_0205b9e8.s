; func_0205b9e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0205b9e8
        .arm
func_0205b9e8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    bne .L_28
    cmp r1, #0x0
    bne .L_28
    cmp r2, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
.L_28:
    cmp r0, #0x0
    blt .L_40
    cmp r1, #0x0
    blt .L_40
    cmp r2, #0x0
    bge .L_4c
.L_40:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_4c:
    cmp r1, #0xc
    addls pc, pc, r1, lsl #0x2
    b .L_144
    b .L_8c
    b .L_a0
    b .L_c8
    b .L_a0
    b .L_b4
    b .L_a0
    b .L_b4
    b .L_a0
    b .L_a0
    b .L_b4
    b .L_a0
    b .L_b4
    b .L_a0
.L_8c:
    cmp r0, #0x0
    beq .L_150
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_a0:
    cmp r0, #0x1f
    ble .L_150
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_b4:
    cmp r0, #0x1e
    ble .L_150
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_c8:
    mov r4, r2, lsr #0x1f
    rsb r3, r4, r2, lsl #0x1e
    adds r3, r4, r3, ror #0x1e
    bne .L_f8
    ldr ip, _LIT0
    ldr lr, _LIT1
    smull r3, r5, ip, r2
    mov r5, r5, asr #0x5
    add r5, r4, r5
    smull r3, ip, lr, r5
    subs r5, r2, r3
    bne .L_11c
.L_f8:
    ldr lr, _LIT0
    mov r3, r2, lsr #0x1f
    smull ip, r4, lr, r2
    mov r4, r4, asr #0x7
    ldr lr, _LIT2
    add r4, r3, r4
    smull r3, ip, lr, r4
    subs r4, r2, r3
    bne .L_130
.L_11c:
    cmp r0, #0x1d
    ble .L_150
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_130:
    cmp r0, #0x1c
    ble .L_150
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_144:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_150:
    ldr r3, _LIT3
    cmp r2, r3
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, pc}
    ldr r3, _LIT4
    cmp r2, r3
    addgt sp, sp, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, pc}
    cmp r2, r3
    bne .L_1a8
    cmp r1, #0x6
    addgt sp, sp, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, pc}
    cmp r1, #0x6
    bne .L_1a8
    cmp r0, #0x6
    addgt sp, sp, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, pc}
.L_1a8:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x51eb851f
_LIT1: .word 0x00000064
_LIT2: .word 0x00000190
_LIT3: .word 0x0000076c
_LIT4: .word 0x0000081f

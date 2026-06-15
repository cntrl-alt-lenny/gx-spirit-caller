; func_0205ba5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0205ba5c
        .arm
func_0205ba5c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    bne .L_bb8
    cmp r1, #0x0
    bne .L_bb8
    cmp r2, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
.L_bb8:
    cmp r0, #0x0
    blt .L_bd0
    cmp r1, #0x0
    blt .L_bd0
    cmp r2, #0x0
    bge .L_bdc
.L_bd0:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_bdc:
    cmp r1, #0xc
    addls pc, pc, r1, lsl #0x2
    b .L_cd4
    b .L_c1c
    b .L_c30
    b .L_c58
    b .L_c30
    b .L_c44
    b .L_c30
    b .L_c44
    b .L_c30
    b .L_c30
    b .L_c44
    b .L_c30
    b .L_c44
    b .L_c30
.L_c1c:
    cmp r0, #0x0
    beq .L_ce0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_c30:
    cmp r0, #0x1f
    ble .L_ce0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_c44:
    cmp r0, #0x1e
    ble .L_ce0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_c58:
    mov r4, r2, lsr #0x1f
    rsb r3, r4, r2, lsl #0x1e
    adds r3, r4, r3, ror #0x1e
    bne .L_c88
    ldr ip, _LIT0
    ldr lr, _LIT1
    smull r3, r5, ip, r2
    mov r5, r5, asr #0x5
    add r5, r4, r5
    smull r3, ip, lr, r5
    subs r5, r2, r3
    bne .L_cac
.L_c88:
    ldr lr, _LIT0
    mov r3, r2, lsr #0x1f
    smull ip, r4, lr, r2
    mov r4, r4, asr #0x7
    ldr lr, _LIT2
    add r4, r3, r4
    smull r3, ip, lr, r4
    subs r4, r2, r3
    bne .L_cc0
.L_cac:
    cmp r0, #0x1d
    ble .L_ce0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_cc0:
    cmp r0, #0x1c
    ble .L_ce0
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_cd4:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, pc}
.L_ce0:
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
    bne .L_d38
    cmp r1, #0x6
    addgt sp, sp, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, pc}
    cmp r1, #0x6
    bne .L_d38
    cmp r0, #0x6
    addgt sp, sp, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, pc}
.L_d38:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x51eb851f
_LIT1: .word 0x00000064
_LIT2: .word 0x00000190
_LIT3: .word 0x0000076c
_LIT4: .word 0x0000081f

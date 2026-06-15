; func_02053c34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb00
        .extern data_020ffb04
        .extern func_020540d0
        .extern func_020a6d54
        .global func_02053c34
        .arm
func_02053c34:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r7, r1
    mov r8, r0
    mov r6, r2
    bne .L_4e8
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6d54
.L_4e8:
    ldr r0, [r8]
    subs r5, r0, #0x1
    bmi .L_520
.L_4f4:
    mov r0, r8
    mov r1, r5
    bl func_020540d0
    mov r1, r6
    mov r4, r0
    blx r7
    cmp r0, #0x0
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    subs r5, r5, #0x1
    bpl .L_4f4
.L_520:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020ffb00
_LIT1: .word data_020ffb04
_LIT2: .word 0x00000121

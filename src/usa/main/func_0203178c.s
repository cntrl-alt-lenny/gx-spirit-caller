; func_0203178c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203178c
        .arm
func_0203178c:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_34
    bge .L_40
    sub r1, r0, #0x97
    sub r1, r1, #0x1400
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_48
    b .L_40
    b .L_40
    b .L_40
    b .L_40
.L_34:
    ldr r1, _LIT1
    cmp r0, r1
    bne .L_48
.L_40:
    mov r0, #0x1
    bx lr
.L_48:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000017ad
_LIT1: .word 0x000017ae

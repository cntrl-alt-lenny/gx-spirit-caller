; func_0202f418 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f418
        .arm
func_0202f418:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_3c
    bge .L_48
    sub r1, r1, #0x61
    sub r1, r0, r1
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_50
    b .L_48
    b .L_48
    b .L_48
    b .L_48
    b .L_48
    b .L_48
.L_3c:
    ldr r1, _LIT1
    cmp r0, r1
    bne .L_50
.L_48:
    mov r0, #0x1
    bx lr
.L_50:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001af1
_LIT1: .word 0x00001b4b

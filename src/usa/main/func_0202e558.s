; func_0202e558 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e558
        .arm
func_0202e558:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_268
    beq .L_2a0
    b .L_2a8
.L_268:
    add r1, r1, #0x268
    sub r0, r0, r1
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_2a8
    b .L_2a0
    b .L_2a0
    b .L_2a0
    b .L_2a0
    b .L_2a0
    b .L_2a0
    b .L_2a0
    b .L_2a0
    b .L_2a0
.L_2a0:
    mov r0, #0x1
    bx lr
.L_2a8:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000131d

; func_0202e864 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e864
        .arm
func_0202e864:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_558
    bge .L_578
    ldr r1, _LIT1
    cmp r0, r1
    bgt .L_530
    beq .L_578
    b .L_580
.L_530:
    sub r1, r2, #0x9b
    cmp r0, r1
    bgt .L_580
    sub r1, r2, #0x9c
    cmp r0, r1
    blt .L_580
    subne r1, r2, #0x9b
    cmpne r0, r1
    beq .L_578
    b .L_580
.L_558:
    add r1, r2, #0x8b
    cmp r0, r1
    bgt .L_56c
    beq .L_578
    b .L_580
.L_56c:
    ldr r1, _LIT2
    cmp r0, r1
    bne .L_580
.L_578:
    mov r0, #0x1
    bx lr
.L_580:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001754
_LIT1: .word 0x0000117b
_LIT2: .word 0x000018be

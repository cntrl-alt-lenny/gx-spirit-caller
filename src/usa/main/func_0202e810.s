; func_0202e810 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e810
        .arm
func_0202e810:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_2a4
    bge .L_2c4
    ldr r1, _LIT1
    cmp r0, r1
    bgt .L_27c
    beq .L_2c4
    b .L_2cc
.L_27c:
    sub r1, r2, #0x9b
    cmp r0, r1
    bgt .L_2cc
    sub r1, r2, #0x9c
    cmp r0, r1
    blt .L_2cc
    subne r1, r2, #0x9b
    cmpne r0, r1
    beq .L_2c4
    b .L_2cc
.L_2a4:
    add r1, r2, #0x8b
    cmp r0, r1
    bgt .L_2b8
    beq .L_2c4
    b .L_2cc
.L_2b8:
    ldr r1, _LIT2
    cmp r0, r1
    bne .L_2cc
.L_2c4:
    mov r0, #0x1
    bx lr
.L_2cc:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001754
_LIT1: .word 0x0000117b
_LIT2: .word 0x000018be

; func_0202f4ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f4ac
        .arm
func_0202f4ac:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_34
    bge .L_60
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_68
    sub r1, r2, #0x3
    cmp r0, r1
    blt .L_68
    cmpne r0, r2
    beq .L_60
    b .L_68
.L_34:
    add r1, r2, #0x3
    cmp r0, r1
    bgt .L_68
    add r1, r2, #0x1
    cmp r0, r1
    blt .L_68
    addne r1, r2, #0x2
    cmpne r0, r1
    addne r1, r2, #0x3
    cmpne r0, r1
    bne .L_68
.L_60:
    mov r0, #0x1
    bx lr
.L_68:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001b2a
_LIT1: .word 0x00001294

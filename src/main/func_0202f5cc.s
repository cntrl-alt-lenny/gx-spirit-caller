; func_0202f5cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f5cc
        .arm
func_0202f5cc:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_14
    beq .L_3c
    b .L_44
.L_14:
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_44
    sub r1, r2, #0x5
    cmp r0, r1
    blt .L_44
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    bne .L_44
.L_3c:
    mov r0, #0x1
    bx lr
.L_44:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000013e4
_LIT1: .word 0x0000180c

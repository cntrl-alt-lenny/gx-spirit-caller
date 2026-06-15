; func_0202f500 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f500
        .arm
func_0202f500:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_104
    bge .L_130
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_138
    sub r1, r2, #0x3
    cmp r0, r1
    blt .L_138
    cmpne r0, r2
    beq .L_130
    b .L_138
.L_104:
    add r1, r2, #0x3
    cmp r0, r1
    bgt .L_138
    add r1, r2, #0x1
    cmp r0, r1
    blt .L_138
    addne r1, r2, #0x2
    cmpne r0, r1
    addne r1, r2, #0x3
    cmpne r0, r1
    bne .L_138
.L_130:
    mov r0, #0x1
    bx lr
.L_138:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001b2a
_LIT1: .word 0x00001294

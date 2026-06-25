; func_0202f110 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f110
        .arm
func_0202f110:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_150
    sub r1, r2, #0x2
    cmp r0, r1
    blt .L_140
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    beq .L_170
    b .L_178
.L_140:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_170
    b .L_178
.L_150:
    add r1, r2, #0xe8
    cmp r0, r1
    bgt .L_164
    beq .L_170
    b .L_178
.L_164:
    add r1, r2, #0xe9
    cmp r0, r1
    bne .L_178
.L_170:
    mov r0, #0x1
    bx lr
.L_178:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000017c9
_LIT1: .word 0x0000152e

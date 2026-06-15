; func_02031208 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031208
        .arm
func_02031208:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_c50
    bge .L_c7c
    sub r1, r2, #0x80
    cmp r0, r1
    bgt .L_c40
    sub r1, r2, #0x85
    cmp r0, r1
    blt .L_c84
    subne r1, r2, #0x84
    cmpne r0, r1
    subne r1, r2, #0x80
    cmpne r0, r1
    beq .L_c7c
    b .L_c84
.L_c40:
    sub r1, r2, #0x7b
    cmp r0, r1
    beq .L_c7c
    b .L_c84
.L_c50:
    ldr r1, _LIT1
    cmp r0, r1
    bgt .L_c70
    bge .L_c7c
    sub r1, r1, #0x18c
    cmp r0, r1
    beq .L_c7c
    b .L_c84
.L_c70:
    ldr r1, _LIT2
    cmp r0, r1
    bne .L_c84
.L_c7c:
    mov r0, #0x1
    bx lr
.L_c84:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001695
_LIT1: .word 0x0000186a
_LIT2: .word 0x00001983

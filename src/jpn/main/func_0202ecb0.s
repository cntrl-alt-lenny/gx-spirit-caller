; func_0202ecb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202ecb0
        .arm
func_0202ecb0:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_290
    bge .L_2b0
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_260
    beq .L_2b0
    b .L_2b8
.L_260:
    add r1, r2, #0x72
    cmp r0, r1
    bgt .L_2b8
    add r1, r2, #0x70
    cmp r0, r1
    blt .L_2b8
    addne r1, r2, #0x71
    cmpne r0, r1
    addne r1, r2, #0x72
    cmpne r0, r1
    beq .L_2b0
    b .L_2b8
.L_290:
    add r1, r2, #0x1
    cmp r0, r1
    bgt .L_2a4
    beq .L_2b0
    b .L_2b8
.L_2a4:
    add r1, r2, #0x2
    cmp r0, r1
    bne .L_2b8
.L_2b0:
    mov r0, #0x1
    bx lr
.L_2b8:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001b4c
_LIT1: .word 0x000019fd

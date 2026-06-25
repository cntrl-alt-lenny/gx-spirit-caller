; func_0202ed3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202ed3c
        .arm
func_0202ed3c:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_4c
    bge .L_98
    sub r1, r2, #0x5c
    cmp r0, r1
    bgt .L_3c
    sub r1, r2, #0x5f
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_a0
    b .L_98
    b .L_98
    b .L_98
    b .L_98
.L_3c:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_98
    b .L_a0
.L_4c:
    add r1, r2, #0x4
    cmp r0, r1
    bgt .L_8c
    add r1, r2, #0x2
    cmp r0, r1
    blt .L_7c
    addne r1, r2, #0x3
    cmpne r0, r1
    addne r1, r2, #0x4
    cmpne r0, r1
    beq .L_98
    b .L_a0
.L_7c:
    add r1, r2, #0x1
    cmp r0, r1
    beq .L_98
    b .L_a0
.L_8c:
    add r1, r2, #0xc4
    cmp r0, r1
    bne .L_a0
.L_98:
    mov r0, #0x1
    bx lr
.L_a0:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001a61
_LIT1: .word 0x00001a60

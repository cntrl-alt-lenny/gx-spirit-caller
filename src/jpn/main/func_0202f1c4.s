; func_0202f1c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f1c4
        .arm
func_0202f1c4:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_54
    bge .L_a8
    ldr r1, _LIT1
    cmp r0, r1
    bgt .L_44
    bge .L_a8
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_b0
    sub r1, r2, #0x1
    cmp r0, r1
    blt .L_b0
    cmpne r0, r2
    beq .L_a8
    b .L_b0
.L_44:
    ldr r1, _LIT3
    cmp r0, r1
    beq .L_a8
    b .L_b0
.L_54:
    ldr r2, _LIT4
    cmp r0, r2
    bgt .L_74
    bge .L_a8
    sub r1, r2, #0xb
    cmp r0, r1
    beq .L_a8
    b .L_b0
.L_74:
    add r1, r2, #0x2
    cmp r0, r1
    bgt .L_9c
    add r1, r2, #0x1
    cmp r0, r1
    blt .L_b0
    addne r1, r2, #0x2
    cmpne r0, r1
    beq .L_a8
    b .L_b0
.L_9c:
    add r1, r2, #0x15
    cmp r0, r1
    bne .L_b0
.L_a8:
    mov r0, #0x1
    bx lr
.L_b0:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001477
_LIT1: .word 0x00001128
_LIT2: .word 0x00000fe5
_LIT3: .word 0x00001246
_LIT4: .word 0x0000182a

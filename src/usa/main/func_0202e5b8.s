; func_0202e5b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e5b8
        .arm
func_0202e5b8:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_54
    bge .L_c4
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_30
    bge .L_c4
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_c4
    b .L_cc
.L_30:
    add r1, r2, #0x8b
    cmp r0, r1
    bgt .L_44
    beq .L_c4
    b .L_cc
.L_44:
    sub r1, r3, #0x1ec
    cmp r0, r1
    beq .L_c4
    b .L_cc
.L_54:
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_a4
    bge .L_c4
    add r1, r3, #0xdc
    cmp r0, r1
    bgt .L_78
    beq .L_c4
    b .L_cc
.L_78:
    sub r1, r2, #0xc1
    sub r1, r0, r1
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_cc
    b .L_c4
    b .L_c4
    b .L_c4
    b .L_c4
    b .L_c4
    b .L_c4
.L_a4:
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_b8
    beq .L_c4
    b .L_cc
.L_b8:
    add r1, r1, #0xa
    cmp r0, r1
    bne .L_cc
.L_c4:
    mov r0, #0x1
    bx lr
.L_cc:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001452
_LIT1: .word 0x0000111c
_LIT2: .word 0x00000ffe
_LIT3: .word 0x0000170b
_LIT4: .word 0x000018b0

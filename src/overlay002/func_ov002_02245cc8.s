; func_ov002_02245cc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_02245cc8
        .arm
func_ov002_02245cc8:
    ldrh r0, [r0]
    ldr r3, _LIT0
    cmp r0, r3
    bne .L_18
    mov r0, #0x1
    bx lr
.L_18:
    ldr r0, _LIT1
    cmp r1, r0
    bgt .L_80
    bge .L_ec
    ldr r2, _LIT2
    cmp r1, r2
    bgt .L_5c
    sub r0, r2, #0x4
    cmp r1, r0
    blt .L_4c
    cmpne r1, r2
    beq .L_ec
    b .L_f4
.L_4c:
    sub r0, r2, #0xc5
    cmp r1, r0
    beq .L_ec
    b .L_f4
.L_5c:
    add r0, r3, #0x82
    cmp r1, r0
    bgt .L_70
    beq .L_ec
    b .L_f4
.L_70:
    add r0, r2, #0x3e4
    cmp r1, r0
    beq .L_ec
    b .L_f4
.L_80:
    ldr r2, _LIT3
    cmp r1, r2
    bgt .L_cc
    bge .L_ec
    sub r0, r2, #0xa
    cmp r1, r0
    bgt .L_a4
    beq .L_ec
    b .L_f4
.L_a4:
    sub r0, r2, #0x8
    cmp r1, r0
    bgt .L_f4
    sub r0, r2, #0x9
    cmp r1, r0
    blt .L_f4
    subne r0, r2, #0x8
    cmpne r1, r0
    beq .L_ec
    b .L_f4
.L_cc:
    add r0, r2, #0x1
    cmp r1, r0
    bgt .L_e0
    beq .L_ec
    b .L_f4
.L_e0:
    add r0, r2, #0x2
    cmp r1, r0
    bne .L_f4
.L_ec:
    mov r0, #0x1
    bx lr
.L_f4:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000017bc
_LIT1: .word 0x000019b7
_LIT2: .word 0x000015ab
_LIT3: .word 0x00001b02

; func_0202effc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202effc
        .arm
func_0202effc:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_94
    bge .L_f4
    sub r1, r2, #0x10c
    cmp r0, r1
    bgt .L_60
    bge .L_f4
    sub r1, r2, #0x20c
    cmp r0, r1
    bgt .L_50
    ldr r2, _LIT1
    cmp r0, r2
    blt .L_fc
    addne r1, r2, #0x1
    cmpne r0, r1
    addne r1, r2, #0x2
    cmpne r0, r1
    beq .L_f4
    b .L_fc
.L_50:
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_f4
    b .L_fc
.L_60:
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_84
    sub r1, r2, #0x4
    cmp r0, r1
    blt .L_fc
    cmpne r0, r2
    beq .L_f4
    b .L_fc
.L_84:
    add r1, r2, #0x9
    cmp r0, r1
    beq .L_f4
    b .L_fc
.L_94:
    add r1, r2, #0x3
    cmp r0, r1
    bgt .L_c8
    bge .L_f4
    add r1, r2, #0x1
    cmp r0, r1
    bgt .L_b8
    beq .L_f4
    b .L_fc
.L_b8:
    add r1, r2, #0x2
    cmp r0, r1
    beq .L_f4
    b .L_fc
.L_c8:
    add r1, r2, #0x5c
    cmp r0, r1
    bgt .L_e8
    bge .L_f4
    add r1, r2, #0x5b
    cmp r0, r1
    beq .L_f4
    b .L_fc
.L_e8:
    add r1, r2, #0x5e
    cmp r0, r1
    bne .L_fc
.L_f4:
    mov r0, #0x1
    bx lr
.L_fc:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001ab9
_LIT1: .word 0x000018ab
_LIT2: .word 0x000019aa
_LIT3: .word 0x000019b2

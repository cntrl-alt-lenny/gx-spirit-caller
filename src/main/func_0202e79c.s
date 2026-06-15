; func_0202e79c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e79c
        .arm
func_0202e79c:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_49c
    bge .L_4f4
    sub r1, r3, #0x60
    cmp r0, r1
    bgt .L_474
    bge .L_4f4
    sub r1, r3, #0x6d
    cmp r0, r1
    beq .L_4f4
    b .L_4fc
.L_474:
    sub r1, r3, #0x5
    cmp r0, r1
    bgt .L_4fc
    sub r1, r3, #0x7
    cmp r0, r1
    blt .L_4fc
    subne r1, r3, #0x5
    cmpne r0, r1
    beq .L_4f4
    b .L_4fc
.L_49c:
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_4d4
    bge .L_4f4
    add r1, r3, #0x5
    cmp r0, r1
    bgt .L_4fc
    add r1, r3, #0x4
    cmp r0, r1
    blt .L_4fc
    addne r1, r3, #0x5
    cmpne r0, r1
    beq .L_4f4
    b .L_4fc
.L_4d4:
    add r1, r2, #0x1
    cmp r0, r1
    bgt .L_4e8
    beq .L_4f4
    b .L_4fc
.L_4e8:
    add r1, r2, #0x2
    cmp r0, r1
    bne .L_4fc
.L_4f4:
    mov r0, #0x1
    bx lr
.L_4fc:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000014ab
_LIT1: .word 0x0000160d

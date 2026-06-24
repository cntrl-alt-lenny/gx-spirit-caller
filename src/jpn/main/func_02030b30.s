; func_02030b30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02030b30
        .arm
func_02030b30:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_5e8
    bge .L_654
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_5c4
    bge .L_654
    sub r1, r2, #0x45
    cmp r0, r1
    bgt .L_65c
    sub r1, r2, #0x48
    cmp r0, r1
    blt .L_65c
    subne r1, r2, #0x45
    cmpne r0, r1
    beq .L_654
    b .L_65c
.L_5c4:
    add r1, r2, #0x1
    cmp r0, r1
    bgt .L_5d8
    beq .L_654
    b .L_65c
.L_5d8:
    sub r1, r3, #0x1
    cmp r0, r1
    beq .L_654
    b .L_65c
.L_5e8:
    add r1, r3, #0x1f8
    cmp r0, r1
    bgt .L_634
    bge .L_654
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_60c
    beq .L_654
    b .L_65c
.L_60c:
    add r1, r2, #0x2
    cmp r0, r1
    bgt .L_65c
    add r1, r2, #0x1
    cmp r0, r1
    blt .L_65c
    addne r1, r2, #0x2
    cmpne r0, r1
    beq .L_654
    b .L_65c
.L_634:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_648
    beq .L_654
    b .L_65c
.L_648:
    add r1, r1, #0x1
    cmp r0, r1
    bne .L_65c
.L_654:
    mov r0, #0x0
    bx lr
.L_65c:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x00001954
_LIT1: .word 0x000015f9
_LIT2: .word 0x00001a6d
_LIT3: .word 0x00001b4d

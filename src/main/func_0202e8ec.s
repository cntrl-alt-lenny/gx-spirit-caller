; func_0202e8ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202e8ec
        .arm
func_0202e8ec:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_658
    bge .L_6f0
    sub r1, r3, #0x48
    cmp r0, r1
    bgt .L_614
    bge .L_718
    sub r1, r3, #0x4c
    cmp r0, r1
    bgt .L_604
    bge .L_718
    sub r1, r3, #0x8d
    sub r1, r0, r1
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b .L_740
    b .L_6f0
    b .L_6f8
    b .L_6f8
    b .L_6f8
    b .L_700
    b .L_700
    b .L_708
    b .L_708
    b .L_710
    b .L_710
    b .L_710
.L_604:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_718
    b .L_740
.L_614:
    sub r1, r3, #0x44
    cmp r0, r1
    bgt .L_634
    bge .L_720
    sub r1, r3, #0x47
    cmp r0, r1
    beq .L_720
    b .L_740
.L_634:
    sub r1, r3, #0x3c
    cmp r0, r1
    bgt .L_648
    beq .L_6f0
    b .L_740
.L_648:
    sub r1, r3, #0x3b
    cmp r0, r1
    beq .L_708
    b .L_740
.L_658:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_6ac
    bge .L_730
    add r1, r3, #0xa8
    cmp r0, r1
    bgt .L_688
    bge .L_728
    sub r1, r2, #0x228
    cmp r0, r1
    beq .L_6f0
    b .L_740
.L_688:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_69c
    beq .L_710
    b .L_740
.L_69c:
    sub r1, r2, #0x1
    cmp r0, r1
    beq .L_730
    b .L_740
.L_6ac:
    add r1, r2, #0x5
    cmp r0, r1
    bgt .L_6cc
    bge .L_738
    add r1, r2, #0x1
    cmp r0, r1
    beq .L_730
    b .L_740
.L_6cc:
    add r1, r2, #0x6
    cmp r0, r1
    bgt .L_6e0
    beq .L_738
    b .L_740
.L_6e0:
    add r1, r2, #0x7
    cmp r0, r1
    beq .L_738
    b .L_740
.L_6f0:
    mov r0, #0x1
    bx lr
.L_6f8:
    mov r0, #0x2
    bx lr
.L_700:
    mov r0, #0x3
    bx lr
.L_708:
    mov r0, #0x4
    bx lr
.L_710:
    mov r0, #0x5
    bx lr
.L_718:
    mov r0, #0x6
    bx lr
.L_720:
    mov r0, #0x7
    bx lr
.L_728:
    mov r0, #0x8
    bx lr
.L_730:
    mov r0, #0x9
    bx lr
.L_738:
    mov r0, #0xa
    bx lr
.L_740:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000185e
_LIT1: .word 0x00001814
_LIT2: .word 0x00001ad7
_LIT3: .word 0x0000198c

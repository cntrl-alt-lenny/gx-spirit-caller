; func_02004684 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02004684
        .arm
func_02004684:
    ldrb r2, [r0]
    ldrb r1, [r0, #0x1]
    ldr r0, _LIT0
    orr r1, r1, r2, lsl #0x8
    cmp r1, r0
    bgt .L_920
    bge .L_a0c
    ldr r3, _LIT1
    cmp r1, r3
    bgt .L_8a8
    bge .L_a0c
    sub r0, r3, #0xd
    cmp r1, r0
    bgt .L_878
    bge .L_a0c
    sub r0, r3, #0x21
    cmp r1, r0
    bgt .L_868
    sub r0, r3, #0x29
    subs r0, r1, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_a14
    b .L_a0c
    b .L_a0c
    b .L_a14
    b .L_a14
    b .L_a0c
    b .L_a14
    b .L_a14
    b .L_a0c
    b .L_a0c
.L_868:
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_878:
    sub r0, r3, #0xa
    cmp r1, r0
    bgt .L_898
    bge .L_a0c
    sub r0, r3, #0xc
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_898:
    sub r0, r3, #0x7
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_8a8:
    sub r2, r0, #0x8
    cmp r1, r2
    bgt .L_8f0
    sub r0, r0, #0x8
    cmp r1, r0
    bge .L_a0c
    add r0, r3, #0xe
    cmp r1, r0
    bgt .L_8e0
    bge .L_a0c
    add r0, r3, #0xc
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_8e0:
    add r0, r3, #0x10
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_8f0:
    sub r2, r0, #0x4
    cmp r1, r2
    bgt .L_910
    bge .L_a0c
    sub r0, r0, #0x6
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_910:
    sub r0, r0, #0x2
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_920:
    add r2, r0, #0x9f
    cmp r1, r2
    bgt .L_9a0
    bge .L_a0c
    add r2, r0, #0x3e
    cmp r1, r2
    bgt .L_970
    bge .L_a0c
    add r2, r0, #0x3a
    cmp r1, r2
    bgt .L_960
    bge .L_a0c
    add r0, r0, #0x1a
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_960:
    add r0, r0, #0x3c
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_970:
    add r2, r0, #0x9b
    cmp r1, r2
    bgt .L_990
    bge .L_a0c
    add r0, r0, #0x99
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_990:
    add r0, r0, #0x9d
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_9a0:
    add r2, r0, #0xde
    cmp r1, r2
    bgt .L_9e0
    bge .L_a0c
    add r2, r0, #0xbb
    cmp r1, r2
    bgt .L_9d0
    bge .L_a0c
    add r0, r0, #0xa1
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_9d0:
    add r0, r0, #0xdc
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_9e0:
    add r2, r0, #0xee
    cmp r1, r2
    bgt .L_a00
    bge .L_a0c
    add r0, r0, #0xe0
    cmp r1, r0
    beq .L_a0c
    b .L_a14
.L_a00:
    add r0, r0, #0xef
    cmp r1, r0
    bne .L_a14
.L_a0c:
    mov r0, #0x1
    bx lr
.L_a14:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000082a7
_LIT1: .word 0x0000816a
_LIT2: .word 0x0000815b

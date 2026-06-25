; func_02004668 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02004668
        .arm
func_02004668:
    ldrb r2, [r0]
    ldrb r1, [r0, #0x1]
    ldr r0, _LIT0
    orr r1, r1, r2, lsl #0x8
    cmp r1, r0
    bgt .L_84c
    bge .L_938
    ldr r3, _LIT1
    cmp r1, r3
    bgt .L_7d4
    bge .L_938
    sub r0, r3, #0xd
    cmp r1, r0
    bgt .L_7a4
    bge .L_938
    sub r0, r3, #0x21
    cmp r1, r0
    bgt .L_794
    sub r0, r3, #0x29
    subs r0, r1, r0
    addpl pc, pc, r0, lsl #0x2
    b .L_940
    b .L_938
    b .L_938
    b .L_940
    b .L_940
    b .L_938
    b .L_940
    b .L_940
    b .L_938
    b .L_938
.L_794:
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_938
    b .L_940
.L_7a4:
    sub r0, r3, #0xa
    cmp r1, r0
    bgt .L_7c4
    bge .L_938
    sub r0, r3, #0xc
    cmp r1, r0
    beq .L_938
    b .L_940
.L_7c4:
    sub r0, r3, #0x7
    cmp r1, r0
    beq .L_938
    b .L_940
.L_7d4:
    sub r2, r0, #0x8
    cmp r1, r2
    bgt .L_81c
    sub r0, r0, #0x8
    cmp r1, r0
    bge .L_938
    add r0, r3, #0xe
    cmp r1, r0
    bgt .L_80c
    bge .L_938
    add r0, r3, #0xc
    cmp r1, r0
    beq .L_938
    b .L_940
.L_80c:
    add r0, r3, #0x10
    cmp r1, r0
    beq .L_938
    b .L_940
.L_81c:
    sub r2, r0, #0x4
    cmp r1, r2
    bgt .L_83c
    bge .L_938
    sub r0, r0, #0x6
    cmp r1, r0
    beq .L_938
    b .L_940
.L_83c:
    sub r0, r0, #0x2
    cmp r1, r0
    beq .L_938
    b .L_940
.L_84c:
    add r2, r0, #0x9f
    cmp r1, r2
    bgt .L_8cc
    bge .L_938
    add r2, r0, #0x3e
    cmp r1, r2
    bgt .L_89c
    bge .L_938
    add r2, r0, #0x3a
    cmp r1, r2
    bgt .L_88c
    bge .L_938
    add r0, r0, #0x1a
    cmp r1, r0
    beq .L_938
    b .L_940
.L_88c:
    add r0, r0, #0x3c
    cmp r1, r0
    beq .L_938
    b .L_940
.L_89c:
    add r2, r0, #0x9b
    cmp r1, r2
    bgt .L_8bc
    bge .L_938
    add r0, r0, #0x99
    cmp r1, r0
    beq .L_938
    b .L_940
.L_8bc:
    add r0, r0, #0x9d
    cmp r1, r0
    beq .L_938
    b .L_940
.L_8cc:
    add r2, r0, #0xde
    cmp r1, r2
    bgt .L_90c
    bge .L_938
    add r2, r0, #0xbb
    cmp r1, r2
    bgt .L_8fc
    bge .L_938
    add r0, r0, #0xa1
    cmp r1, r0
    beq .L_938
    b .L_940
.L_8fc:
    add r0, r0, #0xdc
    cmp r1, r0
    beq .L_938
    b .L_940
.L_90c:
    add r2, r0, #0xee
    cmp r1, r2
    bgt .L_92c
    bge .L_938
    add r0, r0, #0xe0
    cmp r1, r0
    beq .L_938
    b .L_940
.L_92c:
    add r0, r0, #0xef
    cmp r1, r0
    bne .L_940
.L_938:
    mov r0, #0x1
    bx lr
.L_940:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000082a7
_LIT1: .word 0x0000816a
_LIT2: .word 0x0000815b

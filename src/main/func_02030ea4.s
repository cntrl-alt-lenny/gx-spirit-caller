; func_02030ea4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02030ea4
        .arm
func_02030ea4:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_968
    bge .L_aa0
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_914
    bge .L_a90
    sub r1, r3, #0x520
    cmp r0, r1
    bgt .L_8f0
    bge .L_a68
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_8e0
    beq .L_aa0
    b .L_aa8
.L_8e0:
    add r1, r1, #0xb
    cmp r0, r1
    beq .L_a68
    b .L_aa8
.L_8f0:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_904
    beq .L_a70
    b .L_aa8
.L_904:
    sub r1, r2, #0x8d
    cmp r0, r1
    beq .L_a90
    b .L_aa8
.L_914:
    cmp r0, #0x1400
    bgt .L_944
    bge .L_a78
    add r1, r2, #0x45
    cmp r0, r1
    bgt .L_934
    beq .L_aa0
    b .L_aa8
.L_934:
    add r1, r2, #0x52
    cmp r0, r1
    beq .L_aa0
    b .L_aa8
.L_944:
    sub r1, r3, #0x8c
    cmp r0, r1
    bgt .L_958
    beq .L_a88
    b .L_aa8
.L_958:
    add r1, r2, #0x1e4
    cmp r0, r1
    beq .L_a80
    b .L_aa8
.L_968:
    add r1, r3, #0x2e8
    cmp r0, r1
    bgt .L_a04
    ldr r2, _LIT4
    cmp r0, r2
    blt .L_994
    beq .L_a68
    add r1, r2, #0x1
    cmp r0, r1
    beq .L_a98
    b .L_aa8
.L_994:
    sub r1, r2, #0x174
    cmp r0, r1
    bgt .L_9e0
    bge .L_a90
    sub r1, r2, #0x270
    cmp r0, r1
    bgt .L_9d0
    sub r1, r2, #0x274
    cmp r0, r1
    blt .L_aa8
    beq .L_a88
    sub r1, r2, #0x270
    cmp r0, r1
    beq .L_aa0
    b .L_aa8
.L_9d0:
    add r1, r3, #0xc5
    cmp r0, r1
    beq .L_aa0
    b .L_aa8
.L_9e0:
    sub r1, r2, #0x6f
    cmp r0, r1
    bgt .L_9f4
    beq .L_a88
    b .L_aa8
.L_9f4:
    sub r1, r2, #0x1
    cmp r0, r1
    beq .L_aa0
    b .L_aa8
.L_a04:
    add r1, r3, #0x3e0
    cmp r0, r1
    bgt .L_a38
    bge .L_aa0
    ldr r1, _LIT5
    cmp r0, r1
    bgt .L_a28
    beq .L_a88
    b .L_aa8
.L_a28:
    add r1, r1, #0x10
    cmp r0, r1
    beq .L_a90
    b .L_aa8
.L_a38:
    ldr r1, _LIT6
    cmp r0, r1
    bgt .L_a58
    bge .L_a70
    sub r1, r1, #0x25
    cmp r0, r1
    beq .L_a88
    b .L_aa8
.L_a58:
    add r1, r1, #0x6
    cmp r0, r1
    beq .L_a80
    b .L_aa8
.L_a68:
    ldr r0, _LIT7
    bx lr
.L_a70:
    mov r0, #0x3
    bx lr
.L_a78:
    mov r0, #0x2
    bx lr
.L_a80:
    mov r0, #0x3
    bx lr
.L_a88:
    mov r0, #0x2
    bx lr
.L_a90:
    mov r0, #0x0
    bx lr
.L_a98:
    mov r0, #0x0
    bx lr
.L_aa0:
    ldr r0, _LIT7
    bx lr
.L_aa8:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001529
_LIT1: .word 0x000012c8
_LIT2: .word 0x00000fee
_LIT3: .word 0x00001102
_LIT4: .word 0x00001810
_LIT5: .word 0x0000187c
_LIT6: .word 0x00001aa3
_LIT7: .word 0x0000ffff

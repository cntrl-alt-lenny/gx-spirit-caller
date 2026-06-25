; func_02030068 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02030068
        .arm
func_02030068:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_d0c
    bge .L_f20
    sub r2, r1, #0x2d4
    cmp r0, r2
    bgt .L_be0
    sub r1, r1, #0x2d4
    cmp r0, r1
    bge .L_f18
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_b70
    sub r1, r3, #0x1
    cmp r0, r1
    blt .L_ae8
    cmpne r0, r3
    beq .L_f18
    b .L_f40
.L_ae8:
    sub r1, r3, #0x168
    cmp r0, r1
    bgt .L_b40
    bge .L_f28
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_b30
    bge .L_f28
    sub r1, r2, #0x6
    cmp r0, r1
    bgt .L_f40
    sub r1, r2, #0x7
    cmp r0, r1
    blt .L_f40
    subne r1, r2, #0x6
    cmpne r0, r1
    beq .L_f18
    b .L_f40
.L_b30:
    add r1, r2, #0x4
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_b40:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_b60
    bge .L_f18
    sub r1, r1, #0x12
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_b60:
    sub r1, r3, #0x2
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_b70:
    ldr r2, _LIT4
    cmp r0, r2
    bgt .L_bb0
    bge .L_f18
    sub r1, r2, #0x144
    cmp r0, r1
    bgt .L_ba0
    bge .L_f18
    add r1, r3, #0xd
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_ba0:
    sub r1, r2, #0x5f
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_bb0:
    add r1, r2, #0x85
    cmp r0, r1
    bgt .L_bd0
    bge .L_f18
    add r1, r2, #0x7d
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_bd0:
    add r1, r2, #0x9a
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_be0:
    ldr r3, _LIT5
    cmp r0, r3
    bgt .L_c84
    bge .L_f30
    sub r2, r3, #0xfb
    cmp r0, r2
    bgt .L_c54
    bge .L_f18
    sub r2, r1, #0x25c
    cmp r0, r2
    bgt .L_c44
    sub r1, r1, #0x25c
    cmp r0, r1
    bge .L_f18
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_f40
    sub r1, r2, #0x2
    cmp r0, r1
    blt .L_f40
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    beq .L_f18
    b .L_f40
.L_c44:
    sub r1, r1, #0x224
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_c54:
    sub r1, r3, #0x2
    cmp r0, r1
    bgt .L_c74
    bge .L_f30
    sub r1, r3, #0xcd
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_c74:
    sub r1, r3, #0x1
    cmp r0, r1
    beq .L_f30
    b .L_f40
.L_c84:
    add r1, r3, #0x82
    cmp r0, r1
    bgt .L_cc4
    bge .L_f18
    add r1, r3, #0x80
    cmp r0, r1
    bgt .L_cb4
    bge .L_f18
    add r1, r3, #0x37
    cmp r0, r1
    beq .L_f30
    b .L_f40
.L_cb4:
    add r1, r3, #0x81
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_cc4:
    add r1, r3, #0x86
    cmp r0, r1
    bgt .L_cfc
    add r1, r3, #0x84
    cmp r0, r1
    blt .L_cec
    addne r1, r3, #0x86
    cmpne r0, r1
    beq .L_f18
    b .L_f40
.L_cec:
    add r1, r3, #0x83
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_cfc:
    add r1, r3, #0x9f
    cmp r0, r1
    beq .L_f18
    b .L_f40
.L_d0c:
    add r2, r1, #0x190
    cmp r0, r2
    bgt .L_e0c
    bge .L_f20
    add r2, r1, #0xbe
    cmp r0, r2
    bgt .L_d9c
    bge .L_f30
    add r2, r1, #0x6e
    cmp r0, r2
    bgt .L_d6c
    bge .L_f20
    add r2, r1, #0x30
    cmp r0, r2
    bgt .L_d5c
    bge .L_f30
    add r1, r1, #0x14
    cmp r0, r1
    beq .L_f20
    b .L_f40
.L_d5c:
    add r1, r1, #0x6a
    cmp r0, r1
    beq .L_f20
    b .L_f40
.L_d6c:
    add r2, r1, #0x7c
    cmp r0, r2
    bgt .L_d8c
    bge .L_f30
    add r1, r1, #0x71
    cmp r0, r1
    beq .L_f38
    b .L_f40
.L_d8c:
    add r1, r1, #0x83
    cmp r0, r1
    beq .L_f30
    b .L_f40
.L_d9c:
    ldr r2, _LIT7
    cmp r0, r2
    bgt .L_ddc
    bge .L_f20
    sub r1, r2, #0x2a
    cmp r0, r1
    bgt .L_dcc
    bge .L_f30
    sub r1, r2, #0x7b
    cmp r0, r1
    beq .L_f30
    b .L_f40
.L_dcc:
    sub r1, r2, #0x1
    cmp r0, r1
    beq .L_f20
    b .L_f40
.L_ddc:
    add r1, r2, #0x1f
    cmp r0, r1
    bgt .L_dfc
    bge .L_f20
    add r1, r2, #0xf
    cmp r0, r1
    beq .L_f30
    b .L_f40
.L_dfc:
    add r1, r2, #0x24
    cmp r0, r1
    beq .L_f20
    b .L_f40
.L_e0c:
    ldr r1, _LIT8
    cmp r0, r1
    bgt .L_e8c
    bge .L_f20
    sub r2, r1, #0x1a
    cmp r0, r2
    bgt .L_e5c
    bge .L_f20
    sub r2, r1, #0x55
    cmp r0, r2
    bgt .L_e4c
    bge .L_f30
    sub r1, r1, #0xa0
    cmp r0, r1
    beq .L_f30
    b .L_f40
.L_e4c:
    sub r1, r1, #0x24
    cmp r0, r1
    beq .L_f20
    b .L_f40
.L_e5c:
    sub r2, r1, #0x2
    cmp r0, r2
    bgt .L_e7c
    bge .L_f20
    sub r1, r1, #0x3
    cmp r0, r1
    beq .L_f20
    b .L_f40
.L_e7c:
    sub r1, r1, #0x1
    cmp r0, r1
    beq .L_f20
    b .L_f40
.L_e8c:
    add r2, r1, #0x24
    cmp r0, r2
    bgt .L_ecc
    bge .L_f20
    add r2, r1, #0x3
    cmp r0, r2
    bgt .L_ebc
    bge .L_f30
    add r1, r1, #0x2
    cmp r0, r1
    beq .L_f30
    b .L_f40
.L_ebc:
    add r1, r1, #0x22
    cmp r0, r1
    beq .L_f20
    b .L_f40
.L_ecc:
    add r2, r1, #0x28
    cmp r0, r2
    bgt .L_eec
    bge .L_f30
    add r1, r1, #0x27
    cmp r0, r1
    beq .L_f30
    b .L_f40
.L_eec:
    add r2, r1, #0x4a
    cmp r0, r2
    bgt .L_f08
    add r1, r1, #0x4a
    cmp r0, r1
    beq .L_f20
    b .L_f40
.L_f08:
    add r1, r1, #0xbf
    cmp r0, r1
    beq .L_f20
    b .L_f40
.L_f18:
    mov r0, #0x1
    bx lr
.L_f20:
    mov r0, #0x2
    bx lr
.L_f28:
    mov r0, #0x3
    bx lr
.L_f30:
    mov r0, #0x4
    bx lr
.L_f38:
    mov r0, #0x5
    bx lr
.L_f40:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001758
_LIT1: .word 0x0000127f
_LIT2: .word 0x00000fe5
_LIT3: .word 0x0000112e
_LIT4: .word 0x000013e9
_LIT5: .word 0x00001645
_LIT6: .word 0x00001487
_LIT7: .word 0x00001895
_LIT8: .word 0x000019a6

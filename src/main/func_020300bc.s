; func_020300bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020300bc
        .arm
func_020300bc:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_d60
    bge .L_f74
    sub r2, r1, #0x2d4
    cmp r0, r2
    bgt .L_c34
    sub r1, r1, #0x2d4
    cmp r0, r1
    bge .L_f6c
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_bc4
    sub r1, r3, #0x1
    cmp r0, r1
    blt .L_b3c
    cmpne r0, r3
    beq .L_f6c
    b .L_f94
.L_b3c:
    sub r1, r3, #0x168
    cmp r0, r1
    bgt .L_b94
    bge .L_f7c
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_b84
    bge .L_f7c
    sub r1, r2, #0x6
    cmp r0, r1
    bgt .L_f94
    sub r1, r2, #0x7
    cmp r0, r1
    blt .L_f94
    subne r1, r2, #0x6
    cmpne r0, r1
    beq .L_f6c
    b .L_f94
.L_b84:
    add r1, r2, #0x4
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_b94:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_bb4
    bge .L_f6c
    sub r1, r1, #0x12
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_bb4:
    sub r1, r3, #0x2
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_bc4:
    ldr r2, _LIT4
    cmp r0, r2
    bgt .L_c04
    bge .L_f6c
    sub r1, r2, #0x144
    cmp r0, r1
    bgt .L_bf4
    bge .L_f6c
    add r1, r3, #0xd
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_bf4:
    sub r1, r2, #0x5f
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_c04:
    add r1, r2, #0x85
    cmp r0, r1
    bgt .L_c24
    bge .L_f6c
    add r1, r2, #0x7d
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_c24:
    add r1, r2, #0x9a
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_c34:
    ldr r3, _LIT5
    cmp r0, r3
    bgt .L_cd8
    bge .L_f84
    sub r2, r3, #0xfb
    cmp r0, r2
    bgt .L_ca8
    bge .L_f6c
    sub r2, r1, #0x25c
    cmp r0, r2
    bgt .L_c98
    sub r1, r1, #0x25c
    cmp r0, r1
    bge .L_f6c
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_f94
    sub r1, r2, #0x2
    cmp r0, r1
    blt .L_f94
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    beq .L_f6c
    b .L_f94
.L_c98:
    sub r1, r1, #0x224
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_ca8:
    sub r1, r3, #0x2
    cmp r0, r1
    bgt .L_cc8
    bge .L_f84
    sub r1, r3, #0xcd
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_cc8:
    sub r1, r3, #0x1
    cmp r0, r1
    beq .L_f84
    b .L_f94
.L_cd8:
    add r1, r3, #0x82
    cmp r0, r1
    bgt .L_d18
    bge .L_f6c
    add r1, r3, #0x80
    cmp r0, r1
    bgt .L_d08
    bge .L_f6c
    add r1, r3, #0x37
    cmp r0, r1
    beq .L_f84
    b .L_f94
.L_d08:
    add r1, r3, #0x81
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_d18:
    add r1, r3, #0x86
    cmp r0, r1
    bgt .L_d50
    add r1, r3, #0x84
    cmp r0, r1
    blt .L_d40
    addne r1, r3, #0x86
    cmpne r0, r1
    beq .L_f6c
    b .L_f94
.L_d40:
    add r1, r3, #0x83
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_d50:
    add r1, r3, #0x9f
    cmp r0, r1
    beq .L_f6c
    b .L_f94
.L_d60:
    add r2, r1, #0x190
    cmp r0, r2
    bgt .L_e60
    bge .L_f74
    add r2, r1, #0xbe
    cmp r0, r2
    bgt .L_df0
    bge .L_f84
    add r2, r1, #0x6e
    cmp r0, r2
    bgt .L_dc0
    bge .L_f74
    add r2, r1, #0x30
    cmp r0, r2
    bgt .L_db0
    bge .L_f84
    add r1, r1, #0x14
    cmp r0, r1
    beq .L_f74
    b .L_f94
.L_db0:
    add r1, r1, #0x6a
    cmp r0, r1
    beq .L_f74
    b .L_f94
.L_dc0:
    add r2, r1, #0x7c
    cmp r0, r2
    bgt .L_de0
    bge .L_f84
    add r1, r1, #0x71
    cmp r0, r1
    beq .L_f8c
    b .L_f94
.L_de0:
    add r1, r1, #0x83
    cmp r0, r1
    beq .L_f84
    b .L_f94
.L_df0:
    ldr r2, _LIT7
    cmp r0, r2
    bgt .L_e30
    bge .L_f74
    sub r1, r2, #0x2a
    cmp r0, r1
    bgt .L_e20
    bge .L_f84
    sub r1, r2, #0x7b
    cmp r0, r1
    beq .L_f84
    b .L_f94
.L_e20:
    sub r1, r2, #0x1
    cmp r0, r1
    beq .L_f74
    b .L_f94
.L_e30:
    add r1, r2, #0x1f
    cmp r0, r1
    bgt .L_e50
    bge .L_f74
    add r1, r2, #0xf
    cmp r0, r1
    beq .L_f84
    b .L_f94
.L_e50:
    add r1, r2, #0x24
    cmp r0, r1
    beq .L_f74
    b .L_f94
.L_e60:
    ldr r1, _LIT8
    cmp r0, r1
    bgt .L_ee0
    bge .L_f74
    sub r2, r1, #0x1a
    cmp r0, r2
    bgt .L_eb0
    bge .L_f74
    sub r2, r1, #0x55
    cmp r0, r2
    bgt .L_ea0
    bge .L_f84
    sub r1, r1, #0xa0
    cmp r0, r1
    beq .L_f84
    b .L_f94
.L_ea0:
    sub r1, r1, #0x24
    cmp r0, r1
    beq .L_f74
    b .L_f94
.L_eb0:
    sub r2, r1, #0x2
    cmp r0, r2
    bgt .L_ed0
    bge .L_f74
    sub r1, r1, #0x3
    cmp r0, r1
    beq .L_f74
    b .L_f94
.L_ed0:
    sub r1, r1, #0x1
    cmp r0, r1
    beq .L_f74
    b .L_f94
.L_ee0:
    add r2, r1, #0x24
    cmp r0, r2
    bgt .L_f20
    bge .L_f74
    add r2, r1, #0x3
    cmp r0, r2
    bgt .L_f10
    bge .L_f84
    add r1, r1, #0x2
    cmp r0, r1
    beq .L_f84
    b .L_f94
.L_f10:
    add r1, r1, #0x22
    cmp r0, r1
    beq .L_f74
    b .L_f94
.L_f20:
    add r2, r1, #0x28
    cmp r0, r2
    bgt .L_f40
    bge .L_f84
    add r1, r1, #0x27
    cmp r0, r1
    beq .L_f84
    b .L_f94
.L_f40:
    add r2, r1, #0x4a
    cmp r0, r2
    bgt .L_f5c
    add r1, r1, #0x4a
    cmp r0, r1
    beq .L_f74
    b .L_f94
.L_f5c:
    add r1, r1, #0xbf
    cmp r0, r1
    beq .L_f74
    b .L_f94
.L_f6c:
    mov r0, #0x1
    bx lr
.L_f74:
    mov r0, #0x2
    bx lr
.L_f7c:
    mov r0, #0x3
    bx lr
.L_f84:
    mov r0, #0x4
    bx lr
.L_f8c:
    mov r0, #0x5
    bx lr
.L_f94:
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

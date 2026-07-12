; func_ov002_021f3ab0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021f3ab0
        .arm
func_ov002_021f3ab0:
    ldrh r2, [r0]
    ldr r1, _LIT0
    cmp r2, r1
    bgt .L_9d0
    bge .L_c68
    sub r0, r1, #0x1f4
    cmp r2, r0
    bgt .L_898
    bge .L_c48
    ldr r3, _LIT1
    cmp r2, r3
    bgt .L_7fc
    bge .L_c50
    sub r0, r3, #0x148
    cmp r2, r0
    bgt .L_7b8
    bge .L_c48
    ldr r0, _LIT2
    cmp r2, r0
    bgt .L_7a8
    bge .L_c68
    cmp r2, #0xfe0
    beq .L_c68
    b .L_c70
.L_7a8:
    ldr r0, _LIT3
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_7b8:
    sub r0, r3, #0x120
    cmp r2, r0
    bgt .L_7d8
    bge .L_c58
    ldr r0, _LIT4
    cmp r2, r0
    beq .L_c60
    b .L_c70
.L_7d8:
    sub r0, r3, #0x51
    cmp r2, r0
    bgt .L_7ec
    beq .L_c48
    b .L_c70
.L_7ec:
    sub r0, r3, #0x25
    cmp r2, r0
    beq .L_c68
    b .L_c70
.L_7fc:
    add r0, r3, #0x61
    cmp r2, r0
    bgt .L_83c
    bge .L_c50
    add r0, r3, #0x2a
    cmp r2, r0
    bgt .L_82c
    bge .L_c48
    add r0, r3, #0x1b
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_82c:
    add r0, r3, #0x39
    cmp r2, r0
    beq .L_c68
    b .L_c70
.L_83c:
    add r0, r3, #0x98
    cmp r2, r0
    bgt .L_874
    add r0, r3, #0x96
    cmp r2, r0
    blt .L_864
    addne r0, r3, #0x98
    cmpne r2, r0
    beq .L_c48
    b .L_c70
.L_864:
    add r0, r3, #0x91
    cmp r2, r0
    beq .L_c68
    b .L_c70
.L_874:
    sub r0, r1, #0x208
    cmp r2, r0
    bgt .L_888
    beq .L_c68
    b .L_c70
.L_888:
    add r0, r3, #0x160
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_898:
    sub r0, r1, #0x164
    cmp r2, r0
    bgt .L_94c
    bge .L_c58
    ldr r1, _LIT5
    cmp r2, r1
    bgt .L_8e8
    bge .L_c48
    sub r0, r1, #0x16
    cmp r2, r0
    bgt .L_8d8
    bge .L_c48
    sub r0, r1, #0x1a
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_8d8:
    sub r0, r1, #0x13
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_8e8:
    add r0, r1, #0x32
    cmp r2, r0
    bgt .L_908
    bge .L_c48
    add r0, r1, #0x22
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_908:
    add r0, r1, #0x36
    cmp r2, r0
    bgt .L_93c
    add r0, r1, #0x33
    cmp r2, r0
    blt .L_c70
    addne r0, r1, #0x35
    cmpne r2, r0
    beq .L_c48
    add r0, r1, #0x36
    cmp r2, r0
    beq .L_c68
    b .L_c70
.L_93c:
    add r0, r1, #0x55
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_94c:
    sub r0, r1, #0x75
    cmp r2, r0
    bgt .L_98c
    bge .L_c68
    sub r0, r1, #0xea
    cmp r2, r0
    bgt .L_97c
    bge .L_c68
    sub r0, r1, #0xf6
    cmp r2, r0
    beq .L_c58
    b .L_c70
.L_97c:
    sub r0, r1, #0xbf
    cmp r2, r0
    beq .L_c68
    b .L_c70
.L_98c:
    sub r0, r1, #0x44
    cmp r2, r0
    bgt .L_9ac
    bge .L_c68
    sub r0, r1, #0x48
    cmp r2, r0
    beq .L_c68
    b .L_c70
.L_9ac:
    sub r0, r1, #0x38
    cmp r2, r0
    bgt .L_9c0
    beq .L_c68
    b .L_c70
.L_9c0:
    sub r0, r1, #0x33
    cmp r2, r0
    beq .L_c68
    b .L_c70
.L_9d0:
    ldr r0, _LIT6
    cmp r2, r0
    bgt .L_b24
    bge .L_c48
    sub r3, r0, #0xa6
    cmp r2, r3
    bgt .L_a9c
    bge .L_c48
    sub r3, r0, #0xe9
    cmp r2, r3
    bgt .L_a38
    bge .L_c48
    sub r3, r0, #0x128
    cmp r2, r3
    bgt .L_a28
    sub r0, r0, #0x128
    cmp r2, r0
    bge .L_c48
    add r0, r1, #0x2
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_a28:
    sub r0, r0, #0xef
    cmp r2, r0
    beq .L_c50
    b .L_c70
.L_a38:
    sub r1, r0, #0xe4
    cmp r2, r1
    bgt .L_a70
    sub r1, r0, #0xe5
    cmp r2, r1
    blt .L_a60
    subne r0, r0, #0xe4
    cmpne r2, r0
    beq .L_c48
    b .L_c70
.L_a60:
    sub r0, r0, #0xe8
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_a70:
    sub r1, r0, #0xdc
    cmp r2, r1
    bgt .L_a8c
    sub r0, r0, #0xdc
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_a8c:
    sub r0, r0, #0xb3
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_a9c:
    sub r1, r0, #0x64
    cmp r2, r1
    bgt .L_adc
    bge .L_c48
    sub r1, r0, #0x98
    cmp r2, r1
    bgt .L_acc
    bge .L_c68
    sub r0, r0, #0x9f
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_acc:
    sub r0, r0, #0x67
    cmp r2, r0
    beq .L_c68
    b .L_c70
.L_adc:
    cmp r2, #0x1900
    bgt .L_af8
    bge .L_c68
    sub r0, r0, #0x62
    cmp r2, r0
    beq .L_c68
    b .L_c70
.L_af8:
    sub r1, r0, #0x1f
    cmp r2, r1
    bgt .L_b14
    sub r0, r0, #0x1f
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_b14:
    sub r0, r0, #0xf
    cmp r2, r0
    beq .L_c68
    b .L_c70
.L_b24:
    add r3, r1, #0x2c4
    cmp r2, r3
    bgt .L_bc8
    add r1, r1, #0x2c4
    cmp r2, r1
    bge .L_c68
    add r1, r0, #0x89
    cmp r2, r1
    bgt .L_b7c
    bge .L_c48
    add r1, r0, #0x26
    cmp r2, r1
    bgt .L_b6c
    bge .L_c48
    add r0, r0, #0x9
    cmp r2, r0
    beq .L_c68
    b .L_c70
.L_b6c:
    add r0, r0, #0x81
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_b7c:
    add r1, r0, #0xc6
    cmp r2, r1
    bgt .L_b9c
    bge .L_c48
    add r0, r0, #0xae
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_b9c:
    add r1, r0, #0xdc
    cmp r2, r1
    bgt .L_bb8
    add r0, r0, #0xdc
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_bb8:
    ldr r0, _LIT7
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_bc8:
    ldr r1, _LIT8
    cmp r2, r1
    bgt .L_c08
    bge .L_c48
    sub r0, r1, #0x6f
    cmp r2, r0
    bgt .L_bf8
    bge .L_c48
    sub r0, r1, #0x71
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_bf8:
    sub r0, r1, #0x44
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_c08:
    add r0, r1, #0x63
    cmp r2, r0
    bgt .L_c28
    bge .L_c48
    add r0, r1, #0x62
    cmp r2, r0
    beq .L_c48
    b .L_c70
.L_c28:
    add r0, r1, #0x64
    cmp r2, r0
    bgt .L_c3c
    beq .L_c48
    b .L_c70
.L_c3c:
    add r0, r1, #0x65
    cmp r2, r0
    bne .L_c70
.L_c48:
    mov r0, #0x1
    bx lr
.L_c50:
    mov r0, #0x1
    bx lr
.L_c58:
    mov r0, #0x2
    bx lr
.L_c60:
    mov r0, #0x5
    bx lr
.L_c68:
    mov r0, #0x1
    bx lr
.L_c70:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000179c
_LIT1: .word 0x00001446
_LIT2: .word 0x0000114f
_LIT3: .word 0x000012f8
_LIT4: .word 0x00001321
_LIT5: .word 0x000015c7
_LIT6: .word 0x0000192d
_LIT7: .word 0x00001a42
_LIT8: .word 0x00001adf

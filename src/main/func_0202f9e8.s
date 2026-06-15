; func_0202f9e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f9e8
        .arm
func_0202f9e8:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_77c
    bge .L_abc
    ldr r1, _LIT1
    cmp r0, r1
    bgt .L_5cc
    bge .L_ab4
    sub r2, r1, #0xe7
    cmp r0, r2
    bgt .L_510
    bge .L_ab4
    sub r2, r1, #0x1fc
    cmp r0, r2
    bgt .L_4b8
    bge .L_ab4
    sub r1, r1, #0x288
    cmp r0, r1
    bgt .L_494
    ldr r1, _LIT2
    cmp r0, r1
    blt .L_484
    addne r1, r1, #0x1
    cmpne r0, r1
    beq .L_ab4
    b .L_ac4
.L_484:
    sub r1, r1, #0x2b
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_494:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_4a8
    beq .L_ab4
    b .L_ac4
.L_4a8:
    add r1, r1, #0x45
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_4b8:
    ldr r2, _LIT4
    cmp r0, r2
    bgt .L_4ec
    bge .L_ab4
    sub r1, r2, #0xc4
    cmp r0, r1
    bgt .L_4dc
    beq .L_ab4
    b .L_ac4
.L_4dc:
    sub r1, r2, #0x22
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_4ec:
    add r1, r2, #0x7
    cmp r0, r1
    bgt .L_500
    beq .L_ab4
    b .L_ac4
.L_500:
    add r1, r2, #0x1c
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_510:
    sub r2, r1, #0x92
    cmp r0, r2
    bgt .L_56c
    bge .L_ab4
    sub r2, r1, #0xbf
    cmp r0, r2
    bgt .L_540
    bge .L_ab4
    sub r1, r1, #0xc0
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_540:
    sub r2, r1, #0xaa
    cmp r0, r2
    bgt .L_55c
    sub r1, r1, #0xaa
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_55c:
    sub r1, r1, #0x95
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_56c:
    sub r2, r1, #0x79
    cmp r0, r2
    bgt .L_5a4
    bge .L_ab4
    sub r2, r1, #0x8d
    cmp r0, r2
    bgt .L_598
    sub r1, r1, #0x8d
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_598:
    cmp r0, #0x1200
    beq .L_ab4
    b .L_ac4
.L_5a4:
    sub r2, r1, #0x5b
    cmp r0, r2
    bgt .L_5c0
    sub r1, r1, #0x5b
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_5c0:
    cmp r0, #0x1280
    beq .L_ab4
    b .L_ac4
.L_5cc:
    add r2, r1, #0x190
    cmp r0, r2
    bgt .L_6ac
    bge .L_ab4
    add r2, r1, #0xb9
    cmp r0, r2
    bgt .L_638
    bge .L_ab4
    add r2, r1, #0x27
    cmp r0, r2
    bgt .L_60c
    bge .L_ab4
    add r1, r1, #0x1f
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_60c:
    add r2, r1, #0x8d
    cmp r0, r2
    bgt .L_628
    add r1, r1, #0x8d
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_628:
    add r1, r1, #0xaf
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_638:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_66c
    bge .L_ab4
    sub r1, r2, #0x42
    cmp r0, r1
    bgt .L_65c
    beq .L_ab4
    b .L_ac4
.L_65c:
    sub r1, r2, #0x41
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_66c:
    add r1, r2, #0x9
    cmp r0, r1
    bgt .L_69c
    add r1, r2, #0x2
    cmp r0, r1
    blt .L_ac4
    addne r1, r2, #0x5
    cmpne r0, r1
    addne r1, r2, #0x9
    cmpne r0, r1
    beq .L_ab4
    b .L_ac4
.L_69c:
    add r1, r2, #0x12
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_6ac:
    sub r2, r3, #0x72
    cmp r0, r2
    bgt .L_71c
    bge .L_ab4
    sub r2, r3, #0xae
    cmp r0, r2
    bgt .L_6f8
    bge .L_ab4
    sub r2, r3, #0xea
    cmp r0, r2
    bgt .L_6e8
    mov r1, r2
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_6e8:
    add r1, r1, #0x1cc
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_6f8:
    sub r1, r3, #0x7c
    cmp r0, r1
    bgt .L_70c
    beq .L_ab4
    b .L_ac4
.L_70c:
    sub r1, r3, #0x74
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_71c:
    add r2, r1, #0x24c
    cmp r0, r2
    bgt .L_758
    add r1, r1, #0x24c
    cmp r0, r1
    bge .L_ab4
    sub r1, r3, #0x34
    cmp r0, r1
    bgt .L_748
    beq .L_ab4
    b .L_ac4
.L_748:
    sub r1, r3, #0x30
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_758:
    sub r1, r3, #0xe
    cmp r0, r1
    bgt .L_76c
    beq .L_ab4
    b .L_ac4
.L_76c:
    sub r1, r3, #0x2
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_77c:
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_8f4
    bge .L_abc
    sub r1, r2, #0x118
    cmp r0, r1
    bgt .L_848
    bge .L_ab4
    add r1, r3, #0x33
    cmp r0, r1
    bgt .L_7f0
    bge .L_ab4
    add r1, r3, #0x28
    cmp r0, r1
    bgt .L_7cc
    bge .L_ab4
    sub r1, r2, #0x1a8
    cmp r0, r1
    beq .L_abc
    b .L_ac4
.L_7cc:
    add r1, r3, #0x29
    cmp r0, r1
    bgt .L_7e0
    beq .L_abc
    b .L_ac4
.L_7e0:
    sub r1, r2, #0x184
    cmp r0, r1
    beq .L_abc
    b .L_ac4
.L_7f0:
    add r1, r3, #0x88
    cmp r0, r1
    bgt .L_824
    bge .L_ab4
    add r1, r3, #0x37
    cmp r0, r1
    bgt .L_814
    beq .L_abc
    b .L_ac4
.L_814:
    add r1, r3, #0x38
    cmp r0, r1
    beq .L_abc
    b .L_ac4
.L_824:
    sub r1, r2, #0x124
    cmp r0, r1
    bgt .L_838
    beq .L_ab4
    b .L_ac4
.L_838:
    add r1, r3, #0x93
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_848:
    sub r1, r2, #0x8e
    cmp r0, r1
    bgt .L_89c
    bge .L_ab4
    sub r1, r2, #0xce
    cmp r0, r1
    bgt .L_878
    bge .L_ab4
    rsb r1, r2, #0x2c40
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_878:
    sub r1, r2, #0x98
    cmp r0, r1
    bgt .L_88c
    beq .L_ab4
    b .L_ac4
.L_88c:
    sub r1, r2, #0x93
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_89c:
    sub r1, r2, #0x64
    cmp r0, r1
    bgt .L_8d0
    bge .L_ab4
    sub r1, r2, #0x8c
    cmp r0, r1
    bgt .L_8c0
    beq .L_ab4
    b .L_ac4
.L_8c0:
    sub r1, r2, #0x88
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_8d0:
    sub r1, r2, #0x22
    cmp r0, r1
    bgt .L_8e4
    beq .L_ab4
    b .L_ac4
.L_8e4:
    sub r1, r2, #0x17
    cmp r0, r1
    beq .L_abc
    b .L_ac4
.L_8f4:
    ldr r1, _LIT7
    cmp r0, r1
    bgt .L_9d0
    bge .L_abc
    sub r3, r1, #0x59
    cmp r0, r3
    bgt .L_968
    bge .L_ab4
    sub r3, r1, #0x134
    cmp r0, r3
    bgt .L_93c
    sub r1, r1, #0x134
    cmp r0, r1
    bge .L_ab4
    add r1, r2, #0xd
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_93c:
    sub r2, r1, #0x12c
    cmp r0, r2
    bgt .L_958
    sub r1, r1, #0x12c
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_958:
    sub r1, r1, #0x60
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_968:
    sub r2, r1, #0xe
    cmp r0, r2
    bgt .L_9a4
    bge .L_ab4
    sub r2, r1, #0x54
    cmp r0, r2
    bgt .L_994
    sub r1, r1, #0x54
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_994:
    sub r1, r1, #0x19
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_9a4:
    sub r2, r1, #0x4
    cmp r0, r2
    bgt .L_9c0
    sub r1, r1, #0x4
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_9c0:
    sub r1, r1, #0x2
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_9d0:
    add r2, r1, #0xd1
    cmp r0, r2
    bgt .L_a48
    bge .L_ab4
    add r2, r1, #0xb1
    cmp r0, r2
    bgt .L_a1c
    bge .L_ab4
    add r2, r1, #0x4b
    cmp r0, r2
    bgt .L_a0c
    add r1, r1, #0x4b
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_a0c:
    add r1, r1, #0x89
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_a1c:
    add r2, r1, #0xc7
    cmp r0, r2
    bgt .L_a38
    add r1, r1, #0xc7
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_a38:
    add r1, r1, #0xd0
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_a48:
    ldr r3, _LIT8
    cmp r0, r3
    bgt .L_a94
    bge .L_ab4
    add r2, r1, #0xd4
    cmp r0, r2
    bgt .L_a84
    cmp r0, #0x18c0
    blt .L_ac4
    subne r2, r3, #0x168
    cmpne r0, r2
    addne r1, r1, #0xd4
    cmpne r0, r1
    beq .L_ab4
    b .L_ac4
.L_a84:
    sub r1, r3, #0xe
    cmp r0, r1
    beq .L_ab4
    b .L_ac4
.L_a94:
    add r1, r3, #0x1
    cmp r0, r1
    bgt .L_aa8
    beq .L_ab4
    b .L_ac4
.L_aa8:
    add r1, r3, #0x67
    cmp r0, r1
    bne .L_ac4
.L_ab4:
    mov r0, #0x1
    bx lr
.L_abc:
    mov r0, #0x2
    bx lr
.L_ac4:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000014fd
_LIT1: .word 0x00001282
_LIT2: .word 0x00000ff9
_LIT3: .word 0x0000100c
_LIT4: .word 0x00001174
_LIT5: .word 0x000013ab
_LIT6: .word 0x000016ab
_LIT7: .word 0x000017ee
_LIT8: .word 0x00001a29

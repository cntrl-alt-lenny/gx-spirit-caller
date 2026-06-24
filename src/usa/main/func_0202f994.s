; func_0202f994 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f994
        .arm
func_0202f994:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_360
    bge .L_6a0
    ldr r1, _LIT1
    cmp r0, r1
    bgt .L_1b0
    bge .L_698
    sub r2, r1, #0xe7
    cmp r0, r2
    bgt .L_f4
    bge .L_698
    sub r2, r1, #0x1fc
    cmp r0, r2
    bgt .L_9c
    bge .L_698
    sub r1, r1, #0x288
    cmp r0, r1
    bgt .L_78
    ldr r1, _LIT2
    cmp r0, r1
    blt .L_68
    addne r1, r1, #0x1
    cmpne r0, r1
    beq .L_698
    b .L_6a8
.L_68:
    sub r1, r1, #0x2b
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_78:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_8c
    beq .L_698
    b .L_6a8
.L_8c:
    add r1, r1, #0x45
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_9c:
    ldr r2, _LIT4
    cmp r0, r2
    bgt .L_d0
    bge .L_698
    sub r1, r2, #0xc4
    cmp r0, r1
    bgt .L_c0
    beq .L_698
    b .L_6a8
.L_c0:
    sub r1, r2, #0x22
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_d0:
    add r1, r2, #0x7
    cmp r0, r1
    bgt .L_e4
    beq .L_698
    b .L_6a8
.L_e4:
    add r1, r2, #0x1c
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_f4:
    sub r2, r1, #0x92
    cmp r0, r2
    bgt .L_150
    bge .L_698
    sub r2, r1, #0xbf
    cmp r0, r2
    bgt .L_124
    bge .L_698
    sub r1, r1, #0xc0
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_124:
    sub r2, r1, #0xaa
    cmp r0, r2
    bgt .L_140
    sub r1, r1, #0xaa
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_140:
    sub r1, r1, #0x95
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_150:
    sub r2, r1, #0x79
    cmp r0, r2
    bgt .L_188
    bge .L_698
    sub r2, r1, #0x8d
    cmp r0, r2
    bgt .L_17c
    sub r1, r1, #0x8d
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_17c:
    cmp r0, #0x1200
    beq .L_698
    b .L_6a8
.L_188:
    sub r2, r1, #0x5b
    cmp r0, r2
    bgt .L_1a4
    sub r1, r1, #0x5b
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_1a4:
    cmp r0, #0x1280
    beq .L_698
    b .L_6a8
.L_1b0:
    add r2, r1, #0x190
    cmp r0, r2
    bgt .L_290
    bge .L_698
    add r2, r1, #0xb9
    cmp r0, r2
    bgt .L_21c
    bge .L_698
    add r2, r1, #0x27
    cmp r0, r2
    bgt .L_1f0
    bge .L_698
    add r1, r1, #0x1f
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_1f0:
    add r2, r1, #0x8d
    cmp r0, r2
    bgt .L_20c
    add r1, r1, #0x8d
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_20c:
    add r1, r1, #0xaf
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_21c:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_250
    bge .L_698
    sub r1, r2, #0x42
    cmp r0, r1
    bgt .L_240
    beq .L_698
    b .L_6a8
.L_240:
    sub r1, r2, #0x41
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_250:
    add r1, r2, #0x9
    cmp r0, r1
    bgt .L_280
    add r1, r2, #0x2
    cmp r0, r1
    blt .L_6a8
    addne r1, r2, #0x5
    cmpne r0, r1
    addne r1, r2, #0x9
    cmpne r0, r1
    beq .L_698
    b .L_6a8
.L_280:
    add r1, r2, #0x12
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_290:
    sub r2, r3, #0x72
    cmp r0, r2
    bgt .L_300
    bge .L_698
    sub r2, r3, #0xae
    cmp r0, r2
    bgt .L_2dc
    bge .L_698
    sub r2, r3, #0xea
    cmp r0, r2
    bgt .L_2cc
    mov r1, r2
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_2cc:
    add r1, r1, #0x1cc
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_2dc:
    sub r1, r3, #0x7c
    cmp r0, r1
    bgt .L_2f0
    beq .L_698
    b .L_6a8
.L_2f0:
    sub r1, r3, #0x74
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_300:
    add r2, r1, #0x24c
    cmp r0, r2
    bgt .L_33c
    add r1, r1, #0x24c
    cmp r0, r1
    bge .L_698
    sub r1, r3, #0x34
    cmp r0, r1
    bgt .L_32c
    beq .L_698
    b .L_6a8
.L_32c:
    sub r1, r3, #0x30
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_33c:
    sub r1, r3, #0xe
    cmp r0, r1
    bgt .L_350
    beq .L_698
    b .L_6a8
.L_350:
    sub r1, r3, #0x2
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_360:
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_4d8
    bge .L_6a0
    sub r1, r2, #0x118
    cmp r0, r1
    bgt .L_42c
    bge .L_698
    add r1, r3, #0x33
    cmp r0, r1
    bgt .L_3d4
    bge .L_698
    add r1, r3, #0x28
    cmp r0, r1
    bgt .L_3b0
    bge .L_698
    sub r1, r2, #0x1a8
    cmp r0, r1
    beq .L_6a0
    b .L_6a8
.L_3b0:
    add r1, r3, #0x29
    cmp r0, r1
    bgt .L_3c4
    beq .L_6a0
    b .L_6a8
.L_3c4:
    sub r1, r2, #0x184
    cmp r0, r1
    beq .L_6a0
    b .L_6a8
.L_3d4:
    add r1, r3, #0x88
    cmp r0, r1
    bgt .L_408
    bge .L_698
    add r1, r3, #0x37
    cmp r0, r1
    bgt .L_3f8
    beq .L_6a0
    b .L_6a8
.L_3f8:
    add r1, r3, #0x38
    cmp r0, r1
    beq .L_6a0
    b .L_6a8
.L_408:
    sub r1, r2, #0x124
    cmp r0, r1
    bgt .L_41c
    beq .L_698
    b .L_6a8
.L_41c:
    add r1, r3, #0x93
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_42c:
    sub r1, r2, #0x8e
    cmp r0, r1
    bgt .L_480
    bge .L_698
    sub r1, r2, #0xce
    cmp r0, r1
    bgt .L_45c
    bge .L_698
    rsb r1, r2, #0x2c40
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_45c:
    sub r1, r2, #0x98
    cmp r0, r1
    bgt .L_470
    beq .L_698
    b .L_6a8
.L_470:
    sub r1, r2, #0x93
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_480:
    sub r1, r2, #0x64
    cmp r0, r1
    bgt .L_4b4
    bge .L_698
    sub r1, r2, #0x8c
    cmp r0, r1
    bgt .L_4a4
    beq .L_698
    b .L_6a8
.L_4a4:
    sub r1, r2, #0x88
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_4b4:
    sub r1, r2, #0x22
    cmp r0, r1
    bgt .L_4c8
    beq .L_698
    b .L_6a8
.L_4c8:
    sub r1, r2, #0x17
    cmp r0, r1
    beq .L_6a0
    b .L_6a8
.L_4d8:
    ldr r1, _LIT7
    cmp r0, r1
    bgt .L_5b4
    bge .L_6a0
    sub r3, r1, #0x59
    cmp r0, r3
    bgt .L_54c
    bge .L_698
    sub r3, r1, #0x134
    cmp r0, r3
    bgt .L_520
    sub r1, r1, #0x134
    cmp r0, r1
    bge .L_698
    add r1, r2, #0xd
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_520:
    sub r2, r1, #0x12c
    cmp r0, r2
    bgt .L_53c
    sub r1, r1, #0x12c
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_53c:
    sub r1, r1, #0x60
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_54c:
    sub r2, r1, #0xe
    cmp r0, r2
    bgt .L_588
    bge .L_698
    sub r2, r1, #0x54
    cmp r0, r2
    bgt .L_578
    sub r1, r1, #0x54
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_578:
    sub r1, r1, #0x19
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_588:
    sub r2, r1, #0x4
    cmp r0, r2
    bgt .L_5a4
    sub r1, r1, #0x4
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_5a4:
    sub r1, r1, #0x2
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_5b4:
    add r2, r1, #0xd1
    cmp r0, r2
    bgt .L_62c
    bge .L_698
    add r2, r1, #0xb1
    cmp r0, r2
    bgt .L_600
    bge .L_698
    add r2, r1, #0x4b
    cmp r0, r2
    bgt .L_5f0
    add r1, r1, #0x4b
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_5f0:
    add r1, r1, #0x89
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_600:
    add r2, r1, #0xc7
    cmp r0, r2
    bgt .L_61c
    add r1, r1, #0xc7
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_61c:
    add r1, r1, #0xd0
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_62c:
    ldr r3, _LIT8
    cmp r0, r3
    bgt .L_678
    bge .L_698
    add r2, r1, #0xd4
    cmp r0, r2
    bgt .L_668
    cmp r0, #0x18c0
    blt .L_6a8
    subne r2, r3, #0x168
    cmpne r0, r2
    addne r1, r1, #0xd4
    cmpne r0, r1
    beq .L_698
    b .L_6a8
.L_668:
    sub r1, r3, #0xe
    cmp r0, r1
    beq .L_698
    b .L_6a8
.L_678:
    add r1, r3, #0x1
    cmp r0, r1
    bgt .L_68c
    beq .L_698
    b .L_6a8
.L_68c:
    add r1, r3, #0x67
    cmp r0, r1
    bne .L_6a8
.L_698:
    mov r0, #0x1
    bx lr
.L_6a0:
    mov r0, #0x2
    bx lr
.L_6a8:
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

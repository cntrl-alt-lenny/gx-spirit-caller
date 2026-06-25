; func_ov002_021b0f24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_0202b8c0
        .global func_ov002_021b0f24
        .arm
func_ov002_021b0f24:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0xd58]
    bl func_0202b8c0
    cmp r0, #0x3
    bne .L_94
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0, #0xd58]
    cmp r2, r1
    bgt .L_58
    bge .L_78
    sub r0, r1, #0xe5
    cmp r2, r0
    bgt .L_88
    sub r0, r1, #0xe6
    cmp r2, r0
    blt .L_88
    subne r0, r1, #0xe5
    cmpne r2, r0
    beq .L_78
    b .L_88
.L_58:
    add r0, r1, #0xaa
    cmp r2, r0
    bgt .L_6c
    beq .L_78
    b .L_88
.L_6c:
    ldr r0, _LIT2
    cmp r2, r0
    bne .L_88
.L_78:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd6c]
    rsb r0, r0, #0x1
    ldmia sp!, {r3, pc}
.L_88:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd6c]
    ldmia sp!, {r3, pc}
.L_94:
    ldr r0, _LIT0
    ldr ip, _LIT3
    ldr r0, [r0, #0xd58]
    cmp r0, ip
    bgt .L_1c0
    bge .L_29c
    ldr r3, _LIT4
    cmp r0, r3
    bgt .L_150
    bge .L_29c
    sub r1, r3, #0x10c
    cmp r0, r1
    bgt .L_108
    ldr r2, _LIT5
    cmp r0, r2
    blt .L_e4
    addne r1, r2, #0x1
    cmpne r0, r1
    beq .L_29c
    b .L_2a8
.L_e4:
    sub r1, r3, #0x410
    cmp r0, r1
    bgt .L_f8
    beq .L_29c
    b .L_2a8
.L_f8:
    sub r1, r2, #0xb9
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_108:
    sub r1, r3, #0xd4
    cmp r0, r1
    bgt .L_140
    sub r1, r3, #0xd5
    cmp r0, r1
    blt .L_130
    subne r1, r3, #0xd4
    cmpne r0, r1
    beq .L_29c
    b .L_2a8
.L_130:
    sub r1, r3, #0xd8
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_140:
    sub r1, r3, #0x6d
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_150:
    add r1, r3, #0xd5
    cmp r0, r1
    bgt .L_190
    bge .L_29c
    add r1, r3, #0x94
    cmp r0, r1
    bgt .L_180
    bge .L_29c
    add r1, r3, #0x8f
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_180:
    add r1, r3, #0xbb
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_190:
    sub r1, ip, #0xad
    cmp r0, r1
    bgt .L_1b0
    bge .L_29c
    sub r1, ip, #0xd3
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_1b0:
    sub r1, ip, #0xac
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_1c0:
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_234
    bge .L_29c
    add r1, ip, #0x40
    cmp r0, r1
    bgt .L_204
    bge .L_29c
    sub r1, r2, #0x17c
    cmp r0, r1
    bgt .L_1f4
    beq .L_29c
    b .L_2a8
.L_1f4:
    add r1, ip, #0x3c
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_204:
    sub r1, r2, #0xfa
    cmp r0, r1
    bgt .L_224
    bge .L_29c
    sub r1, r2, #0xfe
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_224:
    sub r1, r2, #0xc0
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_234:
    ldr r2, _LIT7
    cmp r0, r2
    bgt .L_274
    bge .L_29c
    sub r1, r2, #0x37
    cmp r0, r1
    bgt .L_264
    bge .L_29c
    sub r1, r2, #0xfa
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_264:
    sub r1, r2, #0x18
    cmp r0, r1
    beq .L_29c
    b .L_2a8
.L_274:
    add r1, r2, #0xac
    cmp r0, r1
    bgt .L_290
    bge .L_29c
    cmp r0, #0x1980
    beq .L_29c
    b .L_2a8
.L_290:
    ldr r1, _LIT8
    cmp r0, r1
    bne .L_2a8
.L_29c:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd6c]
    ldmia sp!, {r3, pc}
.L_2a8:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd6c]
    rsb r0, r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x000013f3
_LIT2: .word 0x00001842
_LIT3: .word 0x000015e4
_LIT4: .word 0x000013fe
_LIT5: .word 0x000012f1
_LIT6: .word 0x0000178e
_LIT7: .word 0x00001945
_LIT8: .word 0x00001a7c

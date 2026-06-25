; func_02030c28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b824
        .extern func_0202b86c
        .global func_02030c28
        .arm
func_02030c28:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_0202b824
    mov r5, r0
    mov r0, r4
    bl func_0202b86c
    cmp r5, #0x16
    beq .L_38
    cmp r5, #0x17
    bne .L_48
    cmp r0, #0x1
    moveq r0, #0x3
    movne r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_38:
    cmp r0, #0x5
    moveq r0, #0x2
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_48:
    ldr r2, _LIT0
    cmp r4, r2
    bgt .L_140
    bge .L_208
    ldr r1, _LIT1
    cmp r4, r1
    bgt .L_dc
    bge .L_208
    sub r0, r1, #0x120
    cmp r4, r0
    bgt .L_b8
    bge .L_208
    cmp r4, #0xfe0
    bgt .L_88
    beq .L_208
    b .L_210
.L_88:
    sub r0, r1, #0x3ac
    cmp r4, r0
    bgt .L_210
    ldr r1, _LIT2
    cmp r4, r1
    blt .L_210
    addne r0, r1, #0x1
    cmpne r4, r0
    addne r0, r1, #0x2
    cmpne r4, r0
    beq .L_208
    b .L_210
.L_b8:
    sub r0, r1, #0x3b
    cmp r4, r0
    bgt .L_cc
    beq .L_208
    b .L_210
.L_cc:
    sub r0, r1, #0x11
    cmp r4, r0
    beq .L_208
    b .L_210
.L_dc:
    sub r0, r2, #0x178
    cmp r4, r0
    bgt .L_110
    bge .L_208
    add r0, r1, #0xc3
    cmp r4, r0
    bgt .L_100
    beq .L_208
    b .L_210
.L_100:
    add r0, r1, #0xcd
    cmp r4, r0
    beq .L_208
    b .L_210
.L_110:
    rsb r0, r1, #0x2b80
    cmp r4, r0
    bgt .L_130
    bge .L_208
    add r0, r1, #0x1c8
    cmp r4, r0
    beq .L_208
    b .L_210
.L_130:
    sub r0, r2, #0x3
    cmp r4, r0
    beq .L_208
    b .L_210
.L_140:
    ldr r1, _LIT3
    cmp r4, r1
    bgt .L_1a8
    bge .L_208
    add r0, r2, #0x60
    cmp r4, r0
    bgt .L_184
    bge .L_208
    sub r0, r1, #0x174
    cmp r4, r0
    bgt .L_174
    beq .L_208
    b .L_210
.L_174:
    sub r0, r1, #0x170
    cmp r4, r0
    beq .L_208
    b .L_210
.L_184:
    sub r0, r1, #0xfc
    cmp r4, r0
    bgt .L_198
    beq .L_208
    b .L_210
.L_198:
    sub r0, r1, #0x30
    cmp r4, r0
    beq .L_208
    b .L_210
.L_1a8:
    add r0, r2, #0x2ec
    cmp r4, r0
    bgt .L_1dc
    bge .L_208
    add r0, r1, #0xee
    cmp r4, r0
    bgt .L_1cc
    beq .L_208
    b .L_210
.L_1cc:
    add r0, r1, #0xef
    cmp r4, r0
    beq .L_208
    b .L_210
.L_1dc:
    add r0, r2, #0x3b8
    cmp r4, r0
    bgt .L_1fc
    bge .L_208
    add r0, r2, #0x338
    cmp r4, r0
    beq .L_208
    b .L_210
.L_1fc:
    add r0, r2, #0x3d0
    cmp r4, r0
    bne .L_210
.L_208:
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
.L_210:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001774
_LIT1: .word 0x000014c7
_LIT2: .word 0x00001119
_LIT3: .word 0x00001936

; func_ov002_021f60fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae484
        .extern func_ov002_021df780
        .extern func_ov002_021f4a00
        .extern func_ov002_021f4a4c
        .extern func_ov002_02257594
        .extern func_ov002_0227ddf8
        .global func_ov002_021f60fc
        .arm
func_ov002_021f60fc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0x5b4]
    mov r4, r1
    cmp r2, #0x0
    beq .L_28
    cmp r2, #0x1
    beq .L_104
    b .L_1dc
.L_28:
    ldrh r2, [r5, #0x2]
    mov r2, r2, lsl #0x12
    movs r2, r2, lsr #0x1e
    bne .L_e0
    bl func_ov002_02257594
    cmp r0, #0x2
    bne .L_d0
    ldrh r2, [r5]
    ldr r0, _LIT1
    cmp r2, r0
    cmpeq r4, #0x0
    bne .L_68
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_b8
.L_68:
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_98
    mov r0, r5
    bl func_ov002_0227ddf8
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_b8
.L_98:
    ldr r0, _LIT4
    cmp r2, r0
    bne .L_b0
    mov r0, #0x2f
    bl func_ov002_021ae484
    b .L_b8
.L_b0:
    ldr r0, _LIT5
    bl func_ov002_021ae484
.L_b8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_d0:
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_ec
.L_e0:
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
.L_ec:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, pc}
.L_104:
    ldr r2, _LIT2
    ldr r3, [r2, #0xd44]
    strh r3, [r5, #0xc]
    ldr r2, [r2, #0xd44]
    cmp r2, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r4, [r5]
    ldr r3, _LIT6
    cmp r4, r3
    bgt .L_158
    bge .L_1c4
    ldr r0, _LIT7
    cmp r4, r0
    bgt .L_148
    beq .L_184
    b .L_1d4
.L_148:
    sub r0, r3, #0x1c
    cmp r4, r0
    beq .L_184
    b .L_1d4
.L_158:
    add r2, r3, #0x39
    cmp r4, r2
    bgt .L_174
    mov r0, r2
    cmp r4, r0
    beq .L_1a4
    b .L_1d4
.L_174:
    ldr r2, _LIT8
    cmp r4, r2
    beq .L_1cc
    b .L_1d4
.L_184:
    ldrh r2, [r5, #0x2]
    mov r1, #0x1f4
    mov r0, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, r2, lsr #0x1f
    bl func_ov002_021df780
    b .L_1d4
.L_1a4:
    ldrh r2, [r5, #0x2]
    mov r1, #0x320
    mov r0, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, r2, lsr #0x1f
    bl func_ov002_021df780
    b .L_1d4
.L_1c4:
    bl func_ov002_021f4a00
    ldmia sp!, {r3, r4, r5, pc}
.L_1cc:
    bl func_ov002_021f4a4c
    ldmia sp!, {r3, r4, r5, pc}
.L_1d4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1dc:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00001517
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022cd744
_LIT4: .word 0x00001a1a
_LIT5: .word 0x0000010e
_LIT6: .word 0x000014de
_LIT7: .word 0x000012f3
_LIT8: .word 0x00001624

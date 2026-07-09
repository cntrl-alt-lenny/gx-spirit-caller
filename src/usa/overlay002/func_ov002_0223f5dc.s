; func_ov002_0223f5dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_0202b854
        .extern func_ov002_021b3538
        .extern func_ov002_021b9dec
        .extern func_ov002_021c8390
        .extern func_ov002_0223de04
        .global func_ov002_0223f5dc
        .arm
func_ov002_0223f5dc:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0]
    ldr ip, _LIT0
    cmp r1, ip
    bgt .L_c4
    bge .L_1ec
    ldr r3, _LIT1
    cmp r1, r3
    bgt .L_6c
    bge .L_1b0
    ldr r3, _LIT2
    cmp r1, r3
    bgt .L_48
    bge .L_1a8
    sub r2, r3, #0x198
    cmp r1, r2
    beq .L_1a8
    b .L_338
.L_48:
    add r2, r3, #0xa7
    cmp r1, r2
    bgt .L_5c
    beq .L_1b0
    b .L_338
.L_5c:
    add r2, r3, #0xfc
    cmp r1, r2
    beq .L_1c0
    b .L_338
.L_6c:
    add r2, r3, #0xde
    cmp r1, r2
    bgt .L_a0
    bge .L_1ec
    add r2, r3, #0x89
    cmp r1, r2
    bgt .L_90
    beq .L_1b0
    b .L_338
.L_90:
    add r2, r3, #0xac
    cmp r1, r2
    beq .L_1a8
    b .L_338
.L_a0:
    sub r2, ip, #0xd0
    cmp r1, r2
    bgt .L_b4
    beq .L_1e4
    b .L_338
.L_b4:
    sub r2, ip, #0x46
    cmp r1, r2
    beq .L_1fc
    b .L_338
.L_c4:
    add r2, ip, #0x118
    cmp r1, r2
    bgt .L_150
    ldr r3, _LIT3
    cmp r1, r3
    blt .L_f8
    beq .L_290
    add r2, r3, #0x4
    cmp r1, r2
    addne r2, r3, #0x5
    cmpne r1, r2
    beq .L_1e4
    b .L_338
.L_f8:
    sub r2, r3, #0x5c
    cmp r1, r2
    bgt .L_12c
    bge .L_234
    sub r2, r3, #0xb1
    cmp r1, r2
    bgt .L_11c
    beq .L_21c
    b .L_338
.L_11c:
    sub r2, r3, #0x67
    cmp r1, r2
    beq .L_224
    b .L_338
.L_12c:
    sub r2, r3, #0x4a
    cmp r1, r2
    bgt .L_140
    beq .L_1e4
    b .L_338
.L_140:
    sub r2, r3, #0x22
    cmp r1, r2
    beq .L_26c
    b .L_338
.L_150:
    add r2, ip, #0x1c8
    cmp r1, r2
    bgt .L_184
    bge .L_1a8
    ldr r2, _LIT4
    cmp r1, r2
    bgt .L_174
    beq .L_1b0
    b .L_338
.L_174:
    add r2, r2, #0x13
    cmp r1, r2
    beq .L_2d4
    b .L_338
.L_184:
    ldr r2, _LIT5
    cmp r1, r2
    bgt .L_198
    beq .L_2f8
    b .L_338
.L_198:
    add r2, r2, #0x8f
    cmp r1, r2
    beq .L_300
    b .L_338
.L_1a8:
    ldrh r0, [r0, #0x8]
    ldmia sp!, {r3, pc}
.L_1b0:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    ldmia sp!, {r3, pc}
.L_1c0:
    ldr r1, [r0, #0x14]
    ldr r0, _LIT6
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    ldmia sp!, {r3, pc}
.L_1e4:
    ldrh r0, [r0, #0xa]
    ldmia sp!, {r3, pc}
.L_1ec:
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    ldmia sp!, {r3, pc}
.L_1fc:
    ldr r1, [r0, #0x14]
    ldr r0, _LIT6
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    ldmia sp!, {r3, pc}
.L_21c:
    ldrh r0, [r0, #0xa]
    ldmia sp!, {r3, pc}
.L_224:
    ldr r0, [r0, #0x14]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    ldmia sp!, {r3, pc}
.L_234:
    ldrh r0, [r0, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3538
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c8390
    orr r0, r0, #0x10000000
    ldmia sp!, {r3, pc}
.L_26c:
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0xf
    bne .L_338
    ldr r0, [r0, #0x14]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r3, pc}
.L_290:
    ldrh r1, [r0, #0x8]
    cmp r1, #0x0
    movne r0, r1
    ldmneia sp!, {r3, pc}
    ldrh r0, [r0, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3538
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021b9dec
    ldmia sp!, {r3, pc}
.L_2d4:
    ldr r1, [r0, #0x14]
    ldr r0, _LIT6
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    ldmia sp!, {r3, pc}
.L_2f8:
    ldrh r0, [r0, #0xc]
    ldmia sp!, {r3, pc}
.L_300:
    ldrh r1, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r1, #0x0
    bl func_ov002_0223de04
    ldr r1, _LIT6
    mov r0, r0, lsl #0x2
    ldrh r0, [r1, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    ldmia sp!, {r3, pc}
.L_338:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x000018c5
_LIT1: .word 0x000016bc
_LIT2: .word 0x000015a3
_LIT3: .word 0x000019d8
_LIT4: .word 0x00001a03
_LIT5: .word 0x00001a98
_LIT6: .word data_ov002_022d0170

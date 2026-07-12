; func_ov002_02211a74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce1a8
        .extern func_0202ea5c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021b0b24
        .extern func_ov002_021bc5e4
        .extern func_ov002_021e26d0
        .extern func_ov002_021e277c
        .extern func_ov002_021ff2cc
        .extern func_ov002_0223f5dc
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .extern func_ov002_0227acc8
        .global func_ov002_02211a74
        .arm
func_ov002_02211a74:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r4, [r6, #0x2]
    ldr r2, _LIT0
    mov r3, r4, lsl #0x11
    ldr r2, [r2, #0x5a8]
    mov r4, r4, lsl #0x1f
    sub r2, r2, #0x75
    mov r3, r3, lsr #0x1f
    cmp r2, #0xb
    eor r4, r3, r4, lsr #0x1f
    addls pc, pc, r2, lsl #0x2
    b .L_324
    b .L_314
    b .L_300
    b .L_2f0
    b .L_2dc
    b .L_324
    b .L_324
    b .L_324
    b .L_324
    b .L_2cc
    b .L_100
    b .L_e0
    b .L_64
.L_64:
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r6]
    ldr r0, _LIT1
    cmp r1, r0
    bne .L_98
    mov r0, r6
    bl func_ov002_0223f5dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_98:
    mov r0, r6
    bl func_ov002_0223f5dc
    mov r2, r0
    ldrh r1, [r6]
    mov r0, r4
    bl func_ov002_022535a4
    cmp r0, #0x0
    bne .L_cc
    ldr r1, _LIT2
    mov r0, r4
    bl func_ov002_021ae320
    mov r0, #0x78
    ldmia sp!, {r4, r5, r6, pc}
.L_cc:
    ldr r1, _LIT3
    mov r0, r4
    bl func_ov002_021ae320
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_e0:
    bl func_ov002_0223f5dc
    mov r3, r0
    ldrh r2, [r6]
    mov r0, r4
    mov r1, #0x6
    bl func_ov002_021af8f0
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_100:
    ldrh r0, [r6]
    ldr r2, _LIT4
    mov r5, #0x0
    cmp r0, r2
    bgt .L_19c
    bge .L_254
    sub r1, r2, #0x180
    cmp r0, r1
    bgt .L_158
    bge .L_254
    ldr r1, _LIT5
    cmp r0, r1
    bgt .L_148
    bge .L_254
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_238
    b .L_258
.L_148:
    sub r1, r2, #0x198
    cmp r0, r1
    beq .L_254
    b .L_258
.L_158:
    sub r1, r2, #0x2b
    cmp r0, r1
    bgt .L_178
    bge .L_254
    ldr r1, _LIT7
    cmp r0, r1
    beq .L_254
    b .L_258
.L_178:
    sub r1, r2, #0x11
    cmp r0, r1
    bgt .L_18c
    beq .L_254
    b .L_258
.L_18c:
    sub r1, r2, #0x7
    cmp r0, r1
    beq .L_254
    b .L_258
.L_19c:
    ldr r2, _LIT8
    cmp r0, r2
    bgt .L_1f4
    bge .L_254
    sub r1, r2, #0x89
    cmp r0, r1
    bgt .L_1e4
    bge .L_254
    sub r1, r2, #0xf0
    cmp r0, r1
    bgt .L_258
    sub r1, r2, #0xf3
    cmp r0, r1
    blt .L_258
    subne r1, r2, #0xf0
    cmpne r0, r1
    beq .L_254
    b .L_258
.L_1e4:
    sub r1, r2, #0x64
    cmp r0, r1
    beq .L_254
    b .L_258
.L_1f4:
    add r1, r2, #0xaa
    cmp r0, r1
    bgt .L_214
    bge .L_254
    add r1, r2, #0x55
    cmp r0, r1
    beq .L_254
    b .L_258
.L_214:
    add r1, r2, #0xae
    cmp r0, r1
    bgt .L_228
    beq .L_254
    b .L_258
.L_228:
    add r1, r2, #0xd1
    cmp r0, r1
    beq .L_254
    b .L_258
.L_238:
    bl func_ov002_021afa94
    ldr r1, [r0]
    ldr r0, _LIT9
    mov r1, r1, lsl #0x13
    cmp r0, r1, lsr #0x13
    moveq r5, #0x1
    b .L_258
.L_254:
    mov r5, #0x1
.L_258:
    ldr r0, _LIT10
    ldr r0, [r0, #0x4]
    cmp r4, r0
    bne .L_290
    bl func_ov002_021afa94
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202ea5c
    cmp r0, #0x0
    beq .L_290
    mov r0, #0x32
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_290:
    mov r0, r4
    bl func_ov002_021bc5e4
    ldr r1, _LIT0
    str r0, [r1, #0x5ac]
    bl func_ov002_021afa94
    ldrh r3, [r6]
    mov r1, r0
    mov r2, r5, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r3, r3, r2, lsr #0x10
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_0227acc8
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_2cc:
    mov r0, r4
    bl func_ov002_021e277c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_2dc:
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x77
    ldmia sp!, {r4, r5, r6, pc}
.L_2f0:
    rsb r0, r4, #0x1
    bl func_ov002_0226af64
    mov r0, #0x76
    ldmia sp!, {r4, r5, r6, pc}
.L_300:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021e26d0
    mov r0, #0x75
    ldmia sp!, {r4, r5, r6, pc}
.L_314:
    mov r0, r4
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_324:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x000017f5
_LIT2: .word 0x00000122
_LIT3: .word 0x0000011d
_LIT4: .word 0x000017da
_LIT5: .word 0x00001529
_LIT6: .word 0x000010e4
_LIT7: .word 0x0000167d
_LIT8: .word 0x00001907
_LIT9: .word 0x00000fe5
_LIT10: .word data_ov002_022cd65c

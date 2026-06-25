; func_ov002_02229ee8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_02229dcc
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_0227adb8
        .extern func_ov002_02290500
        .global func_ov002_02229ee8
        .arm
func_ov002_02229ee8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0x5a8]
    sub r0, r0, #0x7c
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_324
    b .L_318
    b .L_200
    b .L_1d8
    b .L_110
    b .L_34
.L_34:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_f4
    ldrh r0, [r6, #0x2]
    ldr r7, _LIT1
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r3, r2, r7
    ldr r1, [r1, r3]
    mov r5, #0x0
    cmp r1, #0x0
    bls .L_f4
    ldr r8, _LIT3
    mov r4, #0xb
.L_9c:
    mov r1, r4
    mov r2, r5
    bl func_ov002_02229dcc
    cmp r0, #0x0
    beq .L_d0
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    bl func_ov002_021e2b3c
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_d0:
    ldrh r0, [r6, #0x2]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r7, r8
    ldr r1, [r1, #0xc]
    cmp r5, r1
    bcc .L_9c
.L_f4:
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_110:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_1d0
    ldrh r0, [r6, #0x2]
    ldr r7, _LIT1
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r3, r2, r7
    ldr r1, [r1, r3]
    mov r5, #0x0
    cmp r1, #0x0
    bls .L_1d0
    ldr r8, _LIT3
    mov r4, #0xb
.L_15c:
    mov r1, r4
    mov r2, r5
    bl func_ov002_02229dcc
    cmp r0, #0x0
    beq .L_1ac
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_19c
    ldrh r1, [r6]
    ldr r2, _LIT7
    bl func_ov002_02290500
    b .L_1a4
.L_19c:
    ldr r0, _LIT7
    bl func_ov002_022592ec
.L_1a4:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1ac:
    ldrh r0, [r6, #0x2]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r7, r8
    ldr r1, [r1, #0xc]
    cmp r5, r1
    bcc .L_15c
.L_1d0:
    mov r0, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1d8:
    bl func_ov002_022593f4
    cmp r0, #0x0
    moveq r0, #0x7c
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT8
    ldr r1, _LIT0
    ldr r2, [r0, #0xd78]
    mov r0, #0x7d
    str r2, [r1, #0x5b0]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_200:
    ldrh r3, [r6, #0x2]
    ldr r0, _LIT1
    ldr r2, _LIT3
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mla r2, r3, r0, r2
    ldr r0, [r1, #0x5b0]
    ldr r1, _LIT9
    add r0, r2, r0, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    cmp r1, r0, lsr #0x13
    mov r2, r0, lsr #0x13
    bcc .L_254
    cmp r2, r1
    bcs .L_2ac
    sub r0, r1, #0xed
    cmp r2, r0
    beq .L_29c
    b .L_2d8
.L_254:
    add r0, r1, #0x38
    cmp r2, r0
    bhi .L_268
    beq .L_2bc
    b .L_2d8
.L_268:
    add r0, r1, #0x68
    cmp r2, r0
    bhi .L_2d8
    add r0, r1, #0x67
    cmp r2, r0
    bcc .L_2d8
    beq .L_2cc
    add r0, r1, #0x68
    cmp r2, r0
    ldreqh r0, [r6, #0x8]
    orreq r0, r0, #0x10
    streqh r0, [r6, #0x8]
    b .L_2d8
.L_29c:
    ldrh r0, [r6, #0x8]
    orr r0, r0, #0x1
    strh r0, [r6, #0x8]
    b .L_2d8
.L_2ac:
    ldrh r0, [r6, #0x8]
    orr r0, r0, #0x2
    strh r0, [r6, #0x8]
    b .L_2d8
.L_2bc:
    ldrh r0, [r6, #0x8]
    orr r0, r0, #0x4
    strh r0, [r6, #0x8]
    b .L_2d8
.L_2cc:
    ldrh r0, [r6, #0x8]
    orr r0, r0, #0x8
    strh r0, [r6, #0x8]
.L_2d8:
    ldrh r0, [r6, #0x2]
    ldr r4, _LIT3
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mla r4, r3, r1, r4
    ldr r2, _LIT0
    mov r3, #0x0
    ldr r1, [r2, #0x5b0]
    add r2, r4, #0x120
    add r1, r2, r1, lsl #0x2
    mov r2, #0x1
    bl func_ov002_0227adb8
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_318:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_324:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x0000011e
_LIT5: .word 0x00000122
_LIT6: .word data_ov002_022cd744
_LIT7: .word func_ov002_02229dcc
_LIT8: .word data_ov002_022d016c
_LIT9: .word 0x0000161e

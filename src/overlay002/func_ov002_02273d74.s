; func_ov002_02273d74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022d016c
        .extern func_0202b7ec
        .extern func_0202b830
        .extern func_0202b878
        .extern func_0202b890
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021b004c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021d8128
        .extern func_ov002_021de5d4
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_02259324
        .extern func_ov002_022593f4
        .extern func_ov002_0226e46c
        .extern func_ov002_02271278
        .extern func_ov002_02290500
        .extern func_ov002_0229ce5c
        .extern func_ov002_0229cf10
        .global func_ov002_02273d74
        .arm
func_ov002_02273d74:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x200
    ldr r2, _LIT0
    ldr r3, [r2, #0x18]
    mov r0, r3, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_534
    b .L_40
    b .L_22c
    b .L_2d4
    b .L_368
    b .L_44
    b .L_424
    b .L_48c
.L_40:
    bl func_ov002_021e2b3c
.L_44:
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_ov002_0226e46c
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r1, [r1]
    mov r5, r0
    mov r0, r1, lsl #0x9
    cmp r2, r0, lsr #0x11
    mov r0, r0, lsr #0x11
    bcc .L_bc
    cmp r0, r2
    bcs .L_ec
    ldr r1, _LIT2
    cmp r0, r1
    bhi .L_94
    beq .L_dc
    b .L_110
.L_94:
    sub r1, r2, #0x19
    cmp r0, r1
    bhi .L_110
    sub r1, r2, #0x1b
    cmp r0, r1
    bcc .L_110
    subne r1, r2, #0x19
    cmpne r0, r1
    beq .L_ec
    b .L_110
.L_bc:
    add r1, r2, #0x1d0
    cmp r0, r1
    bhi .L_d0
    beq .L_dc
    b .L_110
.L_d0:
    ldr r1, _LIT3
    cmp r0, r1
    bne .L_110
.L_dc:
    bl func_0202b878
    bl func_0202b7ec
    mov r4, r0
    b .L_11c
.L_ec:
    ldr r0, _LIT0
    ldr r0, [r0, #0x18]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x18
    movne r0, #0x2
    moveq r0, #0x1
    bl func_0202b830
    mov r4, r0
    b .L_11c
.L_110:
    bl func_0202b890
    bl func_0202b830
    mov r4, r0
.L_11c:
    ldr r0, _LIT0
    mov r1, r5, lsl #0x18
    ldr r3, [r0, #0x18]
    ldr r2, _LIT4
    bic r3, r3, #0xff00
    orr r1, r3, r1, lsr #0x10
    str r1, [r0, #0x18]
    ldr r0, [r0]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1a8
    cmp r5, #0x2
    blt .L_180
    add r0, sp, #0x0
    mov r2, r4
    mov r1, #0xd6
    bl func_ov002_0229ce5c
    add r0, sp, #0x100
    add r1, sp, #0x0
    mov r2, r5
    bl func_ov002_0229cf10
    b .L_190
.L_180:
    add r0, sp, #0x100
    mov r2, r4
    mov r1, #0xd8
    bl func_ov002_0229ce5c
.L_190:
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    bic r1, r1, #0xff
    orr r1, r1, #0x5
    str r1, [r0, #0x18]
    b .L_1f8
.L_1a8:
    cmp r5, #0x2
    blt .L_1d4
    add r0, sp, #0x0
    mov r2, r4
    mov r1, #0xd7
    bl func_ov002_0229ce5c
    add r0, sp, #0x100
    add r1, sp, #0x0
    mov r2, r5
    bl func_ov002_0229cf10
    b .L_1e4
.L_1d4:
    add r0, sp, #0x100
    mov r2, r4
    mov r1, #0xd9
    bl func_ov002_0229ce5c
.L_1e4:
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    bic r1, r1, #0xff
    orr r1, r1, #0x1
    str r1, [r0, #0x18]
.L_1f8:
    ldr r0, _LIT0
    ldr r1, _LIT5
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x0
    bne .L_220
    add r1, sp, #0x100
    bl func_ov002_021ae400
.L_220:
    add sp, sp, #0x200
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_22c:
    ldr r1, [r2]
    ldr r0, _LIT6
    mov r2, r1, lsl #0x9
    mov r2, r2, lsr #0x11
    cmp r2, r0
    bne .L_260
    mov r0, r1, lsl #0x1f
    mov r1, r3, lsl #0x8
    mov r0, r0, lsr #0x1f
    mov r3, r1, lsr #0x18
    mov r1, #0x47
    bl func_ov002_021af9d0
    b .L_294
.L_260:
    mov r0, r3, lsl #0x10
    mov r1, r0, lsr #0x18
    ldr r0, _LIT0
    cmp r1, #0x20
    ldr r3, [r0]
    movcs r1, #0x20
    ldr r0, [r0, #0x18]
    mov r4, r3, lsl #0x1f
    mov r3, r0, lsl #0x8
    add r1, r1, #0x6
    mov r0, r4, lsr #0x1f
    mov r3, r3, lsr #0x18
    bl func_ov002_021af9d0
.L_294:
    ldr r4, _LIT7
    ldr r1, _LIT0
    ldr r3, [r4]
    add sp, sp, #0x200
    mov r2, r3, lsl #0x18
    mov r2, r2, lsr #0x18
    add r2, r2, #0x1
    bic r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2
    str r2, [r4]
    ldr r2, [r1, #0x18]
    mov r0, #0x0
    bic r2, r2, #0xff00
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
.L_2d4:
    ldr r1, _LIT7
    ldr r0, _LIT8
    ldr r4, [r1]
    mov r3, r4, lsl #0x10
    mov r3, r3, lsr #0x18
    add r3, r3, #0x1
    bic r4, r4, #0xff00
    mov r3, r3, lsl #0x18
    orr r3, r4, r3, lsr #0x10
    str r3, [r1]
    ldr r2, [r2, #0x18]
    ldr r0, [r0, #0xd44]
    mov r2, r2, lsl #0x10
    cmp r0, r2, lsr #0x18
    mov r0, r2, lsr #0x18
    bcc .L_340
    bl func_ov002_021b004c
    ldr r2, _LIT0
    mov r1, r0
    ldr r0, [r2]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8128
    add sp, sp, #0x200
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_340:
    mov r0, r3, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    bic r2, r3, #0xff
    and r0, r0, #0xff
    orr r0, r2, r0
    str r0, [r1]
    add sp, sp, #0x200
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_368:
    ldr r0, [r2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x9
    cmp r1, r0, lsr #0x11
    mov r3, r0, lsr #0x11
    bcc .L_3b0
    cmp r3, r1
    bcs .L_3c8
    sub r0, r1, #0x19
    cmp r3, r0
    bhi .L_408
    sub r0, r1, #0x1b
    cmp r3, r0
    bcc .L_408
    subne r0, r1, #0x19
    cmpne r3, r0
    beq .L_3c8
    b .L_408
.L_3b0:
    add r0, r1, #0x1d0
    cmp r3, r0
    ldreq r0, _LIT8
    ldreq r0, [r0, #0xd44]
    streqh r0, [r2, #0x10]
    b .L_408
.L_3c8:
    ldr r0, _LIT0
    ldr r2, [r0, #0x18]
    mov r1, r2, lsl #0x8
    movs r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff0000
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x8
    str r1, [r0, #0x18]
    bne .L_408
    bic r1, r1, #0xff
    orr r1, r1, #0x4
    str r1, [r0, #0x18]
    add sp, sp, #0x200
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_408:
    bl func_ov002_021e2c5c
    ldr r0, _LIT0
    mov r1, #0x0
    strb r1, [r0, #0x8]
    add sp, sp, #0x200
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_424:
    ldr r2, [r2]
    ldr r1, _LIT5
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_454
    mov r1, r2, lsl #0x9
    ldr r2, _LIT9
    mov r1, r1, lsr #0x11
    bl func_ov002_02290500
    b .L_45c
.L_454:
    ldr r0, _LIT9
    bl func_ov002_02259324
.L_45c:
    ldr r3, _LIT7
    add sp, sp, #0x200
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_48c:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_504
    ldr r0, _LIT8
    mov r2, #0x0
    ldr r3, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    add r1, r3, r1
    bl func_ov002_021de5d4
    ldr r3, _LIT7
    ldr r0, _LIT0
    ldr r2, [r3]
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x18
    sub r1, r1, #0x1
    bic r2, r2, #0xff00
    mov r1, r1, lsl #0x18
    orr r1, r2, r1, lsr #0x10
    str r1, [r3]
    ldr r1, [r0, #0x18]
    mov r2, r1, lsl #0x10
    movs r2, r2, lsr #0x18
    bne .L_504
    bic r1, r1, #0xff
    orr r1, r1, #0x3
    str r1, [r0, #0x18]
    add sp, sp, #0x200
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_504:
    ldr r3, _LIT7
    add sp, sp, #0x200
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    sub r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_534:
    mov r0, #0x0
    add sp, sp, #0x200
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x000016e4
_LIT2: .word 0x00001466
_LIT3: .word 0x000019ca
_LIT4: .word 0x000014a0
_LIT5: .word data_ov002_022cd744
_LIT6: .word 0x000018b4
_LIT7: .word data_ov002_022cd318
_LIT8: .word data_ov002_022d016c
_LIT9: .word func_ov002_02271278

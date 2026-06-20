; func_ov002_02274880 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd310
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae484
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02271608
        .extern func_ov002_02271ab4
        .extern func_ov002_02290500
        .extern func_ov002_0229ade0
        .global func_ov002_02274880
        .arm
func_ov002_02274880:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    ldrh r0, [r1, #0x16]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    beq .L_4c8
    ldr r2, [r1, #0x18]
    mov r0, r2, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_4c0
    b .L_2d0
    b .L_2e4
    b .L_350
    b .L_3c8
.L_2d0:
    add r0, r0, #0x1
    bic r2, r2, #0xff
    and r0, r0, #0xff
    orr r0, r2, r0
    str r0, [r1, #0x18]
.L_2e4:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_314
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_31c
.L_314:
    mov r0, #0x1
    bl func_ov002_021ae484
.L_31c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r3, _LIT3
    strb r0, [r1, #0x8]
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_350:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, [r1]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_394
    mov r1, r2, lsl #0x9
    ldr r2, _LIT4
    mov r1, r1, lsr #0x11
    bl func_ov002_02290500
    b .L_39c
.L_394:
    ldr r0, _LIT4
    bl func_ov002_022592ec
.L_39c:
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_3c8:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_490
    ldr r0, _LIT2
    ldr r2, _LIT5
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT6
    and r1, r4, #0x1
    mla r2, r1, r0, r2
    add r5, r5, r3
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r1, r4
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r3, r0, r3, lsr #0x1f
    mov r2, r5
    mov r0, #0x28
    bl func_ov002_0229ade0
    ldr r1, _LIT0
    and r3, r4, #0xff
    ldrb ip, [r1, #0x8]
    and r2, r5, #0xff
    orr r3, r3, r2, lsl #0x8
    add r4, ip, #0x1
    strb r4, [r1, #0x8]
    ldr r0, _LIT7
    mov r2, ip, lsl #0x1
    strh r3, [r0, r2]
    ldr r4, _LIT3
    mov r0, #0x1
    ldr r3, [r4]
    mov r2, r3, lsl #0x18
    mov r2, r2, lsr #0x18
    add r2, r2, #0x1
    bic r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2
    str r2, [r4]
    ldr r2, [r1]
    mov r2, r2, lsl #0x9
    mov r2, r2, lsr #0x11
    strh r2, [r1, #0x6]
    ldmia sp!, {r3, r4, r5, pc}
.L_490:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x29
    bl func_ov002_0229ade0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x18]
    bic r2, r2, #0xff
    orr r2, r2, #0x1
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
.L_4c0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_4c8:
    bl func_ov002_02271ab4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022cd318
_LIT4: .word func_ov002_02271608
_LIT5: .word data_ov002_022cf16c
_LIT6: .word 0x00000868
_LIT7: .word data_ov002_022cd310

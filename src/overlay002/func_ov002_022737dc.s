; func_ov002_022737dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cd318
        .extern data_ov002_022cd744
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b100
        .extern func_ov002_021ae400
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_022713a8
        .extern func_ov002_02290500
        .extern func_ov002_0229ade0
        .extern func_ov002_0229ce5c
        .global func_ov002_022737dc
        .arm
func_ov002_022737dc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x200
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_578
    b .L_2e4
    b .L_394
    b .L_44c
    b .L_4bc
.L_2e4:
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_314
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_02290500
    b .L_364
.L_314:
    ldr r0, _LIT3
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0xda
    bl func_ov002_0229ce5c
    ldr r0, _LIT4
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x100
    add r1, sp, #0x0
    bl func_ov002_0229ce5c
    ldr r0, _LIT0
    add r1, sp, #0x100
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r0, _LIT2
    bl func_ov002_022592ec
.L_364:
    ldr r3, _LIT5
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
.L_394:
    bl func_ov002_022593f4
    cmp r0, #0x0
    addeq sp, sp, #0x200
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT6
    ldr r2, _LIT7
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT8
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
    ldr r0, _LIT0
    mov r3, #0x1
    strb r3, [r0, #0x8]
    and r2, r4, #0xff
    and r1, r5, #0xff
    orr r1, r2, r1, lsl #0x8
    strh r1, [r0, #0x10]
    ldr r3, _LIT5
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
.L_44c:
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_47c
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_02290500
    b .L_48c
.L_47c:
    mov r1, #0x4
    bl func_ov002_021ae400
    ldr r0, _LIT2
    bl func_ov002_022592ec
.L_48c:
    ldr r3, _LIT5
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
.L_4bc:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_548
    ldr r0, _LIT6
    ldr r2, _LIT7
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd74]
    ldr r3, [r0, #0xd78]
    ldr r0, _LIT8
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
    ldr r0, _LIT0
    mov r3, #0x2
    and r2, r4, #0xff
    and r1, r5, #0xff
    strb r3, [r0, #0x8]
    orr r1, r2, r1, lsl #0x8
    strh r1, [r0, #0x12]
    add sp, sp, #0x200
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_548:
    ldr r4, _LIT0
    mov r1, #0x0
    ldr r0, [r4, #0x18]
    mov r2, r1
    bic r5, r0, #0xff
    mov r3, r1
    mov r0, #0x29
    str r5, [r4, #0x18]
    bl func_ov002_0229ade0
    add sp, sp, #0x200
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_578:
    mov r0, #0x0
    add sp, sp, #0x200
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word data_ov002_022cd744
_LIT2: .word func_ov002_022713a8
_LIT3: .word 0x000013e5
_LIT4: .word 0x000013e7
_LIT5: .word data_ov002_022cd318
_LIT6: .word data_ov002_022d016c
_LIT7: .word data_ov002_022cf16c
_LIT8: .word 0x00000868

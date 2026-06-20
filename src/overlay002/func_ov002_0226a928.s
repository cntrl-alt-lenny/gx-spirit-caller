; func_ov002_0226a928 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cd968
        .extern data_ov002_022ce950
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern data_ov002_022d0f0c
        .extern data_ov002_022d0f1c
        .extern func_ov002_021b1570
        .extern func_ov002_02262804
        .extern func_ov002_02269ba0
        .extern func_ov002_0226a284
        .extern func_ov002_0226a3bc
        .extern func_ov002_0226a488
        .extern func_ov002_0226a504
        .extern func_ov002_0226a730
        .extern func_ov002_0226b400
        .extern func_ov002_0226b73c
        .extern func_ov002_0226b8f8
        .extern func_ov002_0226bbb8
        .extern func_ov002_0226bfa8
        .extern func_ov002_0226c368
        .extern func_ov002_0226c988
        .extern func_ov002_0226cc0c
        .extern func_ov002_0226cd68
        .extern func_ov002_0226ce8c
        .extern func_ov002_0226cf50
        .extern func_ov002_0226d00c
        .extern func_ov002_0226d530
        .extern func_ov002_0226d538
        .extern func_ov002_0229cd70
        .global func_ov002_0226a928
        .arm
func_ov002_0226a928:
    stmfd sp!, {lr}
    sub sp, sp, #0x14
    ldr r1, _LIT0
    ldr r0, [r1, #0xd90]
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    ldr r3, [r1, #0xd8c]
    cmp r3, #0x0
    beq .L_98
    ldr r0, _LIT1
    ldr r2, [r1, #0xd94]
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r2, r0
    bne .L_98
    cmp r3, #0x2
    bne .L_84
    ldr r3, [r1, #0xd98]
    ldr r1, _LIT2
    add r0, sp, #0x2
    mov r2, #0x10
    strh r3, [sp]
    bl func_ov002_0229cd70
    mov r0, #0x1e
    add r2, sp, #0x0
    sub r1, r0, #0x1f
    mov r3, #0x12
    bl func_ov002_021b1570
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0xd8c]
.L_84:
    ldr r0, _LIT3
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x16
    mov r0, r0, lsr #0x1f
    b .L_2e0
.L_98:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd98]
    cmp r1, #0x17
    addls pc, pc, r1, lsl #0x2
    b .L_2d4
    b .L_2d4
    b .L_10c
    b .L_10c
    b .L_124
    b .L_140
    b .L_15c
    b .L_174
    b .L_18c
    b .L_1a0
    b .L_1ac
    b .L_1c4
    b .L_1dc
    b .L_1f0
    b .L_204
    b .L_218
    b .L_230
    b .L_244
    b .L_250
    b .L_268
    b .L_280
    b .L_298
    b .L_2ac
    b .L_2b4
    b .L_2bc
.L_10c:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    bl func_ov002_0226b400
    b .L_2e0
.L_124:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    mov r3, #0x1
    bl func_ov002_0226b73c
    b .L_2e0
.L_140:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    mov r3, #0x0
    bl func_ov002_0226b73c
    b .L_2e0
.L_15c:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    bl func_ov002_0226b8f8
    b .L_2e0
.L_174:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    bl func_ov002_0226bbb8
    b .L_2e0
.L_18c:
    ldr r1, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r1, #0xa0]
    bl func_ov002_0226bfa8
    b .L_2e0
.L_1a0:
    ldr r0, [r0, #0xd94]
    bl func_ov002_0226cf50
    b .L_2e0
.L_1ac:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    bl func_ov002_0226c368
    b .L_2e0
.L_1c4:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    bl func_ov002_0226c988
    b .L_2e0
.L_1dc:
    ldr r1, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r1, #0xa0]
    bl func_ov002_0226a3bc
    b .L_2e0
.L_1f0:
    ldr r1, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r1, #0xa0]
    bl func_ov002_0226a488
    b .L_2e0
.L_204:
    ldr r1, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r1, #0xa0]
    bl func_ov002_0226cd68
    b .L_2e0
.L_218:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    bl func_ov002_0226ce8c
    b .L_2e0
.L_230:
    ldr r1, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r1, #0xa0]
    bl func_ov002_0226d00c
    b .L_2e0
.L_244:
    ldr r0, [r0, #0xd94]
    bl func_ov002_0226d530
    b .L_2e0
.L_250:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    bl func_ov002_0226cc0c
    b .L_2e0
.L_268:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    bl func_ov002_02269ba0
    b .L_2e0
.L_280:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    bl func_ov002_0226a284
    b .L_2e0
.L_298:
    ldr r1, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r1, #0xa0]
    bl func_ov002_02262804
    b .L_2e0
.L_2ac:
    bl func_ov002_0226a504
    b .L_2e0
.L_2b4:
    bl func_ov002_0226a730
    b .L_2e0
.L_2bc:
    ldr r2, _LIT4
    ldr r0, [r0, #0xd94]
    ldrh r1, [r2, #0xa0]
    ldrh r2, [r2, #0xa2]
    bl func_ov002_0226d538
    b .L_2e0
.L_2d4:
    add sp, sp, #0x14
    mov r0, #0x1
    ldmfd sp!, {pc}
.L_2e0:
    cmp r0, #0x0
    beq .L_344
    ldr r0, _LIT5
    ldr r0, [r0, #0x808]
    cmp r0, #0x0
    addne sp, sp, #0x14
    movne r0, #0x1
    ldmnefd sp!, {pc}
    ldr r1, _LIT0
    ldr r0, [r1, #0xd8c]
    cmp r0, #0x0
    beq .L_338
    ldr r0, _LIT1
    ldr r1, [r1, #0xd94]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    bne .L_338
    mov r0, #0x1f
    ldr r2, _LIT6
    sub r1, r0, #0x20
    mov r3, #0x10
    bl func_ov002_021b1570
.L_338:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xd90]
.L_344:
    mov r0, #0x1
    add sp, sp, #0x14
    ldmfd sp!, {pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd73c
_LIT2: .word data_ov002_022d0f0c
_LIT3: .word data_ov002_022cd968
_LIT4: .word data_ov002_022d0e6c
_LIT5: .word data_ov002_022ce950
_LIT6: .word data_ov002_022d0f1c

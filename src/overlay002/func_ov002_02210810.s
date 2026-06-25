; func_ov002_02210810 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b7ec
        .extern func_0202b830
        .extern func_0202b890
        .extern func_ov002_021ae400
        .extern func_ov002_021ae484
        .extern func_ov002_021bc6c4
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021ff46c
        .extern func_ov002_022107b4
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_0227adb8
        .extern func_ov002_02290500
        .extern func_ov002_0229ce5c
        .global func_ov002_02210810
        .arm
func_ov002_02210810:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x100
    mov r4, r0
    ldrh r5, [r4, #0x2]
    ldrh r3, [r4]
    ldr r0, _LIT0
    mov r2, r5, lsl #0x11
    mov r5, r5, lsl #0x1f
    mov r2, r2, lsr #0x1f
    cmp r3, r0
    eor r5, r2, r5, lsr #0x1f
    mov r6, #0x1
    beq .L_44
    ldr r0, _LIT1
    cmp r3, r0
    moveq r6, #0x5
    b .L_48
.L_44:
    mov r6, #0x2
.L_48:
    ldr r2, _LIT2
    ldr r0, [r2, #0x5a8]
    cmp r0, #0x64
    bgt .L_60
    beq .L_384
    b .L_394
.L_60:
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_394
    b .L_2ec
    b .L_29c
    b .L_b0
    b .L_80
.L_80:
    mov r3, #0x0
    mov r0, r4
    str r3, [r2, #0x5ac]
    bl func_ov002_021ff46c
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021e2b3c
    add sp, sp, #0x100
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_b0:
    mov r0, r4
    bl func_ov002_021ff46c
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x64
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_f4
    ldr r0, _LIT4
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_290
.L_f4:
    ldr r0, _LIT2
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    bne .L_288
    ldrh r0, [r4]
    ldr r3, _LIT5
    mov r6, #0x0
    mov r7, r6
    cmp r0, r3
    bgt .L_164
    bge .L_1e8
    rsb r1, r3, #0x29c0
    cmp r0, r1
    bgt .L_140
    bge .L_1e0
    ldr r1, _LIT6
    cmp r0, r1
    moveq r6, #0xa
    b .L_208
.L_140:
    ldr r1, _LIT7
    cmp r0, r1
    bgt .L_154
    moveq r6, #0x2
    b .L_208
.L_154:
    add r1, r1, #0x37
    cmp r0, r1
    moveq r7, #0x2
    b .L_208
.L_164:
    ldr r2, _LIT8
    cmp r0, r2
    bgt .L_198
    bge .L_1f0
    add r1, r3, #0x1f
    cmp r0, r1
    bgt .L_188
    moveq r6, #0x9
    b .L_208
.L_188:
    ldr r1, _LIT9
    cmp r0, r1
    moveq r6, #0x1
    b .L_208
.L_198:
    add r1, r2, #0x85
    cmp r0, r1
    bgt .L_1d0
    add r1, r2, #0x7f
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_208
    b .L_1f8
    b .L_1f8
    b .L_1f8
    b .L_1f8
    b .L_208
    b .L_208
    b .L_204
.L_1d0:
    ldr r1, _LIT10
    cmp r0, r1
    moveq r6, #0x9
    b .L_208
.L_1e0:
    mov r6, #0x1
    b .L_208
.L_1e8:
    mov r6, #0x4
    b .L_208
.L_1f0:
    mov r6, #0x7
    b .L_208
.L_1f8:
    bl func_0202b890
    mov r7, r0
    b .L_208
.L_204:
    mov r6, #0x11
.L_208:
    cmp r6, #0x0
    cmpeq r7, #0x0
    beq .L_26c
    cmp r6, #0x0
    beq .L_234
    mov r0, r6
    bl func_0202b7ec
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x24
    bl func_ov002_0229ce5c
.L_234:
    cmp r7, #0x0
    beq .L_254
    mov r0, r7
    bl func_0202b830
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x24
    bl func_ov002_0229ce5c
.L_254:
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    b .L_278
.L_26c:
    ldr r1, _LIT11
    mov r0, r5
    bl func_ov002_021ae400
.L_278:
    ldr r0, _LIT4
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_290
.L_288:
    mov r0, #0x23
    bl func_ov002_021ae484
.L_290:
    add sp, sp, #0x100
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_29c:
    ldr r0, _LIT4
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x64
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT3
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x1
    bne .L_2d8
    ldr r2, _LIT12
    mov r0, r5
    mov r1, r3
    bl func_ov002_02290500
    b .L_2e0
.L_2d8:
    ldr r0, _LIT12
    bl func_ov002_022592ec
.L_2e0:
    add sp, sp, #0x100
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2ec:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_378
    ldrh r2, [r4]
    ldr r0, _LIT13
    ldr r1, _LIT4
    cmp r2, r0
    mov r8, #0x0
    mov r0, r5
    ldr r7, [r1, #0xd78]
    moveq r8, #0x1
    bl func_ov002_021bc6c4
    ldr r1, _LIT2
    ldr r3, _LIT14
    str r0, [r1, #0x5b0]
    ldr r0, _LIT15
    and r2, r5, #0x1
    mla r0, r2, r0, r3
    ldrh r1, [r4]
    add r4, r0, #0x120
    mov r2, r8, lsl #0x10
    mov r3, r1, lsl #0x10
    orr r3, r3, r2, lsr #0x10
    mov r0, r5
    add r1, r4, r7, lsl #0x2
    mov r2, #0x1
    bl func_ov002_0227adb8
    ldr r0, _LIT2
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    cmp r1, r6
    str r1, [r0, #0x5ac]
    addge sp, sp, #0x100
    movge r0, #0x64
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
.L_378:
    add sp, sp, #0x100
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_384:
    bl func_ov002_021e2c5c
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_394:
    mov r0, #0x0
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x000012ca
_LIT1: .word 0x000016fd
_LIT2: .word data_ov002_022ce288
_LIT3: .word data_ov002_022cd744
_LIT4: .word data_ov002_022d016c
_LIT5: .word 0x000016f6
_LIT6: .word 0x000012a4
_LIT7: .word 0x0000153b
_LIT8: .word 0x000019ac
_LIT9: .word 0x00001879
_LIT10: .word 0x00001aa1
_LIT11: .word 0x0000011e
_LIT12: .word func_ov002_022107b4
_LIT13: .word 0x0000165b
_LIT14: .word data_ov002_022cf16c
_LIT15: .word 0x00000868

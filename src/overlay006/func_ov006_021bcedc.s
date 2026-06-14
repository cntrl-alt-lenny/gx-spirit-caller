; func_ov006_021bcedc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cc03c
        .extern data_ov006_021cc050
        .extern data_ov006_021cc064
        .extern data_ov006_021cc078
        .extern data_ov006_021cc13c
        .extern data_ov006_021cc6cc
        .extern data_ov006_021cc7f8
        .extern data_ov006_021cc924
        .extern data_ov006_0224f448
        .extern data_ov006_0225df3c
        .extern func_02021660
        .extern func_020216b0
        .extern func_0202de9c
        .extern func_ov006_021b6d1c
        .extern func_ov006_021b6f50
        .extern func_ov006_021b7cac
        .extern func_ov006_021b7ce0
        .extern func_ov006_021bd6bc
        .extern func_ov006_021c7f5c
        .global func_ov006_021bcedc
        .arm
func_ov006_021bcedc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x80
    mov r4, r0
    ldr r3, [r4, #0x40]
    mov r0, #0x0
    str r2, [sp, #0x4]
    cmp r3, #0x6
    streq r0, [sp, #0x4]
    ldr fp, _LIT0
    str r1, [sp]
    str r0, [sp, #0x1c]
    cmp r3, #0x6
    addls pc, pc, r3, lsl #0x2
    b .L_2d68
    b .L_2d38
    b .L_2d44
    b .L_2d50
    b .L_2d38
    b .L_2d68
    b .L_2d38
    b .L_2d5c
.L_2d38:
    mov r7, #0x0
    mov r5, #0x3
    b .L_2d70
.L_2d44:
    mov r7, #0x1
    mov r5, #0x2
    b .L_2d70
.L_2d50:
    mov r7, #0x0
    mov r5, #0x1
    b .L_2d70
.L_2d5c:
    mov r7, #0x0
    mov r5, r7
    b .L_2d70
.L_2d68:
    mov r7, #0x1
    mov r5, #0x3
.L_2d70:
    mov r1, #0x0
    mov r6, r1
    add r0, sp, #0x6c
.L_2d7c:
    str r6, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0x5
    blt .L_2d7c
    mvn r3, #0x0
    add r2, sp, #0x48
    mov r1, #0x0
    add r0, sp, #0x24
.L_2d9c:
    str r3, [r2, r6, lsl #0x2]
    str r1, [r0, r6, lsl #0x2]
    add r6, r6, #0x1
    cmp r6, #0x9
    blt .L_2d9c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_2e80
    ldr r1, [r4, #0x50]
    add r2, r4, #0xa0
    mov r0, #0x24
    mla r6, r1, r0, r2
    mov r0, r4
    bl func_ov006_021bd6bc
    movs r2, r0
    bmi .L_2e2c
    ldr r0, [r6, #0x20]
    ldr r1, [r4, #0x50]
    mov r3, r0, lsl #0x1f
    mov r0, fp
    mov r3, r3, lsr #0x1f
    bl func_ov006_021b6d1c
    mov r6, r0
    bl func_0202de9c
    str r0, [sp, #0x1c]
    cmp r7, r5
    bgt .L_2e2c
    add r8, sp, #0x6c
.L_2e0c:
    mov r0, fp
    mov r1, r7
    mov r2, r6
    bl func_ov006_021b6f50
    str r0, [r8, r7, lsl #0x2]
    add r7, r7, #0x1
    cmp r7, r5
    ble .L_2e0c
.L_2e2c:
    mov r7, #0x0
    mov r9, r7
    add r1, sp, #0x48
    add r0, sp, #0x24
    mov r3, r7
    add r2, sp, #0x6c
.L_2e44:
    mov r6, r3
    mov r5, r3
    ldr r8, [r2, r9, lsl #0x2]
    cmp r8, #0x0
    ble .L_2e74
.L_2e58:
    str r9, [r1, r7, lsl #0x2]
    str r6, [r0, r7, lsl #0x2]
    add r6, r6, #0x1
    add r7, r7, #0x1
    add r5, r5, #0x1
    cmp r5, r8
    blt .L_2e58
.L_2e74:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_2e44
.L_2e80:
    ldr r0, _LIT1
    mov r9, #0x0
    str r0, [sp, #0x10]
    ldr r0, _LIT2
    str r0, [sp, #0xc]
    ldr r0, _LIT3
    str r0, [sp, #0x8]
    ldr r0, _LIT4
    rsb r6, r0, #0x8c0
    orr r0, r0, #0x10
    str r0, [sp, #0x20]
.L_2eac:
    ldr r1, [r4, #0x40]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_2ee8
    b .L_2ed8
    b .L_2ee8
    b .L_2ee0
    b .L_2ed8
    b .L_2ee8
    b .L_2ee8
    b .L_2ee8
.L_2ed8:
    ldr r7, [sp, #0x10]
    b .L_2eec
.L_2ee0:
    ldr r7, [sp, #0xc]
    b .L_2eec
.L_2ee8:
    ldr r7, [sp, #0x8]
.L_2eec:
    cmp r9, #0x0
    mov r8, #0x0
    blt .L_2f6c
    cmp r9, #0xf
    bgt .L_2f6c
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_345c
    cmp r1, #0x0
    cmpne r1, #0x2
    cmpne r1, #0x3
    cmpne r9, #0x0
    cmpne r9, #0x8
    bne .L_345c
    ldrsh r0, [r7]
    ldr r2, [r7, #0x8]
    ldr r1, [r4, #0x54]
    add r0, r0, #0x8
    str r0, [sp, #0x18]
    ldrsh r0, [r7, #0x2]
    cmp r2, r1
    moveq r1, #0x1
    movne r1, #0x0
    add r0, r0, #0x8
    add r0, r0, r1
    cmp r9, #0x8
    ldr sl, _LIT4
    str r0, [sp, #0x14]
    blt .L_304c
    cmp r9, #0xf
    ldrle sl, [sp, #0x20]
    b .L_304c
.L_2f6c:
    cmp r9, #0x10
    blt .L_304c
    cmp r9, #0x18
    bgt .L_304c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    sub r0, r9, #0x10
    beq .L_345c
    add r2, sp, #0x48
    ldr r2, [r2, r0, lsl #0x2]
    cmp r2, #0x0
    blt .L_303c
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_2fe8
    b .L_2fc4
    b .L_2fd0
    b .L_2fdc
    b .L_2fc4
    b .L_2fe8
    b .L_2fc4
    b .L_2fe8
.L_2fc4:
    ldr r1, _LIT5
    add r3, r1, r2, lsl #0x2
    b .L_2ff0
.L_2fd0:
    ldr r1, _LIT6
    add r3, r1, r2, lsl #0x2
    b .L_2ff0
.L_2fdc:
    ldr r1, _LIT7
    add r3, r1, r2, lsl #0x2
    b .L_2ff0
.L_2fe8:
    ldr r1, _LIT8
    add r3, r1, r2, lsl #0x2
.L_2ff0:
    add r1, sp, #0x24
    ldr r1, [r1, r0, lsl #0x2]
    add r0, sp, #0x6c
    ldr r0, [r0, r2, lsl #0x2]
    add r2, r1, r1, lsl #0x1
    sub r0, r0, #0x1
    ldrsh r1, [r3]
    ldrsh r3, [r3, #0x2]
    add r0, r0, r0, lsl #0x1
    add r0, r0, r0, lsr #0x1f
    str r3, [sp, #0x14]
    sub r0, r1, r0, asr #0x1
    add r0, r2, r0
    ldr r5, _LIT9
    ldr r3, [sp, #0x1c]
    str r0, [sp, #0x18]
    ldr r8, [r5, r3, lsl #0x2]
    ldr sl, _LIT4
    b .L_304c
.L_303c:
    mov r0, #0x0
    str r0, [sp, #0x18]
    str r0, [sp, #0x14]
    mov sl, r0
.L_304c:
    ldr r0, [r7, #0x8]
    mov r5, #0x0
    cmp r0, #0xd
    addls pc, pc, r0, lsl #0x2
    b .L_3398
    b .L_3398
    b .L_3398
    b .L_3398
    b .L_3098
    b .L_3398
    b .L_3398
    b .L_3398
    b .L_30c8
    b .L_3130
    b .L_3198
    b .L_3200
    b .L_3268
    b .L_32d0
    b .L_3338
.L_3098:
    ldr r1, [r4, #0x50]
    mov r0, fp
    bl func_ov006_021b7cac
    mov r2, r0
    ldr r0, [r4, #0x88]
    mov r1, #0x1
    cmp r0, #0x4
    ldreq r2, [r4, #0x8c]
    ldr r0, _LIT10
    bl func_ov006_021c7f5c
    mov r8, r0
    b .L_3398
.L_30c8:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x1
    bl func_ov006_021b7ce0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_30f4
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_30f8
.L_30f4:
    mov r5, #0x0
.L_30f8:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_311c
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_311c
    cmp r0, #0x1
    ldreq r2, [r4, #0x90]
.L_311c:
    ldr r0, _LIT10
    mov r1, #0x3
    bl func_ov006_021c7f5c
    mov r8, r0
    b .L_3398
.L_3130:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x2
    bl func_ov006_021b7ce0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_315c
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_3160
.L_315c:
    mov r5, #0x0
.L_3160:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_3184
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_3184
    cmp r0, #0x2
    ldreq r2, [r4, #0x90]
.L_3184:
    ldr r0, _LIT10
    mov r1, #0x4
    bl func_ov006_021c7f5c
    mov r8, r0
    b .L_3398
.L_3198:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x3
    bl func_ov006_021b7ce0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_31c4
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_31c8
.L_31c4:
    mov r5, #0x0
.L_31c8:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_31ec
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_31ec
    cmp r0, #0x3
    ldreq r2, [r4, #0x90]
.L_31ec:
    ldr r0, _LIT10
    mov r1, #0x5
    bl func_ov006_021c7f5c
    mov r8, r0
    b .L_3398
.L_3200:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x4
    bl func_ov006_021b7ce0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_322c
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_3230
.L_322c:
    mov r5, #0x0
.L_3230:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_3254
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_3254
    cmp r0, #0x4
    ldreq r2, [r4, #0x90]
.L_3254:
    ldr r0, _LIT10
    mov r1, #0x6
    bl func_ov006_021c7f5c
    mov r8, r0
    b .L_3398
.L_3268:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x5
    bl func_ov006_021b7ce0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_3294
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_3298
.L_3294:
    mov r5, #0x0
.L_3298:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_32bc
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_32bc
    cmp r0, #0x5
    ldreq r2, [r4, #0x90]
.L_32bc:
    ldr r0, _LIT10
    mov r1, #0x7
    bl func_ov006_021c7f5c
    mov r8, r0
    b .L_3398
.L_32d0:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, #0x6
    bl func_ov006_021b7ce0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_32fc
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_3300
.L_32fc:
    mov r5, #0x0
.L_3300:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_3324
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_3324
    cmp r0, #0x6
    ldreq r2, [r4, #0x90]
.L_3324:
    ldr r0, _LIT10
    mov r1, #0x8
    bl func_ov006_021c7f5c
    mov r8, r0
    b .L_3398
.L_3338:
    ldr r1, [r4, #0x50]
    mov r0, fp
    mov r2, r5
    bl func_ov006_021b7ce0
    mov r2, r0
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_3364
    cmp r2, #0x0
    movlt r5, #0x1
    blt .L_3368
.L_3364:
    mov r5, #0x0
.L_3368:
    ldr r0, [r4, #0x88]
    cmp r0, #0x5
    bne .L_3388
    ldr r0, [r4, #0x8c]
    cmp r0, #0x0
    movlt r2, r6
    blt .L_3388
    ldreq r2, [r4, #0x90]
.L_3388:
    ldr r0, _LIT10
    mov r1, #0x2
    bl func_ov006_021c7f5c
    mov r8, r0
.L_3398:
    ldr r0, [r4, #0x50]
    cmp r0, #0x4
    bne .L_33c4
    cmp r9, #0x0
    cmpne r9, #0x8
    beq .L_33c4
    cmp r9, #0x10
    blt .L_33c0
    cmp r9, #0x18
    ble .L_33c4
.L_33c0:
    mov r5, #0x1
.L_33c4:
    ldr r0, [r4]
    mov r1, #0x5
    cmp r5, #0x0
    add r2, r9, #0x4b
    orrne sl, sl, #0x4
    bl func_02021660
    mov r1, #0x2
    mov r2, r9
    mov r5, r0
    bl func_020216b0
    ldr r2, [sp, #0x18]
    mov r0, r5
    mov r1, #0x3
    bl func_020216b0
    ldr r2, [sp, #0x14]
    mov r0, r5
    mov r1, #0x4
    bl func_020216b0
    ldrsh r2, [r7, #0x4]
    mov r0, r5
    mov r1, #0x11
    bl func_020216b0
    ldrsh r2, [r7, #0x6]
    mov r0, r5
    mov r1, #0x12
    bl func_020216b0
    mov r0, r5
    mov r1, #0xc
    mov r2, #0x0
    bl func_020216b0
    mov r2, r8
    mov r0, r5
    mov r1, #0xd
    bl func_020216b0
    mov r0, r5
    mov r1, #0x0
    mov r2, sl
    bl func_020216b0
.L_345c:
    ldr r0, [sp, #0x10]
    add r9, r9, #0x1
    add r0, r0, #0xc
    str r0, [sp, #0x10]
    ldr r0, [sp, #0xc]
    cmp r9, #0x19
    add r0, r0, #0xc
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x8]
    add r0, r0, #0xc
    str r0, [sp, #0x8]
    blt .L_2eac
    mov r0, #0x1
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word data_ov006_021cc6cc
_LIT2: .word data_ov006_021cc7f8
_LIT3: .word data_ov006_021cc924
_LIT4: .word 0x000008c1
_LIT5: .word data_ov006_021cc03c
_LIT6: .word data_ov006_021cc050
_LIT7: .word data_ov006_021cc064
_LIT8: .word data_ov006_021cc078
_LIT9: .word data_ov006_021cc13c
_LIT10: .word data_ov006_0225df3c

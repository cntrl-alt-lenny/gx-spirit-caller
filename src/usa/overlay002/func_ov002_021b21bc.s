; func_ov002_021b21bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0172
        .extern data_ov002_022d0570
        .extern func_ov002_021b1ca4
        .extern func_ov002_021b204c
        .extern func_ov002_021b2108
        .global func_ov002_021b21bc
        .arm
func_ov002_021b21bc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x5c
    ldr r1, [r0]
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r8, r0, r1, lsr #0x1f
.L_2c:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT0
    ldr r2, _LIT1
    and r0, r0, #0x1
    mla r2, r0, r1, r2
    ldr r0, _LIT2
    ldr r6, _LIT3
    add r9, r2, #0x64
    add sl, r2, #0x94
    mov r7, #0x5
    add r4, r1, #0xb00
    add fp, r0, #0xcc
    mov r5, #0x0
.L_60:
    ldrh r1, [r9, #0x38]
    cmp r1, #0x0
    beq .L_144
    ldr r0, [sl]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    cmp r0, r4
    beq .L_98
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_e0
    cmp r0, fp
    beq .L_fc
    b .L_144
.L_98:
    ldr r2, [r9, #0x40]
    mov r3, r2, lsr #0x6
    and r3, r3, #0x1
    mvn r3, r3
    and r1, r1, r3
    mov r3, r2, lsr #0x2
    orr r2, r3, r2, lsr #0x1
    and r2, r2, #0x1
    mvn r2, r2
    tst r1, r2
    beq .L_144
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldrh r0, [r9, #0x3a]
    mov r2, r8
    mov r3, #0x1
    bl func_ov002_021b2108
    b .L_144
.L_e0:
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldrh r0, [r9, #0x3a]
    mov r2, r8
    mov r3, #0x1
    bl func_ov002_021b2108
    b .L_144
.L_fc:
    ldrh r2, [r9, #0x3a]
    cmp r2, #0x0
    beq .L_144
.L_108:
    mov r1, r2, lsl #0x3
    ldrh r3, [r6, r1]
    add r1, r6, r2, lsl #0x3
    ldrh r2, [r1, #0x6]
    cmp r3, r0
    bne .L_13c
    ldrh r3, [r1, #0x2]
    mov r3, r3, lsl #0x1c
    mov r3, r3, lsr #0x1c
    cmp r3, #0x3
    ldreqh r3, [r1, #0x4]
    cmpeq r8, r3, lsr #0x3
    streqh r5, [r1, #0x4]
.L_13c:
    cmp r2, #0x0
    bne .L_108
.L_144:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r9, r9, #0x14
    add sl, sl, #0x14
    ble .L_60
    ldr r0, [sp, #0x8]
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    cmp r0, #0x2
    blt .L_2c
    mov r0, #0x0
    str r0, [sp, #0x4]
.L_174:
    ldr r0, [sp, #0x4]
    ldr r1, _LIT0
    ldr r2, _LIT1
    and r3, r0, #0x1
    mla r0, r3, r1, r2
    add r0, r0, #0x100
    ldrh r0, [r0, #0x16]
    cmp r0, #0x0
    beq .L_4ac
    ldr r1, _LIT4
    add r7, r1, #0x2a0
    ldr r1, _LIT5
    add r5, r1, #0x17c
    ldr r1, _LIT4
    sub r6, r1, #0x4f
    ldr r1, _LIT6
    add r1, r1, #0x6b
    str r1, [sp, #0x28]
    ldr r1, _LIT7
    sub r9, r1, #0xab
    ldr r1, _LIT6
    add r1, r1, #0x1
    str r1, [sp, #0x14]
    ldr r1, _LIT6
    add r1, r1, #0x6d
    str r1, [sp, #0x24]
    ldr r1, _LIT6
    add r1, r1, #0xa8
    str r1, [sp, #0x38]
    ldr r1, _LIT6
    add r1, r1, #0x6a
    str r1, [sp, #0x34]
    ldr r1, _LIT6
    add r1, r1, #0x6d
    str r1, [sp, #0x30]
    ldr r1, _LIT6
    add r1, r1, #0x6b
    str r1, [sp, #0x2c]
    ldr r1, _LIT6
    sub r1, r1, #0x78
    str r1, [sp, #0x20]
    ldr r1, _LIT7
    sub r1, r1, #0x60
    str r1, [sp, #0x1c]
    ldr r1, _LIT6
    add r1, r1, #0x1
    str r1, [sp, #0x18]
    ldr r1, _LIT7
    sub r1, r1, #0xde
    str r1, [sp, #0x10]
    ldr r1, _LIT4
    sub r1, r1, #0x6
    str r1, [sp, #0xc]
    ldr r1, _LIT5
    add fp, r1, #0xc0
    sub r4, r1, #0xde
    ldr r1, _LIT4
    add r1, r1, #0x148
    str r1, [sp, #0x40]
    ldr r1, _LIT7
    sub r1, r1, #0x4b0
    str r1, [sp, #0x44]
    ldr r1, _LIT4
    add r1, r1, #0x148
    str r1, [sp, #0x3c]
    ldr r1, _LIT6
    add r1, r1, #0xb
    str r1, [sp, #0x50]
    ldr r1, _LIT6
    add r1, r1, #0x83
    str r1, [sp, #0x58]
    ldr r1, _LIT6
    add r1, r1, #0xb
    str r1, [sp, #0x54]
    ldr r1, _LIT7
    sub r1, r1, #0x304
    str r1, [sp, #0x4c]
    ldr r1, _LIT7
    sub r1, r1, #0x4b0
    str r1, [sp, #0x48]
.L_2b4:
    ldr r1, _LIT3
    add r2, r1, r0, lsl #0x3
    ldrh r1, [r2, #0x2]
    ldrh sl, [r2, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x6
    bcs .L_4a0
    ldr r1, [sp]
    ldrh r3, [r2, #0x4]
    ldr ip, [r1]
    mov r1, ip, lsl #0x12
    mov ip, ip, lsl #0x2
    mov ip, ip, lsr #0x18
    mov ip, ip, lsl #0x1
    add r1, ip, r1, lsr #0x1f
    cmp r3, r1
    bne .L_424
    ldrh r1, [r2]
    cmp r1, r9
    bgt .L_378
    cmp r1, r7
    bge .L_41c
    cmp r1, r6
    bgt .L_348
    cmp r1, r5
    bge .L_41c
    ldr r2, _LIT5
    cmp r1, r2
    bgt .L_33c
    bge .L_41c
    cmp r1, r4
    beq .L_41c
    b .L_4a0
.L_33c:
    cmp r1, fp
    beq .L_41c
    b .L_4a0
.L_348:
    ldr r2, _LIT4
    cmp r1, r2
    bgt .L_368
    bge .L_41c
    ldr r2, [sp, #0xc]
    cmp r1, r2
    beq .L_41c
    b .L_4a0
.L_368:
    ldr r2, [sp, #0x10]
    cmp r1, r2
    beq .L_41c
    b .L_4a0
.L_378:
    ldr r2, [sp, #0x14]
    cmp r1, r2
    bgt .L_3d0
    ldr r2, _LIT6
    cmp r1, r2
    blt .L_3a0
    ldrne r2, [sp, #0x18]
    cmpne r1, r2
    beq .L_41c
    b .L_4a0
.L_3a0:
    ldr r2, _LIT7
    cmp r1, r2
    bgt .L_3c0
    bge .L_41c
    ldr r2, [sp, #0x1c]
    cmp r1, r2
    beq .L_41c
    b .L_4a0
.L_3c0:
    ldr r2, [sp, #0x20]
    cmp r1, r2
    beq .L_41c
    b .L_4a0
.L_3d0:
    ldr r2, [sp, #0x24]
    cmp r1, r2
    bgt .L_410
    ldr r2, [sp, #0x28]
    cmp r1, r2
    blt .L_400
    ldr r2, [sp, #0x2c]
    cmp r1, r2
    ldrne r2, [sp, #0x30]
    cmpne r1, r2
    beq .L_41c
    b .L_4a0
.L_400:
    ldr r2, [sp, #0x34]
    cmp r1, r2
    beq .L_41c
    b .L_4a0
.L_410:
    ldr r2, [sp, #0x38]
    cmp r1, r2
    bne .L_4a0
.L_41c:
    bl func_ov002_021b1ca4
    b .L_4a0
.L_424:
    cmp r1, r3, lsr #0x3
    bne .L_4a0
    ldrh r1, [r2]
    ldr r2, [sp, #0x3c]
    cmp r1, r2
    bgt .L_474
    ldr r2, [sp, #0x40]
    cmp r1, r2
    bge .L_49c
    ldr r2, [sp, #0x44]
    cmp r1, r2
    bgt .L_464
    ldr r2, [sp, #0x48]
    cmp r1, r2
    beq .L_49c
    b .L_4a0
.L_464:
    ldr r2, [sp, #0x4c]
    cmp r1, r2
    beq .L_49c
    b .L_4a0
.L_474:
    ldr r2, [sp, #0x50]
    cmp r1, r2
    bgt .L_490
    ldr r2, [sp, #0x54]
    cmp r1, r2
    beq .L_49c
    b .L_4a0
.L_490:
    ldr r2, [sp, #0x58]
    cmp r1, r2
    bne .L_4a0
.L_49c:
    bl func_ov002_021b1ca4
.L_4a0:
    cmp sl, #0x0
    mov r0, sl
    bne .L_2b4
.L_4ac:
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_174
    ldr r0, _LIT8
    mov r1, r8, lsl #0x2
    ldrh r0, [r0, r1]
    ldr r1, _LIT9
    mov r2, #0x1
    bl func_ov002_021b204c
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x0000159c
_LIT3: .word data_ov002_022d0570
_LIT4: .word 0x00001571
_LIT5: .word 0x000013a6
_LIT6: .word 0x000019f7
_LIT7: .word 0x000018bc
_LIT8: .word data_ov002_022d0172
_LIT9: .word 0x000018d9

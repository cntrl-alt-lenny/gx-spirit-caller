; func_ov002_0223d1ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce720
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf184
        .extern data_ov002_022cf1a6
        .extern data_ov002_022d016c
        .extern data_ov002_022d0250
        .extern data_ov002_022d0650
        .extern func_0202b8f0
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021afffc
        .extern func_ov002_021b41a4
        .extern func_ov002_021ba310
        .extern func_ov002_021bb068
        .extern func_ov002_021bc6c4
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021e16a4
        .extern func_ov002_021e1870
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021ff3bc
        .extern func_ov002_0223b468
        .extern func_ov002_0223b584
        .extern func_ov002_0223b5cc
        .extern func_ov002_022536e8
        .extern func_ov002_0226b054
        .extern func_ov002_0226b0d0
        .extern func_ov002_0227adb8
        .extern func_ov002_0229cf10
        .global func_ov002_0223d1ec
        .arm
func_ov002_0223d1ec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x108
    mov r4, r0
    ldrh r3, [r4, #0x2]
    mov r5, r1
    mov r0, r3, lsl #0x1f
    mov r1, r3, lsl #0x12
    mov r0, r0, lsr #0x1f
    mov r2, r3, lsl #0x11
    eor r8, r0, r2, lsr #0x1f
    movs r1, r1, lsr #0x1e
    bne .L_1c8c
    ldr r5, _LIT0
    ldr r1, [r5, #0x5a8]
    sub r1, r1, #0x6d
    cmp r1, #0x13
    addls pc, pc, r1, lsl #0x2
    b .L_1f34
    b .L_1c78
    b .L_1c64
    b .L_1f34
    b .L_1f34
    b .L_1f34
    b .L_1f34
    b .L_1f34
    b .L_1f34
    b .L_1f34
    b .L_1f34
    b .L_1f34
    b .L_1f34
    b .L_1ba4
    b .L_1b90
    b .L_1a7c
    b .L_19a4
    b .L_195c
    b .L_18d0
    b .L_18b0
    b .L_1824
.L_1824:
    ldr r1, _LIT1
    and r0, r0, #0x1
    mul r1, r0, r1
    ldr r0, _LIT2
    ldr r0, [r0, r1]
    cmp r0, #0x0
    addeq sp, sp, #0x108
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT3
    ldr r0, [r0, r1]
    cmp r0, #0x0
    addeq sp, sp, #0x108
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [r4]
    mov r0, r8
    mov r2, #0x0
    bl func_ov002_022536e8
    cmp r0, #0x0
    bne .L_1890
    ldr r1, _LIT4
    mov r0, r8
    bl func_ov002_021ae400
    add sp, sp, #0x108
    mov r0, #0x6e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1890:
    ldrh r0, [r4, #0x2]
    mov r1, #0x5b
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x108
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18b0:
    ldrh r2, [r4]
    mov r0, r8
    mov r1, #0x6
    mov r3, #0x0
    bl func_ov002_021af9d0
    add sp, sp, #0x108
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18d0:
    bl func_ov002_021afb74
    ldr r1, [r0]
    mov r0, r5
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    str r1, [r0, #0x69c]
    bl func_ov002_021afb74
    mov r5, r0
    bl func_ov002_021afb74
    ldr r0, [r0]
    ldr r1, [r5]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    ldr r0, _LIT0
    add r1, r1, r2, lsr #0x1f
    str r1, [r0, #0x6a0]
    ldr r0, [r0, #0x69c]
    bl func_ov002_0223b468
    ldr r1, _LIT0
    mov r2, #0x1
    str r0, [r1, #0x6a4]
    str r2, [r1, #0x6b0]
    mov r0, #0x0
    str r0, [r1, #0x6ac]
    bl func_ov002_0223b584
    ldr r2, _LIT0
    ldrh r1, [r4]
    ldr r2, [r2, #0x69c]
    rsb r0, r8, #0x1
    bl func_ov002_0226b0d0
    add sp, sp, #0x108
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_195c:
    ldr r1, [r5, #0x69c]
    ldr r0, _LIT5
    cmp r1, r0
    bne .L_197c
    mov r0, r8
    mov r1, #0x5c
    bl func_ov002_021ae400
    b .L_1998
.L_197c:
    ldr r2, [r5, #0x6a4]
    add r0, sp, #0x8
    mov r1, #0xc
    bl func_ov002_0229cf10
    add r1, sp, #0x8
    mov r0, r8
    bl func_ov002_021ae400
.L_1998:
    add sp, sp, #0x108
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19a4:
    ldr r3, [r5, #0x69c]
    ldr r0, _LIT5
    cmp r3, r0
    bne .L_19dc
    ldr r0, [r5, #0x6ac]
    cmp r0, #0x2
    bcc .L_19dc
    ldrh r2, [r4]
    mov r0, r8
    mov r1, #0x48
    bl func_ov002_021af9d0
    add sp, sp, #0x108
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19dc:
    ldr r0, _LIT6
    cmp r3, r0
    bne .L_1a04
    ldrh r2, [r4]
    mov r0, r8
    mov r1, #0xb
    bl func_ov002_021af9d0
    add sp, sp, #0x108
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a04:
    ldr r0, _LIT0
    ldrh r1, [r4]
    ldr r6, [r0, #0x6a4]
    ldr r5, [r0, #0x6ac]
    mov r0, r8
    mov r2, r3
    sub r5, r6, r5
    bl func_ov002_022536e8
    cmp r5, r0
    bne .L_1a58
    ldr r0, _LIT0
    ldrh r2, [r4]
    cmp r5, #0x20
    movcs r5, #0x20
    ldr r3, [r0, #0x69c]
    mov r0, r8
    add r1, r5, #0x6
    bl func_ov002_021af9d0
    add sp, sp, #0x108
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a58:
    ldr r0, _LIT0
    ldrh r2, [r4]
    ldr r3, [r0, #0x69c]
    mov r0, r8
    mov r1, #0x6
    bl func_ov002_021af9d0
    add sp, sp, #0x108
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a7c:
    ldr r9, _LIT7
    mov r7, #0x0
    ldr sl, [r9, #0xd44]
    cmp sl, #0x0
    bls .L_1b14
    mov r6, #0x1
.L_1a94:
    add r0, r7, #0x1
    bl func_ov002_021afffc
    bl func_ov002_021afb74
    ldr r0, [r0]
    mov r1, r6
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_0223b5cc
    bl func_ov002_021afb74
    mov sl, r0
    bl func_ov002_021afb74
    ldr r1, [sl]
    ldr r0, [r0]
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r0, r0, lsl #0x1
    add r2, r0, r1, lsr #0x1f
    ldr r1, [r5, #0x494]
    ldr r0, [r5, #0x6ac]
    add r7, r7, #0x1
    add r0, r1, r0
    mov r0, r0, lsl #0x19
    add r0, r5, r0, lsr #0x18
    add r0, r0, #0x400
    strh r2, [r0, #0x98]
    ldr r0, [r5, #0x6ac]
    add r0, r0, #0x1
    str r0, [r5, #0x6ac]
    ldr sl, [r9, #0xd44]
    cmp r7, sl
    bcc .L_1a94
.L_1b14:
    ldr r1, _LIT0
    ldr r3, [r1, #0x6ac]
    ldr r0, [r1, #0x6a4]
    cmp r3, r0
    addcc sp, sp, #0x108
    movcc r0, #0x7c
    ldmccia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [r1, #0x69c]
    ldr r0, _LIT5
    cmp r2, r0
    bne .L_1b84
    cmp r3, #0x2
    bne .L_1b78
    sub r0, r3, sl
    cmp r0, #0x2
    bcs .L_1b78
    mov r0, #0x7
    str r0, [r1, #0x6b8]
    ldrh r1, [r4]
    mov r0, r8
    bl func_ov002_022536e8
    cmp r0, #0x0
    addne sp, sp, #0x108
    movne r0, #0x7c
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b78:
    ldr r0, _LIT0
    ldr r1, [r0, #0x6ac]
    str r1, [r0, #0x6a4]
.L_1b84:
    add sp, sp, #0x108
    mov r0, #0x7a
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b90:
    ldr r1, [r5, #0x6ac]
    mov r0, #0x0
    str r1, [r5, #0x6a4]
    str r0, [r5, #0x6ac]
    bl func_ov002_021e2b3c
.L_1ba4:
    ldr r0, _LIT0
    ldr r2, [r0, #0x6ac]
    ldr r1, [r0, #0x6a4]
    cmp r2, r1
    bcs .L_1c20
    ldr r1, [r0, #0x494]
    ldr r0, _LIT8
    add r1, r1, r2
    mov r1, r1, lsl #0x19
    mov r1, r1, lsr #0x18
    ldrh r5, [r0, r1]
    mov r0, r8
    mov r2, #0x0
    mov r1, r5
    bl func_ov002_021e1870
    str r5, [sp]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r3, #0x3
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d59cc
    ldr r1, _LIT0
    add sp, sp, #0x108
    ldr r2, [r1, #0x6ac]
    mov r0, #0x79
    add r2, r2, #0x1
    str r2, [r1, #0x6ac]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c20:
    bl func_ov002_021e2c5c
    ldr r0, _LIT0
    mov r3, #0x41
    ldr r0, [r0, #0x69c]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d59cc
    add sp, sp, #0x108
    mov r0, #0x6d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c64:
    rsb r0, r8, #0x1
    bl func_ov002_0226b054
    add sp, sp, #0x108
    mov r0, #0x6d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c78:
    mov r0, r8
    bl func_ov002_021e286c
    add sp, sp, #0x108
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c8c:
    ldr r1, _LIT0
    ldr r2, [r1, #0x5a8]
    cmp r2, #0x7f
    beq .L_1ef0
    cmp r2, #0x80
    bne .L_1f34
    ldrh r2, [r4]
    mov r1, r3, lsl #0x1a
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b41a4
    mov r1, r0
    ldr r2, _LIT0
    mov r0, r8
    str r1, [r2, #0x69c]
    bl func_ov002_021ba310
    cmp r0, #0x0
    addlt sp, sp, #0x108
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r3, _LIT9
    ldr r1, _LIT1
    and r2, r8, #0x1
    mla r1, r2, r1, r3
    add r2, r1, #0x3a0
    ldr r1, [r2, r0, lsl #0x2]
    add r0, r2, r0, lsl #0x2
    str r0, [sp, #0x4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    ldr r2, _LIT0
    mov r3, #0x0
    str r0, [r2, #0x6a0]
    str r3, [r2, #0x6a4]
    mov r0, r4
    mov r1, r5
    str r3, [r2, #0x6a8]
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    beq .L_1d44
    ldr r0, _LIT10
    bl func_ov002_021bb068
    cmp r0, #0x0
    beq .L_1d70
.L_1d44:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r2, #0x0
    mov r4, r1, lsl #0x1f
    ldr r1, [r0, #0x69c]
    mov r3, r2
    mov r0, r4, lsr #0x1f
    bl func_ov002_021e16a4
    add sp, sp, #0x108
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1d70:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    ldr r3, _LIT11
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1a
    and r5, r2, #0x1
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, r5, r0, r3
    ldrh r9, [r1, r0]
    cmp r9, #0x0
    beq .L_1e74
    ldr r6, _LIT12
    ldr r5, _LIT0
    ldr r7, _LIT13
    ldr fp, _LIT14
.L_1db8:
    add r0, r7, r9, lsl #0x3
    ldrh r1, [r0, #0x2]
    ldrh r9, [r0, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x3
    ldreqh r2, [r0]
    ldreqh r1, [r4]
    cmpeq r2, r1
    bne .L_1e6c
    ldr r1, [r5, #0x69c]
    ldrh sl, [r0, #0x4]
    cmp r1, fp
    bne .L_1e10
    mov r0, sl, lsl #0x2
    ldrh r0, [r6, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    ldr r1, [r5, #0x6a8]
    add r0, r1, r0
    str r0, [r5, #0x6a8]
.L_1e10:
    ldr r1, [r5, #0x494]
    ldr r0, [r5, #0x6a4]
    cmp r8, #0x0
    add r0, r1, r0
    mov r0, r0, lsl #0x19
    add r0, r5, r0, lsr #0x18
    add r0, r0, #0x400
    strh sl, [r0, #0x98]
    movne r0, #0x8000
    ldr r1, [r5, #0x6a4]
    moveq r0, #0x0
    orr r0, r0, #0x4c
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, sl, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0x10
    bl func_ov002_021d479c
    ldr r0, [r5, #0x6a4]
    add r0, r0, #0x1
    str r0, [r5, #0x6a4]
.L_1e6c:
    cmp r9, #0x0
    bne .L_1db8
.L_1e74:
    ldr r0, _LIT0
    cmp r8, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    orr r5, r1, #0x4d
    ldr r1, [r0, #0x69c]
    ldr r2, [r0, #0x6a0]
    ldr r3, [r0, #0x6a4]
    mov r0, r5, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    mov r0, r8
    bl func_ov002_021bc6c4
    ldr r2, _LIT0
    ldr r1, [sp, #0x4]
    str r0, [r2, #0x5ac]
    ldrh r3, [r4]
    mov r0, r8
    mov r2, #0x1
    mov r3, r3, lsl #0x10
    orr r3, r3, #0x1
    bl func_ov002_0227adb8
    add sp, sp, #0x108
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ef0:
    mov r2, #0x0
    str r2, [sp]
    ldrh r2, [r4, #0x2]
    and r3, r0, #0xff
    ldr r1, [r1, #0x5ac]
    mov r0, r2, lsl #0x1a
    mov r0, r0, lsr #0x1b
    and r0, r0, #0xff
    orr r0, r3, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    mov r0, r8
    mov r2, r2, lsr #0x10
    mov r3, #0x7
    bl func_ov002_021d59cc
    add sp, sp, #0x108
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f34:
    mov r0, #0x0
    add sp, sp, #0x108
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf184
_LIT3: .word data_ov002_022cf17c
_LIT4: .word 0x00000122
_LIT5: .word 0x00001a4e
_LIT6: .word 0x0000157e
_LIT7: .word data_ov002_022d016c
_LIT8: .word data_ov002_022ce720
_LIT9: .word data_ov002_022cf16c
_LIT10: .word 0x0000197a
_LIT11: .word data_ov002_022cf1a6
_LIT12: .word data_ov002_022d0250
_LIT13: .word data_ov002_022d0650
_LIT14: .word 0x000018fb

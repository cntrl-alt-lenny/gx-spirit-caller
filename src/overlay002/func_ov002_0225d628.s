; func_ov002_0225d628 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd420
        .extern data_ov002_022cd428
        .extern data_ov002_022cd43c
        .extern data_ov002_022cd440
        .extern data_ov002_022cd44c
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern func_0202f9e8
        .extern func_ov002_021ab864
        .extern func_ov002_021ae3f0
        .extern func_ov002_021b34f4
        .extern func_ov002_021b3ecc
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021df62c
        .extern func_ov002_021e276c
        .extern func_ov002_021e30b4
        .extern func_ov002_02244fe4
        .extern func_ov002_0225a874
        .global func_ov002_0225d628
        .arm
func_ov002_0225d628:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    mov r5, r0
    mov r1, #0x38
    rsb r3, r5, #0x1
    mul sl, r5, r1
    ldr r2, _LIT0
    ldr r6, _LIT1
    mul r9, r3, r1
    ldr r2, [r2, #0xd30]
    ldr r4, _LIT2
    add r7, r6, sl
    add r8, r6, r9
    ldr r6, [r4, #0x4]
    cmp r2, #0xa
    addls pc, pc, r2, lsl #0x2
    b .L_2580
    b .L_194c
    b .L_1b94
    b .L_1ea4
    b .L_2040
    b .L_208c
    b .L_20b0
    b .L_21d4
    b .L_2580
    b .L_2580
    b .L_2580
    b .L_24bc
.L_194c:
    bl func_ov002_0225a874
    cmp r0, #0x0
    beq .L_1970
    ldr r0, _LIT0
    mov r1, #0xa
    str r1, [r0, #0xd30]
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1970:
    mov r0, #0x0
    bl func_ov002_021ab864
    ldr r0, [r7, #0x10]
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_19bc
    bge .L_1a28
    sub r1, r2, #0xe7
    cmp r0, r1
    bgt .L_19ac
    bge .L_1a50
    sub r1, r2, #0x2d0
    cmp r0, r1
    beq .L_1a00
    b .L_1b40
.L_19ac:
    sub r1, r2, #0xdc
    cmp r0, r1
    beq .L_1a28
    b .L_1b40
.L_19bc:
    add r1, r2, #0x70
    cmp r0, r1
    bgt .L_19dc
    bge .L_1a00
    add r1, r2, #0x4f
    cmp r0, r1
    beq .L_1a28
    b .L_1b40
.L_19dc:
    add r1, r2, #0xac
    cmp r0, r1
    bgt .L_19f0
    beq .L_1a28
    b .L_1b40
.L_19f0:
    add r1, r2, #0xb4
    cmp r0, r1
    beq .L_1b20
    b .L_1b40
.L_1a00:
    mov r2, #0x0
    ldr r1, _LIT2
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x1c]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x2
    bl func_ov002_021d59cc
    b .L_1b40
.L_1a28:
    mov r2, #0x0
    ldr r1, _LIT2
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x1c]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_1b40
.L_1a50:
    mov r0, r4
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_1b40
    cmp r5, r6
    beq .L_1b40
    ldr r2, _LIT4
    and r3, r5, #0x1
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r4, r3, r2
    ldr r3, _LIT5
    ldr r2, _LIT6
    mul r0, r1, r0
    add r3, r3, r4
    ldr r8, [r0, r3]
    add r4, r2, r4
    mov r3, r8, lsr #0x6
    mov r2, r8, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, r8, lsr #0x1
    and r2, r2, #0x1
    ldrh r4, [r0, r4]
    mvn r3, r3
    mvn r0, r2
    and r2, r4, r3
    tst r2, r0
    beq .L_1b40
    ldr r2, [r7, #0xc]
    mov r0, r5
    bl func_ov002_021df62c
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    cmp r6, r0
    movne r0, #0x1
    moveq r0, #0x0
    add r0, r0, #0x2
    str r1, [sp]
    and r0, r0, #0xff
    mov r1, r0, lsl #0x4
    ldr r2, [r7, #0x10]
    orr r1, r1, #0x2
    mov r2, r2, lsl #0x10
    mov r3, r1, lsl #0x10
    ldr r0, _LIT2
    mov r2, r2, lsr #0x10
    ldr r1, [r0, #0x20]
    mov r0, r6
    mov r3, r3, lsr #0x10
    bl func_ov002_021d59cc
    b .L_1b40
.L_1b20:
    ldr r2, [r7, #0xc]
    mov r1, r0, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e276c
.L_1b40:
    ldr r2, _LIT7
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1b78
    mov r1, #0x0
    ldr r0, _LIT2
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    ldr r2, _LIT7
    mov r0, r5
    mov r3, #0x2
    bl func_ov002_021d59cc
.L_1b78:
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b94:
    ldr r2, [r4, #0x8]
    cmp r2, #0x0
    bne .L_1dec
    ldr r3, [r8, #0x10]
    ldr r7, _LIT3
    cmp r3, r7
    bgt .L_1bf8
    bge .L_1cac
    ldr r2, _LIT8
    cmp r3, r2
    bgt .L_1bd4
    bge .L_1c64
    sub r0, r7, #0x2d0
    cmp r3, r0
    beq .L_1c3c
    b .L_1db4
.L_1bd4:
    add r0, r2, #0xe3
    cmp r3, r0
    bgt .L_1be8
    beq .L_1cd4
    b .L_1db4
.L_1be8:
    add r0, r2, #0xee
    cmp r3, r0
    beq .L_1cac
    b .L_1db4
.L_1bf8:
    add r0, r7, #0x70
    cmp r3, r0
    bgt .L_1c18
    bge .L_1c3c
    add r0, r7, #0x4f
    cmp r3, r0
    beq .L_1cac
    b .L_1db4
.L_1c18:
    add r0, r7, #0xac
    cmp r3, r0
    bgt .L_1c2c
    beq .L_1cac
    b .L_1db4
.L_1c2c:
    add r0, r7, #0xb4
    cmp r3, r0
    beq .L_1d94
    b .L_1db4
.L_1c3c:
    mov r1, #0x0
    ldr r0, _LIT2
    str r1, [sp]
    mov r2, r3, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r6
    mov r2, r2, lsr #0x10
    mov r3, #0x2
    bl func_ov002_021d59cc
    b .L_1db4
.L_1c64:
    ldr r9, [r4, #0x20]
    mov r7, #0x14
    ldr sl, _LIT9
    and r2, r6, #0x1
    add r1, r1, #0x830
    mul r7, r9, r7
    mla r1, r2, r1, sl
    ldrh r1, [r7, r1]
    cmp r1, #0x0
    beq .L_1db4
    mov r1, #0x0
    str r1, [sp]
    mov r2, r3, lsl #0x10
    ldr r1, [r4, #0x1c]
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d59cc
    b .L_1db4
.L_1cac:
    mov r1, #0x0
    ldr r0, _LIT2
    str r1, [sp]
    mov r2, r3, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r6
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_1db4
.L_1cd4:
    cmp r5, r6
    beq .L_1db4
    and r3, r6, #0x1
    add r2, r1, #0x830
    ldr r1, [r4, #0x20]
    mov r0, #0x14
    mul r4, r3, r2
    ldr r3, _LIT5
    ldr r2, _LIT6
    mul r0, r1, r0
    add r3, r3, r4
    ldr r7, [r0, r3]
    add r4, r2, r4
    mov r3, r7, lsr #0x6
    mov r2, r7, lsr #0x2
    and r3, r3, #0x1
    orr r2, r2, r7, lsr #0x1
    and r2, r2, #0x1
    ldrh r4, [r0, r4]
    mvn r3, r3
    mvn r0, r2
    and r2, r4, r3
    tst r2, r0
    beq .L_1db4
    ldr r2, [r8, #0xc]
    mov r0, r6
    bl func_ov002_021df62c
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0, #0xcec]
    cmp r5, r0
    movne r0, #0x1
    moveq r0, #0x0
    add r0, r0, #0x2
    str r1, [sp]
    and r0, r0, #0xff
    mov r1, r0, lsl #0x4
    ldr r2, [r8, #0x10]
    orr r1, r1, #0x2
    mov r2, r2, lsl #0x10
    mov r3, r1, lsl #0x10
    ldr r0, _LIT2
    mov r2, r2, lsr #0x10
    ldr r1, [r0, #0x1c]
    mov r0, r5
    mov r3, r3, lsr #0x10
    bl func_ov002_021d59cc
    b .L_1db4
.L_1d94:
    ldr r0, [r8, #0xc]
    mov r1, r3, lsl #0x10
    mov r2, r0, lsl #0x10
    mov r0, r6
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x4
    bl func_ov002_021e276c
.L_1db4:
    ldr r2, _LIT7
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_1dec
    mov r1, #0x0
    ldr r0, _LIT2
    str r1, [sp]
    ldr r1, [r0, #0x20]
    ldr r2, _LIT7
    mov r0, r6
    mov r3, #0x2
    bl func_ov002_021d59cc
.L_1dec:
    ldr r2, _LIT2
    ldr r0, [r2, #0x8]
    cmp r0, #0x0
    bne .L_1e88
    ldr r1, [r8, #0x10]
    ldr r0, _LIT10
    cmp r1, r0
    bne .L_1e88
    ldr r0, [r8, #0x8]
    cmp r0, #0x0
    bne .L_1e88
    cmp r5, r6
    beq .L_1e88
    ldr r5, _LIT11
    ldr r0, [r2, #0x20]
    mov r3, #0x14
    ldr r2, _LIT4
    and r4, r6, #0x1
    mla r5, r4, r2, r5
    mul r2, r0, r3
    add r3, r5, #0x30
    ldr r3, [r3, r2]
    mov r4, r6, lsl #0x1f
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    and r5, r4, #-2147483648
    mov r4, r0, lsl #0x10
    mov r3, r3, lsl #0x12
    mov r0, r2, lsl #0x1
    add r0, r0, r3, lsr #0x1f
    mov r2, r0, lsl #0x10
    orr r5, r5, #0x200000
    and r3, r4, #0x1f0000
    mov r0, r1, lsl #0x10
    orr r1, r5, r3
    orr r0, r1, r0, lsr #0x10
    mov r1, r2, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
.L_1e88:
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ea4:
    bl func_ov002_0225a874
    cmp r0, #0x0
    beq .L_1ecc
    ldr r1, _LIT0
    mov r0, #0xb
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ecc:
    mov r0, r4
    ldr r0, [r0]
    cmp r0, #0x0
    movne r1, #0x8000
    ldr r0, _LIT2
    moveq r1, #0x0
    orr r3, r1, #0x16
    ldr r1, [r0, #0x3c]
    ldr r2, [r0, #0x74]
    mov r0, r3, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x0
    bl func_ov002_021d479c
    mov r0, #0x2
    bl func_ov002_021ab864
    ldr r0, _LIT2
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    bne .L_2024
    ldr r0, _LIT12
    ldr r2, _LIT13
    ldr r0, [r0, r9]
    ldr r1, [r2, sl]
    cmp r0, #0x0
    ldrne r0, _LIT14
    strh r1, [sp, #0xc]
    ldrne r1, [r0, r9]
    ldr r0, _LIT2
    ldreq r1, [r2, r9]
    ldr r0, [r0, #0x8]
    strh r1, [sp, #0xe]
    cmp r0, #0x0
    bne .L_2018
    ldr r0, [r7, #0x10]
    ldr r1, _LIT15
    cmp r0, r1
    ldrne r1, _LIT16
    cmpne r0, r1
    addne r1, r1, #0x61
    cmpne r0, r1
    bne .L_1fc0
    ldr r1, _LIT2
    mov r2, r5, lsl #0x1f
    ldr r1, [r1, #0x1c]
    and r2, r2, #-2147483648
    orr r3, r2, #0xa200000
    mov r2, r1, lsl #0x10
    ldr r1, [r7, #0xc]
    orr r3, r3, #0x10000000
    and r2, r2, #0x1f0000
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r3, r3, r2
    ldr r2, [sp, #0xc]
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_1fc0:
    ldr r0, [r8, #0x10]
    ldr r1, _LIT15
    cmp r0, r1
    ldrne r1, _LIT16
    cmpne r0, r1
    bne .L_2018
    ldr r1, _LIT2
    mov r2, r6, lsl #0x1f
    ldr r1, [r1, #0x20]
    and r2, r2, #-2147483648
    orr r3, r2, #0xa200000
    mov r2, r1, lsl #0x10
    ldr r1, [r8, #0xc]
    orr r3, r3, #0x10000000
    and r2, r2, #0x1f0000
    mov r1, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    orr r3, r3, r2
    ldr r2, [sp, #0xc]
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_2018:
    ldr r1, [sp, #0xc]
    mov r0, #0xd
    bl func_ov002_02244fe4
.L_2024:
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2040:
    bl func_ov002_0225a874
    cmp r0, #0x0
    beq .L_2068
    ldr r1, _LIT0
    mov r0, #0xb
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2068:
    mov r0, #0x1
    bl func_ov002_021ab864
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_208c:
    mov r0, #0x1
    bl func_ov002_021ae3f0
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_20b0:
    mov r8, #0x0
    ldr r0, _LIT17
    mov r3, r4
    add r5, sp, #0x8
    mov r7, r8
.L_20c4:
    mov r6, r8, lsl #0x1
    ldr fp, [r4, #0x2c]
    ldr r1, [r4, #0x30]
    mov r9, r7
    mov sl, r3
    strh r7, [r5, r6]
.L_20dc:
    ldr r2, [sl, #0xa8]
    cmp r2, fp
    ldreq r2, [sl, #0xac]
    cmpeq r2, r1
    bne .L_2108
    ldr r2, [sl, #0x9c]
    cmp r2, #0x0
    beq .L_2108
    cmp r2, r0
    movhi r2, r0
    strh r2, [r5, r6]
.L_2108:
    add r9, r9, #0x1
    cmp r9, #0x2
    add sl, sl, #0x14
    blt .L_20dc
    add r8, r8, #0x1
    cmp r8, #0x2
    add r4, r4, #0x38
    blt .L_20c4
    ldrh r2, [sp, #0xa]
    ldr r3, _LIT2
    ldrh r1, [sp, #0x8]
    cmp r2, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r1, #0x0
    movne r1, #0x1
    ldr r3, [r3]
    moveq r1, #0x0
    cmp r3, #0x0
    ldr r3, _LIT2
    movne r4, #0x8000
    ldr r7, [r3, #0x34]
    moveq r4, #0x0
    orr r8, r4, #0x17
    ldr r5, [r3, #0x6c]
    ldr r6, [r3, #0x58]
    ldr r4, [r3, #0x90]
    and r7, r7, #0x1
    mov r3, r6, lsl #0x1f
    orr r3, r7, r3, lsr #0x1e
    orr r6, r3, r1, lsl #0x2
    and r5, r5, #0x1
    mov r1, r4, lsl #0x1f
    orr r1, r5, r1, lsr #0x1e
    orr r0, r1, r0, lsl #0x2
    and r1, r6, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    ldrh r1, [sp, #0x8]
    mov r3, r8, lsl #0x10
    mov r4, r0, lsl #0x10
    mov r0, r3, lsr #0x10
    mov r3, r4, lsr #0x10
    bl func_ov002_021d479c
    ldr r1, _LIT0
    add sp, sp, #0x10
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_21d4:
    ldr r2, [r4]
    ldr r0, _LIT18
    mul r1, r2, r1
    ldr r0, [r0, r1]
    cmp r0, #0x0
    beq .L_22e4
    ldr r0, [r7, #0x10]
    ldr r2, _LIT19
    cmp r0, r2
    bgt .L_2228
    bge .L_224c
    sub r1, r2, #0x4
    cmp r0, r1
    bgt .L_22e4
    sub r1, r2, #0x7
    cmp r0, r1
    blt .L_22e4
    subne r1, r2, #0x4
    cmpne r0, r1
    beq .L_224c
    b .L_22e4
.L_2228:
    add r1, r2, #0x6e0
    cmp r0, r1
    bgt .L_223c
    beq .L_224c
    b .L_22e4
.L_223c:
    ldr r1, _LIT20
    cmp r0, r1
    beq .L_2274
    b .L_22e4
.L_224c:
    mov r2, #0x0
    ldr r1, _LIT2
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x20]
    mov r0, r6
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_22e4
.L_2274:
    mov r9, #0x0
    mov r6, #0x4
    mov fp, r9
.L_2280:
    mov sl, fp
.L_2284:
    ldr r2, [r4]
    ldr r3, [r4, #0x1c]
    mov r0, r9
    mov r1, sl
    bl func_ov002_021b34f4
    cmp r0, #0x0
    beq .L_22cc
    ldr r1, [r7, #0xc]
    mov r0, r9
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldr r2, [r7, #0x10]
    mov r1, sl
    mov r2, r2, lsl #0x10
    mov r3, r6
    mov r2, r2, lsr #0x10
    bl func_ov002_021d59cc
.L_22cc:
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_2284
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_2280
.L_22e4:
    ldr r4, _LIT2
    mov r0, #0x38
    ldr r2, [r4]
    ldr r1, _LIT18
    rsb r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    beq .L_2400
    ldr r0, [r8, #0x10]
    ldr r2, _LIT19
    cmp r0, r2
    bgt .L_2344
    bge .L_2368
    sub r1, r2, #0x4
    cmp r0, r1
    bgt .L_2400
    sub r1, r2, #0x7
    cmp r0, r1
    blt .L_2400
    subne r1, r2, #0x4
    cmpne r0, r1
    beq .L_2368
    b .L_2400
.L_2344:
    add r1, r2, #0x6e0
    cmp r0, r1
    bgt .L_2358
    beq .L_2368
    b .L_2400
.L_2358:
    ldr r1, _LIT20
    cmp r0, r1
    beq .L_2390
    b .L_2400
.L_2368:
    mov r2, #0x0
    ldr r1, _LIT2
    str r2, [sp]
    mov r2, r0, lsl #0x10
    ldr r1, [r1, #0x1c]
    mov r0, r5
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d59cc
    b .L_2400
.L_2390:
    mov r7, #0x0
    mov r5, #0x4
    mov r6, r7
.L_239c:
    mov r9, r6
.L_23a0:
    ldr r2, [r4, #0x4]
    ldr r3, [r4, #0x20]
    mov r0, r7
    mov r1, r9
    bl func_ov002_021b34f4
    cmp r0, #0x0
    beq .L_23e8
    ldr r1, [r8, #0xc]
    mov r0, r7
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldr r2, [r8, #0x10]
    mov r1, r9
    mov r2, r2, lsl #0x10
    mov r3, r5
    mov r2, r2, lsr #0x10
    bl func_ov002_021d59cc
.L_23e8:
    add r9, r9, #0x1
    cmp r9, #0xa
    ble .L_23a0
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_239c
.L_2400:
    ldr r1, _LIT2
    mov r0, #0x38
    ldr r2, [r1]
    ldr r1, _LIT18
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    beq .L_2454
    cmp r2, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT2
    orr r2, r1, #0x21
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d479c
.L_2454:
    ldr r1, _LIT2
    mov r0, #0x38
    ldr r3, [r1]
    ldr r2, _LIT18
    rsb r3, r3, #0x1
    mul r0, r3, r0
    ldr r0, [r2, r0]
    cmp r0, #0x0
    beq .L_24b0
    ldr r0, [r1, #0x4]
    mov r3, #0x0
    cmp r0, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT2
    orr r2, r1, #0x21
    ldr r1, [r0, #0x20]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021d479c
.L_24b0:
    add sp, sp, #0x10
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_24bc:
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_2564
    bl func_0202f9e8
    cmp r0, #0x0
    beq .L_2564
    ldr r4, [r8, #0xc]
    mov r7, #0x200
    rsb r7, r7, #0x0
    ldr r5, [sp, #0x4]
    mov r3, r6, lsl #0x1f
    ldr r2, [r8, #0x4]
    ldr r0, _LIT2
    ldr r1, [r8, #0x8]
    ldr r6, [r0, #0x20]
    and r0, r3, #-2147483648
    orr r0, r0, #0xa200000
    mov r9, r6, lsl #0x10
    ldr r8, [r8, #0x10]
    mov r6, r4, lsl #0x10
    and r5, r5, r7
    and r4, r4, r7, lsr #0x17
    orr r4, r5, r4
    bic r4, r4, #0x200
    orr r3, r4, r3, lsr #0x16
    bic r3, r3, #0x3c00
    mov r2, r2, lsl #0x1c
    orr r2, r3, r2, lsr #0x12
    orr r2, r2, #0x8000
    bic r2, r2, #0x4000
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x11
    bic r1, r1, #0x10000
    bic r2, r1, #0x20000
    orr r0, r0, #0x20000000
    and r3, r9, #0x1f0000
    mov r1, r8, lsl #0x10
    orr r0, r0, r3
    orr r0, r0, r1, lsr #0x10
    mov r1, r6, lsr #0x10
    str r2, [sp, #0x4]
    bl func_ov002_021e30b4
.L_2564:
    ldr r1, _LIT0
    mov r0, #0xb
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2580:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd420
_LIT2: .word data_ov002_022cd3f4
_LIT3: .word 0x00001913
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf1ac
_LIT6: .word data_ov002_022cf1a4
_LIT7: .word 0x00001512
_LIT8: .word 0x00001749
_LIT9: .word data_ov002_022cf1a2
_LIT10: .word 0x0000129a
_LIT11: .word data_ov002_022cf16c
_LIT12: .word data_ov002_022cd428
_LIT13: .word data_ov002_022cd43c
_LIT14: .word data_ov002_022cd440
_LIT15: .word 0x000013aa
_LIT16: .word 0x000014cc
_LIT17: .word 0x0000ffff
_LIT18: .word data_ov002_022cd44c
_LIT19: .word 0x000013b4
_LIT20: .word 0x00001a95

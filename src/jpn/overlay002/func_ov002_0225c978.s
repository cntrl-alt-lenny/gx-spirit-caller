; func_ov002_0225c978 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd400
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_ov002_021ab784
        .extern func_ov002_021b3dec
        .extern func_ov002_021b3f74
        .extern func_ov002_021b4040
        .extern func_ov002_021b9dec
        .extern func_ov002_021bac78
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5a90
        .extern func_ov002_021d6344
        .extern func_ov002_021df53c
        .extern func_ov002_021df5e4
        .extern func_ov002_021df618
        .extern func_ov002_021e267c
        .extern func_ov002_021e2be4
        .extern func_ov002_021e2c30
        .extern func_ov002_021e2fc4
        .extern func_ov002_02244efc
        .extern func_ov002_0225a490
        .extern func_ov002_0225a78c
        .extern func_ov002_0225a890
        .global func_ov002_0225c978
        .arm
func_ov002_0225c978:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r3, [r2, #0x20]
    ldmia r2, {r0, r9}
    ldr r1, [r2, #0x1c]
    and r5, r9, #0xff
    and r2, r3, #0xff
    orr r2, r5, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    and r5, r0, #0xff
    and r2, r1, #0xff
    orr r2, r5, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r6, r3, r2, lsr #0x10
    bl func_ov002_021b9dec
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    bl func_ov002_021b9dec
    ldr r1, _LIT1
    mov r8, r0
    ldr r0, [r1, #0xd30]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_13e8
    b .L_90c
    b .L_984
    b .L_e5c
    b .L_f7c
.L_90c:
    mov r0, #0x0
    mov r1, #0x1
    bl func_ov002_021e2be4
    mov r0, r4
    mov r1, #0x13
    mov r2, #0x1
    bl func_ov002_021e2c30
    ldr r0, _LIT0
    mov r3, #0x0
    ldr r0, [r0]
    cmp r0, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT0
    orr r2, r1, #0x1b
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021d46ac
    ldr r2, _LIT0
    mov r0, #0x0
    ldr r1, _LIT1
    str r0, [r2, #0x24]
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_984:
    ldr r0, _LIT2
    bl func_ov002_0225a490
    ldr r2, _LIT3
    mov r0, #0x0
    mov r1, #0xb
    mov r3, #0x1
    bl func_ov002_021b3f74
    cmp r0, #0x0
    bne .L_9c4
    mov r0, #0x1
    ldr r2, _LIT3
    mov r3, r0
    mov r1, #0xb
    bl func_ov002_021b3f74
    cmp r0, #0x0
    beq .L_9d0
.L_9c4:
    ldr r1, _LIT3
    mov r0, r4
    bl func_ov002_021df5e4
.L_9d0:
    ldr r2, _LIT4
    mov r0, r4
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    beq .L_a60
    rsb r5, r4, #0x1
    ldr r2, _LIT4
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b4040
    mvn r1, #0x0
    cmp r0, r1
    bne .L_a34
    ldr r0, _LIT0
    ldr r1, _LIT4
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    mov r2, r0, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r5
    mov r2, #0x1
    bl func_ov002_021e267c
.L_a34:
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_a60
    mov r1, #0x0
    str r1, [sp]
    ldr r1, [r0, #0x20]
    ldr r2, _LIT4
    mov r0, r9
    mov r3, #0x1
    bl func_ov002_021d58dc
.L_a60:
    ldr r1, _LIT0
    ldr r2, _LIT5
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    and r5, r0, #0x1
    mov r3, #0x14
    mul r2, r5, r2
    ldr r5, _LIT6
    ldr fp, _LIT7
    mul sl, r1, r3
    add r3, r5, r2
    ldr r5, [sl, r3]
    add r3, fp, r2
    mov r2, r5, lsr #0x6
    mov fp, r5, lsr #0x2
    and r2, r2, #0x1
    orr r5, fp, r5, lsr #0x1
    and r5, r5, #0x1
    ldrh sl, [sl, r3]
    mvn r3, r2
    mvn r2, r5
    and r3, sl, r3
    tst r3, r2
    beq .L_c60
    ldr r2, _LIT8
    cmp r7, r2
    bgt .L_b28
    bge .L_bd0
    ldr r3, _LIT9
    cmp r7, r3
    bgt .L_b04
    bge .L_bd0
    sub r2, r3, #0xec
    cmp r7, r2
    bgt .L_af4
    beq .L_bb8
    b .L_c60
.L_af4:
    sub r2, r3, #0x2f
    cmp r7, r2
    beq .L_ba0
    b .L_c60
.L_b04:
    add r2, r3, #0x61
    cmp r7, r2
    bgt .L_b18
    beq .L_bb8
    b .L_c60
.L_b18:
    add r2, r3, #0xcd
    cmp r7, r2
    beq .L_bb8
    b .L_c60
.L_b28:
    ldr r3, _LIT10
    cmp r7, r3
    bgt .L_b70
    bge .L_ba0
    sub r2, r3, #0x7e
    cmp r7, r2
    bgt .L_b60
    sub r2, r3, #0x81
    cmp r7, r2
    blt .L_c60
    subne r2, r3, #0x7e
    cmpne r7, r2
    beq .L_bb8
    b .L_c60
.L_b60:
    sub r0, r3, #0x3b
    cmp r7, r0
    beq .L_bd0
    b .L_c60
.L_b70:
    add r2, r3, #0xce
    cmp r7, r2
    bgt .L_b90
    bge .L_bb8
    add r0, r3, #0xbb
    cmp r7, r0
    beq .L_bd0
    b .L_c60
.L_b90:
    add r0, r3, #0xe6
    cmp r7, r0
    beq .L_bd0
    b .L_c60
.L_ba0:
    ldr r2, _LIT11
    mov r4, #0x0
    mov r3, #0x4
    str r4, [sp]
    bl func_ov002_021d58dc
    b .L_c60
.L_bb8:
    ldr r2, _LIT11
    mov r4, #0x0
    mov r3, #0x2
    str r4, [sp]
    bl func_ov002_021d58dc
    b .L_c60
.L_bd0:
    ldr r2, _LIT9
    mov r0, r4
    bl func_ov002_021b4040
    mvn r1, #0x0
    cmp r0, r1
    bne .L_c20
    ldr r0, _LIT0
    ldr r2, _LIT9
    ldr r0, [r0, #0x8]
    mov r3, #0x1
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021d58dc
.L_c20:
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_c60
    mov r1, #0x0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    and r2, r4, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r2, r1, lsl #0x10
    ldr r1, [r0, #0x20]
    mov r0, r9
    mov r2, r2, lsr #0x10
    mov r3, #0x8
    bl func_ov002_021d58dc
.L_c60:
    ldr r1, _LIT0
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    bne .L_d9c
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021bac78
    cmp r0, #0x0
    beq .L_d9c
    ldr r2, _LIT12
    cmp r7, r2
    bgt .L_cdc
    bge .L_d1c
    ldr r1, _LIT13
    cmp r7, r1
    bgt .L_cb4
    bge .L_d1c
    sub r0, r1, #0xbc
    cmp r7, r0
    beq .L_d1c
    b .L_d9c
.L_cb4:
    add r0, r1, #0x1f8
    cmp r7, r0
    bgt .L_d9c
    sub r0, r2, #0x8
    cmp r7, r0
    blt .L_d9c
    addne r0, r1, #0x1f8
    cmpne r7, r0
    beq .L_d1c
    b .L_d9c
.L_cdc:
    add r0, r2, #0x4a
    cmp r7, r0
    bgt .L_cfc
    bge .L_d1c
    add r0, r2, #0x44
    cmp r7, r0
    beq .L_d1c
    b .L_d9c
.L_cfc:
    add r0, r2, #0x184
    cmp r7, r0
    bgt .L_d10
    beq .L_d1c
    b .L_d9c
.L_d10:
    ldr r0, _LIT14
    cmp r7, r0
    bne .L_d9c
.L_d1c:
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_d9c
    ldr r5, [r0]
    ldr r4, _LIT15
    ldr r1, [r0, #0x1c]
    mov r2, #0x14
    ldr r0, _LIT5
    and r3, r5, #0x1
    mla r4, r3, r0, r4
    mov r0, r5, lsl #0x1f
    and r0, r0, #-2147483648
    orr r0, r0, #0x8200000
    mov r3, r1, lsl #0x10
    mul r2, r1, r2
    add r1, r4, #0x30
    ldr r2, [r1, r2]
    orr r0, r0, #0x20000000
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    and r4, r3, #0x1f0000
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r3, r1, lsl #0x10
    mov r1, r7, lsl #0x10
    orr r0, r0, r4
    mov r2, r6
    orr r0, r0, r1, lsr #0x10
    mov r1, r3, lsr #0x10
    bl func_ov002_021e2fc4
.L_d9c:
    ldr r1, _LIT0
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    ldreq r0, [r1, #0x14]
    cmpeq r0, #0x0
    bne .L_e44
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    bl func_ov002_021bac78
    cmp r0, #0x0
    beq .L_e44
    ldr r0, _LIT16
    cmp r8, r0
    bne .L_e44
    ldr r0, _LIT0
    ldr r3, _LIT15
    ldr r4, [r0, #0x4]
    ldr r1, _LIT5
    and r2, r4, #0x1
    ldr r0, [r0, #0x20]
    mla r3, r2, r1, r3
    mov r1, #0x14
    mul r1, r0, r1
    add r2, r3, #0x30
    ldr r2, [r2, r1]
    mov r3, r4, lsl #0x1f
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    and r4, r3, #-2147483648
    mov r3, r0, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r0, r1, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r1, r0, lsl #0x10
    orr r4, r4, #0x200000
    and r2, r3, #0x1f0000
    mov r0, r8, lsl #0x10
    orr r3, r4, r2
    mov r2, r6
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_e44:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e5c:
    bl func_ov002_0225a78c
    cmp r0, #0x0
    beq .L_e80
    ldr r1, _LIT1
    mov r0, #0xb
    str r0, [r1, #0xd2c]
    mov r0, #0x0
    str r0, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e80:
    ldr r1, _LIT0
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_f64
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    mov r3, #0x14
    ldr r2, _LIT5
    ldr r4, _LIT7
    and r5, r0, #0x1
    mul r3, r1, r3
    mla r2, r5, r2, r4
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    bne .L_f34
    mov r2, #0x0
    mov r3, r2
    str r2, [sp]
    bl func_ov002_021d6344
    ldr r2, _LIT0
    ldr r1, _LIT5
    ldr r0, [r2, #0x4]
    ldr r3, _LIT15
    and r4, r0, #0x1
    mla r3, r4, r1, r3
    ldr r2, [r2, #0x20]
    mov r1, #0x14
    mla r1, r2, r1, r3
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    bl func_ov002_021df618
    ldr r1, _LIT0
    ldr r0, _LIT5
    ldr r3, [r1, #0x4]
    ldr r2, _LIT15
    and r4, r3, #0x1
    mla r3, r4, r0, r2
    ldr r2, [r1, #0x20]
    mov r0, #0x14
    mla r0, r2, r0, r3
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    str r0, [r1, #0x24]
.L_f34:
    ldr r0, _LIT17
    cmp r8, r0
    bne .L_f64
    mov r0, #0x0
    ldr r1, _LIT0
    str r0, [sp]
    mov r2, r8, lsl #0x10
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
.L_f64:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f7c:
    mov r0, #0x0
    bl func_ov002_021ab784
    ldr r0, _LIT0
    ldr r2, _LIT5
    and r3, r4, #0x1
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul sl, r3, r2
    ldr r3, _LIT6
    ldr r2, _LIT7
    mul r5, r1, r0
    add r0, r3, sl
    ldr r3, [r5, r0]
    add r2, r2, sl
    mov r0, r3, lsr #0x6
    mov fp, r3, lsr #0x2
    and r0, r0, #0x1
    orr r3, fp, r3, lsr #0x1
    and r3, r3, #0x1
    ldrh r5, [r5, r2]
    mvn r2, r0
    mvn r0, r3
    and r2, r5, r2
    tst r2, r0
    beq .L_1094
    mov r0, r4
    bl func_ov002_021b9dec
    mov r1, #0x1
    mov fp, r0
    bl func_ov002_0225a890
    mov r5, r0
    mvn r0, #0x0
    cmp r5, r0
    beq .L_1094
    cmp r5, #0x0
    beq .L_107c
    ldr r0, _LIT0
    ldr r2, _LIT15
    ldr r1, [r0, #0x1c]
    mov r0, #0x14
    mul r0, r1, r0
    add r2, r2, sl
    add r2, r2, #0x30
    ldr r3, [r2, r0]
    mov r0, r4
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, r5, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, fp, lsl #0x10
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_1094
.L_107c:
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1, #0x1c]
    mov r2, fp
    mov r3, #0x1
    bl func_ov002_021d5a90
.L_1094:
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_1220
    ldr r2, _LIT5
    and r3, r9, #0x1
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul sl, r3, r2
    ldr r3, _LIT6
    ldr r2, _LIT7
    mul r5, r1, r0
    add r0, r3, sl
    ldr r3, [r5, r0]
    add r2, r2, sl
    mov r0, r3, lsr #0x6
    mov fp, r3, lsr #0x2
    and r0, r0, #0x1
    orr r3, fp, r3, lsr #0x1
    and r3, r3, #0x1
    ldrh r5, [r5, r2]
    mvn r2, r0
    mvn r0, r3
    and r2, r5, r2
    tst r2, r0
    beq .L_1220
    mov r0, r9
    bl func_ov002_021b9dec
    mov r1, #0x0
    mov r5, r0
    bl func_ov002_0225a890
    mov fp, r0
    mvn r0, #0x0
    cmp fp, r0
    beq .L_1220
    cmp fp, #0x0
    beq .L_1208
    ldr r0, _LIT18
    cmp r5, r0
    bne .L_1198
    ldr r0, _LIT0
    ldr r2, _LIT15
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul r0, r1, r0
    add r2, r2, sl
    add r2, r2, #0x30
    ldr r3, [r2, r0]
    mov r0, r9
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    mov r1, #0x0
    mov r2, r5, lsl #0x10
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x1c]
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_1220
.L_1198:
    ldr r0, _LIT0
    ldr r2, _LIT15
    ldr r1, [r0, #0x20]
    mov r0, #0x14
    mul r0, r1, r0
    add r2, r2, sl
    add r2, r2, #0x30
    ldr r3, [r2, r0]
    mov r0, r9
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df53c
    mov r0, fp, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r5, lsl #0x10
    ldr r0, _LIT0
    str r1, [sp]
    ldr r1, [r0, #0x20]
    mov r0, r9
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d58dc
    b .L_1220
.L_1208:
    ldr r1, _LIT0
    mov r0, r9
    ldr r1, [r1, #0x20]
    mov r2, r5
    mov r3, #0x1
    bl func_ov002_021d5a90
.L_1220:
    ldr r1, _LIT0
    ldr r3, [r1, #0x14]
    cmp r3, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    bne .L_13c4
    ldmia r1, {r0, r2}
    cmp r2, r0
    beq .L_13c4
    cmp r3, #0x0
    bne .L_12ec
    ldr r1, [r1, #0x1c]
    bl func_ov002_021bac78
    cmp r0, #0x0
    beq .L_12ec
    ldr r0, _LIT19
    cmp r7, r0
    ldrne r0, _LIT20
    cmpne r7, r0
    bne .L_12ec
    ldr r1, _LIT0
    ldr r4, _LIT15
    ldr r0, [r1]
    ldr r2, _LIT5
    and r3, r0, #0x1
    ldr r1, [r1, #0x1c]
    mla r4, r3, r2, r4
    mov r2, #0x14
    mul r2, r1, r2
    add r3, r4, #0x30
    ldr r3, [r3, r2]
    mov r2, r0, lsl #0x1f
    mov r0, r3, lsl #0x2
    and r4, r2, #-2147483648
    mov r2, r0, lsr #0x18
    orr r0, r4, #0x8200000
    mov r4, r1, lsl #0x10
    mov r3, r3, lsl #0x12
    mov r1, r2, lsl #0x1
    add r1, r1, r3, lsr #0x1f
    mov r3, r1, lsl #0x10
    orr r0, r0, #0x20000000
    and r2, r4, #0x1f0000
    mov r1, r7, lsl #0x10
    orr r0, r0, r2
    mov r2, r6
    orr r0, r0, r1, lsr #0x10
    mov r1, r3, lsr #0x10
    bl func_ov002_021e2fc4
.L_12ec:
    ldr r1, _LIT21
    cmp r8, r1
    bgt .L_1320
    bge .L_1340
    sub r0, r1, #0x1f0
    cmp r8, r0
    bgt .L_1310
    beq .L_1340
    b .L_13c4
.L_1310:
    ldr r0, _LIT22
    cmp r8, r0
    beq .L_1340
    b .L_13c4
.L_1320:
    add r0, r1, #0x14
    cmp r8, r0
    bgt .L_1334
    beq .L_1350
    b .L_13c4
.L_1334:
    ldr r0, _LIT23
    cmp r8, r0
    bne .L_13c4
.L_1340:
    ldr r0, _LIT0
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_13c4
.L_1350:
    ldr r0, _LIT0
    ldr r3, _LIT15
    ldr r4, [r0, #0x4]
    ldr r1, _LIT5
    and r2, r4, #0x1
    ldr r0, [r0, #0x20]
    mla r3, r2, r1, r3
    mov r1, #0x14
    mul r1, r0, r1
    add r2, r3, #0x30
    ldr r2, [r2, r1]
    mov r3, r4, lsl #0x1f
    mov r1, r2, lsl #0x2
    and r3, r3, #-2147483648
    mov r1, r1, lsr #0x18
    orr r4, r3, #0x8200000
    mov r3, r0, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r0, r1, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r1, r0, lsl #0x10
    orr r4, r4, #0x20000000
    and r2, r3, #0x1f0000
    mov r0, r8, lsl #0x10
    orr r3, r4, r2
    mov r2, r6
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_13c4:
    mov r1, r6
    mov r0, #0x14
    bl func_ov002_02244efc
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0xd30]
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13e8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd400
_LIT3: .word 0x000019b8
_LIT4: .word 0x000015ff
_LIT5: .word 0x00000868
_LIT6: .word data_ov002_022cf0cc
_LIT7: .word data_ov002_022cf0c4
_LIT8: .word 0x00001644
_LIT9: .word 0x00001505
_LIT10: .word 0x00001993
_LIT11: .word 0x000014d6
_LIT12: .word 0x000017df
_LIT13: .word 0x000015e0
_LIT14: .word 0x000019c2
_LIT15: .word data_ov002_022cf08c
_LIT16: .word 0x00001829
_LIT17: .word 0x0000129c
_LIT18: .word 0x00001621
_LIT19: .word 0x00001752
_LIT20: .word 0x000018f3
_LIT21: .word 0x00001476
_LIT22: .word 0x00001370
_LIT23: .word 0x000019bd

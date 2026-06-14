; func_ov006_021b8544 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_021cb310
        .extern data_ov006_021cb32c
        .extern data_ov006_0224f3e8
        .extern func_0202b100
        .extern func_0202b878
        .extern func_0202b890
        .extern func_0202b8a8
        .extern func_0202b8c0
        .extern func_0202b950
        .extern func_0202b980
        .extern func_0202b9b0
        .extern func_0202bb20
        .extern func_0202bb78
        .extern func_0202de9c
        .extern func_ov006_021b8c50
        .extern func_ov006_021b8cb8
        .extern func_ov006_021b8d08
        .extern func_ov006_021b9c98
        .extern func_ov006_021b9d58
        .global func_ov006_021b8544
        .arm
func_ov006_021b8544:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r4, r1
    mov r5, r0
    cmp r4, #0x4
    addls pc, pc, r4, lsl #0x2
    b .L_8e8
    b .L_878
    b .L_88c
    b .L_8a4
    b .L_8bc
    b .L_8d4
.L_878:
    add r0, r5, #0x198
    add r8, r0, #0x9800
    mov r0, #0x0
    str r0, [sp, #0x4]
    b .L_8e8
.L_88c:
    add r0, r5, #0x158
    add r1, r5, #0x358
    add r0, r0, #0xb400
    str r0, [sp, #0x4]
    add r8, r1, #0xb000
    b .L_8e8
.L_8a4:
    add r0, r5, #0x358
    add r1, r5, #0x158
    add r0, r0, #0xb800
    str r0, [sp, #0x4]
    add r8, r1, #0xb800
    b .L_8e8
.L_8bc:
    add r0, r5, #0x158
    add r1, r5, #0x358
    add r0, r0, #0xc000
    str r0, [sp, #0x4]
    add r8, r1, #0xbc00
    b .L_8e8
.L_8d4:
    add r0, r5, #0x158
    add r1, r5, #0x58
    add r0, r0, #0xc400
    str r0, [sp, #0x4]
    add r8, r1, #0xc400
.L_8e8:
    mov r0, #0x12
    mla r9, r4, r0, r5
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0xc600
    ldrh r0, [r0, #0x62]
    mov r7, #0x0
    mov r2, r7
    str r0, [sp]
    mov r0, r7
.L_90c:
    add r1, r9, r2, lsl #0x1
    add r1, r1, #0x8100
    add r2, r2, #0x1
    strh r0, [r1, #0x7e]
    cmp r2, #0x9
    blt .L_90c
    mov r1, #0x68
    mla fp, r4, r1, r5
    mvn r3, #0x0
.L_930:
    add r2, fp, r0, lsl #0x1
    add r1, r2, #0xc600
    add r0, r0, #0x1
    strh r3, [r1, #0x76]
    add r1, r2, #0xc800
    strh r3, [r1, #0x7e]
    cmp r0, #0x34
    blt .L_930
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1
    ldrsh r0, [r0, r1]
    cmp r0, #0x0
    bne .L_980
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_980
    mov r0, r5
    bl func_ov006_021b8c50
.L_980:
    ldr r0, [sp]
    mov sl, #0x0
    cmp r0, #0x0
    ble .L_d34
.L_990:
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1
    ldrsh r0, [r0, r1]
    mvn r6, #0x0
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_b98
    b .L_9d4
    b .L_a94
    b .L_aa4
    b .L_ad8
    b .L_b1c
    b .L_b2c
    b .L_b0c
    b .L_b3c
    b .L_b74
    b .L_b84
.L_9d4:
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_a78
    ldrh r1, [r8]
    mov r0, r5
    bl func_ov006_021b8d08
    ldrb r1, [r0]
    cmp r1, #0x0
    beq .L_a54
.L_a00:
    ldrb r2, [r0]
    cmp r2, #0x24
    ldreqb r1, [r0, #0x1]
    cmpeq r1, #0x52
    bne .L_a34
    ldrb r1, [r0, #0x2]!
    cmp r1, #0x28
    beq .L_a2c
.L_a20:
    ldrb r1, [r0, #0x2]!
    cmp r1, #0x28
    bne .L_a20
.L_a2c:
    add r0, r0, #0x1
    b .L_a48
.L_a34:
    cmp r2, #0x81
    ldreqb r1, [r0, #0x1]
    cmpeq r1, #0x77
    bne .L_a54
    add r0, r0, #0x2
.L_a48:
    ldrb r1, [r0]
    cmp r1, #0x0
    bne .L_a00
.L_a54:
    ldrb r2, [r0, #0x1]
    ldrb r1, [r0]
    mov r0, r5
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov006_021b9c98
    mov r6, r0
    b .L_b98
.L_a78:
    ldrh r0, [r8]
    bl func_0202b100
    ldrb r1, [r0]
    mov r0, r5
    bl func_ov006_021b9c98
    mov r6, r0
    b .L_b98
.L_a94:
    ldrh r0, [r8]
    bl func_0202de9c
    mov r6, r0
    b .L_b98
.L_aa4:
    ldrh r0, [r8]
    bl func_0202de9c
    sub r0, r0, #0x7
    cmp r0, #0x1
    bls .L_b98
    ldrh r0, [r8]
    bl func_0202b950
    mov r1, r0, lsl #0x10
    mov r0, r5
    mov r1, r1, asr #0x10
    bl func_ov006_021b9d58
    mov r6, r0
    b .L_b98
.L_ad8:
    ldrh r0, [r8]
    bl func_0202de9c
    sub r0, r0, #0x7
    cmp r0, #0x1
    bls .L_b98
    ldrh r0, [r8]
    bl func_0202b980
    mov r1, r0, lsl #0x10
    mov r0, r5
    mov r1, r1, asr #0x10
    bl func_ov006_021b9d58
    mov r6, r0
    b .L_b98
.L_b0c:
    ldrh r0, [r8]
    bl func_0202b8a8
    mov r6, r0
    b .L_b98
.L_b1c:
    ldrh r0, [r8]
    bl func_0202b890
    mov r6, r0
    b .L_b98
.L_b2c:
    ldrh r0, [r8]
    bl func_0202b878
    mov r6, r0
    b .L_b98
.L_b3c:
    ldrh r0, [r8]
    bl func_0202de9c
    mov r6, r0
    ldrh r0, [r8]
    bl func_0202b8c0
    cmp r6, #0x7
    ldreq r1, _LIT2
    ldreq r6, [r1, r0, lsl #0x2]
    beq .L_b98
    cmp r6, #0x8
    ldreq r1, _LIT3
    ldreq r6, [r1, r0, lsl #0x2]
    mvnne r6, #0x0
    b .L_b98
.L_b74:
    ldrh r0, [r8]
    bl func_0202b9b0
    mov r6, r0
    b .L_b98
.L_b84:
    ldrh r0, [r8]
    bl func_0202bb78
    cmp r0, #0x0
    movne r6, #0x1
    moveq r6, #0x0
.L_b98:
    add r0, r5, #0x6000
    ldr r0, [r0, #0x29c]
    cmp r0, #0x0
    beq .L_bd0
    ldrh r0, [r8]
    bl func_0202bb20
    cmp r0, #0x0
    bne .L_bd0
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1
    ldrsh r0, [r0, r1]
    cmp r0, #0x0
    cmpne r0, #0x1
    mvnne r6, #0x0
.L_bd0:
    cmp r6, #0x0
    blt .L_bfc
    add r2, fp, r6, lsl #0x1
    add r0, r2, #0xc600
    ldrsh r1, [r0, #0x76]
    add r0, r2, #0x76
    add r0, r0, #0xc600
    cmp r1, #0x0
    strlth sl, [r0]
    addlt r0, r2, #0xc800
    strlth r7, [r0, #0x7e]
.L_bfc:
    cmp r4, #0x0
    ldreqb r0, [r8, #0x2]
    addeq r7, r7, r0
    beq .L_c4c
    ldrb r1, [r8, #0x2]
    mov r0, #0x0
    cmp r1, #0x0
    ble .L_c4c
    ldr r1, [sp, #0x4]
    mov r2, #0x1
    add r3, r1, r7, lsl #0x2
.L_c28:
    ldrh r1, [r8]
    add r0, r0, #0x1
    add r7, r7, #0x1
    strh r1, [r3]
    strb r2, [r3, #0x2]
    add r3, r3, #0x4
    ldrb r1, [r8, #0x2]
    cmp r0, r1
    blt .L_c28
.L_c4c:
    ldrh r0, [r8]
    bl func_0202de9c
    cmp r0, #0x8
    mvn r1, #0x0
    addls pc, pc, r0, lsl #0x2
    b .L_cb4
    b .L_c88
    b .L_c90
    b .L_c98
    b .L_ca0
    b .L_cb4
    b .L_cb4
    b .L_cb4
    b .L_ca8
    b .L_cb0
.L_c88:
    mov r1, #0x0
    b .L_cb4
.L_c90:
    mov r1, #0x1
    b .L_cb4
.L_c98:
    mov r1, #0x2
    b .L_cb4
.L_ca0:
    mov r1, #0x3
    b .L_cb4
.L_ca8:
    mov r1, #0x4
    b .L_cb4
.L_cb0:
    mov r1, #0x5
.L_cb4:
    cmp r1, #0x0
    blt .L_cd4
    add r0, r9, r1, lsl #0x1
    add r0, r0, #0x8100
    ldrh r2, [r0, #0x7e]
    ldrb r1, [r8, #0x2]
    add r1, r2, r1
    strh r1, [r0, #0x7e]
.L_cd4:
    ldrh r0, [r8]
    bl func_0202b8a8
    mvn r1, #0x0
    cmp r0, #0x7
    movge r1, #0x8
    bge .L_d00
    cmp r0, #0x5
    movge r1, #0x7
    bge .L_d00
    cmp r0, #0x1
    movge r1, #0x6
.L_d00:
    cmp r1, #0x0
    blt .L_d20
    add r0, r9, r1, lsl #0x1
    add r0, r0, #0x8100
    ldrh r2, [r0, #0x7e]
    ldrb r1, [r8, #0x2]
    add r1, r2, r1
    strh r1, [r0, #0x7e]
.L_d20:
    ldr r0, [sp]
    add sl, sl, #0x1
    cmp sl, r0
    add r8, r8, #0x4
    blt .L_990
.L_d34:
    ldr r0, _LIT0
    mov r1, r4, lsl #0x1
    ldrsh r0, [r0, r1]
    cmp r0, #0x0
    bne .L_d64
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_d64
    mov r0, r5
    bl func_ov006_021b8cb8
.L_d64:
    add r0, r5, r4, lsl #0x1
    add r0, r0, #0xc600
    strh r7, [r0, #0x6c]
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f3e8
_LIT1: .word data_02104f4c
_LIT2: .word data_ov006_021cb310
_LIT3: .word data_ov006_021cb32c

; func_ov020_021ac63c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_02104e6c
        .extern data_0210586c
        .extern data_ov020_021adcf0
        .extern data_ov020_021adf80
        .extern data_ov020_021adfc8
        .extern data_ov020_021ae008
        .extern func_02006148
        .extern func_02006160
        .extern func_02006190
        .extern func_02036540
        .extern func_020371b8
        .extern func_0207eb80
        .extern func_0207ecac
        .extern func_0207ef74
        .extern func_0207fc40
        .extern func_020a9828
        .extern func_020b377c
        .extern func_ov020_021aa6cc
        .extern func_ov020_021aa72c
        .extern func_ov020_021aa9a0
        .extern func_ov020_021aab10
        .extern func_ov020_021aab98
        .extern func_ov020_021aac30
        .extern func_ov020_021aad2c
        .extern func_ov020_021aad68
        .extern func_ov020_021aad84
        .extern func_ov020_021aadcc
        .extern func_ov020_021aaf8c
        .extern func_ov020_021aafcc
        .extern func_ov020_021aaff8
        .extern func_ov020_021ab0fc
        .extern func_ov020_021ab284
        .extern func_ov020_021ab2e8
        .extern func_ov020_021ab338
        .extern func_ov020_021ab35c
        .extern func_ov020_021ab3c0
        .extern func_ov020_021ab4e4
        .extern func_ov020_021ab73c
        .extern func_ov020_021ab818
        .extern func_ov020_021ab884
        .extern func_ov020_021ab8f0
        .extern func_ov020_021ab974
        .extern func_ov020_021ab9e0
        .extern func_ov020_021aba4c
        .extern func_ov020_021abab4
        .global func_ov020_021ac63c
        .arm
func_ov020_021ac63c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov r4, #0x0
    add r0, sp, #0x4
    ldr r5, _LIT0
    ldr r7, _LIT1
    str r4, [sp]
    mov r6, r4
    str r4, [r0]
    str r4, [r0, #0x4]
.L_b5c:
    mov r0, r7
    bl func_0207ecac
    mov r0, r7
    bl func_0207eb80
    add r0, r7, #0x1c
    add r6, r6, #0x1
    cmp r6, #0x2
    add r7, r0, #0x400
    blt .L_b5c
    ldr r0, [r5, #0xa50]
    bic r0, r0, #0x10
    str r0, [r5, #0xa50]
    bl func_02006148
    cmp r0, #0x0
    beq .L_bf0
    ldr r0, [r5, #0xa50]
    mov r1, r0, lsl #0x1c
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    bne .L_c74
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1f
    bne .L_c74
    mov r0, #0xd8
    mov r1, #0x0
    mov r2, #0x23
    mov r3, #0x19
    bl func_ov020_021aa6cc
    cmp r0, #0x1
    bne .L_c74
    ldr r0, [r5, #0xa50]
    mov r4, #0x1
    orr r0, r0, #0x40
    bic r0, r0, #0x1
    orr r0, r0, #0x11
    str r0, [r5, #0xa50]
    b .L_c74
.L_bf0:
    bl func_02006190
    cmp r0, #0x0
    beq .L_c48
    ldr r0, [r5, #0xa50]
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_c74
    mov r0, #0xd8
    mov r1, #0x0
    mov r2, #0x23
    mov r3, #0x19
    bl func_ov020_021aa6cc
    cmp r0, #0x1
    moveq r0, #0x1
    ldr r1, [r5, #0xa50]
    movne r0, #0x0
    and r0, r0, #0x1
    bic r1, r1, #0x1
    orr r0, r1, r0
    str r0, [r5, #0xa50]
    b .L_c74
.L_c48:
    bl func_02006160
    cmp r0, #0x0
    beq .L_c74
    ldr r0, [r5, #0xa50]
    mov r4, #0x1
    mov r1, r0, lsl #0x19
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    biceq r0, r0, #0x40
    biceq r0, r0, #0x1
    streq r0, [r5, #0xa50]
.L_c74:
    ldr r0, [r5]
    cmp r0, #0x6
    bne .L_d90
    bl func_02006148
    cmp r0, #0x0
    beq .L_cf4
    ldr r0, [r5, #0xa50]
    mov r1, r0, lsl #0x19
    movs r1, r1, lsr #0x1f
    bne .L_d90
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1f
    bne .L_d90
    bl func_ov020_021aa72c
    mvn r1, #0x0
    cmp r0, r1
    beq .L_d90
    ldr r8, [r5, #0x898]
    ldr r2, [r5, #0xa50]
    mov r7, #0xa000
    mov r4, #0x1
    str r0, [r5, #0x898]
    orr r6, r2, #0x80
    mov r3, r4
    mov r0, #0x38
    mov r2, #0x0
    str r8, [r5, #0x89c]
    str r7, [r5, #0x888]
    str r7, [r5, #0x88c]
    str r6, [r5, #0xa50]
    bl func_020371b8
    b .L_d90
.L_cf4:
    bl func_02006190
    cmp r0, #0x0
    beq .L_d64
    ldr r0, [r5, #0xa50]
    mov r4, #0x1
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_d90
    bl func_ov020_021aa72c
    mvn r1, #0x0
    cmp r0, r1
    ldrne r8, [r5, #0x898]
    cmpne r0, r8
    beq .L_d90
    ldr r2, [r5, #0xa50]
    mov r7, #0xa000
    orr r6, r2, #0x80
    str r0, [r5, #0x898]
    mov r0, #0x38
    mov r2, #0x0
    mov r3, r4
    str r8, [r5, #0x89c]
    str r7, [r5, #0x888]
    str r7, [r5, #0x88c]
    str r6, [r5, #0xa50]
    bl func_020371b8
    b .L_d90
.L_d64:
    bl func_02006160
    cmp r0, #0x0
    beq .L_d90
    ldr r0, [r5, #0xa50]
    mov r4, #0x1
    mov r1, r0, lsl #0x18
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    biceq r0, r0, #0x80
    orreq r0, r0, #0x4
    streq r0, [r5, #0xa50]
.L_d90:
    cmp r4, #0x0
    bne .L_ea4
    ldr r0, [r5]
    cmp r0, #0x6
    bne .L_e74
    ldr r0, _LIT2
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_dc8
    ldr r0, [r5, #0xa50]
    bic r0, r0, #0x80
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_e74
.L_dc8:
    ldr r1, [r5, #0x88c]
    cmp r1, #0x0
    bne .L_e74
    ldr r1, [r5, #0x8c8]
    ldrh r2, [r0, #0x52]
    sub r0, r1, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    tst r2, #0x80
    sub r0, r0, #0x1
    beq .L_e34
    ldr r7, [r5, #0x898]
    cmp r7, r0
    bge .L_e34
    mov r0, #0x38
    mov r4, #0xa000
    add r6, r7, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r7, [r5, #0x89c]
    str r6, [r5, #0x898]
    str r4, [r5, #0x888]
    str r4, [r5, #0x88c]
    bl func_020371b8
    b .L_e74
.L_e34:
    tst r2, #0x40
    beq .L_e74
    ldr r7, [r5, #0x898]
    cmp r7, #0x0
    ble .L_e74
    mov r0, #0x38
    mov r4, #0xa000
    sub r6, r7, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r7, [r5, #0x89c]
    str r6, [r5, #0x898]
    str r4, [r5, #0x888]
    str r4, [r5, #0x88c]
    bl func_020371b8
.L_e74:
    ldr r1, [r5, #0xa50]
    mov r0, r1, lsl #0x19
    movs r0, r0, lsr #0x1f
    moveq r0, r1, lsl #0x1c
    moveq r0, r0, lsr #0x1f
    cmpeq r0, #0x1
    bne .L_ea4
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0x800
    orrne r0, r1, #0x10
    strne r0, [r5, #0xa50]
.L_ea4:
    ldr r0, [r5, #0xa50]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_ee0
    bl func_ov020_021aaf8c
    ldr r0, [r5, #0x894]
    add r0, r0, #0x1
    bl func_ov020_021aaff8
    str r0, [r5, #0x894]
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_ee0:
    add r0, r5, #0x78
    ldr r1, [r5]
    add r2, r5, #0x5c
    add r0, r0, #0x400
    str r2, [sp, #0xc]
    str r0, [sp, #0x10]
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_1740
    b .L_1740
    b .L_f2c
    b .L_fd8
    b .L_1028
    b .L_107c
    b .L_1120
    b .L_11a8
    b .L_1230
    b .L_12d0
    b .L_152c
.L_f2c:
    bl func_ov020_021aad2c
    bl func_ov020_021aad68
    bl func_ov020_021aaf8c
    bl func_ov020_021aafcc
    ldr r1, [r5, #0x8c8]
    mov r4, #0x0
    sub r0, r1, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    cmp r0, #0x0
    ble .L_fa4
.L_f5c:
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    mov r1, r4
    bl func_ov020_021ab2e8
    ldr r0, [r5, #0x8c8]
    mov r1, r4
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    bl func_ov020_021ab338
    ldr r1, [r5, #0x8c8]
    add r4, r4, #0x1
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    cmp r4, r0
    blt .L_f5c
.L_fa4:
    ldr r0, [r5, #0xa50]
    mov r2, #0x0
    bic r0, r0, #0x8
    bic r0, r0, #0x20
    bic r0, r0, #0x100
    orr r0, r0, #0x4
    mov r1, #0x1
    str r2, [r5, #0x894]
    str r2, [r5, #0x898]
    str r2, [r5, #0x88c]
    str r1, [r5, #0x888]
    str r0, [r5, #0xa50]
    b .L_1740
.L_fd8:
    ldr r1, [r5, #0x87c]
    ldr r0, [r5, #0x878]
    cmp r1, r0
    bne .L_ff0
    bl func_ov020_021aac30
    bl func_ov020_021aad84
.L_ff0:
    ldr r0, [r5, #0x87c]
    sub r0, r0, #0x1000
    str r0, [r5, #0x87c]
    cmp r0, #0x0
    bgt .L_1740
    ldr r1, [r5, #0xa50]
    mov r0, #0x94
    orr r4, r1, #0x4
    sub r1, r0, #0x95
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0xa50]
    bl func_020371b8
    b .L_1740
.L_1028:
    ldr r0, [r5, #0x884]
    ldr r1, [r5, #0x880]
    add r0, r0, #0x1000
    str r0, [r5, #0x884]
    cmp r0, r1
    blt .L_1740
    ldr r0, [r5, #0x87c]
    str r1, [r5, #0x884]
    sub r0, r0, #0x1000
    str r0, [r5, #0x87c]
    cmp r0, #0x0
    bgt .L_1740
    mov r0, #0x95
    sub r1, r0, #0x96
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r5, #0xa50]
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_1740
.L_107c:
    ldr r1, [r5, #0x87c]
    ldr r0, [r5, #0x878]
    cmp r1, r0
    bne .L_10d0
    ldr r0, [r5, #0x8c8]
    sub r0, r0, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xd4]
    bl func_ov020_021aadcc
    ldr r0, [r5, #0x894]
    bl func_ov020_021aaff8
    ldr r0, [r5, #0x890]
    ldr r1, [r5, #0xa50]
    cmp r0, #0x12
    movgt r0, #0x1
    movle r0, #0x0
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x8
    orr r0, r1, r0, lsr #0x1c
    str r0, [r5, #0xa50]
.L_10d0:
    ldr r0, [r5, #0x87c]
    sub r0, r0, #0x1000
    str r0, [r5, #0x87c]
    cmp r0, #0x0
    bgt .L_1740
    ldr r0, [r5, #0x8c8]
    ldr r1, [r5, #0xa50]
    sub r0, r0, #0x1
    orr r1, r1, #0x4
    add r0, r5, r0, lsl #0x1
    str r1, [r5, #0xa50]
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    cmp r0, #0x3
    bne .L_1740
    mov r0, #0x3
    bl func_ov020_021aab10
    mov r0, #0x3
    bl func_ov020_021aab98
    b .L_1740
.L_1120:
    ldr r3, [r5, #0x8c8]
    mov r6, #0x0
    sub r0, r3, #0x1
    add r2, r5, r0, lsl #0x1
    add r0, r2, #0x800
    ldrh r1, [r0, #0xcc]
    add r0, r2, #0x900
    ldrh r4, [r0, #0xd4]
    cmp r1, #0x0
    ble .L_1198
.L_1148:
    add r0, r5, r3, lsl #0x3
    add r0, r0, r6, lsl #0x1
    add r0, r0, #0x900
    ldrh r2, [r0, #0xe0]
    mov r0, r6
    mov r1, r4
    bl func_ov020_021ab0fc
    ldr r0, [r5, #0x8c8]
    mov r1, r6
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    bl func_ov020_021ab284
    ldr r3, [r5, #0x8c8]
    add r6, r6, #0x1
    add r0, r5, r3, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    cmp r6, r0
    blt .L_1148
.L_1198:
    ldr r0, [r5, #0xa50]
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_1740
.L_11a8:
    ldr r0, [r5, #0x884]
    ldr r1, [r5, #0x880]
    mov r0, r0, lsl #0x4
    bl func_020b377c
    ldr r2, [r5, #0x884]
    ldr r1, [r5, #0x880]
    sub r2, r2, #0x1000
    mov r4, r0
    mov r0, r2, lsl #0x4
    str r2, [r5, #0x884]
    bl func_020b377c
    cmp r0, #0x5
    ldrlt r1, [r5, #0xa50]
    orrlt r1, r1, #0x100
    strlt r1, [r5, #0xa50]
    cmp r4, r0
    beq .L_1214
    ldr r0, [r5, #0xa50]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_1214
    mov r0, #0x96
    sub r1, r0, #0x97
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_1214:
    ldr r0, [r5, #0x884]
    cmp r0, #0x0
    bge .L_1740
    ldr r0, [r5, #0xa50]
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_1740
.L_1230:
    ldr r0, [r5, #0x88c]
    cmp r0, #0x0
    ble .L_1248
    ldr r0, [r5, #0x898]
    bl func_ov020_021aa9a0
    b .L_1740
.L_1248:
    ldr r0, [r5, #0x8c8]
    ldr r2, [r5, #0xa50]
    sub r0, r0, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x38]
    ldr r1, _LIT3
    bic r2, r2, #0x20
    str r2, [r5, #0xa50]
    cmp r0, r1
    beq .L_12a8
    ldr r2, [r5, #0x87c]
    ldr r1, [r5, #0x878]
    cmp r2, r1, asr #0x1
    blt .L_128c
    tst r2, #0x2000
    bne .L_12b0
.L_128c:
    add r2, sp, #0xc
    add r1, r5, #0x40
    bl func_ov020_021aba4c
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_12b0
.L_12a8:
    mov r0, #0x0
    str r0, [r5, #0x87c]
.L_12b0:
    ldr r0, [r5, #0x87c]
    subs r0, r0, #0x1000
    str r0, [r5, #0x87c]
    bpl .L_1740
    ldr r0, [r5, #0xa50]
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_1740
.L_12d0:
    ldr r1, [r5, #0x87c]
    ldr r0, [r5, #0x878]
    cmp r1, r0
    bne .L_13e4
    ldr r0, [r5, #0x8c8]
    mov r9, #0x0
    sub r1, r0, #0x1
    add r1, r5, r1, lsl #0x1
    add r1, r1, #0x800
    ldrh r1, [r1, #0xcc]
    cmp r1, #0x0
    ble .L_13b4
    mov sl, #0xbd
    mvn r7, #0x0
    mov fp, r9
    mov r8, #0xbe
    mov r6, r9
    mov r4, #0x1
.L_1318:
    add r1, r5, r0, lsl #0x3
    add r1, r1, r9, lsl #0x1
    add r1, r1, #0x900
    ldrh r1, [r1, #0xe0]
    add r0, r5, r0, lsl #0x1
    cmp r1, #0x1
    bls .L_1374
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    mov r1, r9
    bl func_ov020_021ab35c
    ldr r0, [r5, #0x8c8]
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x36]
    cmp r9, r0
    bne .L_1398
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r4
    bl func_020371b8
    b .L_1398
.L_1374:
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x36]
    cmp r9, r0
    bne .L_1398
    mov r0, sl
    mov r1, r7
    mov r2, fp
    mov r3, #0x1
    bl func_020371b8
.L_1398:
    ldr r0, [r5, #0x8c8]
    add r9, r9, #0x1
    add r1, r5, r0, lsl #0x1
    add r1, r1, #0x800
    ldrh r1, [r1, #0xca]
    cmp r9, r1
    blt .L_1318
.L_13b4:
    sub r0, r0, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0xa00
    ldrh r1, [r0, #0x38]
    ldr r0, _LIT3
    cmp r1, r0
    bne .L_13e4
    mov r0, #0xbe
    sub r1, r0, #0xbf
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_13e4:
    ldr r1, [r5, #0x8c8]
    mov r6, #0x0
    sub r0, r1, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    cmp r0, #0x0
    ble .L_14c0
    add r4, sp, #0xc
.L_1408:
    add r0, r5, r1, lsl #0x3
    add r0, r0, r6, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xe0]
    mov r2, r4
    cmp r0, #0x1
    mov r0, r6
    bhi .L_145c
    add r1, r5, #0x40
    bl func_ov020_021ab974
    ldr r1, [sp, #0x4]
    mov r2, r4
    add r1, r1, r0
    str r1, [sp, #0x4]
    mov r0, r6
    add r1, r5, #0x40
    bl func_ov020_021ab818
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_14a4
.L_145c:
    add r1, r5, #0x40
    bl func_ov020_021ab9e0
    ldr r1, [r5, #0x8c8]
    ldr r2, [sp, #0x4]
    add r1, r5, r1, lsl #0x1
    add r1, r1, #0xa00
    ldrh r1, [r1, #0x36]
    add r0, r2, r0
    str r0, [sp, #0x4]
    cmp r6, r1
    bne .L_14a4
    mov r0, r6
    mov r2, r4
    add r1, r5, #0x40
    bl func_ov020_021ab884
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
.L_14a4:
    ldr r1, [r5, #0x8c8]
    add r6, r6, #0x1
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    cmp r6, r0
    blt .L_1408
.L_14c0:
    sub r0, r1, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x38]
    ldr r1, _LIT3
    cmp r0, r1
    beq .L_14f4
    add r2, sp, #0xc
    add r1, r5, #0x40
    bl func_ov020_021aba4c
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
.L_14f4:
    ldr r0, [r5, #0x87c]
    subs r0, r0, #0x1000
    str r0, [r5, #0x87c]
    bpl .L_1740
    mov r1, #0x0
    mov r0, #0x4
    str r1, [r5, #0x884]
    bl func_ov020_021aab10
    mov r0, #0x4
    bl func_ov020_021aab98
    ldr r0, [r5, #0xa50]
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_1740
.L_152c:
    ldr r1, [r5, #0x878]
    ldr r2, [r5, #0x87c]
    cmp r2, r1
    bne .L_1678
    bl func_ov020_021aad2c
    bl func_ov020_021aad68
    bl func_ov020_021aaf8c
    bl func_ov020_021aafcc
    ldr r1, [r5, #0x8c8]
    mov r4, #0x0
    sub r0, r1, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    cmp r0, #0x0
    ble .L_15b4
.L_156c:
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    mov r1, r4
    bl func_ov020_021ab2e8
    ldr r0, [r5, #0x8c8]
    mov r1, r4
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    bl func_ov020_021ab338
    ldr r1, [r5, #0x8c8]
    add r4, r4, #0x1
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    cmp r4, r0
    blt .L_156c
.L_15b4:
    ldr r0, [r5, #0xa50]
    mov r3, #0x0
    mov r1, #0x1
    bic r0, r0, #0x8
    bic r2, r0, #0x20
    sub r0, r1, #0x2
    str r3, [r5, #0x894]
    str r2, [r5, #0xa50]
    str r3, [r5, #0x898]
    str r3, [r5, #0x88c]
    str r1, [r5, #0x888]
    bl func_ov020_021ab3c0
    ldr r2, _LIT4
    mov r3, #0x0
    mov r0, #0x1
.L_15f0:
    add r4, r5, r3, lsl #0x1
    add r1, r4, #0x900
    ldrh r1, [r1, #0xd4]
    add r4, r4, #0xa00
    ldrh r7, [r4, #0x38]
    mov r4, r1, asr #0x5
    add r6, r5, r3, lsl #0x3
    add r4, r2, r4, lsl #0x2
    add r6, r6, r7, lsl #0x1
    add r4, r4, #0x1000
    add r6, r6, #0x900
    ldrh r6, [r6, #0xe8]
    ldr r7, [r4, #0xab8]
    and r8, r1, #0x1f
    orr r1, r7, r0, lsl r8
    str r1, [r4, #0xab8]
    cmp r6, #0x1
    ldrls r1, [r4, #0xae0]
    add r3, r3, #0x1
    orrls r1, r1, r0, lsl r8
    strls r1, [r4, #0xae0]
    cmp r3, #0xa
    blt .L_15f0
    ldr r0, [r5, #0x8c8]
    add r0, r0, #0x1
    str r0, [r5, #0x8c8]
    bl func_ov020_021aac30
    bl func_ov020_021aad84
    mov r0, #0x0
    bl func_ov020_021ab3c0
    ldr r0, [r5, #0x87c]
    sub r0, r0, #0x1000
    str r0, [r5, #0x87c]
    b .L_1740
.L_1678:
    mov r0, #0x14
    mul r0, r2, r0
    bl func_020b377c
    ldr r2, [r5, #0x87c]
    mov r1, #0x14
    sub r4, r2, #0x1000
    sub r6, r0, #0xa
    mul r0, r4, r1
    ldr r1, [r5, #0x878]
    str r4, [r5, #0x87c]
    bl func_020b377c
    cmp r4, #0x0
    sub r0, r0, #0xa
    bge .L_16e0
    add r0, r5, #0x5c
    add r1, r0, #0x400
    add r2, sp, #0x10
    mov r0, #0x9
    bl func_ov020_021ab4e4
    ldr r2, [sp, #0x8]
    ldr r1, [r5, #0xa50]
    add r2, r2, r0
    orr r0, r1, #0x4
    str r2, [sp, #0x8]
    str r0, [r5, #0xa50]
    b .L_1740
.L_16e0:
    rsb r1, r6, #0x9
    cmp r1, #0xa
    rsb r4, r0, #0x9
    movge r1, #0x9
    cmp r4, #0xa
    movge r4, #0x9
    cmp r4, r1
    beq .L_1720
    add r6, r1, #0x1
    cmp r6, r4
    bgt .L_1720
.L_170c:
    mov r0, r6
    bl func_ov020_021ab3c0
    add r6, r6, #0x1
    cmp r6, r4
    ble .L_170c
.L_1720:
    add r1, r5, #0x5c
    add r2, sp, #0x10
    mov r0, r4
    add r1, r1, #0x400
    bl func_ov020_021ab4e4
    ldr r1, [sp, #0x8]
    add r0, r1, r0
    str r0, [sp, #0x8]
.L_1740:
    add r1, sp, #0xc
    add r0, r5, #0x40
    bl func_ov020_021ab73c
    ldr r1, [r5, #0xa50]
    ldr r2, [sp, #0x4]
    mov r1, r1, lsl #0x1a
    add r2, r2, r0
    mov r0, r1, lsr #0x1f
    str r2, [sp, #0x4]
    cmp r0, #0x1
    mov r2, #0x4000000
    bne .L_179c
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldr r0, [r5, #0x898]
    bl func_ov020_021aa9a0
    b .L_17bc
.L_179c:
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_17bc:
    ldr r0, [r5, #0xa50]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_1804
    add r1, sp, #0xc
    add r0, r5, #0x40
    bl func_ov020_021ab8f0
    ldr r1, [sp, #0x4]
    add r2, r5, #0x5c
    add r3, r1, r0
    add r1, sp, #0x10
    add r0, r2, #0x400
    str r3, [sp, #0x4]
    bl func_ov020_021abab4
    ldr r1, [sp, #0x8]
    add r0, r1, r0
    str r0, [sp, #0x8]
.L_1804:
    add r6, r5, #0x5c
    add r7, r5, #0x40
    mov r8, #0x0
    add r4, sp, #0x4
.L_1814:
    ldr r0, [r4, r8, lsl #0x2]
    cmp r0, #0x0
    ble .L_1834
    mov r2, r0, lsl #0x10
    mov r0, r7
    mov r1, r6
    mov r2, r2, lsr #0x10
    bl func_0207ef74
.L_1834:
    add r0, r6, #0x1c
    add r1, r7, #0x1c
    add r8, r8, #0x1
    cmp r8, #0x2
    add r6, r0, #0x400
    add r7, r1, #0x400
    blt .L_1814
    add r0, r5, #0x12c
    ldr fp, _LIT5
    add sl, r0, #0x800
    mov r8, #0x0
    mov r4, #0x1000
.L_1864:
    ldr r7, [fp, r8, lsl #0x2]
    mov r9, #0x0
    cmp r7, #0x0
    ble .L_1894
    mov r6, sl
.L_1878:
    mov r0, r6
    mov r1, r4
    bl func_0207fc40
    add r9, r9, #0x1
    cmp r9, r7
    add r6, r6, #0x54
    blt .L_1878
.L_1894:
    add r8, r8, #0x1
    cmp r8, #0x2
    add sl, sl, #0x54
    blt .L_1864
    ldr r1, [r5, #0xa50]
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_1b88
    ldr r0, [r5]
    bic r1, r1, #0x4
    str r1, [r5, #0xa50]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_1b88
    b .L_1b88
    b .L_18f8
    b .L_1920
    b .L_1948
    b .L_1964
    b .L_19f4
    b .L_1a68
    b .L_1ae4
    b .L_1b20
    b .L_1b50
.L_18f8:
    ldr r1, [r5, #0x8c8]
    ldr r0, _LIT6
    add r1, r1, #0x1
    str r1, [r5, #0x8c8]
    mov r1, #0x28000
    str r1, [r0, #0x8c0]
    str r1, [r0, #0x8c4]
    mov r0, #0x2
    str r0, [r5]
    b .L_1b88
.L_1920:
    mov r2, #0x1e000
    mov r1, #0x0
    ldr r0, _LIT6
    str r2, [r5, #0x880]
    str r1, [r5, #0x884]
    str r2, [r0, #0x8c0]
    str r2, [r0, #0x8c4]
    mov r0, #0x3
    str r0, [r5]
    b .L_1b88
.L_1948:
    ldr r0, _LIT6
    mov r1, #0x3c000
    str r1, [r0, #0x8c0]
    str r1, [r0, #0x8c4]
    mov r0, #0x4
    str r0, [r5]
    b .L_1b88
.L_1964:
    ldr r0, [r5, #0x8c8]
    sub r1, r0, #0x1
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    cmp r0, #0x0
    beq .L_19e8
    mov r6, #0x0
    add r4, r5, r1, lsl #0x3
.L_1988:
    bl func_020a9828
    ldr r1, [r5, #0x8c8]
    add r1, r5, r1, lsl #0x1
    add r1, r1, #0x800
    ldrh r1, [r1, #0xca]
    bl func_020b377c
    mov r7, r1
    bl func_020a9828
    ldr r1, [r5, #0x8c8]
    add r1, r5, r1, lsl #0x1
    add r1, r1, #0x800
    ldrh r1, [r1, #0xca]
    bl func_020b377c
    add r0, r4, r7, lsl #0x1
    add r1, r4, r1, lsl #0x1
    add r0, r0, #0x900
    add r1, r1, #0x900
    add r6, r6, #0x1
    ldrh r3, [r0, #0xe8]
    ldrh r2, [r1, #0xe8]
    cmp r6, #0x64
    strh r2, [r0, #0xe8]
    strh r3, [r1, #0xe8]
    blt .L_1988
.L_19e8:
    mov r0, #0x5
    str r0, [r5]
    b .L_1b88
.L_19f4:
    ldr r0, _LIT4
    orr r1, r1, #0x20
    ldr r0, [r0, #0xa64]
    str r1, [r5, #0xa50]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    cmp r0, #0x2
    movne r0, #0x0
    bne .L_1a3c
    ldr r0, _LIT7
    ldrh r0, [r0, #0x88]
    cmp r0, #0x1
    beq .L_1a38
    cmp r0, #0x2
    movne r0, #0xb4
    moveq r0, #0x2d0
    b .L_1a3c
.L_1a38:
    mov r0, #0x168
.L_1a3c:
    add r1, r0, #0x2d0
    ldr r0, _LIT6
    mov r1, r1, lsl #0xc
    str r1, [r0, #0x8c8]
    str r1, [r0, #0x8cc]
    mov r1, #0x1e000
    mov r0, #0x6
    str r1, [r5, #0x8c4]
    str r1, [r5, #0x8c0]
    str r0, [r5]
    b .L_1b88
.L_1a68:
    ldr r0, [r5, #0x884]
    cmp r0, #0x0
    bge .L_1a9c
    ldr r0, [r5, #0x8c8]
    ldr r1, _LIT3
    sub r0, r0, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0xa00
    strh r1, [r0, #0x38]
    ldr r0, [r5, #0xa50]
    bic r0, r0, #0x20
    str r0, [r5, #0xa50]
    b .L_1ac8
.L_1a9c:
    ldr r1, [r5, #0x8c8]
    mov r0, #0x3a
    sub r1, r1, #0x1
    add r1, r5, r1, lsl #0x1
    ldr r6, [r5, #0x898]
    add r4, r1, #0xa00
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    strh r6, [r4, #0x38]
    bl func_020371b8
.L_1ac8:
    ldr r0, _LIT6
    mov r1, #0x5a000
    str r1, [r0, #0x8c0]
    str r1, [r0, #0x8c4]
    mov r0, #0x7
    str r0, [r5]
    b .L_1b88
.L_1ae4:
    ldr r0, _LIT6
    mov r1, #0xb4000
    str r1, [r0, #0x8c0]
    str r1, [r0, #0x8c4]
    mov r0, #0x8
    str r0, [r5]
    b .L_1b88
_LIT0: .word data_ov020_021adfc8
_LIT1: .word data_ov020_021ae008
_LIT2: .word data_02104acc
_LIT3: .word 0x0000ffff
_LIT4: .word data_02104e6c
_LIT5: .word data_ov020_021adcf0
_LIT6: .word data_ov020_021adf80
_LIT7: .word data_0210586c
.L_1b20:
    ldr r0, [r5, #0x8c8]
    cmp r0, #0xa
    movne r0, #0x1
    strne r0, [r5]
    bne .L_1b88
    ldr r0, _LIT6
    mov r1, #0x258000
    str r1, [r0, #0x8c0]
    str r1, [r0, #0x8c4]
    mov r0, #0x9
    str r0, [r5]
    b .L_1b88
.L_1b50:
    mov r0, #0xa
    str r0, [r5]
    ldr r2, _LIT6
    mov r3, #0x3c000
    str r3, [r2, #0x8c0]
    mov r0, #0x8f00000
    mov r1, #0x3c
    str r3, [r2, #0x8c4]
    bl func_02036540
    ldr r0, _LIT8
    mov r1, #0x3c
    bl func_02036540
    mov r0, #0x1
    str r0, [sp]
.L_1b88:
    ldr r0, [sp]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT8: .word 0x08f00003

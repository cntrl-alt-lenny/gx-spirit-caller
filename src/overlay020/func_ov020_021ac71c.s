; func_ov020_021ac71c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_02104f4c
        .extern data_0210594c
        .extern data_ov020_021addd0
        .extern data_ov020_021ae060
        .extern data_ov020_021ae0a8
        .extern data_ov020_021ae0e8
        .extern func_02006164
        .extern func_0200617c
        .extern func_020061ac
        .extern func_02036590
        .extern func_02037208
        .extern func_0207ec68
        .extern func_0207ed94
        .extern func_0207f05c
        .extern func_0207fd28
        .extern func_020a991c
        .extern func_020b3870
        .extern func_ov020_021aa7ac
        .extern func_ov020_021aa80c
        .extern func_ov020_021aaa80
        .extern func_ov020_021aabf0
        .extern func_ov020_021aac78
        .extern func_ov020_021aad10
        .extern func_ov020_021aae0c
        .extern func_ov020_021aae48
        .extern func_ov020_021aae64
        .extern func_ov020_021aaeac
        .extern func_ov020_021ab06c
        .extern func_ov020_021ab0ac
        .extern func_ov020_021ab0d8
        .extern func_ov020_021ab1dc
        .extern func_ov020_021ab364
        .extern func_ov020_021ab3c8
        .extern func_ov020_021ab418
        .extern func_ov020_021ab43c
        .extern func_ov020_021ab4a0
        .extern func_ov020_021ab5c4
        .extern func_ov020_021ab81c
        .extern func_ov020_021ab8f8
        .extern func_ov020_021ab964
        .extern func_ov020_021ab9d0
        .extern func_ov020_021aba54
        .extern func_ov020_021abac0
        .extern func_ov020_021abb2c
        .extern func_ov020_021abb94
        .global func_ov020_021ac71c
        .arm
func_ov020_021ac71c:
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
.L_3b0:
    mov r0, r7
    bl func_0207ed94
    mov r0, r7
    bl func_0207ec68
    add r0, r7, #0x1c
    add r6, r6, #0x1
    cmp r6, #0x2
    add r7, r0, #0x400
    blt .L_3b0
    ldr r0, [r5, #0xa50]
    bic r0, r0, #0x10
    str r0, [r5, #0xa50]
    bl func_02006164
    cmp r0, #0x0
    beq .L_444
    ldr r0, [r5, #0xa50]
    mov r1, r0, lsl #0x1c
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    bne .L_4c8
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1f
    bne .L_4c8
    mov r0, #0xd8
    mov r1, #0x0
    mov r2, #0x23
    mov r3, #0x19
    bl func_ov020_021aa7ac
    cmp r0, #0x1
    bne .L_4c8
    ldr r0, [r5, #0xa50]
    mov r4, #0x1
    orr r0, r0, #0x40
    bic r0, r0, #0x1
    orr r0, r0, #0x11
    str r0, [r5, #0xa50]
    b .L_4c8
.L_444:
    bl func_020061ac
    cmp r0, #0x0
    beq .L_49c
    ldr r0, [r5, #0xa50]
    mov r0, r0, lsl #0x19
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_4c8
    mov r0, #0xd8
    mov r1, #0x0
    mov r2, #0x23
    mov r3, #0x19
    bl func_ov020_021aa7ac
    cmp r0, #0x1
    moveq r0, #0x1
    ldr r1, [r5, #0xa50]
    movne r0, #0x0
    and r0, r0, #0x1
    bic r1, r1, #0x1
    orr r0, r1, r0
    str r0, [r5, #0xa50]
    b .L_4c8
.L_49c:
    bl func_0200617c
    cmp r0, #0x0
    beq .L_4c8
    ldr r0, [r5, #0xa50]
    mov r4, #0x1
    mov r1, r0, lsl #0x19
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    biceq r0, r0, #0x40
    biceq r0, r0, #0x1
    streq r0, [r5, #0xa50]
.L_4c8:
    ldr r0, [r5]
    cmp r0, #0x6
    bne .L_5e4
    bl func_02006164
    cmp r0, #0x0
    beq .L_548
    ldr r0, [r5, #0xa50]
    mov r1, r0, lsl #0x19
    movs r1, r1, lsr #0x1f
    bne .L_5e4
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1f
    bne .L_5e4
    bl func_ov020_021aa80c
    mvn r1, #0x0
    cmp r0, r1
    beq .L_5e4
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
    bl func_02037208
    b .L_5e4
.L_548:
    bl func_020061ac
    cmp r0, #0x0
    beq .L_5b8
    ldr r0, [r5, #0xa50]
    mov r4, #0x1
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_5e4
    bl func_ov020_021aa80c
    mvn r1, #0x0
    cmp r0, r1
    ldrne r8, [r5, #0x898]
    cmpne r0, r8
    beq .L_5e4
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
    bl func_02037208
    b .L_5e4
.L_5b8:
    bl func_0200617c
    cmp r0, #0x0
    beq .L_5e4
    ldr r0, [r5, #0xa50]
    mov r4, #0x1
    mov r1, r0, lsl #0x18
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    biceq r0, r0, #0x80
    orreq r0, r0, #0x4
    streq r0, [r5, #0xa50]
.L_5e4:
    cmp r4, #0x0
    bne .L_6f8
    ldr r0, [r5]
    cmp r0, #0x6
    bne .L_6c8
    ldr r0, _LIT2
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_61c
    ldr r0, [r5, #0xa50]
    bic r0, r0, #0x80
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_6c8
.L_61c:
    ldr r1, [r5, #0x88c]
    cmp r1, #0x0
    bne .L_6c8
    ldr r1, [r5, #0x8c8]
    ldrh r2, [r0, #0x52]
    sub r0, r1, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    tst r2, #0x80
    sub r0, r0, #0x1
    beq .L_688
    ldr r7, [r5, #0x898]
    cmp r7, r0
    bge .L_688
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
    bl func_02037208
    b .L_6c8
.L_688:
    tst r2, #0x40
    beq .L_6c8
    ldr r7, [r5, #0x898]
    cmp r7, #0x0
    ble .L_6c8
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
    bl func_02037208
.L_6c8:
    ldr r1, [r5, #0xa50]
    mov r0, r1, lsl #0x19
    movs r0, r0, lsr #0x1f
    moveq r0, r1, lsl #0x1c
    moveq r0, r0, lsr #0x1f
    cmpeq r0, #0x1
    bne .L_6f8
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0x800
    orrne r0, r1, #0x10
    strne r0, [r5, #0xa50]
.L_6f8:
    ldr r0, [r5, #0xa50]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_734
    bl func_ov020_021ab06c
    ldr r0, [r5, #0x894]
    add r0, r0, #0x1
    bl func_ov020_021ab0d8
    str r0, [r5, #0x894]
    mov r0, #0x35
    sub r1, r0, #0x36
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_734:
    add r0, r5, #0x78
    ldr r1, [r5]
    add r2, r5, #0x5c
    add r0, r0, #0x400
    str r2, [sp, #0xc]
    str r0, [sp, #0x10]
    cmp r1, #0x9
    addls pc, pc, r1, lsl #0x2
    b .L_f94
    b .L_f94
    b .L_780
    b .L_82c
    b .L_87c
    b .L_8d0
    b .L_974
    b .L_9fc
    b .L_a84
    b .L_b24
    b .L_d80
.L_780:
    bl func_ov020_021aae0c
    bl func_ov020_021aae48
    bl func_ov020_021ab06c
    bl func_ov020_021ab0ac
    ldr r1, [r5, #0x8c8]
    mov r4, #0x0
    sub r0, r1, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    cmp r0, #0x0
    ble .L_7f8
.L_7b0:
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    mov r1, r4
    bl func_ov020_021ab3c8
    ldr r0, [r5, #0x8c8]
    mov r1, r4
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    bl func_ov020_021ab418
    ldr r1, [r5, #0x8c8]
    add r4, r4, #0x1
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    cmp r4, r0
    blt .L_7b0
.L_7f8:
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
    b .L_f94
.L_82c:
    ldr r1, [r5, #0x87c]
    ldr r0, [r5, #0x878]
    cmp r1, r0
    bne .L_844
    bl func_ov020_021aad10
    bl func_ov020_021aae64
.L_844:
    ldr r0, [r5, #0x87c]
    sub r0, r0, #0x1000
    str r0, [r5, #0x87c]
    cmp r0, #0x0
    bgt .L_f94
    ldr r1, [r5, #0xa50]
    mov r0, #0x94
    orr r4, r1, #0x4
    sub r1, r0, #0x95
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r5, #0xa50]
    bl func_02037208
    b .L_f94
.L_87c:
    ldr r0, [r5, #0x884]
    ldr r1, [r5, #0x880]
    add r0, r0, #0x1000
    str r0, [r5, #0x884]
    cmp r0, r1
    blt .L_f94
    ldr r0, [r5, #0x87c]
    str r1, [r5, #0x884]
    sub r0, r0, #0x1000
    str r0, [r5, #0x87c]
    cmp r0, #0x0
    bgt .L_f94
    mov r0, #0x95
    sub r1, r0, #0x96
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r5, #0xa50]
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_f94
.L_8d0:
    ldr r1, [r5, #0x87c]
    ldr r0, [r5, #0x878]
    cmp r1, r0
    bne .L_924
    ldr r0, [r5, #0x8c8]
    sub r0, r0, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xd4]
    bl func_ov020_021aaeac
    ldr r0, [r5, #0x894]
    bl func_ov020_021ab0d8
    ldr r0, [r5, #0x890]
    ldr r1, [r5, #0xa50]
    cmp r0, #0x12
    movgt r0, #0x1
    movle r0, #0x0
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x8
    orr r0, r1, r0, lsr #0x1c
    str r0, [r5, #0xa50]
.L_924:
    ldr r0, [r5, #0x87c]
    sub r0, r0, #0x1000
    str r0, [r5, #0x87c]
    cmp r0, #0x0
    bgt .L_f94
    ldr r0, [r5, #0x8c8]
    ldr r1, [r5, #0xa50]
    sub r0, r0, #0x1
    orr r1, r1, #0x4
    add r0, r5, r0, lsl #0x1
    str r1, [r5, #0xa50]
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    cmp r0, #0x3
    bne .L_f94
    mov r0, #0x3
    bl func_ov020_021aabf0
    mov r0, #0x3
    bl func_ov020_021aac78
    b .L_f94
.L_974:
    ldr r3, [r5, #0x8c8]
    mov r6, #0x0
    sub r0, r3, #0x1
    add r2, r5, r0, lsl #0x1
    add r0, r2, #0x800
    ldrh r1, [r0, #0xcc]
    add r0, r2, #0x900
    ldrh r4, [r0, #0xd4]
    cmp r1, #0x0
    ble .L_9ec
.L_99c:
    add r0, r5, r3, lsl #0x3
    add r0, r0, r6, lsl #0x1
    add r0, r0, #0x900
    ldrh r2, [r0, #0xe0]
    mov r0, r6
    mov r1, r4
    bl func_ov020_021ab1dc
    ldr r0, [r5, #0x8c8]
    mov r1, r6
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    bl func_ov020_021ab364
    ldr r3, [r5, #0x8c8]
    add r6, r6, #0x1
    add r0, r5, r3, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    cmp r6, r0
    blt .L_99c
.L_9ec:
    ldr r0, [r5, #0xa50]
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_f94
.L_9fc:
    ldr r0, [r5, #0x884]
    ldr r1, [r5, #0x880]
    mov r0, r0, lsl #0x4
    bl func_020b3870
    ldr r2, [r5, #0x884]
    ldr r1, [r5, #0x880]
    sub r2, r2, #0x1000
    mov r4, r0
    mov r0, r2, lsl #0x4
    str r2, [r5, #0x884]
    bl func_020b3870
    cmp r0, #0x5
    ldrlt r1, [r5, #0xa50]
    orrlt r1, r1, #0x100
    strlt r1, [r5, #0xa50]
    cmp r4, r0
    beq .L_a68
    ldr r0, [r5, #0xa50]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_a68
    mov r0, #0x96
    sub r1, r0, #0x97
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_a68:
    ldr r0, [r5, #0x884]
    cmp r0, #0x0
    bge .L_f94
    ldr r0, [r5, #0xa50]
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_f94
.L_a84:
    ldr r0, [r5, #0x88c]
    cmp r0, #0x0
    ble .L_a9c
    ldr r0, [r5, #0x898]
    bl func_ov020_021aaa80
    b .L_f94
.L_a9c:
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
    beq .L_afc
    ldr r2, [r5, #0x87c]
    ldr r1, [r5, #0x878]
    cmp r2, r1, asr #0x1
    blt .L_ae0
    tst r2, #0x2000
    bne .L_b04
.L_ae0:
    add r2, sp, #0xc
    add r1, r5, #0x40
    bl func_ov020_021abb2c
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_b04
.L_afc:
    mov r0, #0x0
    str r0, [r5, #0x87c]
.L_b04:
    ldr r0, [r5, #0x87c]
    subs r0, r0, #0x1000
    str r0, [r5, #0x87c]
    bpl .L_f94
    ldr r0, [r5, #0xa50]
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_f94
.L_b24:
    ldr r1, [r5, #0x87c]
    ldr r0, [r5, #0x878]
    cmp r1, r0
    bne .L_c38
    ldr r0, [r5, #0x8c8]
    mov r9, #0x0
    sub r1, r0, #0x1
    add r1, r5, r1, lsl #0x1
    add r1, r1, #0x800
    ldrh r1, [r1, #0xcc]
    cmp r1, #0x0
    ble .L_c08
    mov sl, #0xbd
    mvn r7, #0x0
    mov fp, r9
    mov r8, #0xbe
    mov r6, r9
    mov r4, #0x1
.L_b6c:
    add r1, r5, r0, lsl #0x3
    add r1, r1, r9, lsl #0x1
    add r1, r1, #0x900
    ldrh r1, [r1, #0xe0]
    add r0, r5, r0, lsl #0x1
    cmp r1, #0x1
    bls .L_bc8
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    mov r1, r9
    bl func_ov020_021ab43c
    ldr r0, [r5, #0x8c8]
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x36]
    cmp r9, r0
    bne .L_bec
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r4
    bl func_02037208
    b .L_bec
.L_bc8:
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x36]
    cmp r9, r0
    bne .L_bec
    mov r0, sl
    mov r1, r7
    mov r2, fp
    mov r3, #0x1
    bl func_02037208
.L_bec:
    ldr r0, [r5, #0x8c8]
    add r9, r9, #0x1
    add r1, r5, r0, lsl #0x1
    add r1, r1, #0x800
    ldrh r1, [r1, #0xca]
    cmp r9, r1
    blt .L_b6c
.L_c08:
    sub r0, r0, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0xa00
    ldrh r1, [r0, #0x38]
    ldr r0, _LIT3
    cmp r1, r0
    bne .L_c38
    mov r0, #0xbe
    sub r1, r0, #0xbf
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_c38:
    ldr r1, [r5, #0x8c8]
    mov r6, #0x0
    sub r0, r1, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    cmp r0, #0x0
    ble .L_d14
    add r4, sp, #0xc
.L_c5c:
    add r0, r5, r1, lsl #0x3
    add r0, r0, r6, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xe0]
    mov r2, r4
    cmp r0, #0x1
    mov r0, r6
    bhi .L_cb0
    add r1, r5, #0x40
    bl func_ov020_021aba54
    ldr r1, [sp, #0x4]
    mov r2, r4
    add r1, r1, r0
    str r1, [sp, #0x4]
    mov r0, r6
    add r1, r5, #0x40
    bl func_ov020_021ab8f8
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    b .L_cf8
.L_cb0:
    add r1, r5, #0x40
    bl func_ov020_021abac0
    ldr r1, [r5, #0x8c8]
    ldr r2, [sp, #0x4]
    add r1, r5, r1, lsl #0x1
    add r1, r1, #0xa00
    ldrh r1, [r1, #0x36]
    add r0, r2, r0
    str r0, [sp, #0x4]
    cmp r6, r1
    bne .L_cf8
    mov r0, r6
    mov r2, r4
    add r1, r5, #0x40
    bl func_ov020_021ab964
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
.L_cf8:
    ldr r1, [r5, #0x8c8]
    add r6, r6, #0x1
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    cmp r6, r0
    blt .L_c5c
.L_d14:
    sub r0, r1, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x38]
    ldr r1, _LIT3
    cmp r0, r1
    beq .L_d48
    add r2, sp, #0xc
    add r1, r5, #0x40
    bl func_ov020_021abb2c
    ldr r1, [sp, #0x4]
    add r0, r1, r0
    str r0, [sp, #0x4]
.L_d48:
    ldr r0, [r5, #0x87c]
    subs r0, r0, #0x1000
    str r0, [r5, #0x87c]
    bpl .L_f94
    mov r1, #0x0
    mov r0, #0x4
    str r1, [r5, #0x884]
    bl func_ov020_021aabf0
    mov r0, #0x4
    bl func_ov020_021aac78
    ldr r0, [r5, #0xa50]
    orr r0, r0, #0x4
    str r0, [r5, #0xa50]
    b .L_f94
.L_d80:
    ldr r1, [r5, #0x878]
    ldr r2, [r5, #0x87c]
    cmp r2, r1
    bne .L_ecc
    bl func_ov020_021aae0c
    bl func_ov020_021aae48
    bl func_ov020_021ab06c
    bl func_ov020_021ab0ac
    ldr r1, [r5, #0x8c8]
    mov r4, #0x0
    sub r0, r1, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    cmp r0, #0x0
    ble .L_e08
.L_dc0:
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    mov r1, r4
    bl func_ov020_021ab3c8
    ldr r0, [r5, #0x8c8]
    mov r1, r4
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    bl func_ov020_021ab418
    ldr r1, [r5, #0x8c8]
    add r4, r4, #0x1
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xca]
    cmp r4, r0
    blt .L_dc0
.L_e08:
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
    bl func_ov020_021ab4a0
    ldr r2, _LIT4
    mov r3, #0x0
    mov r0, #0x1
.L_e44:
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
    blt .L_e44
    ldr r0, [r5, #0x8c8]
    add r0, r0, #0x1
    str r0, [r5, #0x8c8]
    bl func_ov020_021aad10
    bl func_ov020_021aae64
    mov r0, #0x0
    bl func_ov020_021ab4a0
    ldr r0, [r5, #0x87c]
    sub r0, r0, #0x1000
    str r0, [r5, #0x87c]
    b .L_f94
.L_ecc:
    mov r0, #0x14
    mul r0, r2, r0
    bl func_020b3870
    ldr r2, [r5, #0x87c]
    mov r1, #0x14
    sub r4, r2, #0x1000
    sub r6, r0, #0xa
    mul r0, r4, r1
    ldr r1, [r5, #0x878]
    str r4, [r5, #0x87c]
    bl func_020b3870
    cmp r4, #0x0
    sub r0, r0, #0xa
    bge .L_f34
    add r0, r5, #0x5c
    add r1, r0, #0x400
    add r2, sp, #0x10
    mov r0, #0x9
    bl func_ov020_021ab5c4
    ldr r2, [sp, #0x8]
    ldr r1, [r5, #0xa50]
    add r2, r2, r0
    orr r0, r1, #0x4
    str r2, [sp, #0x8]
    str r0, [r5, #0xa50]
    b .L_f94
.L_f34:
    rsb r1, r6, #0x9
    cmp r1, #0xa
    rsb r4, r0, #0x9
    movge r1, #0x9
    cmp r4, #0xa
    movge r4, #0x9
    cmp r4, r1
    beq .L_f74
    add r6, r1, #0x1
    cmp r6, r4
    bgt .L_f74
.L_f60:
    mov r0, r6
    bl func_ov020_021ab4a0
    add r6, r6, #0x1
    cmp r6, r4
    ble .L_f60
.L_f74:
    add r1, r5, #0x5c
    add r2, sp, #0x10
    mov r0, r4
    add r1, r1, #0x400
    bl func_ov020_021ab5c4
    ldr r1, [sp, #0x8]
    add r0, r1, r0
    str r0, [sp, #0x8]
.L_f94:
    add r1, sp, #0xc
    add r0, r5, #0x40
    bl func_ov020_021ab81c
    ldr r1, [r5, #0xa50]
    ldr r2, [sp, #0x4]
    mov r1, r1, lsl #0x1a
    add r2, r2, r0
    mov r0, r1, lsr #0x1f
    str r2, [sp, #0x4]
    cmp r0, #0x1
    mov r2, #0x4000000
    bne .L_ff0
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldr r0, [r5, #0x898]
    bl func_ov020_021aaa80
    b .L_1010
.L_ff0:
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_1010:
    ldr r0, [r5, #0xa50]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_1058
    add r1, sp, #0xc
    add r0, r5, #0x40
    bl func_ov020_021ab9d0
    ldr r1, [sp, #0x4]
    add r2, r5, #0x5c
    add r3, r1, r0
    add r1, sp, #0x10
    add r0, r2, #0x400
    str r3, [sp, #0x4]
    bl func_ov020_021abb94
    ldr r1, [sp, #0x8]
    add r0, r1, r0
    str r0, [sp, #0x8]
.L_1058:
    add r6, r5, #0x5c
    add r7, r5, #0x40
    mov r8, #0x0
    add r4, sp, #0x4
.L_1068:
    ldr r0, [r4, r8, lsl #0x2]
    cmp r0, #0x0
    ble .L_1088
    mov r2, r0, lsl #0x10
    mov r0, r7
    mov r1, r6
    mov r2, r2, lsr #0x10
    bl func_0207f05c
.L_1088:
    add r0, r6, #0x1c
    add r1, r7, #0x1c
    add r8, r8, #0x1
    cmp r8, #0x2
    add r6, r0, #0x400
    add r7, r1, #0x400
    blt .L_1068
    add r0, r5, #0x12c
    ldr fp, _LIT5
    add sl, r0, #0x800
    mov r8, #0x0
    mov r4, #0x1000
.L_10b8:
    ldr r7, [fp, r8, lsl #0x2]
    mov r9, #0x0
    cmp r7, #0x0
    ble .L_10e8
    mov r6, sl
.L_10cc:
    mov r0, r6
    mov r1, r4
    bl func_0207fd28
    add r9, r9, #0x1
    cmp r9, r7
    add r6, r6, #0x54
    blt .L_10cc
.L_10e8:
    add r8, r8, #0x1
    cmp r8, #0x2
    add sl, sl, #0x54
    blt .L_10b8
    ldr r1, [r5, #0xa50]
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_13dc
    ldr r0, [r5]
    bic r1, r1, #0x4
    str r1, [r5, #0xa50]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_13dc
    b .L_13dc
    b .L_114c
    b .L_1174
    b .L_119c
    b .L_11b8
    b .L_1248
    b .L_12bc
    b .L_1338
    b .L_1374
    b .L_13a4
.L_114c:
    ldr r1, [r5, #0x8c8]
    ldr r0, _LIT6
    add r1, r1, #0x1
    str r1, [r5, #0x8c8]
    mov r1, #0x28000
    str r1, [r0, #0x8c0]
    str r1, [r0, #0x8c4]
    mov r0, #0x2
    str r0, [r5]
    b .L_13dc
.L_1174:
    mov r2, #0x1e000
    mov r1, #0x0
    ldr r0, _LIT6
    str r2, [r5, #0x880]
    str r1, [r5, #0x884]
    str r2, [r0, #0x8c0]
    str r2, [r0, #0x8c4]
    mov r0, #0x3
    str r0, [r5]
    b .L_13dc
.L_119c:
    ldr r0, _LIT6
    mov r1, #0x3c000
    str r1, [r0, #0x8c0]
    str r1, [r0, #0x8c4]
    mov r0, #0x4
    str r0, [r5]
    b .L_13dc
.L_11b8:
    ldr r0, [r5, #0x8c8]
    sub r1, r0, #0x1
    add r0, r5, r1, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0, #0xcc]
    cmp r0, #0x0
    beq .L_123c
    mov r6, #0x0
    add r4, r5, r1, lsl #0x3
.L_11dc:
    bl func_020a991c
    ldr r1, [r5, #0x8c8]
    add r1, r5, r1, lsl #0x1
    add r1, r1, #0x800
    ldrh r1, [r1, #0xca]
    bl func_020b3870
    mov r7, r1
    bl func_020a991c
    ldr r1, [r5, #0x8c8]
    add r1, r5, r1, lsl #0x1
    add r1, r1, #0x800
    ldrh r1, [r1, #0xca]
    bl func_020b3870
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
    blt .L_11dc
.L_123c:
    mov r0, #0x5
    str r0, [r5]
    b .L_13dc
.L_1248:
    ldr r0, _LIT4
    orr r1, r1, #0x20
    ldr r0, [r0, #0xa64]
    str r1, [r5, #0xa50]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    cmp r0, #0x2
    movne r0, #0x0
    bne .L_1290
    ldr r0, _LIT7
    ldrh r0, [r0, #0x88]
    cmp r0, #0x1
    beq .L_128c
    cmp r0, #0x2
    movne r0, #0xb4
    moveq r0, #0x2d0
    b .L_1290
.L_128c:
    mov r0, #0x168
.L_1290:
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
    b .L_13dc
.L_12bc:
    ldr r0, [r5, #0x884]
    cmp r0, #0x0
    bge .L_12f0
    ldr r0, [r5, #0x8c8]
    ldr r1, _LIT3
    sub r0, r0, #0x1
    add r0, r5, r0, lsl #0x1
    add r0, r0, #0xa00
    strh r1, [r0, #0x38]
    ldr r0, [r5, #0xa50]
    bic r0, r0, #0x20
    str r0, [r5, #0xa50]
    b .L_131c
.L_12f0:
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
    bl func_02037208
.L_131c:
    ldr r0, _LIT6
    mov r1, #0x5a000
    str r1, [r0, #0x8c0]
    str r1, [r0, #0x8c4]
    mov r0, #0x7
    str r0, [r5]
    b .L_13dc
.L_1338:
    ldr r0, _LIT6
    mov r1, #0xb4000
    str r1, [r0, #0x8c0]
    str r1, [r0, #0x8c4]
    mov r0, #0x8
    str r0, [r5]
    b .L_13dc
_LIT0: .word data_ov020_021ae0a8
_LIT1: .word data_ov020_021ae0e8
_LIT2: .word data_02104bac
_LIT3: .word 0x0000ffff
_LIT4: .word data_02104f4c
_LIT5: .word data_ov020_021addd0
_LIT6: .word data_ov020_021ae060
_LIT7: .word data_0210594c
.L_1374:
    ldr r0, [r5, #0x8c8]
    cmp r0, #0xa
    movne r0, #0x1
    strne r0, [r5]
    bne .L_13dc
    ldr r0, _LIT6
    mov r1, #0x258000
    str r1, [r0, #0x8c0]
    str r1, [r0, #0x8c4]
    mov r0, #0x9
    str r0, [r5]
    b .L_13dc
.L_13a4:
    mov r0, #0xa
    str r0, [r5]
    ldr r2, _LIT6
    mov r3, #0x3c000
    str r3, [r2, #0x8c0]
    mov r0, #0x8f00000
    mov r1, #0x3c
    str r3, [r2, #0x8c4]
    bl func_02036590
    ldr r0, _LIT8
    mov r1, #0x3c
    bl func_02036590
    mov r0, #0x1
    str r0, [sp]
.L_13dc:
    ldr r0, [sp]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT8: .word 0x08f00003

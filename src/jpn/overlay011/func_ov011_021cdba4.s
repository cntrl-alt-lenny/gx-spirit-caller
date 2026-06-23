; func_ov011_021cdba4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_ov011_021d325a
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_02018b8c
        .extern func_0201912c
        .extern func_0201abdc
        .extern func_0201ac20
        .extern func_0201af40
        .extern func_0201b590
        .extern func_0201b608
        .extern func_0201b694
        .extern func_0201b730
        .extern func_0208be54
        .extern func_ov011_021ca320
        .extern func_ov011_021cdae8
        .extern func_ov011_021cdb14
        .extern func_ov011_021d0e0c
        .extern func_ov011_021d0e74
        .extern func_ov011_021d0eec
        .extern func_ov011_021d0f10
        .extern func_ov011_021d0f94
        .extern func_ov011_021d0fbc
        .extern func_ov011_021d10dc
        .extern func_ov011_021d116c
        .extern func_ov011_021d2cf4
        .global func_ov011_021cdba4
        .arm
func_ov011_021cdba4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    ldr r0, _LIT0
    ldr r0, [r0, #0x2a0]
    cmp r0, #0x0
    beq .L_4fc
    cmp r0, #0x1
    addne sp, sp, #0x2c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    ldr r0, [r0, #0x268]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1c
    str r0, [sp, #0x4]
    bl func_0201912c
    ldr r0, _LIT1
    ldr r0, [r0, #0x284]
    mov r0, r0, lsl #0x4
    movs r0, r0, lsr #0x18
    bne .L_58
    bl func_0201b608
    bl func_0201b590
.L_58:
    mov r9, #0x1
    mov r0, r9
    str r9, [sp]
    str r0, [sp, #0x18]
.L_68:
    ldr r0, [sp, #0x18]
    bl func_02018b8c
    ldr r1, [r0, #0x8]
    ldr r0, [sp, #0x4]
    mov r2, r1, lsl #0x18
    cmp r0, r2, lsr #0x18
    ldreq r0, [sp, #0x18]
    moveq r1, r1, lsl #0xf
    cmpeq r0, r1, lsr #0x18
    bne .L_32c
    bl func_0201af40
    mov r1, #0x0
    str r1, [sp, #0x14]
    mov r1, #0x40
    cmp r0, #0x0
    str r1, [sp, #0x10]
    beq .L_bc
    ldr r0, [r0]
    mov r0, r0, lsl #0x8
    mov r0, r0, lsr #0x1c
    str r0, [sp, #0x14]
.L_bc:
    ldr r0, _LIT1
    ldr r0, [r0, #0x264]
    cmp r0, #0x1
    bne .L_100
    ldr r0, _LIT1
    ldr r0, [r0, #0x268]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1c
    cmp r0, #0x5
    bne .L_100
    bl GetSystemWork
    ldr r0, [r0, #0x8f8]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x1f
    ldreq r0, [sp, #0x10]
    addeq r0, r0, #0xe8
    streq r0, [sp, #0x10]
.L_100:
    mov r4, #0x0
    mov fp, #0x800
    mov r6, r4
    mov r5, fp
.L_110:
    add r0, sp, #0x28
    add r1, sp, #0x24
    bl func_ov011_021d2cf4
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x24]
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x4
    add r0, r0, #0x8
    add r1, r1, #0x8
    bl func_ov011_021ca320
    and r0, r0, #0xf
    str r0, [sp, #0xc]
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x24]
    mov r0, r0, lsl #0x4
    mov r1, r1, lsl #0x4
    add r0, r0, #0x18
    add r1, r1, #0x8
    bl func_ov011_021ca320
    and r0, r0, #0xf
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x24]
    mov r0, r0, lsl #0x4
    add r2, r0, #0x8
    ldr r0, [sp, #0x10]
    cmp r2, r0
    blt .L_110
    ldr r0, _LIT1
    ldr r1, [r0, #0x220]
    ldr r0, [sp, #0x28]
    rsb r1, r1, r2, lsl #0xc
    mov r0, r0, lsl #0x4
    smull r3, r2, r1, r1
    add r1, r0, #0x8
    ldr r0, _LIT1
    ldr r0, [r0, #0x21c]
    rsb r0, r0, r1, lsl #0xc
    smull r7, r1, r0, r0
    mov r0, #0x800
    adds r7, r7, r0
    mov r0, #0x0
    adc r1, r1, r0
    mov r0, r7, lsr #0xc
    adds r3, r3, #0x800
    orr r0, r0, r1, lsl #0x14
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_0208be54
    cmp r0, #0x80000
    blt .L_110
    cmp r9, #0x0
    ldr r0, [sp, #0x24]
    ldr r1, [sp, #0x28]
    mov sl, #0x0
    ble .L_26c
    mov r0, r0, lsl #0x4
    add r8, r0, #0x8
    mov r0, r1, lsl #0x4
    add r7, r0, #0x8
.L_204:
    mov r0, sl
    add r1, sp, #0x1c
    add r2, sp, #0x20
    bl func_ov011_021d0fbc
    ldr r1, [sp, #0x20]
    ldr r0, [sp, #0x1c]
    rsb r3, r1, r8, lsl #0xc
    rsb ip, r0, r7, lsl #0xc
    smull r2, r1, r3, r3
    smull r3, r0, ip, ip
    adds ip, r3, fp
    adc r3, r0, r4
    adds r2, r2, r5
    mov r0, ip, lsr #0xc
    adc r1, r1, r6
    mov r2, r2, lsr #0xc
    orr r0, r0, r3, lsl #0x14
    orr r2, r2, r1, lsl #0x14
    add r0, r0, r2
    bl func_0208be54
    cmp r0, #0x1e000
    movlt r0, #0x1
    blt .L_270
    add sl, sl, #0x1
    cmp sl, r9
    blt .L_204
.L_26c:
    mov r0, #0x0
.L_270:
    cmp r0, #0x0
    bne .L_110
    ldr r0, [sp, #0xc]
    tst r0, #0xf0
    moveq r1, r0
    ldreq r0, [sp, #0x8]
    cmpeq r1, r0
    bne .L_110
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    beq .L_2b8
    mov r0, r1
    and r1, r0, #0xf
    ldr r0, [sp, #0x14]
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    b .L_2bc
.L_2b8:
    mov r0, #0x0
.L_2bc:
    cmp r0, #0x0
    bne .L_110
    ldr r1, [sp, #0x28]
    ldr r0, [sp, #0x24]
    mov r1, r1, lsl #0x4
    mov r0, r0, lsl #0x4
    add r2, r0, #0x8
    add r1, r1, #0x8
    mov r0, r9
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    bl func_ov011_021d0eec
    mov r0, r9
    mov r1, #0x1
    bl func_ov011_021d10dc
    ldr r1, [sp, #0x18]
    mov r0, r9
    bl func_ov011_021d0e0c
    mov r0, r9
    mov r1, #0x0
    bl func_ov011_021d0f10
    mov r0, r9
    mov r1, #0x0
    bl func_ov011_021d116c
    ldr r0, [sp]
    add r9, r9, #0x1
    add r0, r0, #0x1
    str r0, [sp]
.L_32c:
    ldr r0, [sp, #0x18]
    add r0, r0, #0x1
    str r0, [sp, #0x18]
    cmp r0, #0x60
    blt .L_68
    ldr r0, [sp, #0x4]
    mov r8, #0x0
    sub r1, r0, #0x1
    mov r0, #0x72
    mul r2, r1, r0
    ldr r1, _LIT2
    ldrb r0, [r1, r2]
    cmp r0, #0x0
    ble .L_420
    cmp r0, #0x0
    add sl, r1, r2
    ble .L_420
    mov r6, #0x1
    mov r5, #0x3
    mov r4, r6
.L_37c:
    add r0, sl, r8
    ldrb r9, [r0, #0x1]
    bl func_0201b730
    mov r7, r0
    mov r0, r9
    bl func_0201b694
    tst r7, r0
    beq .L_410
    mov r0, r9
    bl func_ov011_021cdb14
    movs r7, r0
    beq .L_410
    add r0, sl, r8, lsl #0x2
    ldrh r1, [r0, #0xa]
    ldrh r2, [r0, #0xc]
    ldr r0, [sp]
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    bl func_ov011_021d0eec
    ldr r0, [sp]
    mov r1, r6
    bl func_ov011_021d10dc
    ldr r0, [sp]
    mov r1, r7
    bl func_ov011_021d0e0c
    ldr r0, [sp]
    mov r1, r9
    bl func_ov011_021d0f94
    ldr r0, [sp]
    mov r1, r5
    bl func_ov011_021d0f10
    ldr r0, [sp]
    mov r1, r4
    bl func_ov011_021d116c
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
.L_410:
    ldrb r0, [sl]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_37c
.L_420:
    mov r0, #0x1
    bl func_0201abdc
    movs r8, r0
    beq .L_4c8
    mov r7, #0x1
    mov r6, #0x65
    mov r5, #0x2
    mov r4, r7
.L_440:
    mov r0, r8
    bl func_0201ac20
    ldrb r2, [r0]
    ldr r1, [sp, #0x4]
    cmp r2, r1
    bne .L_4b8
    ldrsh r1, [r0, #0x2]
    ldrsh r2, [r0, #0x4]
    ldr r0, [sp]
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    bl func_ov011_021d0eec
    ldr r0, [sp]
    mov r1, r7
    bl func_ov011_021d10dc
    ldr r0, [sp]
    mov r1, r6
    bl func_ov011_021d0e0c
    ldr r0, [sp]
    mov r1, r8
    bl func_ov011_021d0e74
    ldr r0, [sp]
    mov r1, r5
    bl func_ov011_021d0f10
    ldr r0, [sp]
    mov r1, r4
    bl func_ov011_021d116c
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
.L_4b8:
    add r0, r8, #0x1
    bl func_0201abdc
    movs r8, r0
    bne .L_440
.L_4c8:
    ldr r0, [sp]
    cmp r0, #0xa
    addge sp, sp, #0x2c
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4d8:
    ldr r0, [sp]
    bl func_ov011_021cdae8
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0xa
    blt .L_4d8
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4fc:
    mov r4, #0x1
.L_500:
    mov r0, r4
    bl func_ov011_021cdae8
    add r4, r4, #0x1
    cmp r4, #0xa
    blt .L_500
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word data_ov011_021d325a

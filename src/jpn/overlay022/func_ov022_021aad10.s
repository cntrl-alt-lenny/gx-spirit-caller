; func_ov022_021aad10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_02104acc
        .extern data_02104e6c
        .extern data_ov022_021ab7c8
        .extern data_ov022_021ab804
        .extern data_ov022_021ab9c0
        .extern data_ov022_021aba08
        .extern func_02036540
        .extern func_0207eea8
        .extern func_0207ef74
        .extern func_020b377c
        .extern func_ov022_021aa5a0
        .extern func_ov022_021aa600
        .extern func_ov022_021ab680
        .extern func_ov022_021ab724
        .global func_ov022_021aad10
        .arm
func_ov022_021aad10:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x50
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x54]
    add r3, sp, #0x10
    add r2, r2, #0x1000
    str r0, [sp, #0xc]
    str r0, [r3]
    str r0, [r3, #0x4]
    str r2, [r1, #0x54]
    cmp r2, #0x3c000
    ble .L_7dc
    ldr r0, _LIT1
    ldr r0, [r0, #0xc]
    cmp r0, #0x78000
    bgt .L_7dc
    sub r1, r0, #0x3c000
    mov r0, #0xe0
    mul r3, r1, r0
    ldr r2, _LIT2
    mov r0, r3, lsr #0x1f
    smull r1, r4, r2, r3
    add r4, r3, r4
    add r4, r0, r4, asr #0x11
    rsb r0, r4, #0x100
    bl func_ov022_021aa5a0
.L_7dc:
    ldr r1, _LIT3
    ldr r0, _LIT1
    ldr r1, [r1, #0x4]
    add r0, r0, #0x1000
    mov r1, r1, lsl #0x1d
    mov r2, r1, lsr #0x1d
    mov r1, #0x1c
    mul r4, r2, r1
    ldr r1, _LIT4
    ldr r3, _LIT5
    ldrsh r4, [r1, r4]
    ldr r1, _LIT1
    ldr r0, [r0, #0x140]
    add r2, r1, #0x48
    add r5, r1, #0x2c
    mov r1, r4, lsl #0x1
    add r2, r2, #0x400
    str r5, [sp, #0x18]
    ldrh r1, [r3, r1]
    rsb r0, r0, #0x100
    str r2, [sp, #0x1c]
    add r0, r0, r1
    mov fp, r0, lsl #0xb
    mov r5, #0x0
.L_83c:
    ldr r0, _LIT3
    mov r3, #0x1c
    ldr r1, [r0, #0x4]
    ldr r0, _LIT1
    add r2, r0, r5, lsl #0x2
    mov r0, r1, lsl #0x1d
    ldr r1, _LIT4
    mov r0, r0, lsr #0x1d
    mla r1, r0, r3, r1
    add r2, r2, #0x1000
    mov r0, r5, lsl #0x1
    ldr r4, [r2, #0xec]
    ldr r2, _LIT1
    ldrsh r0, [r1, r0]
    ldr r2, [r2, #0xc]
    sub r3, r3, #0x1d
    cmp r0, r3
    sub r7, r4, r2
    moveq r2, #0x4000
    streq r2, [sp, #0x8]
    beq .L_8a4
    ldr r2, _LIT5
    mov r3, r0, lsl #0x1
    ldrh r2, [r2, r3]
    mov r2, r2, lsl #0xb
    str r2, [sp, #0x8]
.L_8a4:
    cmp r5, #0xc
    bge .L_8e0
    add r1, r1, r5, lsl #0x1
    ldrsh r2, [r1, #0x2]
    mvn r1, #0x0
    cmp r2, r1
    moveq r2, #0x4000
    beq .L_8d4
    ldr r1, _LIT5
    mov r2, r2, lsl #0x1
    ldrh r1, [r1, r2]
    mov r2, r1, lsl #0xb
.L_8d4:
    ldr r1, [sp, #0x8]
    add r1, r1, r2
    str r1, [sp, #0x8]
.L_8e0:
    ldr r1, _LIT1
    add r3, r1, r5, lsl #0x2
    add r1, r3, #0x1000
    ldr r2, [r1, #0xb8]
    add r1, r3, #0xb8
    cmp r2, #0x0
    ldreq r0, [sp, #0x8]
    add r6, r1, #0x1000
    addeq fp, fp, r0
    beq .L_b00
    cmp r7, #0x1e000
    ldrge r0, [sp, #0x8]
    addge fp, fp, r0
    bge .L_b00
    mvn r1, #0x0
    cmp r0, r1
    beq .L_af8
    cmp r7, #0x0
    ldr r4, [sp, #0x18]
    bge .L_94c
    mov r1, #0x1000
    mov r0, #0x0
    str r1, [sp, #0x40]
    str r0, [sp, #0x44]
    str r0, [sp, #0x48]
    str r1, [sp, #0x4c]
    b .L_9a4
.L_94c:
    rsb r1, r7, #0x1e000
    mov r0, #0x1e000000
    bl func_020b377c
    mov r2, #0x0
    str r0, [sp, #0x40]
    ldr r1, [r6]
    mov r0, r7, lsl #0xb
    str r2, [sp, #0x44]
    str r2, [sp, #0x48]
    bl func_020b377c
    mov r1, #0x80000
    rsb r0, r0, #0x1000
    str r0, [sp, #0x4c]
    ldr r2, [sp, #0x40]
    rsb r1, r1, #0x0
    cmp r2, r1
    movlt r2, r1
    ldr r0, _LIT6
    str r2, [sp, #0x40]
    cmp r2, r0
    movge r2, r0
    str r2, [sp, #0x40]
.L_9a4:
    ldr r0, _LIT1
    add r1, sp, #0x40
    add r0, r0, #0x10
    bl func_0207eea8
    mov r6, r0
    ldr r0, _LIT1
    mov r1, #0x60
    add r0, r0, r5, lsl #0x2
    stmia sp, {r1, r6}
    add r0, r0, #0x1000
    ldr r2, [r0, #0x84]
    ldr r0, _LIT1
    add r1, sp, #0x18
    add r0, r0, #0x10
    mov r3, fp, asr #0xc
    bl func_ov022_021aa600
    ldr r1, [sp, #0x10]
    cmp r0, #0x0
    add r1, r1, r0
    str r1, [sp, #0x10]
    mov r3, #0x0
    ble .L_a20
    ldr r1, _LIT7
.L_a00:
    ldr r2, [r4, r3, lsl #0x3]
    and r2, r2, r1
    orr r2, r2, #0x300
    orr r2, r2, r6, lsl #0x19
    str r2, [r4, r3, lsl #0x3]
    add r3, r3, #0x1
    cmp r3, r0
    blt .L_a00
.L_a20:
    cmp r7, #0x0
    blt .L_af8
    add r1, r5, #0x1
    mov r2, r1, lsl #0x5
    ldr r1, _LIT1
    add r3, r2, #0x200
    add r1, r1, #0x120
    ldr r8, _LIT2
    add r2, r1, #0x1000
    add r3, r3, #0x5000000
    rsb ip, r7, #0x1e000
    mov lr, #0x0
.L_a50:
    ldrh r6, [r2], #0x2
    add lr, lr, #0x1
    cmp lr, #0x10
    and r1, r6, #0x1f
    mov r7, r6, asr #0xa
    and r9, r7, #0x1f
    mul r7, r9, ip
    mov r6, r6, asr #0x5
    and r6, r6, #0x1f
    mul r9, r6, ip
    smull r6, sl, r8, r7
    add sl, r7, sl
    mov r6, r7, lsr #0x1f
    add sl, r6, sl, asr #0x10
    mov r6, sl, lsl #0x1b
    mov r6, r6, lsr #0x11
    mov r6, r6, lsl #0x10
    smull r7, sl, r8, r9
    add sl, r9, sl
    mov r7, r9, lsr #0x1f
    add sl, r7, sl, asr #0x10
    mov r7, sl, lsl #0x1b
    mov r7, r7, lsr #0x16
    orr r6, r7, r6, lsr #0x10
    orr r1, r1, r6
    strh r1, [r3], #0x2
    blt .L_a50
    cmp r0, #0x0
    mov r6, #0x0
    ble .L_af8
    add r3, r5, #0x1
.L_acc:
    ldr r1, [r4, r6, lsl #0x3]
    add r2, r4, r6, lsl #0x3
    bic r1, r1, #0xc00
    str r1, [r4, r6, lsl #0x3]
    ldrh r1, [r2, #0x4]
    add r6, r6, #0x1
    cmp r6, r0
    bic r1, r1, #0xf000
    orr r1, r1, r3, lsl #0xc
    strh r1, [r2, #0x4]
    blt .L_acc
.L_af8:
    ldr r0, [sp, #0x8]
    add fp, fp, r0
.L_b00:
    add r5, r5, #0x1
    cmp r5, #0xd
    blt .L_83c
    ldr r0, _LIT1
    ldr r0, [r0, #0xc]
    cmp r0, #0xb4000
    blt .L_bc0
    cmp r0, #0xc8000
    bge .L_ba8
    rsb r0, r0, #0xc8000
    cmp r0, #0xa000
    blt .L_b48
    rsb r0, r0, #0x14000
    rsb r1, r0, r0, lsl #0x8
    ldr r2, _LIT8
    mov r0, r1, lsr #0x1f
    smull r1, r4, r2, r1
    b .L_b58
.L_b48:
    ldr r1, _LIT8
    rsb r2, r0, r0, lsl #0x8
    smull r0, r4, r1, r2
    mov r0, r2, lsr #0x1f
.L_b58:
    add r4, r0, r4, asr #0xe
    rsb r0, r4, #0x100
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, _LIT1
    mov r2, r1, lsl #0x10
    add r0, r0, #0x120
    add r1, sp, #0x20
    add r0, r0, #0x1000
    orr r2, r2, #0x10
    bl func_ov022_021ab680
    add r0, r4, #0x100
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, lsl #0x10
    ldr r1, _LIT9
    add r0, sp, #0x20
    orr r2, r2, #0x10
    bl func_ov022_021ab724
    b .L_bc0
.L_ba8:
    ldr r0, _LIT1
    ldr r1, _LIT9
    add r0, r0, #0x120
    add r0, r0, #0x1000
    mov r2, #0x20
    bl Copy32
.L_bc0:
    ldr r0, _LIT1
    mov r4, #0x0
    add r6, r0, #0x2c
    add r7, r0, #0x10
    add r5, sp, #0x10
.L_bd4:
    ldr r0, [r5, r4, lsl #0x2]
    cmp r0, #0x0
    ble .L_bf4
    mov r2, r0, lsl #0x10
    mov r0, r7
    mov r1, r6
    mov r2, r2, lsr #0x10
    bl func_0207ef74
.L_bf4:
    add r0, r6, #0x1c
    add r1, r7, #0x1c
    add r4, r4, #0x1
    cmp r4, #0x2
    add r6, r0, #0x400
    add r7, r1, #0x400
    blt .L_bd4
    ldr r0, _LIT1
    ldr r1, [r0, #0xc]
    cmp r1, #0x17c000
    blt .L_c34
    ldr r0, _LIT10
    ldrh r0, [r0, #0x54]
    tst r0, #0x2
    movne r0, #0x1
    strne r0, [sp, #0xc]
.L_c34:
    cmp r1, #0x384000
    movge r0, #0x1
    strge r0, [sp, #0xc]
    ldr r0, [sp, #0xc]
    cmp r0, #0x1
    bne .L_c74
    mov r0, #0x8f00000
    mov r1, #0x14
    bl func_02036540
    ldr r0, _LIT11
    mov r1, #0x14
    bl func_02036540
    ldr r0, _LIT0
    mov r1, #0x14000
    str r1, [r0, #0x50]
    str r1, [r0, #0x54]
.L_c74:
    ldr r0, [sp, #0xc]
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov022_021ab9c0
_LIT1: .word data_ov022_021aba08
_LIT2: .word 0x88888889
_LIT3: .word data_02104e6c
_LIT4: .word data_ov022_021ab804
_LIT5: .word data_ov022_021ab7c8
_LIT6: .word 0x0007ffff
_LIT7: .word 0xc1fffcff
_LIT8: .word 0x66666667
_LIT9: .word 0x05000200
_LIT10: .word data_02104acc
_LIT11: .word 0x08f00003

; func_ov002_022a96a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_ov002_022d0f98
        .extern func_0207ef90
        .extern func_0207f05c
        .extern func_0208b0fc
        .extern func_0208b108
        .extern func_0208e318
        .extern func_ov002_021afb90
        .extern func_ov002_021b947c
        .extern func_ov002_0229d9f8
        .extern func_ov002_0229da1c
        .extern func_ov002_022a6e04
        .global func_ov002_022a96a8
        .arm
func_ov002_022a96a8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x60
    mov sl, r0
    ldr r0, [sl, #0x5b4]
    cmp r0, #0x0
    ldreq r0, [sl, #0x5c0]
    cmpeq r0, #0x0
    addeq sp, sp, #0x60
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r1, [sp, #0x28]
    strh r0, [sp, #0x2c]
    ldr r0, [sl, #0x5c0]
    cmp r0, #0x0
    beq .L_7d4
    ldr r5, [sl, #0x5bc]
    cmp r5, #0x0
    blt .L_5e4
    sub r0, r5, #0x1
    bl func_ov002_021afb90
    mov r4, r0
    sub r0, r5, #0x1
    bl func_ov002_021afb90
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    b .L_5f4
.L_5e4:
    ldr r0, [sl, #0x5b4]
    add r0, sl, r0, lsl #0x1
    add r0, r0, #0x500
    ldrh r0, [r0, #0xa0]
.L_5f4:
    bl func_ov002_021b947c
    ldrh r3, [sp, #0x6]
    and r2, r0, #0xff
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    bic r3, r3, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0x6]
    ldrh r2, [sp, #0x6]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x6]
    ldrh r1, [sp, #0x6]
    mov r0, r0, lsl #0x18
    bic r1, r1, #0x3fc0
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x6]
    ldrh r3, [sp, #0x6]
    mov r0, r3, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    bne .L_688
    mov r0, r3, lsl #0x1f
    add r2, sl, #0x3e0
    mov r1, r0, lsr #0x1f
    mov r0, #0xcc
    mla r0, r1, r0, r2
    mov r1, r3, lsl #0x12
    mov r1, r1, lsr #0x18
    bl func_ov002_0229da1c
.L_688:
    ldrh r3, [sp, #0x6]
    add r0, sp, #0x10
    mov r1, sl
    mov r2, r3, lsl #0x12
    mov r4, r2, lsr #0x18
    mov r2, r3, lsl #0x1f
    mov r3, r3, lsl #0x1a
    str r4, [sp]
    mov r2, r2, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6e04
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x14]
    ldr r2, [sl, #0x5c0]
    str r1, [sp, #0x20]
    str r0, [sp, #0x24]
    cmp r2, #0x10
    movlt r4, r2
    rsb r0, r2, #0x20
    ldr r1, [sl, #0x580]
    ldr r2, _LIT2
    add r0, r1, r0
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r2, [r2, r0]
    add r0, sp, #0x50
    movge r4, #0x10
    bl func_0208b0fc
    ldr r1, [sl, #0x5c0]
    add r0, sp, #0x50
    mov r2, r1, lsl #0xa
    mov r1, r2, asr #0x4
    add r1, r2, r1, lsr #0x1b
    mov r3, r1, asr #0x5
    add r2, r3, #0xc00
    add r1, sp, #0x40
    add r3, r3, #0xc00
    bl func_0208b108
    ldr r0, [sp, #0x24]
    ldr r2, [sp, #0x20]
    sub r1, r0, #0x20
    sub r2, r2, #0x20
    mov r5, r2, lsl #0x17
    and r2, r1, #0xff
    ldrh r0, [sp, #0x2c]
    ldr r3, [sp, #0x28]
    ldr r1, _LIT3
    bic r0, r0, #0xf000
    and r1, r3, r1
    orr r1, r1, r2
    orr r1, r1, r5, lsr #0x7
    orr r0, r0, #0x1000
    bic r1, r1, #0xc00
    orr r2, r1, #0x400
    strh r0, [sp, #0x2c]
    ldr r0, _LIT4
    add r1, sp, #0x40
    str r2, [sp, #0x28]
    bl func_0207ef90
    ldr r3, [sp, #0x28]
    ldr r1, _LIT5
    rsb r2, r4, #0x10
    and r1, r3, r1
    orr r1, r1, #0x300
    orr r0, r1, r0, lsl #0x19
    str r0, [sp, #0x28]
    str r2, [sp]
    ldr r0, _LIT6
    mov r3, r4
    mov r1, #0x0
    mov r2, #0x3f
    bl func_0208e318
    ldr r0, _LIT4
    add r1, sp, #0x28
    mov r2, #0x1
    bl func_0207f05c
.L_7d4:
    ldr r0, [sl, #0x580]
    ldr r2, _LIT2
    rsb r0, r0, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r2, [r2, r0]
    add r0, sp, #0x30
    bl func_0208b0fc
    ldr r0, _LIT4
    add r1, sp, #0x30
    bl func_0207ef90
    ldrh r2, [sp, #0x2c]
    mov r8, #0x0
    ldr r3, [sp, #0x28]
    ldr r1, _LIT5
    bic r2, r2, #0xf000
    and r1, r3, r1
    orr r1, r1, #0x100
    orr r0, r1, r0, lsl #0x19
    bic r1, r0, #0xc00
    orr r0, r2, #0x1000
    str r1, [sp, #0x28]
    strh r0, [sp, #0x2c]
    ldr r0, [sl, #0x5b8]
    mov r9, r8
    cmp r0, #0x0
    addle sp, sp, #0x60
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, _LIT3
    add r6, sl, #0x3e0
    mov fp, #0x1
    mov r5, #0xcc
.L_86c:
    ldr r0, [sl, #0x5bc]
    cmp r0, #0x0
    blt .L_8c4
    mov r0, r9
    bl func_ov002_021afb90
    ldr r0, [r0]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    bne .L_9f4
    mov r0, r9
    bl func_ov002_021afb90
    mov r7, r0
    mov r0, r9
    bl func_ov002_021afb90
    ldr r1, [r7]
    ldr r0, [r0]
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    b .L_8d0
.L_8c4:
    add r0, sl, r9, lsl #0x1
    add r0, r0, #0x500
    ldrh r0, [r0, #0xa0]
.L_8d0:
    bl func_ov002_021b947c
    ldrh r2, [sp, #0x4]
    and r1, r0, #0xff
    and r1, r1, #0x1
    bic r2, r2, #0x1
    orr r1, r2, r1
    strh r1, [sp, #0x4]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    ldrh r2, [sp, #0x4]
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    bic r2, r2, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x4]
    mov r0, r0, lsr #0x10
    ldrh r1, [sp, #0x4]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3fc0
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x12
    strh r0, [sp, #0x4]
    ldrh r0, [sp, #0x4]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xe
    bne .L_950
    cmp r8, #0x0
    bne .L_9f4
    mov r8, fp
.L_950:
    ldrh r2, [sp, #0x4]
    mov r0, r2, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0xb
    bne .L_984
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mla r0, r1, r5, r6
    mov r1, r2, lsl #0x12
    mov r1, r1, lsr #0x18
    bl func_ov002_0229d9f8
    cmp r0, #0x0
    beq .L_9f4
.L_984:
    ldrh r3, [sp, #0x4]
    add r0, sp, #0x8
    mov r1, sl
    mov r2, r3, lsl #0x12
    mov r2, r2, lsr #0x18
    str r2, [sp]
    mov r2, r3, lsl #0x1f
    mov r3, r3, lsl #0x1a
    mov r2, r2, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6e04
    ldr r0, [sp, #0x8]
    ldr r2, [sp, #0xc]
    str r0, [sp, #0x18]
    sub r0, r0, #0x10
    ldr r3, [sp, #0x28]
    mov r1, r0, lsl #0x17
    sub r0, r2, #0x10
    str r2, [sp, #0x1c]
    and r2, r0, #0xff
    and r3, r3, r4
    orr r2, r3, r2
    orr r1, r2, r1, lsr #0x7
    str r1, [sp, #0x28]
    ldr r0, _LIT4
    add r1, sp, #0x28
    mov r2, #0x1
    bl func_0207f05c
.L_9f4:
    ldr r0, [sl, #0x5b8]
    add r9, r9, #0x1
    cmp r9, r0
    blt .L_86c
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x80002100
_LIT1: .word 0x0000155d
_LIT2: .word data_020bef80
_LIT3: .word 0xfe00ff00
_LIT4: .word data_ov002_022d0f98
_LIT5: .word 0xc1fffcff
_LIT6: .word 0x04001050

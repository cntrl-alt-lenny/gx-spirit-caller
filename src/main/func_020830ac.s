; func_020830ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a2f20
        .extern data_021a2f60
        .extern func_02084fe0
        .extern func_0208e3e8
        .extern func_0208e404
        .extern func_0208e420
        .extern func_0208e61c
        .extern func_0208e664
        .extern func_02094504
        .global func_020830ac
        .arm
func_020830ac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8c
    ldr r1, [r0, #0x4]
    ldr r4, [r0]
    ldr r6, [r1, #0x4]
    ldrb r2, [r4, #0x2]
    ldr r3, [r6, #0x10]
    mov sl, #0x0
    str r0, [sp]
    str r2, [sp, #0x8]
    add r3, r6, r3
    add r1, sp, #0x34
    mov r0, sl
    mov r2, #0x54
    mov r9, sl
    str r3, [sp, #0x4]
    add r8, r4, #0x3
    bl func_02094504
    bl func_02084fe0
    ldr r0, _LIT0
    mov r7, sl
    str r7, [r0]
    mov r0, #0x1
    ldr r2, _LIT1
    ldr r1, _LIT2
    str r0, [r2]
    str r0, [sp, #0x10]
    str r7, [r1]
    mov r1, #0x2
    ldr r0, _LIT0
    str r1, [sp, #0x14]
    str r1, [r0]
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bls .L_c6c
.L_884:
    ldrb r4, [r8, #0x1]
    mov r0, #0x64
    ldr r3, _LIT3
    mul r0, r4, r0
    str r0, [sp, #0xc]
    ldr r0, [sp]
    mov r1, r4, lsr #0x5
    add r0, r0, r1, lsl #0x2
    ldr r1, [sp, #0x10]
    and r2, r4, #0x1f
    mov r1, r1, lsl r2
    ldr fp, [r0, #0xcc]
    ldr r2, [sp, #0xc]
    ands fp, r1, fp
    add r6, r3, r2
    bne .L_8f8
    ldr r3, [r0, #0xcc]
    mov r2, #0x54
    orr r1, r3, r1
    str r1, [r0, #0xcc]
    ldr r0, [sp, #0x4]
    ldr r1, _LIT4
    mla r0, r4, r2, r0
    ldrb r2, [r8]
    str r2, [r1]
    ldr r2, [sp, #0x10]
    ldr r1, _LIT0
    str r2, [r1]
    bl func_0208e404
.L_8f8:
    cmp r7, #0x0
    beq .L_aa0
    ldr r2, [sp, #0x6c]
    ldr r1, [r5]
    str r2, [sp, #0x18]
    ldr r2, [sp, #0x70]
    mov r0, r1, asr #0x1f
    str r2, [sp, #0x1c]
    ldr r2, [sp, #0x74]
    ldr ip, [sp, #0x64]
    str r2, [sp, #0x20]
    ldr r2, [sp, #0x78]
    ldr lr, [sp, #0x68]
    str r2, [sp, #0x24]
    ldr r2, [sp, #0x7c]
    str r2, [sp, #0x28]
    ldr r2, [sp, #0x80]
    str r2, [sp, #0x2c]
    ldr r2, [sp, #0x84]
    str r2, [sp, #0x30]
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    mov r0, r3, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    adds r0, ip, r0
    str r0, [sp, #0x64]
    ldr r1, [r5, #0x4]
    mov r0, r1, asr #0x1f
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    mov r0, r3, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    adds r0, lr, r0
    str r0, [sp, #0x68]
    ldr r1, [r5, #0x8]
    mov r0, r1, asr #0x1f
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    mov r1, r3, lsr #0xc
    ldr r0, [sp, #0x18]
    orr r1, r1, r2, lsl #0x14
    adds r0, r0, r1
    str r0, [sp, #0x6c]
    ldr r1, [r5, #0xc]
    mov r0, r1, asr #0x1f
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    mov r1, r3, lsr #0xc
    ldr r0, [sp, #0x1c]
    orr r1, r1, r2, lsl #0x14
    adds r0, r0, r1
    str r0, [sp, #0x70]
    ldr r1, [r5, #0x10]
    mov r0, r1, asr #0x1f
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    mov r1, r3, lsr #0xc
    ldr r0, [sp, #0x20]
    orr r1, r1, r2, lsl #0x14
    adds r0, r0, r1
    str r0, [sp, #0x74]
    ldr r1, [r5, #0x14]
    mov r0, r1, asr #0x1f
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    mov r1, r3, lsr #0xc
    ldr r0, [sp, #0x24]
    orr r1, r1, r2, lsl #0x14
    adds r0, r0, r1
    str r0, [sp, #0x78]
    ldr r1, [r5, #0x18]
    mov r0, r1, asr #0x1f
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    mov r1, r3, lsr #0xc
    ldr r0, [sp, #0x28]
    orr r1, r1, r2, lsl #0x14
    adds r0, r0, r1
    str r0, [sp, #0x7c]
    ldr r1, [r5, #0x1c]
    mov r0, r1, asr #0x1f
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    mov r1, r3, lsr #0xc
    ldr r0, [sp, #0x2c]
    orr r1, r1, r2, lsl #0x14
    adds r0, r0, r1
    str r0, [sp, #0x80]
    ldr r1, [r5, #0x20]
    mov r0, r1, asr #0x1f
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    mov r1, r3, lsr #0xc
    ldr r0, [sp, #0x30]
    orr r1, r1, r2, lsl #0x14
    adds r0, r0, r1
    str r0, [sp, #0x84]
.L_aa0:
    cmp fp, #0x0
    bne .L_ad8
.L_aa8:
    mov r0, r6
    bl func_0208e664
    cmp r0, #0x0
    bne .L_aa8
    ldr r1, [sp, #0x14]
    ldr r0, _LIT0
    str r1, [r0]
    ldr r0, [sp, #0x4]
    mov r1, #0x54
    mla r0, r4, r1, r0
    add r0, r0, #0x30
    bl func_0208e3e8
.L_ad8:
    ldrb r1, [r8, #0x2]
    ldr r2, [sp, #0x34]
    ldr r0, [r6]
    mov sl, r1, lsl #0x4
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r2, r1
    str r0, [sp, #0x34]
    mov r9, sl, asr #0x1f
    ldr r2, [sp, #0x38]
    ldr r0, [r6, #0x4]
    ldr r3, [sp, #0x3c]
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r2, r1
    str r0, [sp, #0x38]
    ldr r0, [r6, #0x8]
    ldr r2, [sp, #0x40]
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r3, r1
    str r0, [sp, #0x3c]
    ldr r0, [r6, #0x10]
    ldr r3, [sp, #0x44]
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r2, r1
    str r0, [sp, #0x40]
    ldr r0, [r6, #0x14]
    ldr r2, [sp, #0x48]
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r3, r1
    str r0, [sp, #0x44]
    ldr r0, [r6, #0x18]
    ldr r3, [sp, #0x4c]
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r2, r1
    str r0, [sp, #0x48]
    ldr r0, [r6, #0x20]
    ldr r2, [sp, #0x50]
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r3, r1
    str r0, [sp, #0x4c]
    ldr r0, [r6, #0x24]
    ldr r3, [sp, #0x54]
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r2, r1
    str r0, [sp, #0x50]
    ldr r0, [r6, #0x28]
    ldr r2, [sp, #0x58]
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r3, r1
    str r0, [sp, #0x54]
    ldr r0, [r6, #0x30]
    ldr r3, [sp, #0x5c]
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r2, r1
    str r0, [sp, #0x58]
    ldr r0, [r6, #0x34]
    ldr r2, [sp, #0x60]
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r3, r1
    str r0, [sp, #0x5c]
    ldr r0, [r6, #0x38]
    smull r1, r0, sl, r0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    adds r0, r2, r1
    str r0, [sp, #0x60]
    cmp fp, #0x0
    ldr r1, _LIT5
    ldr r0, [sp, #0xc]
    add r5, r1, r0
    add r8, r8, #0x3
    bne .L_c5c
.L_c4c:
    mov r0, r5
    bl func_0208e61c
    cmp r0, #0x0
    bne .L_c4c
.L_c5c:
    ldr r0, [sp, #0x8]
    add r7, r7, #0x1
    cmp r7, r0
    bcc .L_884
.L_c6c:
    ldr r1, [r5]
    ldr r4, [sp, #0x64]
    mov r0, r1, asr #0x1f
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    mov r0, r3, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    adds r0, r4, r0
    str r0, [sp, #0x64]
    ldr r1, [r5, #0x4]
    ldr r4, [sp, #0x68]
    mov r0, r1, asr #0x1f
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    mov r0, r3, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    adds r0, r4, r0
    str r0, [sp, #0x68]
    ldr r1, [r5, #0x8]
    ldr r4, [sp, #0x6c]
    umull r0, r2, sl, r1
    mov r3, r0, lsr #0xc
    mov r0, r1, asr #0x1f
    mla r2, sl, r0, r2
    mla r2, r9, r1, r2
    orr r3, r3, r2, lsl #0x14
    adds r0, r4, r3
    str r0, [sp, #0x6c]
    ldr r7, [r5, #0xc]
    ldr ip, [sp, #0x70]
    mov r6, r7, asr #0x1f
    umull fp, r8, sl, r7
    mla r8, sl, r6, r8
    mla r8, r9, r7, r8
    mov r6, fp, lsr #0xc
    orr r6, r6, r8, lsl #0x14
    adds r6, ip, r6
    str r6, [sp, #0x70]
    ldr r7, [r5, #0x10]
    ldr r4, [sp, #0x74]
    mov r6, r7, asr #0x1f
    umull fp, r8, sl, r7
    mla r8, sl, r6, r8
    mla r8, r9, r7, r8
    mov r6, fp, lsr #0xc
    orr r6, r6, r8, lsl #0x14
    adds r4, r4, r6
    str r4, [sp, #0x74]
    ldr r6, [r5, #0x14]
    ldr r3, [sp, #0x78]
    mov r4, r6, asr #0x1f
    umull r8, r7, sl, r6
    mla r7, sl, r4, r7
    mla r7, r9, r6, r7
    mov r4, r8, lsr #0xc
    orr r4, r4, r7, lsl #0x14
    adds r3, r3, r4
    str r3, [sp, #0x78]
    ldr r4, [r5, #0x18]
    ldr r2, [sp, #0x7c]
    mov r3, r4, asr #0x1f
    umull r7, r6, sl, r4
    mla r6, sl, r3, r6
    mla r6, r9, r4, r6
    mov r3, r7, lsr #0xc
    orr r3, r3, r6, lsl #0x14
    adds r2, r2, r3
    str r2, [sp, #0x7c]
    ldr r3, [r5, #0x1c]
    ldr r1, [sp, #0x80]
    mov r2, r3, asr #0x1f
    umull r6, r4, sl, r3
    mla r4, sl, r2, r4
    mla r4, r9, r3, r4
    mov r2, r6, lsr #0xc
    orr r2, r2, r4, lsl #0x14
    adds r1, r1, r2
    str r1, [sp, #0x80]
    ldr r2, [r5, #0x20]
    ldr lr, [sp, #0x84]
    mov r1, r2, asr #0x1f
    umull r4, r3, sl, r2
    mla r3, sl, r1, r3
    mla r3, r9, r2, r3
    mov r1, r4, lsr #0xc
    orr r1, r1, r3, lsl #0x14
    adds r1, lr, r1
    add r0, sp, #0x64
    str r1, [sp, #0x84]
    bl func_0208e420
    ldr r1, _LIT0
    mov r2, #0x1
    add r0, sp, #0x34
    str r2, [r1]
    bl func_0208e420
    ldr r3, _LIT0
    mov r0, #0x0
    str r0, [r3]
    ldr r1, _LIT4
    mov r2, #0x1
    mov r0, #0x2
    str r2, [r1]
    str r0, [r3]
    ldr r0, [sp]
    ldr r1, [r0]
    ldr r0, _LIT1
    ldrb r2, [r1, #0x1]
    mov r1, #0x3
    str r2, [r0]
    ldr r0, [sp]
    ldr r2, [r0]
    ldrb r0, [r2, #0x2]
    add r0, r0, #0x1
    mla r1, r0, r1, r2
    ldr r0, [sp]
    str r1, [r0]
    add sp, sp, #0x8c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x04000440
_LIT1: .word 0x0400044c
_LIT2: .word 0x04000454
_LIT3: .word data_021a2f20
_LIT4: .word 0x04000450
_LIT5: .word data_021a2f60

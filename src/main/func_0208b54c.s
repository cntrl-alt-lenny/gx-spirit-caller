; func_0208b54c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208be9c
        .extern func_0208bed8
        .extern MI_Copy48B
        .global func_0208b54c
        .arm
func_0208b54c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x5c
    mov sl, r0
    ldr fp, [sl, #0x14]
    cmp sl, r1
    addeq r9, sp, #0x2c
    ldr r3, [sl, #0x18]
    ldr r2, [sl, #0xc]
    ldr r8, [sl, #0x20]
    str r1, [sp]
    movne r9, r1
    smull r7, r5, r2, r8
    smull r6, r1, fp, r3
    ldr r4, [sl, #0x1c]
    subs ip, r7, r6
    ldr r0, [sl, #0x10]
    smull r6, lr, fp, r4
    sbc fp, r5, r1
    smull r5, r4, r2, r4
    mov r1, #0x800
    smull r8, r7, r0, r8
    smull r3, r2, r0, r3
    adds ip, ip, r1
    adc r0, fp, #0x0
    subs r8, r8, r6
    sbc r6, r7, lr
    adds r7, r8, r1
    adc fp, r6, #0x0
    mov r7, r7, lsr #0xc
    mov r8, ip, lsr #0xc
    orr r7, r7, fp, lsl #0x14
    orr r8, r8, r0, lsl #0x14
    subs r0, r5, r3
    sbc ip, r4, r2
    ldr r6, [sl, #0x4]
    ldr fp, [sl]
    smull r3, r2, r6, r8
    adds r0, r0, r1
    smull r5, r4, fp, r7
    adc fp, ip, #0x0
    mov r6, r0, lsr #0xc
    subs r3, r5, r3
    ldr r0, [sl, #0x8]
    orr r6, r6, fp, lsl #0x14
    sbc r2, r4, r2
    smlal r3, r2, r0, r6
    adds r0, r3, r1
    mov r1, r8, asr #0x1f
    str r1, [sp, #0x4]
    mov r1, r7, asr #0x1f
    str r1, [sp, #0x8]
    mov r1, r6, asr #0x1f
    adc r2, r2, #0x0
    mov r0, r0, lsr #0xc
    orrs r0, r0, r2, lsl #0x14
    str r1, [sp, #0xc]
    addeq sp, sp, #0x5c
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    bl func_0208be9c
    ldr r1, [sl, #0x8]
    ldr r2, [sl, #0x1c]
    ldr fp, [sl, #0x10]
    smull r0, r4, r2, r1
    smull r3, r2, fp, r1
    ldr r5, [sl, #0x18]
    str r2, [sp, #0x18]
    str r3, [sp, #0x14]
    smull r3, r2, r5, r1
    str r2, [sp, #0x20]
    ldr r2, [sl, #0x20]
    ldr lr, [sl, #0x4]
    str r2, [sp, #0x10]
    ldr r5, [sp, #0x10]
    str r3, [sp, #0x1c]
    smull ip, r5, lr, r5
    subs r0, ip, r0
    ldr r2, [sl, #0xc]
    sbc r4, r5, r4
    smull r1, r5, r2, r1
    str r5, [sp, #0x28]
    mov r5, r0, lsr #0xc
    ldr fp, [sl, #0x14]
    orr r5, r5, r4, lsl #0x14
    smull r4, r2, lr, fp
    ldr r0, [sp, #0x14]
    ldr r3, [sl]
    subs r4, r4, r0
    ldr r0, [sp, #0x18]
    mov r4, r4, lsr #0xc
    sbc r0, r2, r0
    orr r4, r4, r0, lsl #0x14
    ldr r0, [sp, #0x10]
    ldr r2, [sp, #0x1c]
    smull ip, r0, r3, r0
    subs r2, ip, r2
    ldr ip, [sp, #0x20]
    sbc r0, r0, ip
    smull ip, fp, r3, fp
    ldr r3, [sp, #0x28]
    subs r1, ip, r1
    sbc r3, fp, r3
    mov fp, r2, lsr #0xc
    orr fp, fp, r0, lsl #0x14
    mov r0, r1, lsr #0xc
    str r0, [sp, #0x24]
    orr r0, r0, r3, lsl #0x14
    str r0, [sp, #0x24]
    bl func_0208bed8
    smull r2, r1, r0, r5
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    rsb lr, r2, #0x0
    smull r2, r1, r0, r4
    mov r4, r2, lsr #0xc
    orr r4, r4, r1, lsl #0x14
    smull r2, r1, r0, fp
    mov r3, r2, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    ldr r1, [sp, #0x24]
    umull fp, r5, r0, r7
    smull r2, r1, r0, r1
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    ldr r1, [sp, #0x8]
    mov ip, r0, asr #0x1f
    mla r5, r0, r1, r5
    mla r5, ip, r7, r5
    mov r1, fp, lsr #0xc
    orr r1, r1, r5, lsl #0x14
    str r1, [r9]
    str lr, [r9, #0x4]
    str r4, [r9, #0x8]
    ldr r1, [sp, #0x4]
    umull r5, r4, r0, r8
    mla r4, r0, r1, r4
    mla r4, ip, r8, r4
    mov r1, r5, lsr #0xc
    orr r1, r1, r4, lsl #0x14
    rsb r1, r1, #0x0
    str r1, [r9, #0xc]
    ldr r1, [sp, #0xc]
    rsb r2, r2, #0x0
    str r3, [r9, #0x10]
    str r2, [r9, #0x14]
    umull r3, r2, r0, r6
    mla r2, r0, r1, r2
    mla r2, ip, r6, r2
    mov r1, r3, lsr #0xc
    orr r1, r1, r2, lsl #0x14
    str r1, [r9, #0x18]
    ldr r3, [sl]
    ldr r1, [sl, #0x1c]
    ldr r2, [sl, #0x18]
    smull r5, r4, r3, r1
    ldr r1, [sl, #0x4]
    smull r3, r1, r2, r1
    subs r2, r5, r3
    sbc r1, r4, r1
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    smull r2, r1, r0, r2
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    rsb r1, r2, #0x0
    str r1, [r9, #0x1c]
    ldr r3, [sl]
    ldr r1, [sl, #0x10]
    ldr r2, [sl, #0xc]
    smull r5, r4, r3, r1
    ldr r1, [sl, #0x4]
    smull r3, r1, r2, r1
    subs r2, r5, r3
    sbc r1, r4, r1
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    smull r2, r1, r0, r2
    mov r0, r2, lsr #0xc
    orr r0, r0, r1, lsl #0x14
    str r0, [r9, #0x20]
    add r0, sp, #0x2c
    ldr r2, [r9, #0xc]
    ldr r1, [sl, #0x28]
    ldr r4, [r9]
    smull r7, r1, r2, r1
    ldr r3, [sl, #0x24]
    ldr r6, [r9, #0x18]
    smlal r7, r1, r4, r3
    ldr r5, [sl, #0x2c]
    cmp r9, r0
    smlal r7, r1, r6, r5
    mov r2, r7, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    rsb r1, r2, #0x0
    str r1, [r9, #0x24]
    ldr r2, [r9, #0x10]
    ldr r1, [sl, #0x28]
    ldr r4, [r9, #0x4]
    smull r7, r1, r2, r1
    ldr r3, [sl, #0x24]
    ldr r6, [r9, #0x1c]
    smlal r7, r1, r4, r3
    ldr r5, [sl, #0x2c]
    smlal r7, r1, r6, r5
    mov r2, r7, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    rsb r1, r2, #0x0
    str r1, [r9, #0x28]
    ldr r1, [sl, #0x28]
    ldr r2, [r9, #0x14]
    ldr r4, [r9, #0x8]
    smull r7, r1, r2, r1
    ldr r3, [sl, #0x24]
    ldr r6, [r9, #0x20]
    smlal r7, r1, r4, r3
    ldr r5, [sl, #0x2c]
    smlal r7, r1, r6, r5
    mov r2, r7, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    rsb r1, r2, #0x0
    str r1, [r9, #0x2c]
    bne .L_5d0
    ldr r1, [sp]
    bl MI_Copy48B
.L_5d0:
    mov r0, #0x0
    add sp, sp, #0x5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr

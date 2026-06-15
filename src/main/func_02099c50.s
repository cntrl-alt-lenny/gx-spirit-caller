; func_02099c50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8394
        .extern data_021a83ac
        .global func_02099c50
        .arm
func_02099c50:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    ldrh r2, [r2, #0x30]
    cmp r2, #0x0
    bne .L_3c
    ldrh r3, [r1]
    ldrh r2, [r1, #0x2]
    strh r3, [r0]
    strh r2, [r0, #0x2]
    ldrh r2, [r1, #0x4]
    ldrh r1, [r1, #0x6]
    strh r2, [r0, #0x4]
    strh r1, [r0, #0x6]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_3c:
    ldrh r3, [r1, #0x4]
    ldr r2, _LIT1
    strh r3, [r0, #0x4]
    ldrh r3, [r1, #0x6]
    strh r3, [r0, #0x6]
    ldrh r3, [r1, #0x4]
    cmp r3, #0x0
    moveq r1, #0x0
    streqh r1, [r0]
    streqh r1, [r0, #0x2]
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldrh r4, [r1]
    ldr r3, [r2]
    ldr lr, [r2, #0x8]
    mov ip, r4, lsl #0x2
    mov r4, ip, asr #0x1f
    subs ip, ip, r3
    sbc r3, r4, r3, asr #0x1f
    umull r6, r5, lr, ip
    mla r5, lr, r3, r5
    mov r3, lr, asr #0x1f
    mla r5, r3, ip, r5
    mov r3, r6, lsr #0x16
    orr r3, r3, r5, lsl #0xa
    strh r3, [r0]
    ldrsh r3, [r0]
    cmp r3, #0x0
    movlt r3, #0x0
    strlth r3, [r0]
    blt .L_c4
    cmp r3, #0xff
    movgt r3, #0xff
    strgth r3, [r0]
.L_c4:
    ldrh r3, [r1, #0x2]
    ldr r1, [r2, #0xc]
    ldr ip, [r2, #0x14]
    mov r3, r3, lsl #0x2
    mov r2, r3, asr #0x1f
    subs r3, r3, r1
    sbc r1, r2, r1, asr #0x1f
    umull r4, lr, ip, r3
    mla lr, ip, r1, lr
    mov r1, ip, asr #0x1f
    mla lr, r1, r3, lr
    mov r1, r4, lsr #0x16
    orr r1, r1, lr, lsl #0xa
    strh r1, [r0, #0x2]
    ldrsh r1, [r0, #0x2]
    cmp r1, #0x0
    movlt r1, #0x0
    strlth r1, [r0, #0x2]
    ldmltia sp!, {r4, r5, r6, lr}
    bxlt lr
    cmp r1, #0xbf
    movgt r1, #0xbf
    strgth r1, [r0, #0x2]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a8394
_LIT1: .word data_021a83ac

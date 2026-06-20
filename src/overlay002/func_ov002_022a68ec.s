; func_ov002_022a68ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022a6324
        .global func_ov002_022a68ec
        .arm
func_ov002_022a68ec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    str r1, [sp]
    ldrh r1, [r1]
    mov r5, r2
    mov r6, r0
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov r4, r1, lsl #0x1f
    mov r1, r4, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022a6324
    ldrh r1, [r5]
    mov r4, r0
    mov r0, r6
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov r6, r1, lsl #0x1f
    mov r1, r6, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022a6324
    ldrsb r3, [r4, #0x2]
    ldrsb r2, [r4]
    ldrsb r1, [r4, #0x1]
    strb r3, [sp, #0xe]
    strb r2, [sp, #0xc]
    strb r1, [sp, #0xd]
    ldrsb r6, [r4, #0x3]
    ldrsh r3, [r4, #0x8]
    ldrsh r2, [r4, #0x4]
    ldrsh r1, [r4, #0x6]
    strb r6, [sp, #0xf]
    strh r2, [sp, #0x10]
    strh r1, [sp, #0x12]
    ldrh r6, [r4, #0xa]
    strh r3, [sp, #0x14]
    ldr r2, [r4, #0xc]
    ldr r1, [r4, #0x10]
    ldrsb r3, [r0]
    ldrsb r9, [sp, #0xc]
    ldrsb r8, [sp, #0xd]
    strb r3, [r4]
    strh r6, [sp, #0x16]
    ldrsb r3, [r0, #0x1]
    ldrsb r7, [sp, #0xe]
    ldrsb r6, [sp, #0xf]
    strb r3, [r4, #0x1]
    ldrsb r3, [r0, #0x2]
    ldrsh lr, [sp, #0x10]
    ldrsh ip, [sp, #0x12]
    strb r3, [r4, #0x2]
    ldrsb r3, [r0, #0x3]
    ldrh fp, [sp, #0x16]
    str r1, [sp, #0x1c]
    strb r3, [r4, #0x3]
    ldrsh sl, [r0, #0x4]
    ldrsh r3, [sp, #0x14]
    str r2, [sp, #0x18]
    strh sl, [r4, #0x4]
    ldrsh sl, [r0, #0x6]
    strh sl, [r4, #0x6]
    ldrsh sl, [r0, #0x8]
    strh sl, [r4, #0x8]
    ldrh sl, [r0, #0xa]
    strh sl, [r4, #0xa]
    ldr sl, [r0, #0xc]
    str sl, [r4, #0xc]
    ldr sl, [r0, #0x10]
    str sl, [r4, #0x10]
    strb r9, [r0]
    strb r8, [r0, #0x1]
    strb r7, [r0, #0x2]
    strb r6, [r0, #0x3]
    strh lr, [r0, #0x4]
    strh ip, [r0, #0x6]
    strh r3, [r0, #0x8]
    strh fp, [r0, #0xa]
    str r2, [r0, #0xc]
    str r1, [r0, #0x10]
    ldrh r1, [r4, #0xa]
    strh r1, [sp, #0xa]
    ldrh r3, [sp, #0xa]
    ldr r1, [sp]
    mov r2, #0x8
    ldrh r6, [r1]
    mov r1, r3, lsl #0x11
    mov r1, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r6, r6, #0x4000
    mov r1, r1, lsl #0x1f
    orr r1, r6, r1, lsr #0x11
    strh r1, [sp, #0x8]
    mov r1, r3, lsl #0x10
    mov r1, r1, lsr #0x1f
    ldrh r3, [sp, #0x8]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r3, r3, #0x8000
    mov r1, r1, lsl #0x1f
    orr r1, r3, r1, lsr #0x10
    strh r1, [sp, #0x8]
    ldrh r1, [sp, #0x8]
    strh r1, [r4, #0xa]
    strh r2, [r4, #0x4]
    ldrh r1, [r0, #0xa]
    ldrh r5, [r5]
    mov r3, r1, lsl #0x11
    mov r3, r3, lsr #0x1f
    mov r3, r3, lsl #0x10
    mov r4, r3, lsr #0x10
    mov r3, r1, lsl #0x10
    mov r3, r3, lsr #0x1f
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    bic r5, r5, #0x4000
    mov r4, r4, lsl #0x1f
    orr r4, r5, r4, lsr #0x11
    strh r4, [sp, #0x6]
    ldrh r4, [sp, #0x6]
    strh r1, [sp, #0x4]
    mov r3, r3, lsl #0x1f
    bic r1, r4, #0x8000
    orr r1, r1, r3, lsr #0x10
    strh r1, [sp, #0x6]
    ldrh r1, [sp, #0x6]
    strh r1, [r0, #0xa]
    strh r2, [r0, #0x4]
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}

; func_02086f24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208bd50
        .extern func_0208bdf0
        .global func_02086f24
        .arm
func_02086f24:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r6, r1
    ldrh r2, [r6, #0x2c]
    ldrh r1, [r6, #0x2e]
    mov r7, r0
    mov sl, r2, lsl #0xc
    mov fp, r1, lsl #0xc
    mov r0, fp
    mov r1, sl
    bl func_0208bd50
    ldrsh r3, [r6, #0x22]
    ldr r0, [r6, #0x18]
    ldrsh r9, [r6, #0x20]
    smull r2, r1, r0, r3
    mov r2, r2, lsr #0xc
    ldr r8, [r6, #0x1c]
    orr r2, r2, r1, lsl #0x14
    str r2, [r7]
    smull r2, r1, r8, r3
    mov r4, r2, lsr #0xc
    orr r4, r4, r1, lsl #0x14
    smull r2, r1, r0, r9
    mov r5, r2, lsr #0xc
    orr r5, r5, r1, lsl #0x14
    str r4, [r7, #0x14]
    bl func_0208bdf0
    smull r2, r1, r8, r9
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    mul r0, r2, r0
    mov r0, r0, asr #0xc
    str r0, [r7, #0x4]
    mov r0, sl
    mov r1, fp
    bl func_0208bd50
    ldr lr, [r6, #0x1c]
    ldrsh r2, [r6, #0x20]
    ldr r8, [r6, #0x24]
    ldr r0, [r6, #0x28]
    smull sl, r9, r8, r2
    ldrh r1, [r6, #0x2c]
    smull r3, r2, r0, r2
    ldrsh ip, [r6, #0x22]
    str r1, [sp]
    mov fp, lr, asr #0x1f
    smlal r3, r2, r8, ip
    smull r8, ip, r0, ip
    subs r8, sl, r8
    sbc r0, r9, ip
    mov r9, r8, lsr #0xc
    mov ip, r3, lsr #0xc
    orr r9, r9, r0, lsl #0x14
    mov r3, r2, asr #0xc
    orr ip, ip, r2, lsl #0x14
    umull sl, r2, r9, lr
    mla r2, r9, fp, r2
    mov r8, r0, asr #0xc
    mla r2, r8, lr, r2
    ldr r1, [r6, #0x18]
    mov r8, sl, lsr #0xc
    orr r8, r8, r2, lsl #0x14
    add r2, r4, r8
    mov r0, r1, asr #0x1f
    umull r8, r4, ip, r1
    mla r4, ip, r0, r4
    mla r4, r3, r1, r4
    mov r0, r8, lsr #0xc
    orr r0, r0, r4, lsl #0x14
    sub r1, r5, r0
    ldr r0, [sp]
    sub r2, r2, #0x1000
    mul r1, r0, r1
    mov r0, r1, lsl #0x4
    str r0, [r7, #0x30]
    ldrh r0, [r6, #0x2e]
    rsb r0, r0, #0x0
    mul r1, r0, r2
    mov r0, r1, lsl #0x4
    str r0, [r7, #0x34]
    bl func_0208bdf0
    rsb r1, r5, #0x0
    mul r0, r1, r0
    mov r0, r0, asr #0xc
    str r0, [r7, #0x10]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

; func_02086700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208be38
        .extern func_0208bed8
        .global func_02086700
        .arm
func_02086700:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r9, r1
    ldrh r2, [r9, #0x2c]
    ldrh r1, [r9, #0x2e]
    mov sl, r0
    mov r8, r2, lsl #0xc
    mov fp, r1, lsl #0xc
    mov r0, fp
    mov r1, r8
    bl func_0208be38
    ldrsh r0, [r9, #0x22]
    ldr r3, [r9, #0x18]
    ldrsh r5, [r9, #0x20]
    ldr r4, [r9, #0x1c]
    smull r2, r1, r3, r0
    mov r7, r2, lsr #0xc
    orr r7, r7, r1, lsl #0x14
    smull r2, r1, r3, r5
    mov r6, r2, lsr #0xc
    orr r6, r6, r1, lsl #0x14
    smull r3, r2, r4, r0
    smull r1, r0, r4, r5
    mov r5, r3, lsr #0xc
    orr r5, r5, r2, lsl #0x14
    mov r4, r1, lsr #0xc
    orr r4, r4, r0, lsl #0x14
    str r7, [sl]
    str r5, [sl, #0x14]
    bl func_0208bed8
    mov r1, fp
    mul r0, r4, r0
    mov r0, r0, asr #0xc
    str r0, [sl, #0x4]
    mov r0, r8
    bl func_0208be38
    ldrh r3, [r9, #0x2c]
    ldrh r1, [r9, #0x2e]
    rsb r0, r3, #0x0
    rsb r1, r1, #0x0
    mov r2, r1, lsl #0xb
    mov fp, r0, lsl #0xb
    smull r1, r0, r7, fp
    smull r8, r7, r5, r2
    smlal r8, r7, r4, fp
    mov r4, r8, lsr #0x8
    orr r4, r4, r7, lsl #0x18
    smull r5, r2, r6, r2
    subs r1, r1, r5
    sbc r0, r0, r2
    mov r1, r1, lsr #0x8
    orr r1, r1, r0, lsl #0x18
    add r0, r1, r3, lsl #0xf
    str r0, [sl, #0x30]
    ldrh r0, [r9, #0x2e]
    add r0, r4, r0, lsl #0xf
    str r0, [sl, #0x34]
    bl func_0208bed8
    rsb r1, r6, #0x0
    mul r0, r1, r0
    mov r0, r0, asr #0xc
    str r0, [sl, #0x10]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

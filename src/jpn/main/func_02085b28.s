; func_02085b28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208bd50
        .extern func_0208bdf0
        .global func_02085b28
        .arm
func_02085b28:
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
    bl func_0208bd50
    ldrsh r5, [r9, #0x22]
    ldr r3, [r9, #0x18]
    ldrsh r0, [r9, #0x20]
    ldr r4, [r9, #0x1c]
    smull r2, r1, r3, r5
    mov r6, r2, lsr #0xc
    orr r6, r6, r1, lsl #0x14
    smull r2, r1, r3, r0
    mov r7, r2, lsr #0xc
    orr r7, r7, r1, lsl #0x14
    smull r3, r2, r4, r0
    smull r1, r0, r4, r5
    mov r5, r3, lsr #0xc
    orr r5, r5, r2, lsl #0x14
    mov r4, r1, lsr #0xc
    orr r4, r4, r0, lsl #0x14
    str r6, [sl]
    str r4, [sl, #0x14]
    bl func_0208bdf0
    mov r1, fp
    rsb r2, r5, #0x0
    mul r0, r2, r0
    mov r0, r0, asr #0xc
    str r0, [sl, #0x4]
    mov r0, r8
    bl func_0208bd50
    sub r1, r5, r4
    add r2, r7, r6
    ldr r5, [r9, #0x18]
    ldrh r0, [r9, #0x2c]
    sub r3, r5, r2
    ldr r2, [r9, #0x24]
    mul r4, r0, r3
    smull r3, r2, r5, r2
    mov r4, r4, lsl #0x3
    mov r3, r3, lsr #0x8
    orr r3, r3, r2, lsl #0x18
    mul r2, r0, r3
    sub r0, r4, r2
    str r0, [sl, #0x30]
    ldr r4, [r9, #0x1c]
    ldrh r3, [r9, #0x2e]
    sub r0, r1, r4
    add r0, r0, #0x2000
    mul r2, r3, r0
    ldr r0, [r9, #0x28]
    smull r1, r0, r4, r0
    mov r1, r1, lsr #0x8
    orr r1, r1, r0, lsl #0x18
    mul r0, r3, r1
    add r0, r0, r2, lsl #0x3
    str r0, [sl, #0x34]
    bl func_0208bdf0
    mul r0, r7, r0
    mov r0, r0, asr #0xc
    str r0, [sl, #0x10]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

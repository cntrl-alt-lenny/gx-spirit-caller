; func_02085b38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208be38
        .extern func_0208bed8
        .global func_02085b38
        .arm
func_02085b38:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r1
    ldrh r2, [r5, #0x2c]
    ldrh r1, [r5, #0x2e]
    mov r6, r0
    mov r4, r2, lsl #0xc
    mov r7, r1, lsl #0xc
    mov r0, r7
    mov r1, r4
    bl func_0208be38
    ldrsh r0, [r5, #0x22]
    str r0, [r6]
    ldrsh r0, [r5, #0x22]
    str r0, [r6, #0x14]
    bl func_0208bed8
    ldrsh r2, [r5, #0x20]
    mov r1, r7
    rsb r2, r2, #0x0
    mul r0, r2, r0
    mov r2, r0, asr #0xc
    mov r0, r4
    str r2, [r6, #0x4]
    bl func_0208be38
    ldrsh r2, [r5, #0x20]
    ldrsh r1, [r5, #0x22]
    ldrh r3, [r5, #0x2c]
    ldr r0, [r5, #0x24]
    add r1, r2, r1
    rsb r1, r1, #0x0
    add r1, r1, #0x1000
    mul r2, r3, r1
    mul r1, r0, r3
    mov r0, r2, lsl #0x3
    sub r0, r0, r1, lsl #0x4
    str r0, [r6, #0x30]
    ldrsh r2, [r5, #0x20]
    ldrsh r1, [r5, #0x22]
    ldrh r3, [r5, #0x2e]
    ldr r0, [r5, #0x28]
    sub r1, r2, r1
    add r1, r1, #0x1000
    mul r2, r3, r1
    mul r1, r0, r3
    mov r0, r2, lsl #0x3
    add r0, r0, r1, lsl #0x4
    str r0, [r6, #0x34]
    bl func_0208bed8
    ldrsh r1, [r5, #0x20]
    mul r0, r1, r0
    mov r0, r0, asr #0xc
    str r0, [r6, #0x10]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}

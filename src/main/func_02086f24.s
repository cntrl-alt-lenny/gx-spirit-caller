; func_02086f24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208be38
        .extern func_0208bed8
        .global func_02086f24
        .arm
func_02086f24:
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
    mul r0, r2, r0
    mov r2, r0, asr #0xc
    mov r0, r4
    str r2, [r6, #0x4]
    bl func_0208be38
    ldrsh lr, [r5, #0x20]
    ldr r4, [r5, #0x28]
    ldrsh r0, [r5, #0x22]
    ldr ip, [r5, #0x24]
    smull r3, r2, r4, lr
    smlal r3, r2, ip, r0
    smull r1, r0, r4, r0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    sub r4, lr, r3
    smull r3, r2, ip, lr
    subs r1, r3, r1
    sbc r0, r2, r0
    ldrh r2, [r5, #0x2c]
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    mul r0, r2, r4
    mov r0, r0, lsl #0x4
    str r0, [r6, #0x30]
    ldrsh r0, [r5, #0x22]
    ldrh r2, [r5, #0x2e]
    add r0, r0, r1
    rsb r1, r2, #0x0
    sub r0, r0, #0x1000
    mul r0, r1, r0
    mov r0, r0, lsl #0x4
    str r0, [r6, #0x34]
    bl func_0208bed8
    ldrsh r1, [r5, #0x20]
    rsb r1, r1, #0x0
    mul r0, r1, r0
    mov r0, r0, asr #0xc
    str r0, [r6, #0x10]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}

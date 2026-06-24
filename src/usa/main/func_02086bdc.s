; func_02086bdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208bd50
        .extern func_0208bdf0
        .global func_02086bdc
        .arm
func_02086bdc:
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
    bl func_0208bd50
    ldrsh r0, [r5, #0x22]
    str r0, [r6]
    ldrsh r0, [r5, #0x22]
    str r0, [r6, #0x14]
    bl func_0208bdf0
    ldrsh r2, [r5, #0x20]
    mov r1, r7
    mul r0, r2, r0
    mov r2, r0, asr #0xc
    mov r0, r4
    str r2, [r6, #0x4]
    bl func_0208bd50
    ldrh r1, [r5, #0x2c]
    ldrsh r0, [r5, #0x20]
    mul r0, r1, r0
    mov r0, r0, lsl #0x4
    str r0, [r6, #0x30]
    ldrh r1, [r5, #0x2e]
    ldrsh r0, [r5, #0x22]
    rsb r1, r1, #0x0
    sub r0, r0, #0x1000
    mul r0, r1, r0
    mov r0, r0, lsl #0x4
    str r0, [r6, #0x34]
    bl func_0208bdf0
    ldrsh r1, [r5, #0x20]
    rsb r1, r1, #0x0
    mul r0, r1, r0
    mov r0, r0, asr #0xc
    str r0, [r6, #0x10]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}

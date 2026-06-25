; func_020867e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208bd50
        .extern func_0208bdf0
        .global func_020867e4
        .arm
func_020867e4:
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
    ldrh r2, [r5, #0x2c]
    ldrh r7, [r5, #0x2e]
    ldr r1, [r5, #0x28]
    ldr r0, [r5, #0x24]
    rsb r4, r2, #0x0
    mul r3, r1, r7
    rsb r1, r7, #0x0
    add r1, r3, r1, lsl #0xb
    ldrsh r3, [r5, #0x20]
    mov r7, r4, lsl #0xb
    mul r4, r0, r2
    sub r0, r7, r4
    ldrsh lr, [r5, #0x22]
    smull ip, r4, r3, r1
    smull r7, r3, lr, r0
    subs r7, r7, ip
    sbc r3, r3, r4
    mov r4, r7, lsr #0x8
    orr r4, r4, r3, lsl #0x18
    add r2, r4, r2, lsl #0xf
    str r2, [r6, #0x30]
    ldrsh r2, [r5, #0x22]
    ldrsh r3, [r5, #0x20]
    ldrh ip, [r5, #0x2e]
    smull r4, r1, r2, r1
    smlal r4, r1, r3, r0
    mov r0, r4, lsr #0x8
    orr r0, r0, r1, lsl #0x18
    add r0, r0, ip, lsl #0xf
    str r0, [r6, #0x34]
    bl func_0208bdf0
    ldrsh r1, [r5, #0x20]
    rsb r1, r1, #0x0
    mul r0, r1, r0
    mov r0, r0, asr #0xc
    str r0, [r6, #0x10]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}

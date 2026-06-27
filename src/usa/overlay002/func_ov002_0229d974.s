; func_ov002_0229d974 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229d90c
        .global func_ov002_0229d974
        .arm
func_ov002_0229d974:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0xa4]
    mov r4, r1
    add r1, r2, #0x1
    str r1, [r5, #0xa4]
    sub r1, r1, #0x1
    bl func_ov002_0229d90c
    ldr r1, [r5, #0xa4]
    ldr r0, [r5, #0xa8]
    sub r1, r1, #0x1
    sub r1, r1, r0
    mov r0, #0x14
    mul r2, r1, r0
    ldrsb r1, [r4]
    add r0, r5, r2
    add r3, r5, #0xbc
    strb r1, [r5, r2]
    ldrsb r2, [r4, #0x1]
    mov r1, #0x1
    strb r2, [r0, #0x1]
    ldrsb r2, [r4, #0x2]
    strb r2, [r0, #0x2]
    ldrsb r2, [r4, #0x3]
    strb r2, [r0, #0x3]
    ldrsh r2, [r4, #0x4]
    strh r2, [r0, #0x4]
    ldrsh r2, [r4, #0x6]
    strh r2, [r0, #0x6]
    ldrsh r2, [r4, #0x8]
    strh r2, [r0, #0x8]
    ldrh r2, [r4, #0xa]
    strh r2, [r0, #0xa]
    ldr r2, [r4, #0xc]
    str r2, [r0, #0xc]
    ldr r2, [r4, #0x10]
    str r2, [r0, #0x10]
    ldr r0, [r5, #0xa4]
    sub r4, r0, #0x1
    mov r0, r4, asr #0x4
    add r0, r4, r0, lsr #0x1b
    mov r2, r0, asr #0x5
    and r0, r4, #0x1f
    mvn r0, r1, lsl r0
    ldr r1, [r3, r2, lsl #0x2]
    and r0, r1, r0
    str r0, [r3, r2, lsl #0x2]
    ldmia sp!, {r3, r4, r5, pc}

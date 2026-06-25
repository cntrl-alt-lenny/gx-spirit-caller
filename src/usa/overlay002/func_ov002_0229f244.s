; func_ov002_0229f244 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229f1e8
        .global func_ov002_0229f244
        .arm
func_ov002_0229f244:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r1
    mov r4, r0
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r5
    bl func_ov002_0229f1e8
    ldr r0, [sp, #0x4]
    ldr r3, [r5, #0xc]
    ldr r1, [r5, #0x10]
    ldr r2, [sp]
    add r0, r0, r0, lsr #0x1f
    mov r3, r3, lsl #0x3
    add r3, r3, r0, asr #0x1
    add r0, r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x3
    add r0, r1, r0, asr #0x1
    str r3, [r4]
    str r3, [sp, #0x8]
    str r0, [sp, #0xc]
    str r0, [r4, #0x4]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}

; func_ov002_021f62ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d58dc
        .extern func_ov002_021f48e0
        .global func_ov002_021f62ac
        .arm
func_ov002_021f62ac:
    stmdb sp!, {r3, r4, r5, lr}
    mov r2, #0x0
    mov r5, r0
    str r2, [sp]
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r4, r1
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r3, #0x4
    bl func_ov002_021d58dc
    mov r0, r5
    mov r1, r4
    bl func_ov002_021f48e0
    ldmia sp!, {r3, r4, r5, pc}

; func_ov002_02294fd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b4174
        .extern func_ov002_021bbe70
        .extern func_ov002_02291104
        .global func_ov002_02294fd8
        .arm
func_ov002_02294fd8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x4]
    mov r4, r1
    ldrh r1, [r5]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b4174
    cmp r0, #0x3
    bge .L_38
    mov r0, r5
    mov r1, r4
    bl func_ov002_02291104
    ldmia sp!, {r3, r4, r5, pc}
.L_38:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x1
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}

; func_ov002_02294ac0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022536e8
        .extern func_ov002_022577dc
        .extern func_ov002_02280980
        .global func_ov002_02294ac0
        .arm
func_ov002_02294ac0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280980
    cmp r0, #0x0
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_022577dc
    ldrh r2, [r4, #0x2]
    ldrh r1, [r4]
    mov r4, r0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_022536e8
    cmp r4, r0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, pc}

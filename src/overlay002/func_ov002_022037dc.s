; func_ov002_022037dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b99b4
        .extern func_ov002_021bd030
        .global func_ov002_022037dc
        .arm
func_ov002_022037dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd030
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99b4
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}

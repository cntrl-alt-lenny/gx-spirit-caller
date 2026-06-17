; func_ov002_022885ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02280980
        .extern func_ov002_02281760
        .extern func_ov002_022817f4
        .global func_ov002_022885ec
        .arm
func_ov002_022885ec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280980
    cmp r0, #0x0
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, #0x1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02281760
    ldrh r1, [r4, #0x2]
    mov r4, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_022817f4
    adds r0, r4, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}

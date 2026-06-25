; func_ov002_021ff410 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0223f5dc
        .extern func_ov002_02253600
        .global func_ov002_021ff410
        .arm
func_ov002_021ff410:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5, #0x2]
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r4, r1, r2, lsr #0x1f
    bl func_ov002_0223f5dc
    mov r2, r0
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_02253600
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}

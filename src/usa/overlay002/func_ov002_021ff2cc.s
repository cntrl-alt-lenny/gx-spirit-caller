; func_ov002_021ff2cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ff1c8
        .global func_ov002_021ff2cc
        .arm
func_ov002_021ff2cc:
    stmdb sp!, {r4, lr}
    ldrh r2, [r0, #0x2]
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r4, r1, r2, lsr #0x1f
    mov r1, r4
    bl func_ov002_021ff1c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}

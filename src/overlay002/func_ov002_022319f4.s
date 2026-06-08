; func_ov002_022319f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021e276c
        .extern func_ov002_022287c4
        .global func_ov002_022319f4
        .arm
func_ov002_022319f4:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    mov r2, r3, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x2
    beq .L_1868
    ldrh r2, [r0, #0x4]
    ldrh r1, [r0]
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r3, r2, lsr #0x17
    mov r2, #0x11
    bl func_ov002_021e276c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1868:
    bl func_ov002_022287c4
    ldmia sp!, {r3, pc}

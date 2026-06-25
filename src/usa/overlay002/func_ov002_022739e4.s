; func_ov002_022739e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern func_0202b824
        .extern func_ov002_022719c4
        .extern func_ov002_02272934
        .global func_ov002_022739e4
        .arm
func_ov002_022739e4:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldrh r1, [r0, #0x16]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
    ldr r0, [r0]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x11
    bl func_0202b824
    cmp r0, #0x9
    bne .L_5e4
    bl func_ov002_02272934
    ldmia sp!, {r3, pc}
.L_5e4:
    bl func_ov002_022719c4
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd220

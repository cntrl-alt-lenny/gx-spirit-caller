; func_ov002_0220a7f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_0220803c
        .global func_ov002_0220a7f0
        .arm
func_ov002_0220a7f0:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r2, r2, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x23
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r2, _LIT0
    ldr r2, [r2, #0xcf8]
    cmp r2, #0x2
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_ov002_0220803c
    cmp r0, #0x0
    movne r0, #0x2
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c

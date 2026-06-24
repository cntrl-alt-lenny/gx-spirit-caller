; func_ov002_0220dd04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_0220dc44
        .global func_ov002_0220dd04
        .arm
func_ov002_0220dd04:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r2, [r2, #0x484]
    add r2, r2, #0x1
    cmp r2, #0x3
    movlt r0, #0x0
    ldmltia sp!, {r3, pc}
    bl func_ov002_0220dc44
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8

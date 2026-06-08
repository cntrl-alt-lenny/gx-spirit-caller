; func_ov002_0220ddac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ff400
        .extern func_ov002_0220dd34
        .global func_ov002_0220ddac
        .arm
func_ov002_0220ddac:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0x484]
    mov r4, r1
    add r2, r2, #0x1
    cmp r2, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    bl func_ov002_0220dd34
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff400
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288

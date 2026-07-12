; func_ov000_021adafc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c74ac
        .extern data_ov000_021c74e4
        .extern func_0201d4dc
        .extern func_02094410
        .global func_ov000_021adafc
        .arm
func_ov000_021adafc:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x29c]
    cmp r0, #0x0
    ldrne r4, [r1, #0x264]
    mov r0, #0x8
    moveq r4, #0x4a0
    bl func_0201d4dc
    add r1, r4, r0
    mov r0, #0x0
    mov r2, #0x1500
    bl func_02094410
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov000_021c74ac
_LIT1: .word data_ov000_021c74e4

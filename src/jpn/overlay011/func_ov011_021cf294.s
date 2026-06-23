; func_ov011_021cf294 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .extern data_ov011_021d4138
        .extern func_02018b60
        .extern func_020190f0
        .extern func_0201bec4
        .extern func_0201c64c
        .extern func_ov011_021d1eac
        .global func_ov011_021cf294
        .arm
func_ov011_021cf294:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    bl func_0201bec4
    bl func_0201c64c
    bl func_02018b60
    ldr r0, [r0]
    .word 0xebff87c1
    bl func_020190f0
    mov r2, r0
    ldr r0, _LIT1
    ldr r1, [r0, #0x2a4]
    mov r0, r1, lsl #0x17
    mov r0, r0, lsr #0x1c
    mov r1, r1, lsl #0xf
    mov r1, r1, lsr #0x1c
    bl func_ov011_021d1eac
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov011_021d4138
_LIT1: .word data_ov011_021d3f20

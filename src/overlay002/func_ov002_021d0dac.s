; func_ov002_021d0dac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern func_ov002_021ba7c4
        .extern func_ov002_021c9af0
        .extern func_ov002_0229ade0
        .global func_ov002_021d0dac
        .arm
func_ov002_021d0dac:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r2, [r0, #0x810]
    ldrh r1, [r0, #0x2]
    cmp r2, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x2
    bl func_ov002_021c9af0
    mov r0, #0x0
    bl func_ov002_021ba7c4
    mov r0, #0x1
    bl func_ov002_021ba7c4
    mov r1, #0x0
    mov r3, r1
    mov r0, #0x14
    mov r2, #0xd
    bl func_ov002_0229ade0
    mov r0, #0x14
    mov r1, #0x1
    mov r2, #0xd
    mov r3, #0x0
    bl func_ov002_0229ade0
    mov r1, #0x0
    ldr r0, _LIT0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce950

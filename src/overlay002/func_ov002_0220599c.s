; func_ov002_0220599c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021ff354
        .global func_ov002_0220599c
        .arm
func_ov002_0220599c:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    ldr r2, _LIT0
    ldr ip, [r2, #0xcec]
    mov r3, r3, lsl #0x1f
    cmp ip, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r2, [r2, #0xcf8]
    cmp r2, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_ov002_021ff354
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c

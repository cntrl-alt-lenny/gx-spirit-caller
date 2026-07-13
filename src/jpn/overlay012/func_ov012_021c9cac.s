; func_ov012_021c9cac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov012_021ca5fc
        .global func_ov012_021c9cac
        .arm
func_ov012_021c9cac:
    stmdb sp!, {r3, lr}
    .word 0xebff9b68
    .word 0xebffa19e
    bl func_ov012_021ca5fc
    ldmia sp!, {r3, pc}

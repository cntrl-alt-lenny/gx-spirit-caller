; func_ov011_021c9fcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov011_021cb198
        .extern func_ov011_021d17ec
        .global func_ov011_021c9fcc
        .arm
func_ov011_021c9fcc:
    stmdb sp!, {r3, lr}
    .word 0xebff9aa0
    .word 0xebffa0d6
    bl func_ov011_021cb198
    bl func_ov011_021d17ec
    ldmia sp!, {r3, pc}

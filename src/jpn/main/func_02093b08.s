; func_02093b08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern func_02093bf0
        .global func_02093b08
        .arm
func_02093b08:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
.L_8:
    bl OS_DisableIrq
    bl func_02093bf0
    b .L_8

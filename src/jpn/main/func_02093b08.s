; func_02093b08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_Halt
        .global func_02093b08
        .arm
func_02093b08:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
.L_8:
    bl OS_DisableIrq
    bl OS_Halt
    b .L_8

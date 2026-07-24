; func_02091618 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020936a8
        .extern OS_Halt
        .global func_02091618
        .arm
func_02091618:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_020936a8
.L_c:
    bl OS_Halt
    b .L_c

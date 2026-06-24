; func_020936a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020936a8
        .arm
func_020936a8:
    mrs r0, CPSR
    bic r1, r0, #0x80
    msr CPSR_c, r1
    and r0, r0, #0x80
    bx lr

; func_020936fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020936fc
        .arm
func_020936fc:
    mrs r1, CPSR
    bic r2, r1, #0xc0
    orr r2, r2, r0
    msr CPSR_c, r2
    and r0, r1, #0xc0
    bx lr

; OS_RestoreIrq — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global OS_RestoreIrq
        .global .L_020936e4
        .global .L_020936e8
        .global .L_020936ec
        .global .L_020936f0
        .global .L_020936f4
        .global .L_020936f8
        .arm
OS_RestoreIrq:
.L_020936e4:
    mrs r1, CPSR
.L_020936e8:
    bic r2, r1, #0x80
.L_020936ec:
    orr r2, r2, r0
.L_020936f0:
    msr CPSR_c, r2
.L_020936f4:
    and r0, r1, #0x80
.L_020936f8:
    bx lr

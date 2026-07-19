; OS_DisableIrq — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global OS_DisableIrq
        .global .L_020936bc
        .global .L_020936c0
        .global .L_020936c4
        .global .L_020936c8
        .global .L_020936cc
        .arm
OS_DisableIrq:
.L_020936bc:
    mrs r0, CPSR
.L_020936c0:
    orr r1, r0, #0x80
.L_020936c4:
    msr CPSR_c, r1
.L_020936c8:
    and r0, r0, #0x80
.L_020936cc:
    bx lr

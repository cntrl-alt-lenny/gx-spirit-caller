; func_020b2b74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b2b74
        .arm
func_020b2b74:
    mov r3, #-16777216
    cmp r3, r0, lsl #0x1
    cmpcs r3, r1, lsl #0x1
    bcc .L_338
    cmp r0, #0x0
    bicmi r0, r0, #-2147483648
    rsbmi r0, r0, #0x0
    cmp r1, #0x0
    bicmi r1, r1, #-2147483648
    rsbmi r1, r1, #0x0
    cmp r0, r1
    movgt r0, #0x1
    movle r0, #0x0
    mrs ip, CPSR
    bicle ip, ip, #0x20000000
    orrgt ip, ip, #0x20000000
    msr CPSR_f, ip
    bx lr
.L_338:
    mov r0, #0x0
    mrs ip, CPSR
    bic ip, ip, #0x20000000
    msr CPSR_f, ip
    bx lr

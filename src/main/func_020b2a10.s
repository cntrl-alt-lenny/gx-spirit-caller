; func_020b2a10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b2a10
        .arm
func_020b2a10:
    mov ip, #0x200000
    cmn ip, r1, lsl #0x1
    bcs .L_118
    cmn ip, r3, lsl #0x1
    bcs .L_12c
.L_ac:
    orrs ip, r3, r1
    bmi .L_e0
    cmp r1, r3
    cmpeq r0, r2
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
.L_c8:
    mov r0, #0x0
    mrs ip, CPSR
    bic ip, ip, #0x40000000
    orr ip, ip, #0x20000000
    msr CPSR_f, ip
    bx lr
.L_e0:
    orr ip, r0, ip, lsl #0x1
    orrs ip, ip, r2
    moveq r0, #0x1
    bne .L_104
    mrs ip, CPSR
    bic ip, ip, #0x20000000
    orr ip, ip, #0x40000000
    msr CPSR_f, ip
    bxeq lr
.L_104:
    cmp r3, r1
    cmpeq r2, r0
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
.L_118:
    bne .L_c8
    cmp r0, #0x0
    bhi .L_c8
    cmn ip, r3, lsl #0x1
    bcc .L_ac
.L_12c:
    bne .L_c8
    cmp r2, #0x0
    bhi .L_c8
    b .L_ac

; func_020b2ae8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b2ae8
        .arm
func_020b2ae8:
    mov ip, #0x200000
    cmn ip, r1, lsl #0x1
    bcs .L_2cc
    cmn ip, r3, lsl #0x1
    bcs .L_2e0
.L_278:
    orrs ip, r3, r1
    bmi .L_2a8
    cmp r1, r3
    cmpeq r0, r2
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_294:
    mov r0, #0x1
    mrs ip, CPSR
    bic ip, ip, #0x40000000
    msr CPSR_f, ip
    bx lr
.L_2a8:
    orr ip, r0, ip, lsl #0x1
    orrs ip, ip, r2
    moveq r0, #0x0
    bxeq lr
    cmp r3, r1
    cmpeq r2, r0
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.L_2cc:
    bne .L_294
    cmp r0, #0x0
    bhi .L_294
    cmn ip, r3, lsl #0x1
    bcc .L_278
.L_2e0:
    bne .L_294
    cmp r2, #0x0
    bhi .L_294
    b .L_278

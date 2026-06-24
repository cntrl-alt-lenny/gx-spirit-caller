; func_020b291c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b291c
        .arm
func_020b291c:
    mov ip, #0x200000
    cmn ip, r1, lsl #0x1
    bcs .L_80
    cmn ip, r3, lsl #0x1
    bcs .L_94
.L_14:
    orrs ip, r3, r1
    bmi .L_48
    cmp r1, r3
    cmpeq r0, r2
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
.L_30:
    mov r0, #0x0
    mrs ip, CPSR
    bic ip, ip, #0x40000000
    orr ip, ip, #0x20000000
    msr CPSR_f, ip
    bx lr
.L_48:
    orr ip, r0, ip, lsl #0x1
    orrs ip, ip, r2
    moveq r0, #0x1
    bne .L_6c
    mrs ip, CPSR
    bic ip, ip, #0x20000000
    orr ip, ip, #0x40000000
    msr CPSR_f, ip
    bxeq lr
.L_6c:
    cmp r3, r1
    cmpeq r2, r0
    movls r0, #0x1
    movhi r0, #0x0
    bx lr
.L_80:
    bne .L_30
    cmp r0, #0x0
    bhi .L_30
    cmn ip, r3, lsl #0x1
    bcc .L_14
.L_94:
    bne .L_30
    cmp r2, #0x0
    bhi .L_30
    b .L_14

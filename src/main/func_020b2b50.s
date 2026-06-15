; func_020b2b50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b2b50
        .arm
func_020b2b50:
    mov ip, #0x200000
    cmn ip, r1, lsl #0x1
    bcs .L_240
    cmn ip, r3, lsl #0x1
    bcs .L_254
.L_1ec:
    orrs ip, r3, r1
    bmi .L_21c
    cmp r1, r3
    cmpeq r0, r2
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_208:
    mov r0, #0x0
    mrs ip, CPSR
    bic ip, ip, #0x40000000
    msr CPSR_f, ip
    bx lr
.L_21c:
    orr ip, r0, ip, lsl #0x1
    orrs ip, ip, r2
    moveq r0, #0x1
    bxeq lr
    cmp r3, r1
    cmpeq r2, r0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.L_240:
    bne .L_208
    cmp r0, #0x0
    bhi .L_208
    cmn ip, r3, lsl #0x1
    bcc .L_1ec
.L_254:
    bne .L_208
    cmp r2, #0x0
    bhi .L_208
    b .L_1ec

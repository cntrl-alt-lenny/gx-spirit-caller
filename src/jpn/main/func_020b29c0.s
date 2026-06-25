; func_020b29c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b29c0
        .arm
func_020b29c0:
    mov ip, #0x200000
    cmn ip, r1, lsl #0x1
    bcs .L_1b4
    cmn ip, r3, lsl #0x1
    bcs .L_1c8
.L_150:
    orrs ip, r3, r1
    bmi .L_180
    cmp r1, r3
    cmpeq r0, r2
    movcc r0, #0x1
    movcs r0, #0x0
    bx lr
.L_16c:
    mov r0, #0x0
    mrs ip, CPSR
    orr ip, ip, #0x20000000
    msr CPSR_f, ip
    bx lr
.L_180:
    orr ip, r0, ip, lsl #0x1
    orrs ip, ip, r2
    moveq r0, #0x0
    bne .L_1a0
    mrs ip, CPSR
    orr ip, ip, #0x20000000
    msr CPSR_f, ip
    bxeq lr
.L_1a0:
    cmp r3, r1
    cmpeq r2, r0
    movcc r0, #0x1
    movcs r0, #0x0
    bx lr
.L_1b4:
    bne .L_16c
    cmp r0, #0x0
    bhi .L_16c
    cmn ip, r3, lsl #0x1
    bcc .L_150
.L_1c8:
    bne .L_16c
    cmp r2, #0x0
    bhi .L_16c
    b .L_150

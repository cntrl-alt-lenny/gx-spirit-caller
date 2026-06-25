; func_02094688 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02094688
        .arm
func_02094688:
    cmp r2, #0x0
    bxeq lr
    tst r1, #0x1
    beq .L_40
    ldrh ip, [r1, #-1]
    and ip, ip, #0xff
    tst r0, #0x1
    ldrneh r3, [r0, #-1]
    movne r3, r3, lsr #0x8
    ldreqh r3, [r0]
    orr r3, ip, r3, lsl #0x8
    strh r3, [r1, #-1]
    add r0, r0, #0x1
    add r1, r1, #0x1
    subs r2, r2, #0x1
    bxeq lr
.L_40:
    eor ip, r1, r0
    tst ip, #0x1
    beq .L_94
    bic r0, r0, #0x1
    ldrh ip, [r0], #0x2
    mov r3, ip, lsr #0x8
    subs r2, r2, #0x2
    bcc .L_78
.L_60:
    ldrh ip, [r0], #0x2
    orr ip, r3, ip, lsl #0x8
    strh ip, [r1], #0x2
    mov r3, ip, lsr #0x10
    subs r2, r2, #0x2
    bcs .L_60
.L_78:
    tst r2, #0x1
    bxeq lr
    ldrh ip, [r1]
    and ip, ip, #0xff00
    orr ip, ip, r3
    strh ip, [r1]
    bx lr
.L_94:
    tst ip, #0x2
    beq .L_c0
    bics r3, r2, #0x1
    beq .L_10c
    sub r2, r2, r3
    add ip, r3, r1
.L_ac:
    ldrh r3, [r0], #0x2
    strh r3, [r1], #0x2
    cmp r1, ip
    bcc .L_ac
    b .L_10c
.L_c0:
    cmp r2, #0x2
    bcc .L_10c
    tst r1, #0x2
    beq .L_e0
    ldrh r3, [r0], #0x2
    strh r3, [r1], #0x2
    subs r2, r2, #0x2
    bxeq lr
.L_e0:
    bics r3, r2, #0x3
    beq .L_100
    sub r2, r2, r3
    add ip, r3, r1
.L_f0:
    ldr r3, [r0], #0x4
    str r3, [r1], #0x4
    cmp r1, ip
    bcc .L_f0
.L_100:
    tst r2, #0x2
    ldrneh r3, [r0], #0x2
    strneh r3, [r1], #0x2
.L_10c:
    tst r2, #0x1
    bxeq lr
    ldrh r2, [r1]
    ldrh r0, [r0]
    and r2, r2, #0xff00
    and r0, r0, #0xff
    orr r0, r2, r0
    strh r0, [r1]
    bx lr

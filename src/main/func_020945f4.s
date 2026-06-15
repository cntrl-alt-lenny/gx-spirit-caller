; func_020945f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020945f4
        .arm
func_020945f4:
    cmp r2, #0x0
    bxeq lr
    tst r0, #0x1
    beq .L_2c
    ldrh ip, [r0, #-1]
    and ip, ip, #0xff
    orr r3, ip, r1, lsl #0x8
    strh r3, [r0, #-1]
    add r0, r0, #0x1
    subs r2, r2, #0x1
    bxeq lr
.L_2c:
    cmp r2, #0x2
    bcc .L_74
    orr r1, r1, r1, lsl #0x8
    tst r0, #0x2
    beq .L_4c
    strh r1, [r0], #0x2
    subs r2, r2, #0x2
    bxeq lr
.L_4c:
    orr r1, r1, r1, lsl #0x10
    bics r3, r2, #0x3
    beq .L_6c
    sub r2, r2, r3
    add ip, r3, r0
.L_60:
    str r1, [r0], #0x4
    cmp r0, ip
    bcc .L_60
.L_6c:
    tst r2, #0x2
    strneh r1, [r0], #0x2
.L_74:
    tst r2, #0x1
    bxeq lr
    ldrh r3, [r0]
    and r3, r3, #0xff00
    and r1, r1, #0xff
    orr r1, r1, r3
    strh r1, [r0]
    bx lr

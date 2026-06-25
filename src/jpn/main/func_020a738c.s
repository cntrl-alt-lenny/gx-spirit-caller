; func_020a738c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a738c
        .arm
func_020a738c:
    cmp r2, #0x20
    and r3, r1, #0xff
    bcc .L_94
    rsb r1, r0, #0x0
    ands ip, r1, #0x3
    beq .L_2c
    sub r2, r2, ip
    and r1, r3, #0xff
.L_20:
    strb r1, [r0], #0x1
    subs ip, ip, #0x1
    bne .L_20
.L_2c:
    cmp r3, #0x0
    beq .L_44
    mov r1, r3, lsl #0x10
    orr r1, r1, r3, lsl #0x18
    orr r1, r1, r3, lsl #0x8
    orr r3, r3, r1
.L_44:
    movs r1, r2, lsr #0x5
    beq .L_78
.L_4c:
    str r3, [r0]
    str r3, [r0, #0x4]
    str r3, [r0, #0x8]
    str r3, [r0, #0xc]
    str r3, [r0, #0x10]
    str r3, [r0, #0x14]
    str r3, [r0, #0x18]
    str r3, [r0, #0x1c]
    add r0, r0, #0x20
    subs r1, r1, #0x1
    bne .L_4c
.L_78:
    and r1, r2, #0x1f
    movs r1, r1, lsr #0x2
    beq .L_90
.L_84:
    str r3, [r0], #0x4
    subs r1, r1, #0x1
    bne .L_84
.L_90:
    and r2, r2, #0x3
.L_94:
    cmp r2, #0x0
    bxeq lr
    and r1, r3, #0xff
.L_a0:
    strb r1, [r0], #0x1
    subs r2, r2, #0x1
    bne .L_a0
    bx lr

; func_020a7480 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a7480
        .arm
func_020a7480:
    cmp r2, #0x20
    and r3, r1, #0xff
    bcc .L_12c
    rsb r1, r0, #0x0
    ands ip, r1, #0x3
    beq .L_c4
    sub r2, r2, ip
    and r1, r3, #0xff
.L_b8:
    strb r1, [r0], #0x1
    subs ip, ip, #0x1
    bne .L_b8
.L_c4:
    cmp r3, #0x0
    beq .L_dc
    mov r1, r3, lsl #0x10
    orr r1, r1, r3, lsl #0x18
    orr r1, r1, r3, lsl #0x8
    orr r3, r3, r1
.L_dc:
    movs r1, r2, lsr #0x5
    beq .L_110
.L_e4:
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
    bne .L_e4
.L_110:
    and r1, r2, #0x1f
    movs r1, r1, lsr #0x2
    beq .L_128
.L_11c:
    str r3, [r0], #0x4
    subs r1, r1, #0x1
    bne .L_11c
.L_128:
    and r2, r2, #0x3
.L_12c:
    cmp r2, #0x0
    bxeq lr
    and r1, r3, #0xff
.L_138:
    strb r1, [r0], #0x1
    subs r2, r2, #0x1
    bne .L_138
    bx lr

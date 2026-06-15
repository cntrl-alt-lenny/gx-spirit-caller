; func_020b0390 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b0390
        .arm
func_020b0390:
    add r3, r0, #0x5
    ldrb r2, [r3, r1]
    add ip, r3, r1
    cmp r2, #0x5
    movhi r0, #0x1
    bxhi lr
    mvncc r0, #0x0
    bxcc lr
    ldrb r2, [r0, #0x4]
    add ip, ip, #0x1
    add r3, r3, r2
    cmp ip, r3
    bcs .L_50
.L_34:
    ldrb r2, [ip]
    cmp r2, #0x0
    movne r0, #0x1
    bxne lr
    add ip, ip, #0x1
    cmp ip, r3
    bcc .L_34
.L_50:
    sub r1, r1, #0x1
    add r0, r0, r1
    ldrb r0, [r0, #0x5]
    tst r0, #0x1
    movne r0, #0x1
    mvneq r0, #0x0
    bx lr

; func_02072444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02072444
        .arm
func_02072444:
    mov r2, #0x218
    strh r2, [r1, #0x2e]
    ldrb r2, [r0, #0xc]
    add r3, r0, #0x14
    and r2, r2, #0xf0
    mov r0, r2, asr #0x1
    add r0, r2, r0, lsr #0x1e
    mov r0, r0, asr #0x2
    subs r0, r0, #0x14
    sub ip, r0, #0x1
    bxeq lr
.L_2c:
    ldrb r0, [r3], #0x1
    cmp r0, #0x0
    bxeq lr
    cmp r0, #0x1
    beq .L_74
    cmp r0, #0x2
    bne .L_64
    ldrb r2, [r3, #0x1]
    ldrb r0, [r3, #0x2]
    add r3, r3, #0x3
    sub ip, ip, #0x3
    orr r0, r0, r2, lsl #0x8
    strh r0, [r1, #0x2e]
    b .L_74
.L_64:
    ldrb r0, [r3]
    sub r0, r0, #0x1
    sub ip, ip, r0
    add r3, r3, r0
.L_74:
    cmp ip, #0x0
    sub ip, ip, #0x1
    bne .L_2c
    bx lr

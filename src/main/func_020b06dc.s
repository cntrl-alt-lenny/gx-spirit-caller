; func_020b06dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b03fc
        .global func_020b06dc
        .arm
func_020b06dc:
    stmdb sp!, {r3, lr}
    strh r2, [r0, #0x2]
    mov ip, #0x0
    strb ip, [r0]
    b .L_2b8
.L_2a4:
    ldrsb r3, [r1], #0x1
    add r2, r0, ip
    add ip, ip, #0x1
    sub r3, r3, #0x30
    strb r3, [r2, #0x5]
.L_2b8:
    cmp ip, #0x20
    bge .L_2cc
    ldrsb r2, [r1]
    cmp r2, #0x0
    bne .L_2a4
.L_2cc:
    strb ip, [r0, #0x4]
    ldrsb r2, [r1]
    cmp r2, #0x0
    ldmeqia sp!, {r3, pc}
    cmp r2, #0x5
    ldmltia sp!, {r3, pc}
    bgt .L_320
    ldrsb r2, [r1, #0x1]
    add r1, r1, #0x1
    cmp r2, #0x0
    beq .L_30c
.L_2f8:
    cmp r2, #0x30
    bne .L_320
    ldrsb r2, [r1, #0x1]!
    cmp r2, #0x0
    bne .L_2f8
.L_30c:
    sub r1, ip, #0x1
    add r1, r0, r1
    ldrb r1, [r1, #0x5]
    tst r1, #0x1
    ldmeqia sp!, {r3, pc}
.L_320:
    ldrb r1, [r0, #0x4]
    bl func_020b03fc
    ldmia sp!, {r3, pc}

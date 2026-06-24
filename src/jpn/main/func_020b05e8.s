; func_020b05e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b0308
        .global func_020b05e8
        .arm
func_020b05e8:
    stmdb sp!, {r3, lr}
    strh r2, [r0, #0x2]
    mov ip, #0x0
    strb ip, [r0]
    b .L_278
.L_264:
    ldrsb r3, [r1], #0x1
    add r2, r0, ip
    add ip, ip, #0x1
    sub r3, r3, #0x30
    strb r3, [r2, #0x5]
.L_278:
    cmp ip, #0x20
    bge .L_28c
    ldrsb r2, [r1]
    cmp r2, #0x0
    bne .L_264
.L_28c:
    strb ip, [r0, #0x4]
    ldrsb r2, [r1]
    cmp r2, #0x0
    ldmeqia sp!, {r3, pc}
    cmp r2, #0x5
    ldmltia sp!, {r3, pc}
    bgt .L_2e0
    ldrsb r2, [r1, #0x1]
    add r1, r1, #0x1
    cmp r2, #0x0
    beq .L_2cc
.L_2b8:
    cmp r2, #0x30
    bne .L_2e0
    ldrsb r2, [r1, #0x1]!
    cmp r2, #0x0
    bne .L_2b8
.L_2cc:
    sub r1, ip, #0x1
    add r1, r0, r1
    ldrb r1, [r1, #0x5]
    tst r1, #0x1
    ldmeqia sp!, {r3, pc}
.L_2e0:
    ldrb r1, [r0, #0x4]
    bl func_020b0308
    ldmia sp!, {r3, pc}

; func_020a84c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a84c8
        .arm
func_020a84c8:
    stmdb sp!, {r4, lr}
    cmp r1, #0x0
    bge .L_1108
.L_10ec:
    mov r1, #0x0
    strh r1, [r0, #0x2]
    mov r1, #0x1
    strb r1, [r0, #0x4]
    mov r1, #0x30
    strb r1, [r0, #0x5]
    ldmia sp!, {r4, pc}
.L_1108:
    ldrb lr, [r0, #0x4]
    cmp r1, lr
    ldmgeia sp!, {r4, pc}
    add ip, r0, #0x5
    add r2, ip, r1
    add r2, r2, #0x1
    ldrsb r3, [r2, #-1]!
    sub r3, r3, #0x30
    mov r3, r3, lsl #0x18
    mov r3, r3, asr #0x18
    cmp r3, #0x5
    bne .L_1168
    add ip, ip, lr
.L_113c:
    sub ip, ip, #0x1
    cmp ip, r2
    bls .L_1154
    ldrsb r3, [ip]
    cmp r3, #0x30
    beq .L_113c
.L_1154:
    cmp ip, r2
    ldreqsb r3, [r2, #-1]
    andeq r4, r3, #0x1
    movne r4, #0x1
    b .L_1170
.L_1168:
    movgt r4, #0x1
    movle r4, #0x0
.L_1170:
    cmp r1, #0x0
    beq .L_11cc
    mov ip, #0x0
    mov lr, #0x1
.L_1180:
    ldrsb r3, [r2, #-1]!
    sub r3, r3, #0x30
    add r3, r3, r4
    mov r3, r3, lsl #0x18
    mov r3, r3, asr #0x18
    cmp r3, #0x9
    movgt r4, lr
    movle r4, ip
    cmp r4, #0x0
    bne .L_11b0
    cmp r3, #0x0
    bne .L_11b8
.L_11b0:
    sub r1, r1, #0x1
    b .L_11c4
.L_11b8:
    add r3, r3, #0x30
    strb r3, [r2]
    b .L_11cc
.L_11c4:
    cmp r1, #0x0
    bne .L_1180
.L_11cc:
    cmp r4, #0x0
    beq .L_11f4
    ldrsh r3, [r0, #0x2]
    mov r2, #0x1
    mov r1, #0x31
    add r3, r3, #0x1
    strh r3, [r0, #0x2]
    strb r2, [r0, #0x4]
    strb r1, [r0, #0x5]
    ldmia sp!, {r4, pc}
.L_11f4:
    cmp r1, #0x0
    beq .L_10ec
    strb r1, [r0, #0x4]
    ldmia sp!, {r4, pc}

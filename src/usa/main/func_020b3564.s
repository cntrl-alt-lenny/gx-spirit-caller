; func_020b3564 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b377c
        .global func_020b3564
        .arm
func_020b3564:
    stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
    eor r4, r1, r3
    mov r4, r4, asr #0x1
    mov r4, r4, lsl #0x1
    orrs r5, r3, r2
    bne .L_20
    ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
    bx lr
.L_20:
    mov r5, r0, lsr #0x1f
    add r5, r5, r1
    mov r6, r2, lsr #0x1f
    add r6, r6, r3
    orrs r6, r5, r6
    bne .L_54
    mov r1, r2
    bl func_020b377c
    ands r4, r4, #0x1
    movne r0, r1
    mov r1, r0, asr #0x1f
    ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
    bx lr
.L_54:
    cmp r1, #0x0
    bge .L_64
    rsbs r0, r0, #0x0
    rsc r1, r1, #0x0
.L_64:
    cmp r3, #0x0
    bge .L_74
    rsbs r2, r2, #0x0
    rsc r3, r3, #0x0
.L_74:
    orrs r5, r1, r0
    beq .L_198
    mov r5, #0x0
    mov r6, #0x1
    cmp r3, #0x0
    bmi .L_a0
.L_8c:
    add r5, r5, #0x1
    adds r2, r2, r2
    adcs r3, r3, r3
    bpl .L_8c
    add r6, r6, r5
.L_a0:
    cmp r1, #0x0
    blt .L_c0
.L_a8:
    cmp r6, #0x1
    beq .L_c0
    sub r6, r6, #0x1
    adds r0, r0, r0
    adcs r1, r1, r1
    bpl .L_a8
.L_c0:
    mov r7, #0x0
    mov ip, #0x0
    mov fp, #0x0
    b .L_e8
.L_d0:
    orr ip, ip, #0x1
    subs r6, r6, #0x1
    beq .L_140
    adds r0, r0, r0
    adcs r1, r1, r1
    adcs r7, r7, r7
.L_e8:
    subs r0, r0, r2
    sbcs r1, r1, r3
    sbcs r7, r7, #0x0
    adds ip, ip, ip
    adc fp, fp, fp
    cmp r7, #0x0
    bge .L_d0
.L_104:
    subs r6, r6, #0x1
    beq .L_138
    adds r0, r0, r0
    adcs r1, r1, r1
    adc r7, r7, r7
    adds r0, r0, r2
    adcs r1, r1, r3
    adc r7, r7, #0x0
    adds ip, ip, ip
    adc fp, fp, fp
    cmp r7, #0x0
    bge .L_d0
    b .L_104
.L_138:
    adds r0, r0, r2
    adc r1, r1, r3
.L_140:
    ands r7, r4, #0x1
    moveq r0, ip
    moveq r1, fp
    beq .L_178
    subs r7, r5, #0x20
    movge r0, r1, lsr r7
    bge .L_19c
    rsb r7, r5, #0x20
    mov r0, r0, lsr r5
    orr r0, r0, r1, lsl r7
    mov r1, r1, lsr r5
    b .L_178
    mov r0, r1, lsr r7
    mov r1, #0x0
.L_178:
    cmp r4, #0x0
    blt .L_188
    ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
    bx lr
.L_188:
    rsbs r0, r0, #0x0
    rsc r1, r1, #0x0
    ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
    bx lr
.L_198:
    mov r0, #0x0
.L_19c:
    mov r1, #0x0
    cmp r4, #0x0
    blt .L_188
    ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
    bx lr

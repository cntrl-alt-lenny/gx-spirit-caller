; func_02043728 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02043728
        .arm
func_02043728:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ands r4, r1, #0x3
    addne sp, sp, #0x8
    mvnne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r6, #0x0
    mov r5, r6
    cmp r1, #0x0
    bls .L_55c
.L_544:
    ldrsb r4, [r0, r5]
    add r5, r5, #0x1
    cmp r4, #0x2a
    addne r6, r6, #0x6
    cmp r5, r1
    bcc .L_544
.L_55c:
    cmp r2, #0x0
    moveq r0, r6, asr #0x2
    addeq r0, r6, r0, lsr #0x1d
    addeq sp, sp, #0x8
    moveq r0, r0, asr #0x3
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r4, r6, asr #0x2
    add r4, r6, r4, lsr #0x1d
    mov r4, r4, asr #0x3
    cmp r3, r4
    addcc sp, sp, #0x8
    mvncc r0, #0x0
    ldmccia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r1, #0x0
    moveq r0, #0x0
    streqb r0, [r2]
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r6, r2
    add ip, sp, #0x0
    mov lr, #0x0
    mov r1, #0x3f
    mov r3, #0x3e
.L_5b8:
    mov r8, lr
    mov r5, ip
.L_5c0:
    ldrsb r7, [r0, r8]
    cmp r7, #0x41
    blt .L_5dc
    cmp r7, #0x5a
    suble r7, r7, #0x41
    strleb r7, [r5]
    ble .L_624
.L_5dc:
    cmp r7, #0x61
    blt .L_5f4
    cmp r7, #0x7a
    suble r7, r7, #0x47
    strleb r7, [r5]
    ble .L_624
.L_5f4:
    cmp r7, #0x30
    blt .L_60c
    cmp r7, #0x39
    addle r7, r7, #0x4
    strleb r7, [r5]
    ble .L_624
.L_60c:
    cmp r7, #0x2e
    streqb r3, [r5]
    beq .L_624
    cmp r7, #0x2d
    streqb r1, [r5]
    strneb lr, [r5]
.L_624:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r5, r5, #0x1
    blt .L_5c0
    ldrsb r8, [sp]
    ldrsb r7, [sp, #0x1]
    add r5, r6, #0x1
    mov r8, r8, lsl #0x2
    orr r7, r8, r7, asr #0x4
    sub r5, r5, r2
    strb r7, [r6]
    cmp r5, r4
    add r0, r0, #0x4
    bge .L_6a0
    ldrsb r8, [sp, #0x1]
    ldrsb r7, [sp, #0x2]
    add r5, r6, #0x2
    mov r8, r8, lsl #0x4
    orr r7, r8, r7, asr #0x2
    sub r5, r5, r2
    strb r7, [r6, #0x1]
    cmp r5, r4
    bge .L_6a0
    ldrsb r7, [sp, #0x2]
    ldrsb r5, [sp, #0x3]
    orr r5, r5, r7, lsl #0x6
    strb r5, [r6, #0x2]
    add r6, r6, #0x3
    sub r5, r6, r2
    cmp r5, r4
    blt .L_5b8
.L_6a0:
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}

; func_ov004_021cc950 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov004_0220b2a0
        .extern func_020060f4
        .extern func_02006110
        .extern func_02006160
        .extern func_02006178
        .extern func_020371b8
        .extern func_ov000_021abe48
        .extern func_ov000_021abe60
        .extern func_ov000_021abe70
        .extern func_ov000_021ac064
        .extern func_ov004_021cbf34
        .extern func_ov004_021cc210
        .extern func_ov004_021cc2e0
        .extern func_ov004_021cc66c
        .extern func_ov004_021cc6dc
        .global func_ov004_021cc950
        .arm
func_ov004_021cc950:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    ldr r8, _LIT0
    mov r1, #0x0
    str r1, [r8, #0x9c]
    str r1, [r8, #0xa0]
    sub r0, r1, #0x1
    str r0, [r8, #0xa8]
    ldr r0, [r8, #0x8c]
    cmp r0, #0x100
    addge sp, sp, #0x10
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r8, #0xa4]
    ldr r5, [r8, #0x98]
    str r1, [r8, #0x94]
    cmp r0, #0x0
    movge r1, r0
    str r1, [r8, #0xa4]
    cmp r5, #0x20
    bge .L_a4
    mov r4, #0x0
    mov r6, #0x6
.L_58:
    mov r0, r5
    mov r1, r4
    bl func_ov004_021cc66c
    cmp r0, #0x0
    beq .L_98
    ldr r3, [r8, #0x98]
    add r0, r5, #0x1
    cmp r3, r0
    movle r3, r0
    mul r0, r3, r6
    ldr r2, [r8, #0x200]
    mov r1, r0, lsl #0x10
    mov r0, r2, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    str r3, [r8, #0x98]
    str r0, [r8, #0x200]
.L_98:
    add r5, r5, #0x1
    cmp r5, #0x20
    blt .L_58
.L_a4:
    ldr r4, _LIT1
    ldr r6, _LIT2
    mov r9, #0x0
    add r7, r8, #0xb8
    mov r5, #0x5
.L_b8:
    ldr r0, [r8, #0xa4]
    sub r1, r0, #0x8
    mov r0, r1, lsr #0x1f
    smull r1, r2, r4, r1
    add r2, r0, r2, asr #0x3
    add r0, r2, r9
    mov r1, r0, lsr #0x1f
    smull r2, r3, r6, r0
    add r3, r1, r3, asr #0x1
    smull r1, r2, r5, r3
    sub r3, r0, r1
    add r1, r7, r3, lsl #0x5
    bl func_ov004_021cc66c
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_b8
    ldr r0, [r8, #0x98]
    cmp r0, #0x4
    movge r1, #0x1
    movlt r1, #0x0
    add r0, r8, #0x1f8
    bl func_ov000_021abe48
    ldr r0, [r8, #0x8c]
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    add r0, r8, #0x1f8
    bl func_ov000_021ac064
    add r0, r8, #0x1f8
    bl func_ov000_021abe60
    mov r0, r0, lsl #0x3
    str r0, [r8, #0xa4]
    bl func_02006178
    cmp r0, #0x0
    bne .L_150
    bl func_02006160
    cmp r0, #0x0
    beq .L_214
.L_150:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    add r0, sp, #0xc
    add r1, sp, #0x8
    bl func_020060f4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    blt .L_478
    cmp r0, #0xec
    bge .L_478
    ldr r2, [sp, #0x8]
    cmp r2, #0x20
    ldrge r0, [sp]
    cmpge r0, #0x20
    blt .L_478
    ldr r0, [r8, #0xa4]
    ldr r1, _LIT1
    add r0, r0, r2
    sub r6, r0, #0x20
    smull r0, r5, r1, r6
    smull r0, r4, r1, r6
    mov r3, r6, lsr #0x1f
    add r5, r3, r5, asr #0x3
    mov r2, #0x30
    smull r0, r1, r2, r5
    add r4, r3, r4, asr #0x3
    sub r5, r6, r0
    cmp r5, #0x2e
    movge r0, #0x1
    mov r1, r4, lsr #0x1f
    strge r0, [r8, #0x60]
    rsb r0, r1, r4, lsl #0x1e
    add r1, r1, r0, ror #0x1e
    str r4, [r8, #0x90]
    add r0, r8, r1, lsl #0x5
    ldr r0, [r0, #0x158]
    cmp r0, #0x1
    cmpne r0, #0x6
    beq .L_1f8
    cmp r0, #0xfa0
    bcc .L_478
.L_1f8:
    str r1, [r8, #0xa8]
    bl func_02006160
    cmp r0, #0x0
    beq .L_478
    mov r0, r4
    bl func_ov004_021cc6dc
    b .L_478
.L_214:
    ldr r0, _LIT3
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    beq .L_2b0
    ldr r0, [r8, #0x90]
    cmp r0, #0x0
    bge .L_240
    mov r0, #0x1
    str r0, [r8, #0x9c]
    bl func_ov004_021cbf34
    b .L_478
.L_240:
    mov r1, #0x30
    mul r2, r0, r1
    ldr r4, [r8, #0xa4]
    cmp r2, r4
    blt .L_478
    add r2, r0, #0x1
    mul r3, r2, r1
    add r1, r4, #0xa0
    cmp r3, r1
    bgt .L_478
    mov r1, #0x0
    bl func_ov004_021cc66c
    cmp r0, #0x0
    beq .L_478
    ldr r0, [r8, #0x90]
    mov r2, r0, lsr #0x1f
    rsb r1, r2, r0, lsl #0x1e
    add r1, r2, r1, ror #0x1e
    str r1, [r8, #0xa8]
    add r1, r8, r1, lsl #0x5
    ldr r1, [r1, #0x158]
    cmp r1, #0x1
    cmpne r1, #0x6
    beq .L_2a8
    cmp r1, #0xfa0
    bcc .L_478
.L_2a8:
    bl func_ov004_021cc6dc
    b .L_478
.L_2b0:
    ldr r0, [r8, #0x98]
    mov r4, #0x0
    mov r5, r4
    mov r7, r4
    cmp r0, #0x0
    ble .L_2f4
    mov r6, r4
.L_2cc:
    mov r0, r7
    mov r1, r6
    bl func_ov004_021cc66c
    cmp r0, #0x0
    movne r5, r7
    ldr r0, [r8, #0x98]
    add r7, r7, #0x1
    addne r4, r4, #0x1
    cmp r7, r0
    blt .L_2cc
.L_2f4:
    cmp r4, #0x0
    mvneq r0, #0x0
    streq r0, [r8, #0x90]
    ldr r0, _LIT3
    ldrh r0, [r0, #0x56]
    tst r0, #0x40
    beq .L_3b8
    ldr r1, [r8, #0x90]
    mvn r0, #0x0
    cmp r1, #0x0
    streq r0, [r8, #0x90]
    beq .L_478
    str r0, [r8, #0x90]
    subs r5, r1, #0x1
    bmi .L_478
    mov r4, #0x0
.L_334:
    mov r0, r5
    mov r1, r4
    bl func_ov004_021cc66c
    cmp r0, #0x0
    beq .L_3ac
    mov r0, #0x30
    mul r4, r5, r0
    ldr r3, [r8, #0xa4]
    str r5, [r8, #0x90]
    cmp r4, r3
    strlt r4, [r8, #0xa4]
    blt .L_37c
    add r1, r5, #0x1
    mul r2, r1, r0
    add r0, r3, #0xa0
    cmp r2, r0
    subgt r0, r4, #0x70
    strgt r0, [r8, #0xa4]
.L_37c:
    ldr r2, [r8, #0xa4]
    add r0, r8, #0x1f8
    mov r1, r2, asr #0x2
    add r1, r2, r1, lsr #0x1d
    mov r1, r1, asr #0x3
    bl func_ov000_021abe70
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_478
.L_3ac:
    subs r5, r5, #0x1
    bpl .L_334
    b .L_478
.L_3b8:
    tst r0, #0x80
    beq .L_464
    ldr r1, [r8, #0x90]
    ldr r0, [r8, #0x98]
    add r4, r1, #0x1
    cmp r4, r0
    bge .L_478
    mov r5, #0x0
.L_3d8:
    mov r0, r4
    mov r1, r5
    bl func_ov004_021cc66c
    cmp r0, #0x0
    beq .L_450
    mov r0, #0x30
    mul r5, r4, r0
    ldr r3, [r8, #0xa4]
    str r4, [r8, #0x90]
    cmp r5, r3
    strlt r5, [r8, #0xa4]
    blt .L_420
    add r1, r4, #0x1
    mul r2, r1, r0
    add r0, r3, #0xa0
    cmp r2, r0
    subgt r0, r5, #0x70
    strgt r0, [r8, #0xa4]
.L_420:
    ldr r2, [r8, #0xa4]
    add r0, r8, #0x1f8
    mov r1, r2, asr #0x2
    add r1, r2, r1, lsr #0x1d
    mov r1, r1, asr #0x3
    bl func_ov000_021abe70
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_478
.L_450:
    ldr r0, [r8, #0x98]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_3d8
    b .L_478
.L_464:
    cmp r4, #0x1
    bne .L_478
    ldr r0, [r8, #0x90]
    cmp r0, #0x0
    strge r5, [r8, #0x90]
.L_478:
    bl func_ov004_021cc210
    ldr r1, [r8, #0x9c]
    orr r0, r1, r0
    str r0, [r8, #0x9c]
    bl func_ov004_021cc2e0
    str r0, [r8, #0xa0]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word 0x2aaaaaab
_LIT2: .word 0x66666667
_LIT3: .word data_02104acc

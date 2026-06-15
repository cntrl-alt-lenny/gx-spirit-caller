; func_0204b410 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_0204b850
        .extern func_0204bc4c
        .extern func_0204bf44
        .extern func_020930b0
        .extern func_020b3808
        .global func_0204b410
        .arm
func_0204b410:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x8
    beq .L_378
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xe
    beq .L_378
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xf
    bne .L_3bc
.L_378:
    bl func_020930b0
    mov r4, r0
    mov r5, r1
    bl func_020498f0
    ldr r1, [r0, #0x1e8]
    ldr r0, [r0, #0x1ec]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    mov r4, r0
    mov r5, r1
    b .L_3c8
.L_3bc:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_3c8:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x8
    beq .L_3ec
    cmp r0, #0xe
    beq .L_420
    cmp r0, #0xf
    beq .L_528
    b .L_548
.L_3ec:
    ldr r0, _LIT1
    cmp r5, #0x0
    cmpeq r4, r0
    bls .L_548
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    mov r1, #0xe
    bl func_0204b850
    cmp r0, #0x0
    bne .L_548
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_420:
    ldr r0, _LIT1
    cmp r5, #0x0
    cmpeq r4, r0
    bls .L_548
    bl func_020498f0
    ldrb r1, [r0, #0x1ac]
    add r1, r1, #0x1
    strb r1, [r0, #0x1ac]
    bl func_020498f0
    ldrb r0, [r0, #0x1ac]
    cmp r0, #0x5
    bls .L_4ac
    bl func_020498f0
    ldr r0, [r0, #0x1d8]
    bl func_0204bc4c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_4a0
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1ac]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0x1e8]
    str r1, [r4, #0x1ec]
    b .L_548
.L_4a0:
    mov r0, #0x2
    bl func_0204bf44
    b .L_548
.L_4ac:
    mov r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_548
    mov r5, #0xd
    mov r6, r4
.L_4c8:
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    add r0, r0, r4
    ldrb r0, [r0, #0x2d0]
    ldr r1, [r7, #0x1d8]
    mov r0, r6, lsl r0
    ands r0, r1, r0
    bne .L_510
    bl func_020498f0
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xf4]
    mov r1, r5
    bl func_0204b850
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_510:
    add r4, r4, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_4c8
    b .L_548
.L_528:
    bl func_020498f0
    add r0, r0, #0x100
    ldrh r0, [r0, #0xb2]
    cmp r5, r0, asr #0x1f
    cmpeq r4, r0
    bls .L_548
    mov r0, #0x2
    bl func_0204bf44
.L_548:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x000082ea
_LIT1: .word 0x00001770

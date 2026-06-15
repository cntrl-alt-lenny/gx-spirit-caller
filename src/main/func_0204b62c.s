; func_0204b62c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020469b4
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204b0d0
        .extern func_0204b134
        .extern func_0204b850
        .extern func_0204bdc4
        .extern func_0204bf44
        .extern func_020930b0
        .extern func_020b3808
        .global func_0204b62c
        .arm
func_0204b62c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_020469b4
    cmp r0, #0x6
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r5, #0xd
    beq .L_598
    cmp r5, #0xe
    beq .L_5d4
    cmp r5, #0xf
    beq .L_75c
    b .L_774
.L_598:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x8
    beq .L_5b8
    mov r0, #0x8
    bl func_020498dc
    mov r0, r4
    bl func_0204bdc4
.L_5b8:
    mov r0, r6
    mov r1, #0xe
    bl func_0204b850
    cmp r0, #0x0
    bne .L_774
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_5d4:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xe
    bne .L_740
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
    mov r2, r0, lsr #0x1
    mov r0, r1, lsr #0x1
    cmp r0, #0x0
    orr r2, r2, r1, lsl #0x1f
    cmpeq r2, #0x12c
    bls .L_6a0
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
    mov r3, r0, lsr #0x1
    mov r0, #0x12c
    orr r3, r3, r1, lsl #0x1f
    rsb r0, r0, #0x0
    mvn r2, #0x0
    adds r5, r3, r0
    adc r4, r2, r1, lsr #0x1
    bl func_020498f0
    add r0, r0, #0x100
    ldrh r0, [r0, #0xb2]
    cmp r4, r0, asr #0x1f
    cmpeq r5, r0
    bls .L_6a0
    bl func_020498f0
    add r0, r0, #0x100
    strh r5, [r0, #0xb2]
.L_6a0:
    mov r0, r6
    mov r1, #0x0
    bl func_0204b134
    mov r4, r0
    cmp r4, #0xff
    beq .L_6cc
    bl func_020498f0
    ldr r2, [r0, #0x1d8]
    mov r1, #0x1
    orr r1, r2, r1, lsl r4
    str r1, [r0, #0x1d8]
.L_6cc:
    mov r0, #0x1
    bl func_0204b0d0
    mov r4, r0
    bl func_020498f0
    ldr r0, [r0, #0x1d8]
    cmp r4, r0
    bne .L_774
    mov r5, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_734
    mov r4, #0xf
.L_700:
    bl func_020498f0
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0xf4]
    mov r1, r4
    bl func_0204b850
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r5, r5, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r5, r0
    ble .L_700
.L_734:
    mov r0, #0xf
    bl func_020498dc
    b .L_774
.L_740:
    mov r0, r6
    mov r1, #0xf
    bl func_0204b850
    cmp r0, #0x0
    bne .L_774
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_75c:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x8
    bne .L_774
    mov r0, #0x2
    bl func_0204bf44
.L_774:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000082ea

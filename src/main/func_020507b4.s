; func_020507b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045280
        .extern func_020469b4
        .extern func_020498f0
        .extern func_02049990
        .extern func_0204aaf4
        .extern func_0204abfc
        .extern func_0204b410
        .extern func_0204b8d0
        .extern func_0204be40
        .extern func_0204bf00
        .extern func_0204cb54
        .extern func_0204cc20
        .extern func_0204ce90
        .extern func_0204d284
        .extern func_0204d438
        .extern func_0204ead0
        .extern func_0204f0a8
        .extern func_0204f820
        .extern func_02050054
        .extern func_02050118
        .extern func_02051168
        .extern func_020627a8
        .extern func_0206553c
        .extern func_02067608
        .extern func_02068d0c
        .extern func_020930b0
        .extern func_020b3808
        .global func_020507b4
        .arm
func_020507b4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_020498f0
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_02045280
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    cmp r4, #0x0
    bne .L_6f0
    bl func_020498f0
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_6c4
    bl func_020498f0
    ldr r0, [r0, #0x10]
    bl func_02067608
.L_6c4:
    bl func_020498f0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_020627a8
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_6f0:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xd
    addls pc, pc, r0, lsl #0x2
    b .L_e10
    b .L_e10
    b .L_d18
    b .L_8c4
    b .L_8c4
    b .L_750
    b .L_8c4
    b .L_e10
    b .L_97c
    b .L_e10
    b .L_e10
    b .L_e10
    b .L_b04
    b .L_e10
    b .L_bf8
.L_750:
    bl func_020498f0
    ldr r0, [r0, #0x1c8]
    cmp r0, #0x0
    beq .L_83c
    bl func_020930b0
    mov r6, r0
    mov r7, r1
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    mov r4, r0
    ldr r1, [r5, #0x1cc]
    ldr r0, [r5, #0x1d0]
    subs r2, r6, r1
    sbc r0, r7, r0
    mov r1, r0, lsl #0x6
    orr r1, r1, r2, lsr #0x1a
    mov r0, r2, lsl #0x6
    ldr r2, _LIT0
    mov r3, #0x0
    bl func_020b3808
    cmp r1, #0x0
    ldr r1, [r4, #0x1c8]
    cmpeq r0, r1
    bls .L_83c
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1c8]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_828
    bl func_020498f0
    ldrb r1, [r0, #0x1aa]
    add r1, r1, #0x1
    strb r1, [r0, #0x1aa]
    bl func_020498f0
    ldrb r0, [r0, #0x1aa]
    cmp r0, #0x5
    bls .L_804
    ldr r1, _LIT1
    mov r0, #0x6
    bl func_02050054
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_804:
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    mov r1, #0x0
    bl func_0204d284
    bl func_0204d438
    cmp r0, #0x0
    beq .L_83c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_828:
    mov r0, #0x0
    bl func_0204ce90
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_83c:
    bl func_020498f0
    ldr r0, [r0, #0x1bc]
    cmp r0, #0x0
    beq .L_e10
    bl func_020498f0
    ldrb r1, [r0, #0xd]
    ldr r0, _LIT2
    mla r5, r1, r0, r0
    bl func_020930b0
    mov r4, r0
    mov r6, r1
    bl func_020498f0
    ldr r1, [r0, #0x1c0]
    ldr r0, [r0, #0x1c4]
    subs r2, r4, r1
    sbc r0, r6, r0
    mov r1, r0, lsl #0x6
    orr r1, r1, r2, lsr #0x1a
    mov r0, r2, lsl #0x6
    ldr r2, _LIT0
    mov r3, #0x0
    bl func_020b3808
    cmp r1, #0x0
    cmpeq r0, r5
    bcc .L_e10
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    mov r1, #0x0
    bl func_0204d284
    bl func_0204d438
    cmp r0, #0x0
    beq .L_e10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_8c4:
    bl func_020498f0
    ldr r0, [r0, #0xe8]
    cmp r0, #0x0
    ble .L_e10
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x3
    bne .L_8f8
    bl func_020498f0
    ldrb r1, [r0, #0xd]
    ldr r0, _LIT2
    mla r5, r1, r0, r0
    b .L_90c
.L_8f8:
    bl func_020498f0
    ldr r0, [r0, #0xe8]
    cmp r0, #0x1
    moveq r5, #0x3e8
    ldrne r5, _LIT2
.L_90c:
    bl func_020930b0
    mov r4, r0
    mov r6, r1
    bl func_020498f0
    ldr r1, [r0, #0xec]
    ldr r0, [r0, #0xf0]
    subs r3, r4, r1
    sbc r0, r6, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    cmp r1, #0x0
    cmpeq r0, r5
    bls .L_e10
    bl func_020498f0
    ldr r0, [r0, #0x204]
    bl func_0204f0a8
    bl func_0204aaf4
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0xe8]
    b .L_e10
.L_97c:
    bl func_020498f0
    ldr r2, [r0, #0x18c]
    ldr r1, [r0, #0x190]
    mov r0, #0x0
    cmp r1, r0
    cmpeq r2, r0
    beq .L_a0c
    bl func_020930b0
    mov r4, r0
    mov r5, r1
    bl func_020498f0
    ldr r1, [r0, #0x18c]
    ldr r0, [r0, #0x190]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, _LIT3
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_e10
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x18c]
    str r1, [r0, #0x190]
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    bl func_0204cb54
    cmp r0, #0x0
    bne .L_e10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_a0c:
    bl func_020498f0
    ldrb r0, [r0, #0x3cc]
    cmp r0, #0x6
    bne .L_e10
    bl func_020930b0
    mov r4, r0
    mov r5, r1
    bl func_020498f0
    ldr r1, [r0, #0x45c]
    ldr r0, [r0, #0x460]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, _LIT4
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_e10
    bl func_020498f0
    ldrb r1, [r0, #0x3cd]
    add r1, r1, #0x1
    strb r1, [r0, #0x3cd]
    bl func_020498f0
    ldrb r0, [r0, #0x3cd]
    cmp r0, #0x5
    bls .L_aa4
    bl func_02050118
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    bl func_0204cb54
    cmp r0, #0x0
    bne .L_e10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_aa4:
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    add r1, r4, #0x3d4
    str r1, [sp]
    add r3, r5, #0x300
    ldr r1, [r0, #0x458]
    mov r0, #0x6
    str r1, [sp, #0x4]
    ldr r1, [r7, #0x454]
    ldr r2, [r6, #0x3d0]
    ldrh r3, [r3, #0xce]
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    beq .L_e10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_b04:
    bl func_020498f0
    ldrb r0, [r0, #0x3cc]
    cmp r0, #0x2
    bne .L_e10
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_b6c
    bl func_020930b0
    mov r4, r0
    mov r5, r1
    bl func_020498f0
    ldr r1, [r0, #0x45c]
    ldr r0, [r0, #0x460]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, _LIT4
    cmp r1, #0x0
    cmpeq r0, r2
    bhi .L_bc4
.L_b6c:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_e10
    bl func_020930b0
    mov r4, r0
    mov r5, r1
    bl func_020498f0
    ldr r1, [r0, #0x45c]
    ldr r0, [r0, #0x460]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, _LIT5
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_e10
.L_bc4:
    bl func_02050118
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r0, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cc20
    cmp r0, #0x0
    bne .L_e10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_bf8:
    bl func_020498f0
    ldrb r0, [r0, #0x3cc]
    cmp r0, #0x8
    bne .L_e10
    bl func_020930b0
    mov r4, r0
    mov r5, r1
    bl func_020498f0
    ldr r1, [r0, #0x45c]
    ldr r0, [r0, #0x460]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, _LIT6
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_e10
    bl func_020498f0
    ldrb r1, [r0, #0x3cd]
    add r1, r1, #0x1
    strb r1, [r0, #0x3cd]
    bl func_020498f0
    ldrb r0, [r0, #0x3cd]
    cmp r0, #0x0
    beq .L_cb8
    bl func_02050118
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_cb0
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    bl func_0204cc20
    cmp r0, #0x0
    bne .L_e10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_cb0:
    bl func_0204bf00
    b .L_e10
.L_cb8:
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    add r1, r4, #0x3d4
    str r1, [sp]
    add r3, r5, #0x300
    ldr r1, [r0, #0x458]
    mov r0, #0x8
    str r1, [sp, #0x4]
    ldr r1, [r7, #0x454]
    ldr r2, [r6, #0x3d0]
    ldrh r3, [r3, #0xce]
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    beq .L_e10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_d18:
    bl func_020469b4
    cmp r0, #0x5
    bne .L_e10
    bl func_020930b0
    mov r4, r0
    mov r5, r1
    bl func_020498f0
    ldr r1, [r0, #0x1f8]
    ldr r0, [r0, #0x1fc]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, _LIT6
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_e10
    bl func_020498f0
    ldrb r0, [r0, #0x1ad]
    cmp r0, #0x5
    bcc .L_d98
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    bl func_0204cb54
    cmp r0, #0x0
    bne .L_e10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_d98:
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    mov r1, #0x0
    str r1, [sp]
    str r1, [sp, #0x4]
    ldrh r3, [r0, #0xa4]
    ldr r1, [r5, #0xf4]
    ldr r2, [r4, #0x24]
    mov r0, #0x40
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    bl func_020498f0
    ldrb r1, [r0, #0x1ad]
    add r1, r1, #0x1
    strb r1, [r0, #0x1ad]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    ldr r2, _LIT7
    mvn r3, #0x0
    adds r0, r0, r2
    str r0, [r4, #0x1f8]
    adc r0, r1, r3
    str r0, [r4, #0x1fc]
.L_e10:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xb
    beq .L_e30
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x6
    bne .L_eac
.L_e30:
    bl func_020498f0
    ldr r2, [r0, #0x184]
    ldr r1, [r0, #0x188]
    mov r0, #0x0
    cmp r1, r0
    cmpeq r2, r0
    beq .L_eac
    bl func_020930b0
    mov r4, r0
    mov r5, r1
    bl func_020498f0
    ldr r1, [r0, #0x184]
    ldr r0, [r0, #0x188]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, _LIT8
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_eac
    bl func_020498f0
    mov r1, #0x0
    add r3, r0, #0x194
    mov r2, r1
    mov r0, #0x1
    bl func_02049990
.L_eac:
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    beq .L_ec8
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    bl func_02068d0c
.L_ec8:
    bl func_020498f0
    ldr r0, [r0, #0x10]
    bl func_02051168
    bl func_0206553c
    bl func_020498f0
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_ef8
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_020627a8
.L_ef8:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x12
    bne .L_f60
    bl func_020930b0
    mov r4, r0
    mov r5, r1
    bl func_020498f0
    ldr r1, [r0, #0x1f0]
    ldr r0, [r0, #0x1f4]
    subs r3, r4, r1
    sbc r0, r5, r0
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    ldr r2, _LIT2
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_f60
    bl func_0204be40
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
.L_f60:
    bl func_0204b8d0
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0204b410
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_0204abfc
    bl func_020498f0
    ldrb r0, [r0, #0x1ae]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xa
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, pc}
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    strb r0, [r4, #0x16]
    bl func_0204f820
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1ae]
    bl func_020498f0
    ldr r0, [r0, #0x47c]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldr r0, [r0, #0x480]
    ldr r1, [r4, #0x47c]
    blx r1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x000082ea
_LIT1: .word 0xfffec5d2
_LIT2: .word 0x00000bb8
_LIT3: .word 0x000061a8
_LIT4: .word 0x00001770
_LIT5: .word 0x00004a38
_LIT6: .word 0x00007530
_LIT7: .word 0xff403b3a
_LIT8: .word 0x00002710

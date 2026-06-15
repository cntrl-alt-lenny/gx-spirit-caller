; func_0204c40c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff9c4
        .extern data_0219dc8c
        .extern func_02049038
        .extern func_02049120
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204ab88
        .extern func_0204b0a8
        .extern func_0204b0d0
        .extern func_0204bb5c
        .extern func_0204bf00
        .extern func_0204cf7c
        .extern func_0204d438
        .extern func_0204ead0
        .extern func_0204f280
        .extern func_0204f820
        .extern func_02065e40
        .extern func_020673dc
        .extern func_02068cd8
        .extern func_02068f54
        .extern func_020930b0
        .global func_0204c40c
        .arm
func_0204c40c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x20
    cmp r0, #0x4
    mov r5, #0x3
    mov r4, #0x0
    addls pc, pc, r0, lsl #0x2
    b .L_1964
    b .L_136c
    b .L_1710
    b .L_1754
    b .L_1818
    b .L_1838
.L_136c:
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    ldrb r1, [r6, #0x1a4]
    sub r0, r0, #0x1
    cmp r1, r0
    bge .L_142c
    mov r0, #0xd
    bl func_020498dc
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldrb r0, [r0, #0x1a4]
    add r0, r0, #0x1
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    str r0, [sp, #0x8]
    bl func_020498f0
    ldrb r0, [r0, #0x1a4]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldrb r0, [r0, #0x1a4]
    add r0, r0, #0x1
    add r0, r5, r0
    ldrb r0, [r0, #0x2d0]
    str r0, [sp, #0x10]
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldrb r0, [r0, #0x1a4]
    add r0, r0, #0x1
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0x24]
    str r0, [sp, #0x14]
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldrb r0, [r0, #0x1a4]
    mov r5, #0x5
    add r0, r0, #0x1
    add r0, r6, r0, lsl #0x1
    ldrh r0, [r0, #0xa4]
    str r0, [sp, #0x18]
    b .L_1678
.L_142c:
    bl func_020498f0
    mov r1, r4
    strb r1, [r0, #0x17]
    bl func_020498f0
    mov r1, r4
    str r1, [r0, #0x20]
    bl func_020498f0
    ldr r0, [r0, #0x10]
    bl func_020673dc
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_146c
    mov r0, r5
    bl func_020498dc
    b .L_1490
.L_146c:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_1488
    mov r0, #0x4
    bl func_020498dc
    b .L_1490
.L_1488:
    mov r0, #0xa
    bl func_020498dc
.L_1490:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a4]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    beq .L_14c8
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldrb r1, [r6, #0xd]
    ldrb r0, [r0, #0x16]
    cmp r1, r0
    bne .L_1578
.L_14c8:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_1500
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r6, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    str r0, [r7, #0x20c]
    b .L_1520
.L_1500:
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x20c]
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldr r0, [r0, #0x200]
    str r0, [r6, #0xf4]
.L_1520:
    mov r0, #0x10
    bl func_020498dc
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1d4]
    mov r7, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_1668
    mov r6, #0x2
.L_154c:
    bl func_020498f0
    add r0, r0, r7
    ldrb r0, [r0, #0x2d0]
    mov r1, r6
    bl func_0204bb5c
    add r7, r7, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r7, r0
    ble .L_154c
    b .L_1668
.L_1578:
    mov r0, #0x0
    str r0, [sp, #0x8]
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    str r0, [sp, #0xc]
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r6, r0
    ldrb r0, [r0, #0x2d0]
    str r0, [sp, #0x10]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_15dc
    bl func_020498f0
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_020498f0
    mov r6, r0
    bl func_020930b0
    str r0, [r6, #0xec]
    str r1, [r6, #0xf0]
    b .L_1668
.L_15dc:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_1668
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0204cf7c
    bl func_020498f0
    ldrb r0, [r0, #0x1a6]
    cmp r0, #0x0
    bne .L_1668
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x2
    bcc .L_1668
    bl func_020498f0
    mov r8, r0
    mov r0, #0x0
    bl func_0204b0d0
    mov r6, r0
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    mov r1, #0x1
    ldr r2, [r8, #0x1dc]
    add r0, r7, r0
    ldrb r0, [r0, #0x2d0]
    mvn r0, r1, lsl r0
    and r0, r6, r0
    cmp r2, r0
    beq .L_1668
    bl func_0204bf00
    b .L_1964
.L_1668:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    movne r4, #0x1
.L_1678:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x10
    beq .L_1964
    bl func_020498f0
    mov sl, r0
    bl func_020498f0
    mov r9, r0
    bl func_020498f0
    mov r8, r0
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    add r1, sp, #0x8
    str r1, [sp]
    str r5, [sp, #0x4]
    mov ip, r0
    ldrb r3, [r9, #0xd]
    ldrb r2, [r7, #0xd]
    ldrb r1, [ip, #0xd]
    add r5, sl, r3, lsl #0x2
    add r2, r8, r2, lsl #0x2
    add r3, r6, r1, lsl #0x1
    ldrh r3, [r3, #0xa4]
    ldr r1, [r5, #0xf4]
    ldr r2, [r2, #0x24]
    mov r0, #0x8
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x3cd]
    b .L_1964
.L_1710:
    mov r0, #0x1
    bl func_020498dc
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_174c
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    str r0, [r5, #0x20c]
.L_174c:
    mov r4, #0x1
    b .L_1964
.L_1754:
    mov r0, #0x1
    bl func_020498dc
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_177c
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_179c
.L_177c:
    bl func_020498f0
    mov r1, #0x1
    strb r1, [r0, #0x17]
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldr r0, [r0, #0x200]
    str r0, [r5, #0x20]
.L_179c:
    bl func_0204b0a8
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    bls .L_1964
    bl func_020498f0
    mov r7, r0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    mov r8, r0
    bl func_020498f0
    add r3, r8, #0xf4
    ldrb r2, [r0, #0xd]
    mov r1, #0x1
    mov r0, #0x9
    sub r2, r2, #0x1
    add r2, r3, r2, lsl #0x2
    str r2, [sp]
    str r1, [sp, #0x4]
    ldr r1, [r7, #0xf4]
    ldr r2, [r6, #0x24]
    ldrh r3, [r5, #0xa4]
    bl func_0204ead0
    bl func_0204d438
    cmp r0, #0x0
    beq .L_1964
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1818:
    mov r0, #0x1
    bl func_020498dc
    bl func_0204b0a8
    bl func_020498f0
    mov r1, r4
    str r1, [r0, #0x20c]
    mov r4, #0x1
    b .L_1964
.L_1838:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    beq .L_1858
    ldr r1, _LIT0
    mov r0, #0x2
    mov r2, r4
    bl func_02049038
.L_1858:
    bl func_020498f0
    ldr r0, [r0, #0x20c]
    cmp r0, #0x0
    moveq r7, #0x1
    movne r7, #0x0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldr r0, [r0, #0x20c]
    bl func_02049120
    mov r5, r0
    bl func_020498f0
    str r5, [sp]
    ldr r1, [r0, #0x468]
    mov r0, #0x0
    str r1, [sp, #0x4]
    ldr r5, [r6, #0x464]
    mov r2, r7
    mov r1, r0
    mov r3, r0
    blx r5
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_18cc
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_18d4
.L_18cc:
    bl func_0204f280
    b .L_1958
.L_18d4:
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    beq .L_18fc
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    bl func_02068f54
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0xe4]
.L_18fc:
    bl func_02065e40
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_1944
    bl func_0204f820
    bl func_0204ab88
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT1
    ldrb r1, [r0]
    cmp r1, #0x1
    moveq r1, #0x1
    streqb r1, [r0, #0x1]
    mov r0, #0xa
    bl func_020498dc
    b .L_194c
.L_1944:
    mov r0, #0x1
    bl func_020498dc
.L_194c:
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x20c]
.L_1958:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x1a9]
.L_1964:
    cmp r4, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    bl func_02068cd8
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_020ff9c4
_LIT1: .word data_0219dc8c

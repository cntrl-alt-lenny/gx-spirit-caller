; func_020b1e88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b1e88
        .arm
func_020b1e88:
    stmdb sp!, {r4, r5, r6, r7, lr}
    eor lr, r1, r3
    and lr, lr, #-2147483648
    mov ip, r1, lsr #0x14
    mov r1, r1, lsl #0xb
    orr r1, r1, r0, lsr #0x15
    mov r0, r0, lsl #0xb
    movs r6, ip, lsl #0x15
    cmnne r6, #0x200000
    beq .L_62c
    orr r1, r1, #-2147483648
    bic ip, ip, #0x800
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r5, r4, lsl #0x15
    cmnne r5, #0x200000
    beq .L_674
    orr r3, r3, #-2147483648
    bic r4, r4, #0x800
.L_578:
    add ip, r4, ip
    umull r5, r4, r0, r2
    umull r7, r6, r0, r3
    adds r4, r7, r4
    adc r6, r6, #0x0
    umull r7, r0, r1, r2
    adds r4, r7, r4
    adcs r0, r0, r6
    umull r7, r2, r1, r3
    adc r1, r2, #0x0
    adds r0, r0, r7
    adc r1, r1, #0x0
    orrs r4, r4, r5
    orrne r0, r0, #0x1
    cmp r1, #0x0
    blt .L_5c4
    sub ip, ip, #0x1
    adds r0, r0, r0
    adc r1, r1, r1
.L_5c4:
    add ip, ip, #0x2
    subs ip, ip, #0x400
    bmi .L_760
    beq .L_760
    mov r6, ip, lsl #0x14
    cmn r6, #0x100000
    bmi .L_860
    movs r2, r0, lsl #0x15
    mov r0, r0, lsr #0xb
    orr r0, r0, r1, lsl #0x15
    add r1, r1, r1
    orr r1, lr, r1, lsr #0xc
    orr r1, r1, ip, lsl #0x14
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    tst r2, #-2147483648
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    movs r2, r2, lsl #0x1
    andeqs r2, r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    adds r0, r0, #0x1
    adc r1, r1, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_62c:
    bics ip, ip, #0x800
    beq .L_688
    orrs r6, r0, r1, lsl #0x1
    bne .L_814
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r5, r4, lsl #0x15
    beq .L_668
    cmn r5, #0x200000
    bne .L_800
    orrs r5, r2, r3, lsl #0x1
    beq .L_800
    b .L_814
.L_668:
    orrs r5, r3, r2
    beq .L_828
    b .L_800
.L_674:
    bics r4, r4, #0x800
    beq .L_71c
    orrs r6, r2, r3, lsl #0x1
    bne .L_814
    b .L_800
.L_688:
    orrs r6, r0, r1, lsl #0x1
    beq .L_6f0
    mov ip, #0x1
    cmp r1, #0x0
    bne .L_6ac
    sub ip, ip, #0x20
    movs r1, r0
    mov r0, #0x0
    bmi .L_6c8
.L_6ac:
    clz r6, r1
    movs r1, r1, lsl r6
    rsb r6, r6, #0x20
    orr r1, r1, r0, lsr r6
    rsb r6, r6, #0x20
    mov r0, r0, lsl r6
    sub ip, ip, r6
.L_6c8:
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r5, r4, lsl #0x15
    cmnne r5, #0x200000
    beq .L_674
    orr r3, r3, #-2147483648
    bic r4, r4, #0x800
    b .L_578
.L_6f0:
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r5, r4, lsl #0x15
    beq .L_874
    cmn r5, #0x200000
    bne .L_874
    orrs r6, r2, r3, lsl #0x1
    beq .L_828
    b .L_814
.L_71c:
    orrs r5, r2, r3, lsl #0x1
    beq .L_874
    mov r4, #0x1
    cmp r3, #0x0
    bne .L_740
    sub r4, r4, #0x20
    movs r3, r2
    mov r2, #0x0
    bmi .L_578
.L_740:
    clz r6, r3
    movs r3, r3, lsl r6
    rsb r6, r6, #0x20
    orr r3, r3, r2, lsr r6
    rsb r6, r6, #0x20
    mov r2, r2, lsl r6
    sub r4, r4, r6
    b .L_578
.L_760:
    cmn ip, #0x34
    beq .L_7f8
    bmi .L_850
    mov r2, r1
    mov r3, r0
    add r4, ip, #0x34
    cmp r4, #0x20
    movge r2, r3
    movge r3, #0x0
    subge r4, r4, #0x20
    rsb r5, r4, #0x20
    mov r2, r2, lsl r4
    orr r2, r2, r3, lsr r5
    movs r3, r3, lsl r4
    orrne r2, r2, #0x1
    rsb ip, ip, #0xc
    cmp ip, #0x20
    movge r0, r1
    movge r1, #0x0
    subge ip, ip, #0x20
    rsb r4, ip, #0x20
    mov r0, r0, lsr ip
    orr r0, r0, r1, lsl r4
    orr r1, lr, r1, lsr ip
    cmp r2, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    tst r2, #-2147483648
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    movs r2, r2, lsl #0x1
    andeqs r2, r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    adds r0, r0, #0x1
    adc r1, r1, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_7f8:
    orr r0, r0, r1, lsl #0x1
    b .L_838
.L_800:
    ldr r1, _LIT0
    orr r1, lr, r1
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_814:
    mov r1, r3
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_828:
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_838:
    movs r2, r0
    mov r1, lr
    mov r0, #0x0
    addne r0, r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_850:
    mov r1, lr
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_860:
    ldr r1, _LIT0
    orr r1, lr, r1
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_874:
    mov r1, lr
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x7ff00000

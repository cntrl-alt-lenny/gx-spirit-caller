; func_020b1d94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b1d94
        .arm
func_020b1d94:
    stmdb sp!, {r4, r5, r6, r7, lr}
    eor lr, r1, r3
    and lr, lr, #-2147483648
    mov ip, r1, lsr #0x14
    mov r1, r1, lsl #0xb
    orr r1, r1, r0, lsr #0x15
    mov r0, r0, lsl #0xb
    movs r6, ip, lsl #0x15
    cmnne r6, #0x200000
    beq .L_108
    orr r1, r1, #-2147483648
    bic ip, ip, #0x800
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r5, r4, lsl #0x15
    cmnne r5, #0x200000
    beq .L_150
    orr r3, r3, #-2147483648
    bic r4, r4, #0x800
.L_54:
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
    blt .L_a0
    sub ip, ip, #0x1
    adds r0, r0, r0
    adc r1, r1, r1
.L_a0:
    add ip, ip, #0x2
    subs ip, ip, #0x400
    bmi .L_23c
    beq .L_23c
    mov r6, ip, lsl #0x14
    cmn r6, #0x100000
    bmi .L_33c
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
.L_108:
    bics ip, ip, #0x800
    beq .L_164
    orrs r6, r0, r1, lsl #0x1
    bne .L_2f0
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r5, r4, lsl #0x15
    beq .L_144
    cmn r5, #0x200000
    bne .L_2dc
    orrs r5, r2, r3, lsl #0x1
    beq .L_2dc
    b .L_2f0
.L_144:
    orrs r5, r3, r2
    beq .L_304
    b .L_2dc
.L_150:
    bics r4, r4, #0x800
    beq .L_1f8
    orrs r6, r2, r3, lsl #0x1
    bne .L_2f0
    b .L_2dc
.L_164:
    orrs r6, r0, r1, lsl #0x1
    beq .L_1cc
    mov ip, #0x1
    cmp r1, #0x0
    bne .L_188
    sub ip, ip, #0x20
    movs r1, r0
    mov r0, #0x0
    bmi .L_1a4
.L_188:
    clz r6, r1
    movs r1, r1, lsl r6
    rsb r6, r6, #0x20
    orr r1, r1, r0, lsr r6
    rsb r6, r6, #0x20
    mov r0, r0, lsl r6
    sub ip, ip, r6
.L_1a4:
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r5, r4, lsl #0x15
    cmnne r5, #0x200000
    beq .L_150
    orr r3, r3, #-2147483648
    bic r4, r4, #0x800
    b .L_54
.L_1cc:
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r5, r4, lsl #0x15
    beq .L_350
    cmn r5, #0x200000
    bne .L_350
    orrs r6, r2, r3, lsl #0x1
    beq .L_304
    b .L_2f0
.L_1f8:
    orrs r5, r2, r3, lsl #0x1
    beq .L_350
    mov r4, #0x1
    cmp r3, #0x0
    bne .L_21c
    sub r4, r4, #0x20
    movs r3, r2
    mov r2, #0x0
    bmi .L_54
.L_21c:
    clz r6, r3
    movs r3, r3, lsl r6
    rsb r6, r6, #0x20
    orr r3, r3, r2, lsr r6
    rsb r6, r6, #0x20
    mov r2, r2, lsl r6
    sub r4, r4, r6
    b .L_54
.L_23c:
    cmn ip, #0x34
    beq .L_2d4
    bmi .L_32c
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
.L_2d4:
    orr r0, r0, r1, lsl #0x1
    b .L_314
.L_2dc:
    ldr r1, _LIT0
    orr r1, lr, r1
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_2f0:
    mov r1, r3
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_304:
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_314:
    movs r2, r0
    mov r1, lr
    mov r0, #0x0
    addne r0, r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_32c:
    mov r1, lr
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_33c:
    ldr r1, _LIT0
    orr r1, lr, r1
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_350:
    mov r1, lr
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x7ff00000

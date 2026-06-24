; func_020b22ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b22ac
        .arm
func_020b22ac:
    stmdb sp!, {r4, lr}
    eors ip, r1, r3
    eormi r3, r3, #-2147483648
    .word 0x4afffd70
    subs ip, r0, r2
    sbcs lr, r1, r3
    bcs .L_48
    eor lr, lr, #-2147483648
    adds r2, r2, ip
    adc r3, r3, lr
    subs r0, r0, ip
    sbc r1, r1, lr
.L_48:
    mov lr, #-2147483648
    mov ip, r1, lsr #0x14
    orr r1, lr, r1, lsl #0xb
    orr r1, r1, r0, lsr #0x15
    mov r0, r0, lsl #0xb
    movs r4, ip, lsl #0x15
    cmnne r4, #0x200000
    beq .L_24c
    mov r4, r3, lsr #0x14
    orr r3, lr, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs lr, r4, lsl #0x15
    beq .L_294
.L_80:
    subs r4, ip, r4
    beq .L_128
    cmp r4, #0x20
    ble .L_bc
    cmp r4, #0x38
    movge r4, #0x3f
    sub r4, r4, #0x20
    rsb lr, r4, #0x20
    orrs lr, r2, r3, lsl lr
    mov r2, r3, lsr r4
    orrne r2, r2, #0x1
    subs r0, r0, r2
    sbcs r1, r1, #0x0
    bmi .L_e4
    b .L_1d4
.L_bc:
    rsb lr, r4, #0x20
    movs lr, r2, lsl lr
    rsb lr, r4, #0x20
    mov r2, r2, lsr r4
    orr r2, r2, r3, lsl lr
    mov r3, r3, lsr r4
    orrne r2, r2, #0x1
    subs r0, r0, r2
    sbcs r1, r1, r3
    bpl .L_1d4
.L_e4:
    movs r2, r0, lsl #0x15
    mov r0, r0, lsr #0xb
    orr r0, r0, r1, lsl #0x15
    add r1, r1, r1
    mov r1, r1, lsr #0xc
    orr r1, r1, ip, lsl #0x14
    tst r2, #-2147483648
    ldmeqia sp!, {r4, lr}
    bxeq lr
    movs r2, r2, lsl #0x1
    andeqs r2, r0, #0x1
    ldmeqia sp!, {r4, lr}
    bxeq lr
    adds r0, r0, #0x1
    adc r1, r1, #0x0
    ldmia sp!, {r4, lr}
    bx lr
.L_128:
    subs r0, r0, r2
    sbc r1, r1, r3
    orrs lr, r1, r0
    beq .L_3b8
    mov lr, ip, lsl #0x14
    and lr, lr, #-2147483648
    bic ip, ip, #0x800
    cmp r1, #0x0
    bmi .L_1b0
    bne .L_160
    sub ip, ip, #0x20
    movs r1, r0
    mov r0, #0x0
    bmi .L_17c
.L_160:
    clz r4, r1
    movs r1, r1, lsl r4
    rsb r4, r4, #0x20
    orr r1, r1, r0, lsr r4
    rsb r4, r4, #0x20
    mov r0, r0, lsl r4
    sub ip, ip, r4
.L_17c:
    cmp ip, #0x0
    bgt .L_1b8
    rsb ip, ip, #0xc
    cmp ip, #0x20
    movge r0, r1
    movge r1, #0x0
    subge ip, ip, #0x20
    rsb r4, ip, #0x20
    mov r0, r0, lsr ip
    orr r0, r0, r1, lsl r4
    orr r1, lr, r1, lsr ip
    ldmia sp!, {r4, lr}
    bx lr
.L_1b0:
    cmp r1, #0x0
    subges ip, ip, #0x1
.L_1b8:
    mov r0, r0, lsr #0xb
    orr r0, r0, r1, lsl #0x15
    add r1, r1, r1
    orr r1, lr, r1, lsr #0xc
    orr r1, r1, ip, lsl #0x14
    ldmia sp!, {r4, lr}
    bx lr
.L_1d4:
    mov lr, ip, lsl #0x14
    and lr, lr, #-2147483648
    bic ip, ip, #0x800
    cmp r1, #0x0
    bne .L_1f8
    sub ip, ip, #0x20
    movs r1, r0
    mov r0, #0x0
    bmi .L_214
.L_1f8:
    clz r4, r1
    movs r1, r1, lsl r4
    rsb r4, r4, #0x20
    orr r1, r1, r0, lsr r4
    rsb r4, r4, #0x20
    mov r0, r0, lsl r4
    sub ip, ip, r4
.L_214:
    cmp ip, #0x0
    orrgt ip, ip, lr, lsr #0x14
    bgt .L_e4
    rsb ip, ip, #0xc
    cmp ip, #0x20
    movge r0, r1
    movge r1, #0x0
    subge ip, ip, #0x20
    rsb r4, ip, #0x20
    mov r0, r0, lsr ip
    orr r0, r0, r1, lsl r4
    orr r1, lr, r1, lsr ip
    ldmia sp!, {r4, lr}
    bx lr
.L_24c:
    cmp ip, #0x800
    movge lr, #-2147483648
    movlt lr, #0x0
    bics ip, ip, #0x800
    beq .L_2b8
    orrs r4, r0, r1, lsl #0x1
    bne .L_394
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r4, r4, lsl #0x15
    beq .L_380
    cmn r4, #0x200000
    bne .L_380
    orrs r4, r2, r3, lsl #0x1
    beq .L_3a8
    b .L_394
.L_294:
    cmp r4, #0x800
    movge lr, #-2147483648
    movlt lr, #0x0
    bic ip, ip, #0x800
    bics r4, r4, #0x800
    beq .L_330
    orrs r4, r2, r3, lsl #0x1
    bne .L_394
    b .L_380
.L_2b8:
    orrs r4, r0, r1, lsl #0x1
    beq .L_2f8
    mov ip, #0x1
    bic r1, r1, #-2147483648
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r4, r4, lsl #0x15
    cmnne r4, #0x200000
    mov r4, r4, lsr #0x15
    orr r4, r4, lr, lsr #0x14
    beq .L_294
    orr r3, r3, #-2147483648
    orr ip, ip, lr, lsr #0x14
    b .L_80
.L_2f8:
    mov ip, r3, lsr #0x14
    mov r1, r3, lsl #0xb
    orr r1, r1, r2, lsr #0x15
    mov r0, r2, lsl #0xb
    movs r4, ip, lsl #0x15
    beq .L_324
    cmn r4, #0x200000
    bne .L_34c
    orrs r4, r0, r1, lsl #0x1
    bne .L_398
    b .L_380
.L_324:
    orrs r4, r0, r1, lsl #0x1
    beq .L_3b8
    b .L_34c
.L_330:
    orrs r4, r2, r3, lsl #0x1
    beq .L_35c
    mov r4, #0x1
    bic r3, r3, #-2147483648
    orr ip, ip, lr, lsr #0x14
    orr r4, r4, lr, lsr #0x14
    b .L_80
.L_34c:
    mov r1, r3
    mov r0, r2
    ldmia sp!, {r4, lr}
    bx lr
.L_35c:
    cmp r1, #0x0
    subges ip, ip, #0x1
    mov r0, r0, lsr #0xb
    orr r0, r0, r1, lsl #0x15
    add r1, r1, r1
    orr r1, lr, r1, lsr #0xc
    orr r1, r1, ip, lsl #0x14
    ldmia sp!, {r4, lr}
    bx lr
.L_380:
    ldr r1, _LIT0
    orr r1, lr, r1
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
.L_394:
    mov r1, r3
.L_398:
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    ldmia sp!, {r4, lr}
    bx lr
.L_3a8:
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    ldmia sp!, {r4, lr}
    bx lr
.L_3b8:
    mov r1, #0x0
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x7ff00000

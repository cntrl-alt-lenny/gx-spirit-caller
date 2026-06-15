; func_020b1964 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b1964
        .arm
func_020b1964:
    stmdb sp!, {r4, lr}
    eors ip, r1, r3
    eormi r3, r3, #-2147483648
    .word 0x4a00028e
    subs ip, r0, r2
    sbcs lr, r1, r3
    bcs .L_2c
    adds r2, r2, ip
    adc r3, r3, lr
    subs r0, r0, ip
    sbc r1, r1, lr
.L_2c:
    mov lr, #-2147483648
    mov ip, r1, lsr #0x14
    orr r1, lr, r1, lsl #0xb
    orr r1, r1, r0, lsr #0x15
    mov r0, r0, lsl #0xb
    movs r4, ip, lsl #0x15
    cmnne r4, #0x200000
    beq .L_128
    mov r4, r3, lsr #0x14
    orr r3, lr, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs lr, r4, lsl #0x15
    beq .L_170
.L_64:
    subs r4, ip, r4
    beq .L_bc
    cmp r4, #0x20
    ble .L_a0
    cmp r4, #0x38
    movge r4, #0x3f
    sub r4, r4, #0x20
    rsb lr, r4, #0x20
    orrs lr, r2, r3, lsl lr
    mov r2, r3, lsr r4
    orrne r2, r2, #0x1
    adds r0, r0, r2
    adcs r1, r1, #0x0
    bcc .L_e4
    b .L_c8
.L_a0:
    rsb lr, r4, #0x20
    movs lr, r2, lsl lr
    rsb lr, r4, #0x20
    mov r2, r2, lsr r4
    orr r2, r2, r3, lsl lr
    mov r3, r3, lsr r4
    orrne r2, r2, #0x1
.L_bc:
    adds r0, r0, r2
    adcs r1, r1, r3
    bcc .L_e4
.L_c8:
    add ip, ip, #0x1
    and r4, r0, #0x1
    movs r1, r1, rrx
    orr r0, r4, r0, rrx
    mov lr, ip, lsl #0x15
    cmn lr, #0x200000
    beq .L_2f4
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
    cmp ip, #0x800
    movge lr, #-2147483648
    movlt lr, #0x0
    bics ip, ip, #0x800
    beq .L_194
    orrs r4, r0, r1, lsl #0x1
    bne .L_2d0
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r4, r4, lsl #0x15
    beq .L_2bc
    cmn r4, #0x200000
    bne .L_2bc
    orrs r4, r2, r3, lsl #0x1
    beq .L_2bc
    b .L_2d0
.L_170:
    cmp r4, #0x800
    movge lr, #-2147483648
    movlt lr, #0x0
    bic ip, ip, #0x800
    bics r4, r4, #0x800
    beq .L_200
    orrs r4, r2, r3, lsl #0x1
    bne .L_2d0
    b .L_2bc
.L_194:
    orrs r4, r0, r1, lsl #0x1
    beq .L_1d4
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
    beq .L_170
    orr r3, r3, #-2147483648
    orr ip, ip, lr, lsr #0x14
    b .L_64
.L_1d4:
    mov ip, r3, lsr #0x14
    mov r1, r3, lsl #0xb
    orr r1, r1, r2, lsr #0x15
    mov r0, r2, lsl #0xb
    movs r4, ip, lsl #0x15
    beq .L_288
    cmn r4, #0x200000
    bne .L_288
    orrs r4, r0, r1, lsl #0x1
    beq .L_2bc
    b .L_2d4
.L_200:
    orrs r4, r2, r3, lsl #0x1
    beq .L_298
    mov r4, #0x1
    bic r3, r3, #-2147483648
    cmp r1, #0x0
    bpl .L_224
    orr ip, ip, lr, lsr #0x14
    orr r4, r4, lr, lsr #0x14
    b .L_64
.L_224:
    adds r0, r0, r2
    adcs r1, r1, r3
    bcc .L_244
    add ip, ip, #0x1
    and r4, r0, #0x1
    movs r1, r1, rrx
    mov r0, r0, rrx
    orr r0, r0, r4
.L_244:
    cmp r1, #0x0
    subges ip, ip, #0x1
    movs r2, r0, lsl #0x15
    mov r0, r0, lsr #0xb
    orr r0, r0, r1, lsl #0x15
    add r1, r1, r1
    orr r1, lr, r1, lsr #0xc
    orr r1, r1, ip, lsl #0x14
    ldmeqia sp!, {r4, lr}
    bxeq lr
    tst r2, #-2147483648
    ldmeqia sp!, {r4, lr}
    bxeq lr
    movs r2, r2, lsl #0x1
    andeqs r2, r0, #0x1
    ldmeqia sp!, {r4, lr}
    bxeq lr
.L_288:
    mov r1, r3
    mov r0, r2
    ldmia sp!, {r4, lr}
    bx lr
.L_298:
    cmp r1, #0x0
    subges ip, ip, #0x1
    mov r0, r0, lsr #0xb
    orr r0, r0, r1, lsl #0x15
    add r1, r1, r1
    orr r1, lr, r1, lsr #0xc
    orr r1, r1, ip, lsl #0x14
    ldmia sp!, {r4, lr}
    bx lr
.L_2bc:
    ldr r1, _LIT0
    orr r1, lr, r1
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
.L_2d0:
    mov r1, r3
.L_2d4:
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    ldmia sp!, {r4, lr}
    bx lr
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    ldmia sp!, {r4, lr}
    bx lr
.L_2f4:
    cmp ip, #0x800
    movge lr, #-2147483648
    movlt lr, #0x0
    ldr r1, _LIT0
    orr r1, lr, r1
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x7ff00000

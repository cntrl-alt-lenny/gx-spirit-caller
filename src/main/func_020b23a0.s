; func_020b23a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b23a0
        .arm
func_020b23a0:
    stmdb sp!, {r4, lr}
    eors ip, r1, r3
    eormi r3, r3, #-2147483648
    .word 0x4afffd70
    subs ip, r0, r2
    sbcs lr, r1, r3
    bcs .L_a6c
    eor lr, lr, #-2147483648
    adds r2, r2, ip
    adc r3, r3, lr
    subs r0, r0, ip
    sbc r1, r1, lr
.L_a6c:
    mov lr, #-2147483648
    mov ip, r1, lsr #0x14
    orr r1, lr, r1, lsl #0xb
    orr r1, r1, r0, lsr #0x15
    mov r0, r0, lsl #0xb
    movs r4, ip, lsl #0x15
    cmnne r4, #0x200000
    beq .L_c70
    mov r4, r3, lsr #0x14
    orr r3, lr, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs lr, r4, lsl #0x15
    beq .L_cb8
.L_aa4:
    subs r4, ip, r4
    beq .L_b4c
    cmp r4, #0x20
    ble .L_ae0
    cmp r4, #0x38
    movge r4, #0x3f
    sub r4, r4, #0x20
    rsb lr, r4, #0x20
    orrs lr, r2, r3, lsl lr
    mov r2, r3, lsr r4
    orrne r2, r2, #0x1
    subs r0, r0, r2
    sbcs r1, r1, #0x0
    bmi .L_b08
    b .L_bf8
.L_ae0:
    rsb lr, r4, #0x20
    movs lr, r2, lsl lr
    rsb lr, r4, #0x20
    mov r2, r2, lsr r4
    orr r2, r2, r3, lsl lr
    mov r3, r3, lsr r4
    orrne r2, r2, #0x1
    subs r0, r0, r2
    sbcs r1, r1, r3
    bpl .L_bf8
.L_b08:
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
.L_b4c:
    subs r0, r0, r2
    sbc r1, r1, r3
    orrs lr, r1, r0
    beq .L_ddc
    mov lr, ip, lsl #0x14
    and lr, lr, #-2147483648
    bic ip, ip, #0x800
    cmp r1, #0x0
    bmi .L_bd4
    bne .L_b84
    sub ip, ip, #0x20
    movs r1, r0
    mov r0, #0x0
    bmi .L_ba0
.L_b84:
    clz r4, r1
    movs r1, r1, lsl r4
    rsb r4, r4, #0x20
    orr r1, r1, r0, lsr r4
    rsb r4, r4, #0x20
    mov r0, r0, lsl r4
    sub ip, ip, r4
.L_ba0:
    cmp ip, #0x0
    bgt .L_bdc
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
.L_bd4:
    cmp r1, #0x0
    subges ip, ip, #0x1
.L_bdc:
    mov r0, r0, lsr #0xb
    orr r0, r0, r1, lsl #0x15
    add r1, r1, r1
    orr r1, lr, r1, lsr #0xc
    orr r1, r1, ip, lsl #0x14
    ldmia sp!, {r4, lr}
    bx lr
.L_bf8:
    mov lr, ip, lsl #0x14
    and lr, lr, #-2147483648
    bic ip, ip, #0x800
    cmp r1, #0x0
    bne .L_c1c
    sub ip, ip, #0x20
    movs r1, r0
    mov r0, #0x0
    bmi .L_c38
.L_c1c:
    clz r4, r1
    movs r1, r1, lsl r4
    rsb r4, r4, #0x20
    orr r1, r1, r0, lsr r4
    rsb r4, r4, #0x20
    mov r0, r0, lsl r4
    sub ip, ip, r4
.L_c38:
    cmp ip, #0x0
    orrgt ip, ip, lr, lsr #0x14
    bgt .L_b08
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
.L_c70:
    cmp ip, #0x800
    movge lr, #-2147483648
    movlt lr, #0x0
    bics ip, ip, #0x800
    beq .L_cdc
    orrs r4, r0, r1, lsl #0x1
    bne .L_db8
    mov r4, r3, lsr #0x14
    mov r3, r3, lsl #0xb
    orr r3, r3, r2, lsr #0x15
    mov r2, r2, lsl #0xb
    movs r4, r4, lsl #0x15
    beq .L_da4
    cmn r4, #0x200000
    bne .L_da4
    orrs r4, r2, r3, lsl #0x1
    beq .L_dcc
    b .L_db8
.L_cb8:
    cmp r4, #0x800
    movge lr, #-2147483648
    movlt lr, #0x0
    bic ip, ip, #0x800
    bics r4, r4, #0x800
    beq .L_d54
    orrs r4, r2, r3, lsl #0x1
    bne .L_db8
    b .L_da4
.L_cdc:
    orrs r4, r0, r1, lsl #0x1
    beq .L_d1c
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
    beq .L_cb8
    orr r3, r3, #-2147483648
    orr ip, ip, lr, lsr #0x14
    b .L_aa4
.L_d1c:
    mov ip, r3, lsr #0x14
    mov r1, r3, lsl #0xb
    orr r1, r1, r2, lsr #0x15
    mov r0, r2, lsl #0xb
    movs r4, ip, lsl #0x15
    beq .L_d48
    cmn r4, #0x200000
    bne .L_d70
    orrs r4, r0, r1, lsl #0x1
    bne .L_dbc
    b .L_da4
.L_d48:
    orrs r4, r0, r1, lsl #0x1
    beq .L_ddc
    b .L_d70
.L_d54:
    orrs r4, r2, r3, lsl #0x1
    beq .L_d80
    mov r4, #0x1
    bic r3, r3, #-2147483648
    orr ip, ip, lr, lsr #0x14
    orr r4, r4, lr, lsr #0x14
    b .L_aa4
.L_d70:
    mov r1, r3
    mov r0, r2
    ldmia sp!, {r4, lr}
    bx lr
.L_d80:
    cmp r1, #0x0
    subges ip, ip, #0x1
    mov r0, r0, lsr #0xb
    orr r0, r0, r1, lsl #0x15
    add r1, r1, r1
    orr r1, lr, r1, lsr #0xc
    orr r1, r1, ip, lsl #0x14
    ldmia sp!, {r4, lr}
    bx lr
.L_da4:
    ldr r1, _LIT0
    orr r1, lr, r1
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
.L_db8:
    mov r1, r3
.L_dbc:
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    ldmia sp!, {r4, lr}
    bx lr
.L_dcc:
    mvn r0, #0x0
    bic r1, r0, #-2147483648
    ldmia sp!, {r4, lr}
    bx lr
.L_ddc:
    mov r1, #0x0
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x7ff00000

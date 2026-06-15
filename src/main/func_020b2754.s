; func_020b2754 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b2754
        .arm
func_020b2754:
    eors r2, r0, r1
    eormi r1, r1, #-2147483648
    .word 0x4a00031e
    subs ip, r0, r1
    subcc r0, r0, ip
    addcc r1, r1, ip
    mov r2, #-2147483648
    mov r3, r0, lsr #0x17
    orr r0, r2, r0, lsl #0x8
    ands ip, r3, #0xff
    cmpne ip, #0xff
    beq .L_e90
    mov ip, r1, lsr #0x17
    orr r1, r2, r1, lsl #0x8
    ands r2, ip, #0xff
    beq .L_ed0
.L_e30:
    subs ip, r3, ip
    beq .L_e48
    rsb r2, ip, #0x20
    movs r2, r1, lsl r2
    mov r1, r1, lsr ip
    orrne r1, r1, #0x1
.L_e48:
    adds r0, r0, r1
    bcc .L_e68
    and r1, r0, #0x1
    orr r0, r1, r0, rrx
    add r3, r3, #0x1
    and r2, r3, #0xff
    cmp r2, #0xff
    beq .L_fd8
.L_e68:
    ands r1, r0, #0xff
    add r0, r0, r0
    mov r0, r0, lsr #0x9
    orr r0, r0, r3, lsl #0x17
    tst r1, #0x80
    bxeq lr
    ands r1, r1, #0x7f
    andeqs r1, r0, #0x1
    addne r0, r0, #0x1
    bx lr
.L_e90:
    cmp r3, #0x100
    movge r2, #-2147483648
    movlt r2, #0x0
    ands r3, r3, #0xff
    beq .L_ef4
    movs r0, r0, lsl #0x1
    bne .L_1004
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x9
    ands ip, ip, #0xff
    beq .L_ff8
    cmp ip, #0xff
    blt .L_ff8
    cmp r1, #0x0
    beq .L_ff8
    b .L_1004
.L_ed0:
    cmp r3, #0x100
    movge r2, #-2147483648
    movlt r2, #0x0
    and r3, r3, #0xff
    ands ip, ip, #0xff
    beq .L_f50
.L_ee8:
    movs r1, r1, lsl #0x1
    bne .L_1004
    b .L_ff8
.L_ef4:
    movs r0, r0, lsl #0x1
    beq .L_f2c
    mov r3, #0x1
    mov r0, r0, lsr #0x1
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x8
    ands ip, ip, #0xff
    beq .L_f50
    cmp ip, #0xff
    beq .L_ee8
    orr r1, r1, #-2147483648
    orr r3, r3, r2, lsr #0x17
    orr ip, ip, r2, lsr #0x17
    b .L_e30
.L_f2c:
    mov r3, r1, lsr #0x17
    mov r0, r1, lsl #0x9
    ands r3, r3, #0xff
    beq .L_fb8
    cmp r3, #0xff
    blt .L_fb8
    cmp r0, #0x0
    beq .L_ff8
    b .L_ff0
.L_f50:
    movs r1, r1, lsl #0x1
    beq .L_fc0
    mov r1, r1, lsr #0x1
    mov ip, #0x1
    orr r3, r3, r2, lsr #0x17
    orr ip, ip, r2, lsr #0x17
    cmp r0, #0x0
    bmi .L_e30
    adds r0, r0, r1
    bcc .L_f84
    and r1, r0, #0x1
    orr r0, r1, r0, rrx
    add ip, ip, #0x1
.L_f84:
    cmp r0, #0x0
    subge ip, ip, #0x1
    ands r1, r0, #0xff
    add r0, r0, r0
    mov r0, r0, lsr #0x9
    orr r0, r0, ip, lsl #0x17
    bxeq lr
    tst r1, #0x80
    bxeq lr
    ands r1, r1, #0x7f
    andeqs r1, r0, #0x1
    addne r0, r0, #0x1
    bx lr
.L_fb8:
    mov r0, r1
    bx lr
.L_fc0:
    cmp r0, #0x0
    subges r3, r3, #0x1
    add r0, r0, r0
    orr r0, r2, r0, lsr #0x9
    orr r0, r0, r3, lsl #0x17
    bx lr
.L_fd8:
    cmp r3, #0x100
    movge r2, #-2147483648
    movlt r2, #0x0
    mov r0, #-16777216
    orr r0, r2, r0, lsr #0x1
    bx lr
.L_ff0:
    mvn r0, #-2147483648
    bx lr
.L_ff8:
    mov r0, #-16777216
    orr r0, r2, r0, lsr #0x1
    bx lr
.L_1004:
    mvn r0, #-2147483648
    bx lr

; func_020b32dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b32dc
        .arm
func_020b32dc:
    eors r2, r0, r1
    eormi r1, r1, #-2147483648
    .word 0x4afffce0
    subs ip, r0, r1
    eorcc ip, ip, #-2147483648
    subcc r0, r0, ip
    addcc r1, r1, ip
    mov r2, #-2147483648
    mov r3, r0, lsr #0x17
    orr r0, r2, r0, lsl #0x8
    ands ip, r3, #0xff
    cmpne ip, #0xff
    beq .L_134
    mov ip, r1, lsr #0x17
    orr r1, r2, r1, lsl #0x8
    ands r2, ip, #0xff
    beq .L_174
.L_50:
    subs ip, r3, ip
    beq .L_98
    rsb r2, ip, #0x20
    movs r2, r1, lsl r2
    mov r1, r1, lsr ip
    orrne r1, r1, #0x1
    subs r0, r0, r1
    bpl .L_dc
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
.L_98:
    subs r0, r0, r1
    beq .L_240
    mov r2, r3, lsl #0x17
    and r2, r2, #-2147483648
    bic r3, r3, #0x100
    clz ip, r0
    movs r0, r0, lsl ip
    sub r3, r3, ip
    cmp r3, #0x0
    bgt .L_cc
    rsb r3, r3, #0x9
    orr r0, r2, r0, lsr r3
    bx lr
.L_cc:
    add r0, r0, r0
    orr r0, r2, r0, lsr #0x9
    orr r0, r0, r3, lsl #0x17
    bx lr
.L_dc:
    mov r2, r3, lsl #0x17
    and r2, r2, #-2147483648
    bic r3, r3, #0x100
    clz ip, r0
    movs r0, r0, lsl ip
    sub r3, r3, ip
    cmp r3, #0x0
    bgt .L_108
    rsb r3, r3, #0x9
    orr r0, r2, r0, lsr r3
    bx lr
.L_108:
    ands r1, r0, #0xff
    add r0, r0, r0
    orr r0, r2, r0, lsr #0x9
    orr r0, r0, r3, lsl #0x17
    bxeq lr
    tst r1, #0x80
    bxeq lr
    ands r1, r1, #0x7f
    andeqs r1, r0, #0x1
    addne r0, r0, #0x1
    bx lr
.L_134:
    cmp r3, #0x100
    movge r2, #-2147483648
    movlt r2, #0x0
    ands r3, r3, #0xff
    beq .L_19c
    movs r0, r0, lsl #0x1
    bne .L_274
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x9
    ands ip, ip, #0xff
    beq .L_268
    cmp ip, #0xff
    blt .L_268
    cmp r1, #0x0
    beq .L_27c
    b .L_274
.L_174:
    cmp ip, #0x100
    movge r2, #-2147483648
    movlt r2, #0x0
    and r3, r3, #0xff
    ands ip, ip, #0xff
    beq .L_204
.L_18c:
    eor r2, r2, #-2147483648
    movs r1, r1, lsl #0x1
    bne .L_274
    b .L_268
.L_19c:
    movs r0, r0, lsl #0x1
    beq .L_1d4
    mov r0, r0, lsr #0x1
    mov r3, #0x1
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x8
    ands ip, ip, #0xff
    beq .L_204
    cmp ip, #0xff
    beq .L_18c
    orr r1, r1, #-2147483648
    orr r3, r3, r2, lsr #0x17
    orr ip, ip, r2, lsr #0x17
    b .L_50
.L_1d4:
    mov r3, r1, lsr #0x17
    mov r0, r1, lsl #0x9
    ands r2, r3, #0xff
    beq .L_1f8
    cmp r2, #0xff
    blt .L_220
    cmp r0, #0x0
    bne .L_260
    b .L_268
.L_1f8:
    cmp r0, #0x0
    beq .L_240
    b .L_220
.L_204:
    movs r1, r1, lsl #0x1
    beq .L_228
    mov r1, r1, lsr #0x1
    mov ip, #0x1
    orr ip, ip, r2, lsr #0x17
    orr r3, r3, r2, lsr #0x17
    b .L_50
.L_220:
    mov r0, r1
    bx lr
.L_228:
    cmp r0, #0x0
    subges r3, r3, #0x1
    add r0, r0, r0
    orr r0, r2, r0, lsr #0x9
    orr r0, r0, r3, lsl #0x17
    bx lr
.L_240:
    mov r0, #0x0
    bx lr
    cmp r0, #0x0
    subges r3, r3, #0x1
    add r0, r0, r0
    mov r0, r0, lsr #0x9
    orr r0, r0, r3, lsl #0x17
    bx lr
.L_260:
    mvn r0, #-2147483648
    bx lr
.L_268:
    mov r0, #-16777216
    orr r0, r2, r0, lsr #0x1
    bx lr
.L_274:
    mvn r0, #-2147483648
    bx lr
.L_27c:
    mvn r0, #-2147483648
    bx lr

; func_020b30f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b30f0
        .arm
func_020b30f0:
    eor r2, r0, r1
    and r2, r2, #-2147483648
    mov ip, #0xff
    ands r3, ip, r0, lsr #0x17
    mov r0, r0, lsl #0x8
    cmpne r3, #0xff
    beq .L_7c
    orr r0, r0, #-2147483648
    ands ip, ip, r1, lsr #0x17
    mov r1, r1, lsl #0x8
    cmpne ip, #0xff
    beq .L_bc
    orr r1, r1, #-2147483648
.L_34:
    add ip, r3, ip
    umull r1, r3, r0, r1
    movs r0, r3
    addpl r0, r0, r0
    subpl ip, ip, #0x1
    subs ip, ip, #0x7f
    bmi .L_148
    cmp ip, #0xfe
    bge .L_1b4
    ands r3, r0, #0xff
    orr r0, r2, r0, lsr #0x8
    add r0, r0, ip, lsl #0x17
    tst r3, #0x80
    bxeq lr
    orrs r1, r1, r3, lsl #0x19
    andeqs r3, r0, #0x1
    addne r0, r0, #0x1
    bx lr
.L_7c:
    cmp r3, #0x0
    beq .L_d0
    movs r0, r0, lsl #0x1
    bne .L_1a4
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x9
    ands ip, ip, #0xff
    beq .L_b0
    cmp ip, #0xff
    blt .L_198
    cmp r1, #0x0
    beq .L_198
    b .L_1a4
.L_b0:
    cmp r1, #0x0
    beq .L_1ac
    b .L_198
.L_bc:
    cmp ip, #0x0
    beq .L_12c
.L_c4:
    movs r1, r1, lsl #0x1
    bne .L_1a4
    b .L_198
.L_d0:
    movs r0, r0, lsl #0x1
    beq .L_108
    mov r0, r0, lsr #0x1
    clz r3, r0
    movs r0, r0, lsl r3
    rsb r3, r3, #0x1
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x8
    ands ip, ip, #0xff
    beq .L_12c
    cmp ip, #0xff
    beq .L_c4
    orr r1, r1, #-2147483648
    b .L_34
.L_108:
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x9
    ands ip, ip, #0xff
    beq .L_1d8
    cmp ip, #0xff
    blt .L_1d8
    cmp r1, #0x0
    beq .L_1ac
    b .L_1a4
.L_12c:
    movs r1, r1, lsl #0x1
    beq .L_1d8
    mov r1, r1, lsr #0x1
    clz ip, r1
    movs r1, r1, lsl ip
    rsb ip, ip, #0x1
    b .L_34
.L_148:
    cmn ip, #0x18
    beq .L_190
    bmi .L_1d0
    cmp r1, #0x0
    orrne r0, r0, #0x1
    mov r3, r0
    mov r0, r0, lsr #0x8
    rsb ip, ip, #0x0
    orr r0, r2, r0, lsr ip
    rsb ip, ip, #0x18
    movs r1, r3, lsl ip
    bxeq lr
    tst r1, #-2147483648
    bxeq lr
    movs r1, r1, lsl #0x1
    andeqs r1, r0, #0x1
    addne r0, r0, #0x1
    bx lr
.L_190:
    mov r0, r0, lsl #0x1
    b .L_1c0
.L_198:
    mov r0, #-16777216
    orr r0, r2, r0, lsr #0x1
    bx lr
.L_1a4:
    mvn r0, #-2147483648
    bx lr
.L_1ac:
    mvn r0, #-2147483648
    bx lr
.L_1b4:
    mov r0, #-16777216
    orr r0, r2, r0, lsr #0x1
    bx lr
.L_1c0:
    movs r1, r0
    mov r0, r2
    addne r0, r0, #0x1
    bx lr
.L_1d0:
    mov r0, r2
    bx lr
.L_1d8:
    mov r0, r2
    bx lr

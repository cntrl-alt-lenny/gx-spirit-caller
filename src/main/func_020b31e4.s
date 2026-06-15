; func_020b31e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b31e4
        .arm
func_020b31e4:
    eor r2, r0, r1
    and r2, r2, #-2147483648
    mov ip, #0xff
    ands r3, ip, r0, lsr #0x17
    mov r0, r0, lsl #0x8
    cmpne r3, #0xff
    beq .L_8e8
    orr r0, r0, #-2147483648
    ands ip, ip, r1, lsr #0x17
    mov r1, r1, lsl #0x8
    cmpne ip, #0xff
    beq .L_928
    orr r1, r1, #-2147483648
.L_8a0:
    add ip, r3, ip
    umull r1, r3, r0, r1
    movs r0, r3
    addpl r0, r0, r0
    subpl ip, ip, #0x1
    subs ip, ip, #0x7f
    bmi .L_9b4
    cmp ip, #0xfe
    bge .L_a20
    ands r3, r0, #0xff
    orr r0, r2, r0, lsr #0x8
    add r0, r0, ip, lsl #0x17
    tst r3, #0x80
    bxeq lr
    orrs r1, r1, r3, lsl #0x19
    andeqs r3, r0, #0x1
    addne r0, r0, #0x1
    bx lr
.L_8e8:
    cmp r3, #0x0
    beq .L_93c
    movs r0, r0, lsl #0x1
    bne .L_a10
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x9
    ands ip, ip, #0xff
    beq .L_91c
    cmp ip, #0xff
    blt .L_a04
    cmp r1, #0x0
    beq .L_a04
    b .L_a10
.L_91c:
    cmp r1, #0x0
    beq .L_a18
    b .L_a04
.L_928:
    cmp ip, #0x0
    beq .L_998
.L_930:
    movs r1, r1, lsl #0x1
    bne .L_a10
    b .L_a04
.L_93c:
    movs r0, r0, lsl #0x1
    beq .L_974
    mov r0, r0, lsr #0x1
    clz r3, r0
    movs r0, r0, lsl r3
    rsb r3, r3, #0x1
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x8
    ands ip, ip, #0xff
    beq .L_998
    cmp ip, #0xff
    beq .L_930
    orr r1, r1, #-2147483648
    b .L_8a0
.L_974:
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x9
    ands ip, ip, #0xff
    beq .L_a44
    cmp ip, #0xff
    blt .L_a44
    cmp r1, #0x0
    beq .L_a18
    b .L_a10
.L_998:
    movs r1, r1, lsl #0x1
    beq .L_a44
    mov r1, r1, lsr #0x1
    clz ip, r1
    movs r1, r1, lsl ip
    rsb ip, ip, #0x1
    b .L_8a0
.L_9b4:
    cmn ip, #0x18
    beq .L_9fc
    bmi .L_a3c
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
.L_9fc:
    mov r0, r0, lsl #0x1
    b .L_a2c
.L_a04:
    mov r0, #-16777216
    orr r0, r2, r0, lsr #0x1
    bx lr
.L_a10:
    mvn r0, #-2147483648
    bx lr
.L_a18:
    mvn r0, #-2147483648
    bx lr
.L_a20:
    mov r0, #-16777216
    orr r0, r2, r0, lsr #0x1
    bx lr
.L_a2c:
    movs r1, r0
    mov r0, r2
    addne r0, r0, #0x1
    bx lr
.L_a3c:
    mov r0, r2
    bx lr
.L_a44:
    mov r0, r2
    bx lr

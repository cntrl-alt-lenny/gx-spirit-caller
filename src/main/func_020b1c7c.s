; func_020b1c7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b1c7c
        .arm
func_020b1c7c:
    and r2, r1, #-2147483648
    mov ip, r1, lsr #0x14
    bics ip, ip, #0x800
    beq .L_390
    mov r3, ip, lsl #0x15
    cmn r3, #0x200000
    bcs .L_374
    subs ip, ip, #0x380
    bls .L_3a0
    cmp ip, #0xff
    bge .L_410
    mov r1, r1, lsl #0xc
    orr r3, r2, r1, lsr #0x9
    orr r3, r3, r0, lsr #0x1d
    movs r1, r0, lsl #0x3
    orr r0, r3, ip, lsl #0x17
    bxeq lr
    tst r1, #-2147483648
    bxeq lr
    movs r1, r1, lsl #0x1
    andeqs r1, r0, #0x1
    addne r0, r0, #0x1
    bx lr
.L_374:
    orrs r3, r0, r1, lsl #0xc
    bne .L_388
    mov r0, #-16777216
    orr r0, r2, r0, lsr #0x1
    bx lr
.L_388:
    mvn r0, #-2147483648
    bx lr
.L_390:
    orrs r3, r0, r1, lsl #0xc
    bne .L_408
    mov r0, r2
    bx lr
.L_3a0:
    cmn ip, #0x17
    beq .L_3f4
    bmi .L_408
    mov r1, r1, lsl #0xb
    orr r1, r1, #-2147483648
    mov r3, r1, lsr #0x8
    orr r3, r3, r0, lsr #0x1d
    rsb ip, ip, #0x1
    movs r1, r0, lsl #0x3
    orr r0, r2, r3, lsr ip
    rsb ip, ip, #0x20
    mov r3, r3, lsl ip
    orrne r3, r3, #0x1
    movs r1, r3
    bxeq lr
    tst r1, #-2147483648
    bxeq lr
    movs r1, r1, lsl #0x1
    andeqs r1, r0, #0x1
    addne r0, r0, #0x1
    bx lr
.L_3f4:
    orr r0, r0, r1, lsl #0xc
    movs r1, r0
    mov r0, r2
    addne r0, r0, #0x1
    bx lr
.L_408:
    mov r0, r2
    bx lr
.L_410:
    mov r0, #-16777216
    orr r0, r2, r0, lsr #0x1
    bx lr

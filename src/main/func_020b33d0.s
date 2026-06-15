; func_020b33d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b33d0
        .arm
func_020b33d0:
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
    beq .L_b80
    mov ip, r1, lsr #0x17
    orr r1, r2, r1, lsl #0x8
    ands r2, ip, #0xff
    beq .L_bc0
.L_a9c:
    subs ip, r3, ip
    beq .L_ae4
    rsb r2, ip, #0x20
    movs r2, r1, lsl r2
    mov r1, r1, lsr ip
    orrne r1, r1, #0x1
    subs r0, r0, r1
    bpl .L_b28
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
.L_ae4:
    subs r0, r0, r1
    beq .L_c8c
    mov r2, r3, lsl #0x17
    and r2, r2, #-2147483648
    bic r3, r3, #0x100
    clz ip, r0
    movs r0, r0, lsl ip
    sub r3, r3, ip
    cmp r3, #0x0
    bgt .L_b18
    rsb r3, r3, #0x9
    orr r0, r2, r0, lsr r3
    bx lr
.L_b18:
    add r0, r0, r0
    orr r0, r2, r0, lsr #0x9
    orr r0, r0, r3, lsl #0x17
    bx lr
.L_b28:
    mov r2, r3, lsl #0x17
    and r2, r2, #-2147483648
    bic r3, r3, #0x100
    clz ip, r0
    movs r0, r0, lsl ip
    sub r3, r3, ip
    cmp r3, #0x0
    bgt .L_b54
    rsb r3, r3, #0x9
    orr r0, r2, r0, lsr r3
    bx lr
.L_b54:
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
.L_b80:
    cmp r3, #0x100
    movge r2, #-2147483648
    movlt r2, #0x0
    ands r3, r3, #0xff
    beq .L_be8
    movs r0, r0, lsl #0x1
    bne .L_cc0
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x9
    ands ip, ip, #0xff
    beq .L_cb4
    cmp ip, #0xff
    blt .L_cb4
    cmp r1, #0x0
    beq .L_cc8
    b .L_cc0
.L_bc0:
    cmp ip, #0x100
    movge r2, #-2147483648
    movlt r2, #0x0
    and r3, r3, #0xff
    ands ip, ip, #0xff
    beq .L_c50
.L_bd8:
    eor r2, r2, #-2147483648
    movs r1, r1, lsl #0x1
    bne .L_cc0
    b .L_cb4
.L_be8:
    movs r0, r0, lsl #0x1
    beq .L_c20
    mov r0, r0, lsr #0x1
    mov r3, #0x1
    mov ip, r1, lsr #0x17
    mov r1, r1, lsl #0x8
    ands ip, ip, #0xff
    beq .L_c50
    cmp ip, #0xff
    beq .L_bd8
    orr r1, r1, #-2147483648
    orr r3, r3, r2, lsr #0x17
    orr ip, ip, r2, lsr #0x17
    b .L_a9c
.L_c20:
    mov r3, r1, lsr #0x17
    mov r0, r1, lsl #0x9
    ands r2, r3, #0xff
    beq .L_c44
    cmp r2, #0xff
    blt .L_c6c
    cmp r0, #0x0
    bne .L_cac
    b .L_cb4
.L_c44:
    cmp r0, #0x0
    beq .L_c8c
    b .L_c6c
.L_c50:
    movs r1, r1, lsl #0x1
    beq .L_c74
    mov r1, r1, lsr #0x1
    mov ip, #0x1
    orr ip, ip, r2, lsr #0x17
    orr r3, r3, r2, lsr #0x17
    b .L_a9c
.L_c6c:
    mov r0, r1
    bx lr
.L_c74:
    cmp r0, #0x0
    subges r3, r3, #0x1
    add r0, r0, r0
    orr r0, r2, r0, lsr #0x9
    orr r0, r0, r3, lsl #0x17
    bx lr
.L_c8c:
    mov r0, #0x0
    bx lr
    cmp r0, #0x0
    subges r3, r3, #0x1
    add r0, r0, r0
    mov r0, r0, lsr #0x9
    orr r0, r0, r3, lsl #0x17
    bx lr
.L_cac:
    mvn r0, #-2147483648
    bx lr
.L_cb4:
    mov r0, #-16777216
    orr r0, r2, r0, lsr #0x1
    bx lr
.L_cc0:
    mvn r0, #-2147483648
    bx lr
.L_cc8:
    mvn r0, #-2147483648
    bx lr

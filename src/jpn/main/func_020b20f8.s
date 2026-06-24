; func_020b20f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021aa380
        .global func_020b20f8
        .arm
func_020b20f8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    cmp r1, r2
    bcs .L_4b0
    movs ip, r1, lsr #0x14
    beq .L_45c
    bic r1, r1, r2
    orr r1, r1, #0x100000
.L_384:
    movs ip, ip, asr #0x1
    bcs .L_398
    sub ip, ip, #0x1
    movs r0, r0, lsl #0x1
    adc r1, r1, r1
.L_398:
    movs r3, r0, lsl #0x1
    adc r1, r1, r1
    mov r2, #0x0
    mov r4, #0x0
    mov lr, #0x200000
.L_3ac:
    add r6, r4, lr
    cmp r6, r1
    addle r4, r6, lr
    suble r1, r1, r6
    addle r2, r2, lr
    movs r3, r3, lsl #0x1
    adc r1, r1, r1
    movs lr, lr, lsr #0x1
    bne .L_3ac
    mov r0, #0x0
    mov r5, #0x0
    cmp r1, r4
    cmpeq r3, #-2147483648
    bcc .L_3f4
    subs r3, r3, #-2147483648
    sbc r1, r1, r4
    add r4, r4, #0x1
    mov r0, #-2147483648
.L_3f4:
    movs r3, r3, lsl #0x1
    adc r1, r1, r1
    mov lr, #0x40000000
.L_400:
    add r6, r5, lr
    cmp r4, r1
    cmpeq r6, r3
    bhi .L_420
    add r5, r6, lr
    subs r3, r3, r6
    sbc r1, r1, r4
    add r0, r0, lr
.L_420:
    movs r3, r3, lsl #0x1
    adc r1, r1, r1
    movs lr, lr, lsr #0x1
    bne .L_400
    orrs r1, r1, r3
    biceq r0, r0, #0x1
    movs r1, r2, lsr #0x1
    movs r0, r0, rrx
    adcs r0, r0, #0x0
    adc r1, r1, #0x0
    add r1, r1, #0x20000000
    sub r1, r1, #0x100000
    add r1, r1, ip, lsl #0x14
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_45c:
    cmp r1, #0x0
    bne .L_48c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    mvn ip, #0x13
    clz r5, r0
    movs r0, r0, lsl r5
    sub ip, ip, r5
    mov r1, r0, lsr #0xb
    mov r0, r0, lsl #0x15
    b .L_384
.L_48c:
    clz r2, r1
    movs r1, r1, lsl r2
    rsb r2, r2, #0x2b
    mov r1, r1, lsr #0xb
    orr r1, r1, r0, lsr r2
    rsb r2, r2, #0x20
    mov r0, r0, lsl r2
    rsb ip, r2, #0x1
    b .L_384
.L_4b0:
    tst r1, #-2147483648
    beq .L_4cc
    bics r3, r1, #-2147483648
    cmpeq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    b .L_4d8
.L_4cc:
    orrs r2, r0, r1, lsl #0xc
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
.L_4d8:
    ldr r2, _LIT1
    orr r1, r1, r2
    ldr r3, _LIT2
    mov r4, #0x21
    str r4, [r3]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x7ff00000
_LIT1: .word 0x7ff80000
_LIT2: .word data_021aa380

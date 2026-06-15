; func_020b0138 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b0034
        .extern func_020b1854
        .extern func_020b1964
        .extern func_020b1e88
        .extern func_020b2b50
        .global func_020b0138
        .arm
func_020b0138:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, lr}
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    mov r4, r2
    bl func_020b1854
    cmp r0, #0x2
    ble .L_f4
    mov r0, #0x0
    ldr r2, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r1, r0
    bl func_020b2b50
    bne .L_108
.L_f4:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
.L_108:
    ldr r3, [sp, #0xc]
    ldr r0, _LIT0
    ldr r1, [sp, #0x8]
    and r0, r3, r0
    movs ip, r0, asr #0x14
    bne .L_194
    bic r0, r3, #-2147483648
    orrs r0, r1, r0
    ldreq r0, [sp, #0x8]
    ldreq r1, [sp, #0xc]
    ldmeqia sp!, {r4, lr}
    addeq sp, sp, #0x10
    bxeq lr
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    ldr r3, _LIT1
    mov r2, #0x0
    bl func_020b1e88
    mov r3, r1
    ldr r1, _LIT0
    ldr ip, _LIT2
    and r1, r3, r1
    mov r2, r0
    mov r0, r1, asr #0x14
    str r2, [sp, #0x8]
    str r3, [sp, #0xc]
    cmp r4, ip
    sub ip, r0, #0x36
    bge .L_194
    ldr r0, _LIT3
    ldr r1, _LIT4
    bl func_020b1e88
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
.L_194:
    ldr r0, _LIT5
    cmp ip, r0
    bne .L_1c0
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    mov r2, r0
    mov r3, r1
    bl func_020b1964
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
.L_1c0:
    add r2, ip, r4
    sub r0, r0, #0x1
    cmp r2, r0
    ble .L_204
    ldr r2, [sp, #0x8]
    ldr r3, [sp, #0xc]
    ldr r0, _LIT6
    ldr r1, _LIT7
    bl func_020b0034
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT6
    ldr r1, _LIT7
    bl func_020b1e88
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
.L_204:
    cmp r2, #0x0
    ble .L_22c
    ldr r1, _LIT8
    ldr r0, [sp, #0x8]
    and r1, r3, r1
    orr r1, r1, r2, lsl #0x14
    str r1, [sp, #0xc]
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
.L_22c:
    mvn r0, #0x35
    cmp r2, r0
    bgt .L_2ac
    ldr r0, _LIT9
    cmp r4, r0
    ble .L_278
    ldr r2, [sp, #0x8]
    ldr r3, [sp, #0xc]
    ldr r0, _LIT6
    ldr r1, _LIT7
    bl func_020b0034
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT6
    ldr r1, _LIT7
    bl func_020b1e88
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
.L_278:
    ldr r2, [sp, #0x8]
    ldr r3, [sp, #0xc]
    ldr r0, _LIT3
    ldr r1, _LIT4
    bl func_020b0034
    mov r2, r0
    mov r3, r1
    ldr r0, _LIT3
    ldr r1, _LIT4
    bl func_020b1e88
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
.L_2ac:
    ldr r0, _LIT8
    add r1, r2, #0x36
    and r0, r3, r0
    orr r3, r0, r1, lsl #0x14
    ldr r2, [sp, #0x8]
    ldr r1, _LIT10
    mov r0, #0x0
    str r3, [sp, #0xc]
    bl func_020b1e88
    ldmia sp!, {r4, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x7ff00000
_LIT1: .word 0x43500000
_LIT2: .word 0xffff3cb0
_LIT3: .word 0xc2f8f359
_LIT4: .word 0x01a56e1f
_LIT5: .word 0x000007ff
_LIT6: .word 0x8800759c
_LIT7: .word 0x7e37e43c
_LIT8: .word 0x800fffff
_LIT9: .word 0x0000c350
_LIT10: .word 0x3c900000

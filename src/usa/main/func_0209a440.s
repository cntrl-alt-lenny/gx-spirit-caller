; func_0209a440 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a82b4
        .extern func_02093b08
        .global func_0209a440
        .arm
func_0209a440:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r0, r1, lsl #0x10
    mov r3, r0, lsr #0x10
    and r0, r3, #0x7f00
    mov r0, r0, lsl #0x8
    cmp r2, #0x0
    mov r0, r0, lsr #0x10
    beq .L_64
    ldr r1, _LIT0
    mov r2, #0x1
    ldrh r4, [r1, #0x34]
    ldr r3, [r1]
    orr r2, r4, r2, lsl r0
    cmp r3, #0x0
    strh r2, [r1, #0x34]
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, lr}
    bxeq lr
    mov r1, #0x4
    mov r2, #0x0
    blx r3
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_64:
    cmp r0, #0x10
    bne .L_134
    ldr r1, _LIT0
    ldrh r3, [r1, #0xc]
    ldrh r2, [r1, #0x14]
    add r3, r3, #0x1
    strh r3, [r1, #0xc]
    ldrh r3, [r1, #0xc]
    cmp r3, r2
    movcs r2, #0x0
    strcsh r2, [r1, #0xc]
    ldr r1, _LIT1
    ldr r2, _LIT0
    ldrh r3, [r1]
    ldr r1, _LIT2
    ldrh ip, [r2, #0xc]
    strh r3, [sp]
    ldrh r1, [r1]
    ldr r4, [r2, #0x10]
    mov lr, ip, lsl #0x3
    strh r1, [sp, #0x2]
    ldr r3, [sp]
    add r1, r4, ip, lsl #0x3
    mov r3, r3, lsl #0x14
    mov r3, r3, lsr #0x14
    strh r3, [r4, lr]
    ldr r3, [sp]
    mov r3, r3, lsl #0x8
    mov r3, r3, lsr #0x14
    strh r3, [r1, #0x2]
    ldr r3, [sp]
    mov r3, r3, lsl #0x7
    mov r3, r3, lsr #0x1f
    and r3, r3, #0xff
    strh r3, [r1, #0x4]
    ldr r3, [sp]
    mov r3, r3, lsl #0x5
    mov r3, r3, lsr #0x1e
    and r3, r3, #0xff
    strh r3, [r1, #0x6]
    ldr r3, [r2]
    cmp r3, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldrh r2, [r2, #0xc]
    mov r1, #0x0
    and r2, r2, #0xff
    blx r3
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_134:
    ands r1, r1, #0x1000000
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, lr}
    bxeq lr
    and r1, r3, #0xff
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_2a4
    b .L_168
    b .L_2a4
    b .L_248
    b .L_250
    b .L_240
.L_168:
    cmp r0, #0x0
    beq .L_18c
    cmp r0, #0x1
    beq .L_1f0
    cmp r0, #0x2
    ldreq r1, _LIT0
    moveq r2, #0x0
    streqh r2, [r1, #0x32]
    b .L_1fc
.L_18c:
    ldr r1, _LIT1
    ldr r3, _LIT2
    ldrh ip, [r1]
    ldr r1, _LIT0
    mov r2, #0x0
    strh ip, [sp, #0x4]
    ldrh r3, [r3]
    strh r3, [sp, #0x6]
    ldr ip, [sp, #0x4]
    strh r2, [r1, #0x32]
    mov r3, ip, lsl #0x7
    mov r2, ip, lsl #0x5
    mov lr, ip, lsl #0x14
    mov ip, ip, lsl #0x8
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsr #0x1e
    mov lr, lr, lsr #0x14
    mov ip, ip, lsr #0x14
    and r3, r3, #0xff
    and r2, r2, #0xff
    strh lr, [r1, #0x4]
    strh ip, [r1, #0x6]
    strh r3, [r1, #0x8]
    strh r2, [r1, #0xa]
    b .L_1fc
.L_1f0:
    ldr r1, _LIT0
    mov r2, #0x2
    strh r2, [r1, #0x32]
.L_1fc:
    ldr r1, _LIT0
    mov r2, #0x1
    ldrh ip, [r1, #0x36]
    mvn r2, r2, lsl r0
    ldr r3, [r1]
    and r2, ip, r2
    cmp r3, #0x0
    strh r2, [r1, #0x36]
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, lr}
    bxeq lr
    mov r1, #0x0
    mov r2, r1
    blx r3
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_240:
    mov r4, #0x3
    b .L_254
.L_248:
    mov r4, #0x1
    b .L_254
.L_250:
    mov r4, #0x2
.L_254:
    ldr r1, _LIT0
    mov lr, #0x1
    ldrh ip, [r1, #0x34]
    ldr r3, [r1]
    mvn r2, lr, lsl r0
    orr ip, ip, lr, lsl r0
    strh ip, [r1, #0x34]
    ldrh ip, [r1, #0x36]
    cmp r3, #0x0
    addeq sp, sp, #0x8
    and r2, ip, r2
    strh r2, [r1, #0x36]
    ldmeqia sp!, {r4, lr}
    bxeq lr
    and r1, r4, #0xff
    mov r2, #0x0
    blx r3
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
.L_2a4:
    bl func_02093b08
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a82b4
_LIT1: .word 0x027fffaa
_LIT2: .word 0x027fffac

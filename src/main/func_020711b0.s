; func_020711b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef0c
        .extern data_0219ef1c
        .extern func_020713ac
        .extern func_020716bc
        .extern func_020718d8
        .extern func_020726e0
        .extern func_0207352c
        .extern func_02073dcc
        .extern func_02073f84
        .global func_020711b0
        .arm
func_020711b0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh ip, [r4, #0xc]
    ldrh r6, [r4, #0x10]
    ldrh r2, [r4, #0xe]
    ldrh r0, [r4, #0x12]
    mov r5, r6, asr #0x8
    mov r3, ip, asr #0x8
    orr r5, r5, r6, lsl #0x8
    orr ip, r3, ip, lsl #0x8
    mov r3, r5, lsl #0x10
    mov r5, r0, asr #0x8
    mov ip, ip, lsl #0x10
    mov lr, r2, asr #0x8
    mov r6, r3, lsr #0x10
    orr r0, r5, r0, lsl #0x8
    mov r3, ip, lsr #0x10
    orr r2, lr, r2, lsl #0x8
    mov r5, r6, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    orr r0, r5, r0, lsr #0x10
    orr r2, r3, r2, lsr #0x10
    mov r5, r1
    cmp r0, r2
    beq .L_2b4
    bl func_02073dcc
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldrh r1, [r4, #0x2]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    cmp r5, r0, lsr #0x10
    addcc sp, sp, #0x8
    ldmccia sp!, {r4, r5, r6, lr}
    bxcc lr
    ldrb r1, [r4]
    mov r0, r4
    and r1, r1, #0xf
    mov r1, r1, lsl #0x2
    bl func_02073f84
    ldr r1, _LIT0
    cmp r0, r1
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    ldrh r2, [r4, #0x10]
    ldrh ip, [r4, #0x12]
    ldr r1, _LIT1
    mov r0, r2, asr #0x8
    orr r0, r0, r2, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r2, ip, asr #0x8
    mov r3, r0, lsr #0x10
    orr r0, r2, ip, lsl #0x8
    mov r2, r3, lsl #0x10
    mov r0, r0, lsl #0x10
    ldr r1, [r1]
    orr r0, r2, r0, lsr #0x10
    cmp r1, r0
    bne .L_2b4
    ldrh r2, [r4, #0xc]
    ldrh ip, [r4, #0xe]
    sub r0, r4, #0x8
    mov r1, r2, asr #0x8
    orr r1, r1, r2, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r2, ip, asr #0x8
    mov r3, r1, lsr #0x10
    orr r1, r2, ip, lsl #0x8
    mov r2, r3, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    mov r2, #0x1
    bl func_0207352c
.L_2b4:
    add r1, sp, #0x0
    mov r0, r4
    bl func_020713ac
    movs r4, r0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldrh r2, [r4, #0x2]
    ldrb r3, [r4]
    ldrb ip, [r4, #0x9]
    mov r1, r2, asr #0x8
    orr r1, r1, r2, lsl #0x8
    mov r1, r1, lsl #0x10
    and r3, r3, #0xf
    mov r2, r1, lsr #0x10
    cmp ip, #0x11
    add r1, r4, r3, lsl #0x2
    sub r2, r2, r3, lsl #0x2
    bne .L_308
    bl func_020716bc
    b .L_334
.L_308:
    ldr r3, _LIT1
    ldr r3, [r3]
    cmp r3, #0x0
    beq .L_334
    cmp ip, #0x1
    bne .L_328
    bl func_020726e0
    b .L_334
.L_328:
    cmp ip, #0x6
    bne .L_334
    bl func_020718d8
.L_334:
    ldr r0, [sp]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r1, _LIT2
    sub r0, r4, #0xe
    ldr r1, [r1]
    blx r1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x0000ffff
_LIT1: .word data_0219ef1c
_LIT2: .word data_0219ef0c

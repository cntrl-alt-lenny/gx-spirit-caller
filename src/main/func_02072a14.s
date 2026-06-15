; func_02072a14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eec4
        .extern data_0219ef1c
        .extern data_0219ef2c
        .extern func_02072bcc
        .extern func_0207352c
        .extern func_02073da0
        .global func_02072a14
        .arm
func_02072a14:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    cmp r1, #0x1c
    mov r6, r0
    addcc sp, sp, #0x4
    ldmccia sp!, {r4, r5, r6, r7, lr}
    bxcc lr
    ldr r1, _LIT0
    add r0, r6, #0x8
    bl func_02073da0
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldrh r0, [r6]
    cmp r0, #0x100
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    ldrh r0, [r6, #0x2]
    cmp r0, #0x8
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    ldrh r1, [r6, #0x4]
    ldr r0, _LIT2
    cmp r1, r0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    ldrh r1, [r6, #0x6]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    cmp r4, #0x1
    beq .L_2c4
    cmp r4, #0x2
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
.L_2c4:
    ldrh r1, [r6, #0xe]
    ldrh r5, [r6, #0x10]
    ldr r2, _LIT1
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r1, r5, asr #0x8
    orr r0, r1, r5, lsl #0x8
    mov r1, r0, lsl #0x10
    mov r3, r3, lsl #0x10
    orr r1, r3, r1, lsr #0x10
    ldr r0, [r2]
    ldrh r3, [r6, #0x18]
    ldrh lr, [r6, #0x1a]
    cmp r1, r0
    mov r2, r3, asr #0x8
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    moveq r5, #0x1
    mov r3, lr, asr #0x8
    mov ip, r2, lsr #0x10
    orr r2, r3, lr, lsl #0x8
    mov r3, ip, lsl #0x10
    mov r2, r2, lsl #0x10
    orr r2, r3, r2, lsr #0x10
    movne r5, #0x0
    cmp r0, r2
    moveq r7, #0x1
    movne r7, #0x0
    cmp r5, #0x0
    bne .L_350
    mov r2, r7
    add r0, r6, #0x8
    bl func_0207352c
.L_350:
    cmp r4, #0x1
    bne .L_374
    cmp r7, #0x0
    beq .L_374
    mov r0, r6
    bl func_02072bcc
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_374:
    cmp r4, #0x2
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    cmp r7, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    cmp r5, #0x0
    ldrne r0, _LIT3
    movne r1, #0x1
    strneb r1, [r0]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_0219ef2c
_LIT1: .word data_0219ef1c
_LIT2: .word 0x00000406
_LIT3: .word data_0219eec4

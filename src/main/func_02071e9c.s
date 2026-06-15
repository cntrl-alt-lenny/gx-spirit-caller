; func_02071e9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02072234
        .extern func_02072384
        .extern func_02072444
        .extern func_020724c8
        .extern func_020918d0
        .extern func_020919d8
        .global func_02071e9c
        .arm
func_02071e9c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r5, r1
    mov r6, r2
    bl func_020724c8
    movs r4, r0
    beq .L_e8c
    ldrb r0, [r4, #0x8]
    cmp r0, #0x2
    beq .L_eac
.L_e8c:
    mov r0, r7
    mov r1, r5
    mov r2, r6
    mov r3, #0x0
    bl func_02072234
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_eac:
    bl func_020918d0
    ldrh r2, [r5, #0x4]
    ldrh ip, [r5, #0x6]
    mov r0, r5
    mov r1, r2, asr #0x8
    orr r1, r1, r2, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r2, ip, asr #0x8
    mov r3, r1, lsr #0x10
    orr r1, r2, ip, lsl #0x8
    mov r2, r3, lsl #0x10
    mov r1, r1, lsl #0x10
    orr r1, r2, r1, lsr #0x10
    add r1, r1, #0x1
    str r1, [r4, #0x24]
    ldrh r3, [r5, #0x8]
    ldrh lr, [r5, #0xa]
    mov r1, r4
    mov r2, r3, asr #0x8
    orr r2, r2, r3, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r3, lr, asr #0x8
    mov ip, r2, lsr #0x10
    orr r2, r3, lr, lsl #0x8
    mov r3, ip, lsl #0x10
    mov r2, r2, lsl #0x10
    orr r2, r3, r2, lsr #0x10
    str r2, [r4, #0x30]
    ldrh r3, [r5, #0xe]
    mov r2, r3, asr #0x8
    orr r2, r2, r3, lsl #0x8
    strh r2, [r4, #0x2c]
    bl func_02072444
    mov r0, r4
    mov r1, #0x0
    bl func_02072384
    mov r0, #0x4
    strb r0, [r4, #0x8]
    ldr r0, [r4, #0x4]
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldr r0, [r4]
    bl func_020919d8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr

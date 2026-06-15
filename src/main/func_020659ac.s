; func_020659ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101598
        .extern func_02055330
        .extern func_02065dc0
        .global func_020659ac
        .arm
func_020659ac:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x1c
    ldr lr, _LIT0
    add r5, sp, #0x4
    ldrb r4, [lr]
    ldrb r3, [lr, #0x1]
    mov r2, #0x2
    mov r1, #0x7
    strb r4, [r5]
    strb r3, [r5, #0x1]
    ldrb ip, [lr, #0x2]
    ldrb r3, [lr, #0x3]
    mov r4, r0
    strb ip, [r5, #0x2]
    strb r3, [r5, #0x3]
    ldrb r3, [lr, #0x4]
    ldrb r0, [lr, #0x5]
    strb r3, [r5, #0x4]
    strb r0, [r5, #0x5]
    strb r2, [sp, #0xa]
    strb r1, [sp, #0xb]
    ldr r3, [r4, #0x8]
    mov r1, r3, lsr #0x18
    mov r0, r3, lsr #0x8
    mov r2, r3, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    mov r3, r3, lsl #0x18
    orr r0, r1, r0
    and r2, r2, #0xff0000
    and r1, r3, #-16777216
    orr r0, r2, r0
    orr r0, r1, r0
    str r0, [sp, #0xc]
    ldr r0, [r4, #0x2c]
    add r3, sp, #0x4
    str r0, [sp, #0x10]
    ldrh r0, [r4, #0x30]
    mov r1, r0, asr #0x8
    mov r0, r0, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    strh r0, [sp, #0x14]
    ldrb r0, [r4, #0x32]
    mvn r1, #0x0
    strb r0, [sp, #0x16]
    ldr r0, [r4, #0x10]
    cmp r0, #0x2
    movne r0, #0x1
    moveq r0, #0x0
    strb r0, [sp, #0x17]
    ldr r0, [r4, #0x4]
    cmp r0, r1
    ldreq r0, [r4]
    mov r1, #0x14
    str r1, [sp]
    ldrh r2, [r4, #0x30]
    ldr r1, [r4, #0x2c]
    bl func_02065dc0
    bl func_02055330
    add r0, r0, #0x2bc
    str r0, [r4, #0x28]
    mov r0, #0xc
    str r0, [r4, #0x24]
    ldrb r0, [r4, #0x32]
    cmp r0, #0x0
    movne r0, #0x1
    strneb r0, [r4, #0x33]
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02101598

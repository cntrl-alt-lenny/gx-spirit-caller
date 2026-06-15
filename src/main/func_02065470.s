; func_02065470 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101598
        .extern func_02065dc0
        .global func_02065470
        .arm
func_02065470:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    ldr r6, _LIT0
    add r3, sp, #0x4
    ldrb ip, [r6]
    ldrb r2, [r6, #0x1]
    mov r5, #0x2
    mov r4, #0x6
    strb ip, [r3]
    strb r2, [r3, #0x1]
    ldrb lr, [r6, #0x2]
    ldrb ip, [r6, #0x3]
    mov r2, #0x15
    strb lr, [r3, #0x2]
    strb ip, [r3, #0x3]
    ldrb lr, [r6, #0x4]
    ldrb ip, [r6, #0x5]
    strb lr, [r3, #0x4]
    strb ip, [r3, #0x5]
    strb r5, [sp, #0xa]
    strb r4, [sp, #0xb]
    ldr r4, [r0, #0xc]
    strb r4, [sp, #0x11]
    ldr r5, [r0, #0x8]
    mov lr, r5, lsr #0x18
    mov ip, r5, lsr #0x8
    mov r4, r5, lsl #0x8
    mov r5, r5, lsl #0x18
    and lr, lr, #0xff
    and ip, ip, #0xff00
    and r4, r4, #0xff0000
    orr ip, lr, ip
    and r5, r5, #-16777216
    orr r4, r4, ip
    orr r4, r5, r4
    str r4, [sp, #0xc]
    ldrh lr, [r1, #0x2]
    str r2, [sp]
    mov ip, lr, asr #0x8
    mov r2, lr, lsl #0x8
    and ip, ip, #0xff
    and r2, r2, #0xff00
    orr r2, ip, r2
    mov r2, r2, lsl #0x10
    ldr r0, [r0]
    ldr r1, [r1, #0x4]
    mov r2, r2, lsr #0x10
    bl func_02065dc0
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02101598

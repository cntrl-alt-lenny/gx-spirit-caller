; func_0206fa48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eeec
        .extern data_0219ef00
        .extern data_0219f262
        .extern func_0206fc2c
        .extern func_0206fc6c
        .extern func_02070430
        .global func_0206fa48
        .arm
func_0206fa48:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    mov r5, r0
    add r2, sp, #0x0
    mov r0, r4
    mov r1, #0x3
    bl func_0206fc6c
    mov ip, r0
    cmp r5, #0x0
    bne .L_a5c
    mov r0, #0x32
    strb r0, [ip]
    mov r0, #0x4
    ldr r3, _LIT1
    strb r0, [ip, #0x1]
    ldr r1, [r3]
    mov lr, #0x36
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    strb r1, [ip, #0x2]
    ldr r1, [r3]
    ldr r2, _LIT2
    mov r1, r1, lsr #0x10
    strb r1, [ip, #0x3]
    ldr r1, [r3]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    strb r1, [ip, #0x4]
    ldr r1, [r3]
    strb r1, [ip, #0x5]
    strb lr, [ip, #0x6]
    strb r0, [ip, #0x7]
    ldr r0, [r2]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    strb r0, [ip, #0x8]
    ldr r0, [r2]
    mov r0, r0, lsr #0x10
    strb r0, [ip, #0x9]
    ldr r0, [r2]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    strb r0, [ip, #0xa]
    ldr r0, [r2]
    strb r0, [ip, #0xb]
    add ip, ip, #0xc
.L_a5c:
    add r2, ip, #0x1
    mov lr, #0xff
    sub r3, r2, r4
    mov r0, #0x0
    mov r1, #0x12c
    strb lr, [ip]
    bl func_0206fc2c
    mov r1, r0
    mov r0, r4
    sub r1, r1, r4
    bl func_02070430
    ldr r0, [sp]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_0219f262
_LIT1: .word data_0219ef00
_LIT2: .word data_0219eeec

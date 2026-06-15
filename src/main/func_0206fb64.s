; func_0206fb64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef00
        .extern data_0219f262
        .extern func_0206fc2c
        .extern func_0206fc6c
        .extern func_02070430
        .global func_0206fb64
        .arm
func_0206fb64:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    add r2, sp, #0x0
    mov r0, r4
    mov r1, #0x1
    bl func_0206fc6c
    ldr r1, _LIT1
    mov ip, r0
    ldr r0, [r1]
    cmp r0, #0x0
    beq .L_b28
    mov r0, #0x32
    strb r0, [ip]
    mov r0, #0x4
    strb r0, [ip, #0x1]
    ldr r0, [r1]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    strb r0, [ip, #0x2]
    ldr r0, [r1]
    mov r0, r0, lsr #0x10
    strb r0, [ip, #0x3]
    ldr r0, [r1]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    strb r0, [ip, #0x4]
    ldr r0, [r1]
    strb r0, [ip, #0x5]
    add ip, ip, #0x6
.L_b28:
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
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0219f262
_LIT1: .word data_0219ef00

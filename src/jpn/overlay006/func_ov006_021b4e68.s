; func_ov006_021b4e68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov006_021cf090
        .extern data_ov006_0224f210
        .extern data_ov006_0224f224
        .extern data_ov006_0224f260
        .extern data_ov006_0224f328
        .extern data_ov006_0225db00
        .extern func_020018b4
        .extern func_0200195c
        .extern func_02001d48
        .extern func_0202ada4
        .extern func_0202adc8
        .extern func_0202c01c
        .extern func_0202c1f8
        .extern func_0202c21c
        .extern func_0203737c
        .extern func_ov006_021b5cec
        .global func_ov006_021b4e68
        .arm
func_ov006_021b4e68:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    bl func_0202ada4
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202adc8
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c01c
    ldr r0, _LIT2
    bl func_0202c1f8
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c21c
    mov r0, #0xa0
    bl func_020018b4
    ldr r1, _LIT3
    mov r0, #0x4
    mov r2, #0x80000
    bl func_0200195c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT4
    bl func_ov006_021b5cec
    mov r1, #0x1b
    ldr r0, _LIT5
    mov r3, #0x0
    str r3, [r0]
    str r3, [r0, #0x4]
    str r3, [r0, #0x8]
    cmp r1, #0x6
    ldr ip, _LIT5
    str r1, [r0, #0xc]
    ldr r1, [ip, #0x10]
    movgt r3, #0x1
    mov r2, #0x0
    and r0, r3, #0x1
    bic r1, r1, #0x1
    orr lr, r1, r0
    sub r3, r2, #0x1
    mov r0, #0x24
    mov r1, #0x1
    str lr, [ip, #0x10]
    bl func_0203737c
    ldr r0, _LIT6
    mov r1, #0x0
    str r1, [r0, #0xc]
    mov r1, #0x2
    str r1, [r0]
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov006_0224f224
_LIT1: .word data_02104e6c
_LIT2: .word data_ov006_0224f260
_LIT3: .word data_ov006_021cf090
_LIT4: .word data_ov006_0224f328
_LIT5: .word data_ov006_0225db00
_LIT6: .word data_ov006_0224f210

; func_ov006_021b4f68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_021cf1b0
        .extern data_ov006_0224f330
        .extern data_ov006_0224f344
        .extern data_ov006_0224f380
        .extern data_ov006_0224f448
        .extern data_ov006_0225dc20
        .extern func_020018d4
        .extern func_0200197c
        .extern func_02001d68
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202c070
        .extern func_0202c24c
        .extern func_0202c270
        .extern func_020373cc
        .extern func_ov006_021b5dec
        .global func_ov006_021b4f68
        .arm
func_ov006_021b4f68:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    bl func_0202adf8
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202ae1c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c070
    ldr r0, _LIT2
    bl func_0202c24c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c270
    mov r0, #0xa0
    bl func_020018d4
    ldr r1, _LIT3
    mov r0, #0x4
    mov r2, #0x80000
    bl func_0200197c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT4
    bl func_ov006_021b5dec
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
    bl func_020373cc
    ldr r0, _LIT6
    mov r1, #0x0
    str r1, [r0, #0xc]
    mov r1, #0x2
    str r1, [r0]
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov006_0224f344
_LIT1: .word data_02104f4c
_LIT2: .word data_ov006_0224f380
_LIT3: .word data_ov006_021cf1b0
_LIT4: .word data_ov006_0224f448
_LIT5: .word data_ov006_0225dc20
_LIT6: .word data_ov006_0224f330

; func_ov011_021ca908 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3493
        .extern data_ov011_021d349b
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_0202c06c
        .extern func_ov000_021adabc
        .extern func_ov000_021adafc
        .extern func_ov000_021adb3c
        .extern func_ov000_021adb50
        .extern func_ov000_021adb70
        .extern func_ov000_021adc64
        .extern func_ov011_021cd138
        .global func_ov011_021ca908
        .arm
func_ov011_021ca908:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r1, [r0, #0x2bc]
    ldr r0, [r0, #0x2a0]
    mov r1, r1, lsl #0x18
    cmp r0, #0x0
    mov r5, r1, lsr #0x18
    beq .L_3d4
    cmp r0, #0x1
    bne .L_430
    ldr r2, [r4, #0x268]
    ldr r0, [r4, #0x270]
    ldr r1, _LIT2
    mov r3, r2, lsl #0x17
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    ldrb r6, [r1, r3, lsr #0x1c]
    beq .L_3a0
    bl func_ov011_021cd138
    ldr r2, [r4, #0x268]
    ldr r1, _LIT3
    mov r2, r2, lsl #0x17
    ldrb r1, [r1, r2, lsr #0x1c]
    add r2, r6, #0x4b0
    add r1, r2, r1
    add r0, r0, r1
    bl func_0202c06c
    mov r1, #0x0
    bl func_ov000_021adc64
    b .L_430
.L_3a0:
    mov r0, r2, lsl #0xf
    movs r0, r0, lsr #0x1c
    bne .L_3b8
    bl func_ov000_021adb3c
    bl func_ov000_021adafc
    b .L_430
.L_3b8:
    add r0, r6, #0xaf
    add r0, r0, #0x400
    add r0, r0, r5
    bl func_0202c06c
    mov r1, #0x0
    bl func_ov000_021adc64
    b .L_430
.L_3d4:
    ldr r0, [r4, #0x268]
    mov r1, r0, lsl #0x17
    movs r1, r1, lsr #0x1c
    bne .L_3f4
    bl func_ov000_021adb3c
    bl func_ov000_021adafc
    bl func_ov000_021adabc
    b .L_430
.L_3f4:
    mov r0, r0, lsl #0x13
    cmp r1, r0, lsr #0x1c
    bne .L_418
    mov r0, #0x9
    bl func_ov000_021adb50
    ldr r0, _LIT4
    bl func_0202c06c
    bl func_ov000_021adb70
    b .L_41c
.L_418:
    bl func_ov000_021adabc
.L_41c:
    add r0, r5, #0xb9
    add r0, r0, #0x400
    bl func_0202c06c
    mov r1, #0x0
    bl func_ov000_021adc64
.L_430:
    mov r0, #0x3
    mov r1, #0x0
    .word 0xebff9c07
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word data_ov011_021d3493
_LIT3: .word data_ov011_021d349b
_LIT4: .word 0x000004b2

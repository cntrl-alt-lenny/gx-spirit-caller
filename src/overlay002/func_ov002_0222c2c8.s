; func_ov002_0222c2c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae680
        .extern func_ov002_021e104c
        .extern func_ov002_021e13f4
        .extern func_ov002_0226b0b0
        .extern func_ov002_0226b258
        .global func_ov002_0222c2c8
        .arm
func_ov002_0222c2c8:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr r1, [r3, #0x5a8]
    sub r1, r1, #0x7d
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_2c4
    b .L_280
    b .L_260
    b .L_234
    b .L_1f4
.L_1f4:
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_220
    ldr r0, _LIT2
    mov r1, #0x60
    str r1, [r0, #0xd44]
    b .L_22c
.L_220:
    mov r0, #0x128
    mov r1, #0x2
    bl func_ov002_021ae680
.L_22c:
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_234:
    ldr r1, _LIT2
    ldr r2, [r1, #0xd44]
    str r2, [r3, #0x5ac]
    ldrh r3, [r0, #0x2]
    ldrh r1, [r0]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b0b0
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_260:
    ldrh r0, [r0, #0x2]
    mvn r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b258
    mov r0, #0x7d
    ldmia sp!, {r3, pc}
.L_280:
    ldr r1, _LIT3
    ldr r3, [r3, #0x5ac]
    ldrh r1, [r1, #0xb0]
    mov r2, #0x1
    ldrh r0, [r0, #0x2]
    tst r3, r2, lsl r1
    beq .L_2ac
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e104c
    b .L_2bc
.L_2ac:
    mov r0, r0, lsl #0x1f
    mov r2, #0x0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e13f4
.L_2bc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_2c4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022d0e6c

; func_ov002_02230e20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae584
        .extern func_ov002_021afff0
        .extern func_ov002_021df728
        .extern func_ov002_0226b13c
        .global func_ov002_02230e20
        .arm
func_ov002_02230e20:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_2c4
    cmp r1, #0x7f
    beq .L_298
    cmp r1, #0x80
    bne .L_300
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_288
    mov r0, #0x2
    bl func_ov002_021afff0
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_290
.L_288:
    mov r0, #0x38
    bl func_ov002_021ae584
.L_290:
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_298:
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT2
    mov r2, #0x1
    mov ip, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    ldr r3, [r0, #0xd44]
    mov r0, ip, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b13c
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_2c4:
    ldr r1, _LIT3
    mov r2, #0x3e8
    ldrh r1, [r1, #0xb2]
    cmp r1, #0x0
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x1f
    beq .L_2f0
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df728
    b .L_2f8
.L_2f0:
    mov r1, r1, lsr #0x1f
    bl func_ov002_021df728
.L_2f8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_300:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022d0d8c

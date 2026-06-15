; func_ov000_021aa5b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_ov000_021c73e0
        .global func_ov000_021aa5b8
        .arm
func_ov000_021aa5b8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, [r0, #0x140]
    mov r1, r1, lsl #0x1c
    mov r1, r1, asr #0x1c
    cmp r1, #0x4
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT0
    ldr r3, [r2]
    ldr r2, [r3, #0x140]
    mov r2, r2, lsl #0x1c
    mov r2, r2, asr #0x1c
    cmp r2, #0x1
    cmpne r2, #0x2
    cmpne r2, #0x3
    add r2, r3, #0x100
    bne .L_16c
    ldrsh r4, [r2, #0x2c]
    ldrsh r3, [r2, #0x2e]
    ldrsh r2, [r2, #0x30]
    rsb r5, r4, #0x0
    rsb r4, r3, #0x0
    mov r3, r5, lsl #0x10
    mov r4, r4, lsl #0x10
    mov r3, r3, lsr #0x10
    mov r4, r4, lsr #0x10
    mov r3, r3, lsl #0x10
    mov r4, r4, lsl #0x10
    mov r3, r3, asr #0x10
    mov r4, r4, asr #0x10
    b .L_178
.L_16c:
    ldrsh r3, [r2, #0x2c]
    ldrsh r4, [r2, #0x2e]
    ldrsh r2, [r2, #0x30]
.L_178:
    mov r3, r3, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r4, r4, lsl #0x10
    mov r5, r3, lsr #0x10
    mov r3, r4, lsr #0x10
    mov r4, r5, asr #0x4
    mov r3, r3, asr #0x4
    mov r5, r4, lsl #0x1
    add r4, r5, #0x1
    mov lr, r3, lsl #0x1
    add ip, lr, #0x1
    mov r2, r2, asr #0x4
    mov r3, r2, lsl #0x1
    add r2, r3, #0x1
    ldr r6, _LIT1
    mov r5, r5, lsl #0x1
    mov r4, r4, lsl #0x1
    mov lr, lr, lsl #0x1
    mov ip, ip, lsl #0x1
    mov r3, r3, lsl #0x1
    mov r2, r2, lsl #0x1
    ldrsh r5, [r6, r5]
    ldrsh r4, [r6, r4]
    ldrsh lr, [r6, lr]
    ldrsh ip, [r6, ip]
    ldrsh r3, [r6, r3]
    ldrsh r2, [r6, r2]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_2d8
    b .L_204
    b .L_270
    b .L_270
    b .L_270
.L_204:
    ldr r1, [r0, #0x120]
    mul r1, r4, r1
    mov r1, r1, asr #0xc
    str r1, [r0, #0x24]
    ldr r1, [r0, #0x120]
    mul r1, r5, r1
    mov r1, r1, asr #0xc
    str r1, [r0, #0x28]
    ldr r1, [r0, #0x120]
    mul r1, r4, r1
    mov r1, r1, asr #0xc
    str r1, [r0, #0x2c]
    ldr r1, [r0, #0x24]
    ldr r5, [r0, #0x30]
    mul r4, r1, lr
    add r1, r5, r4, asr #0xc
    str r1, [r0, #0x24]
    ldr r4, [r0, #0x28]
    ldr r1, [r0, #0x34]
    add r1, r4, r1
    str r1, [r0, #0x28]
    ldr r1, [r0, #0x2c]
    ldr r5, [r0, #0x38]
    mul r4, r1, ip
    add r1, r5, r4, asr #0xc
    str r1, [r0, #0x2c]
    b .L_2d8
.L_270:
    ldr r1, [r0, #0x120]
    mul r1, r4, r1
    mov r1, r1, asr #0xc
    str r1, [r0, #0x30]
    ldr r1, [r0, #0x120]
    mul r1, r5, r1
    mov r1, r1, asr #0xc
    str r1, [r0, #0x34]
    ldr r1, [r0, #0x120]
    mul r1, r4, r1
    mov r1, r1, asr #0xc
    str r1, [r0, #0x38]
    ldr r1, [r0, #0x30]
    ldr r5, [r0, #0x24]
    mul r4, r1, lr
    add r1, r5, r4, asr #0xc
    str r1, [r0, #0x30]
    ldr r4, [r0, #0x34]
    ldr r1, [r0, #0x28]
    add r1, r4, r1
    str r1, [r0, #0x34]
    ldr r1, [r0, #0x38]
    ldr r5, [r0, #0x2c]
    mul r4, r1, ip
    sub r1, r5, r4, asr #0xc
    str r1, [r0, #0x38]
.L_2d8:
    smull r1, r5, r3, ip
    adds r6, r1, #0x800
    smull r4, r1, r3, lr
    adc r5, r5, #0x0
    adds r3, r4, #0x800
    mov r4, r6, lsr #0xc
    orr r4, r4, r5, lsl #0x14
    str r4, [r0, #0x3c]
    adc r1, r1, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r1, lsl #0x14
    str r2, [r0, #0x40]
    rsb r1, r3, #0x0
    str r1, [r0, #0x44]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov000_021c73e0
_LIT1: .word data_020bef80

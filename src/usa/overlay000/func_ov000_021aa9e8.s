; func_ov000_021aa9e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee8c
        .extern data_ov000_021c7300
        .extern func_ov000_021aa760
        .global func_ov000_021aa9e8
        .arm
func_ov000_021aa9e8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r5, [r0]
    add r2, r5, #0x100
    ldrh r1, [r2, #0x3e]
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x140]
    mov r0, r0, lsl #0x1c
    mov r0, r0, asr #0x1c
    cmp r0, #0x3
    cmpne r0, #0x4
    bne .L_50
    ldr r1, [r5, #0x144]
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    add r0, r5, #0x3e
    add r0, r0, #0x100
    blx r1
    ldmia sp!, {r3, r4, r5, pc}
.L_50:
    cmp r0, #0x1
    cmpne r0, #0x2
    rsb r4, r1, #0x100
    cmpne r0, #0x3
    bne .L_a0
    add r0, r5, #0x100
    ldrsh r3, [r0, #0x2c]
    ldrsh r1, [r0, #0x2e]
    ldrsh r2, [r0, #0x30]
    rsb r0, r3, #0x0
    rsb r1, r1, #0x0
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    b .L_ac
.L_a0:
    ldrsh r0, [r2, #0x2c]
    ldrsh r1, [r2, #0x2e]
    ldrsh r2, [r2, #0x30]
.L_ac:
    add ip, r5, #0x100
    ldrsh r3, [ip, #0x38]
    cmp r3, #0x0
    beq .L_f4
    add r0, r4, #0x100
    mov r0, r0, lsl #0x7
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add lr, r0, #0x1
    ldr r0, _LIT1
    mov lr, lr, lsl #0x1
    ldrsh r0, [r0, lr]
    ldrsh ip, [ip, #0x32]
    add r0, r0, #0x1000
    mul r0, r3, r0
    add r0, ip, r0, asr #0xd
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
.L_f4:
    add ip, r5, #0x100
    ldrsh r3, [ip, #0x3a]
    cmp r3, #0x0
    beq .L_13c
    add r1, r4, #0x100
    mov r1, r1, lsl #0x7
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add lr, r1, #0x1
    ldr r1, _LIT1
    mov lr, lr, lsl #0x1
    ldrsh r1, [r1, lr]
    ldrsh ip, [ip, #0x34]
    add r1, r1, #0x1000
    mul r1, r3, r1
    add r1, ip, r1, asr #0xd
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
.L_13c:
    add ip, r5, #0x100
    ldrsh r3, [ip, #0x3c]
    cmp r3, #0x0
    beq .L_184
    add r2, r4, #0x100
    mov r2, r2, lsl #0x7
    mov r2, r2, asr #0x4
    mov r2, r2, lsl #0x1
    add lr, r2, #0x1
    ldr r2, _LIT1
    mov lr, lr, lsl #0x1
    ldrsh r2, [r2, lr]
    ldrsh ip, [ip, #0x36]
    add r2, r2, #0x1000
    mul r2, r3, r2
    add r2, ip, r2, asr #0xd
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
.L_184:
    bl func_ov000_021aa760
    ldr r2, [r5, #0x128]
    cmp r2, #0x0
    beq .L_1d0
    add r0, r4, #0x100
    mov r0, r0, lsl #0x7
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    ldr r1, [r5, #0x124]
    add r0, r0, #0x1000
    mul r0, r2, r0
    add r0, r1, r0, asr #0xd
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [r5, #0x120]
.L_1d0:
    ldr r2, [r5, #0xcc]
    cmp r2, #0x0
    beq .L_210
    add r0, r4, #0x100
    mov r0, r0, lsl #0x7
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    ldr r1, [r5, #0x78]
    add r0, r0, #0x1000
    mul r0, r2, r0
    add r0, r1, r0, asr #0xd
    str r0, [r5, #0x24]
.L_210:
    ldr r2, [r5, #0xd0]
    cmp r2, #0x0
    beq .L_250
    add r0, r4, #0x100
    mov r0, r0, lsl #0x7
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    ldr r1, [r5, #0x7c]
    add r0, r0, #0x1000
    mul r0, r2, r0
    add r0, r1, r0, asr #0xd
    str r0, [r5, #0x28]
.L_250:
    ldr r2, [r5, #0xd4]
    cmp r2, #0x0
    beq .L_290
    add r0, r4, #0x100
    mov r0, r0, lsl #0x7
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    ldr r1, [r5, #0x80]
    add r0, r0, #0x1000
    mul r0, r2, r0
    add r0, r1, r0, asr #0xd
    str r0, [r5, #0x2c]
.L_290:
    ldr r2, [r5, #0xd8]
    cmp r2, #0x0
    beq .L_2d0
    add r0, r4, #0x100
    mov r0, r0, lsl #0x7
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    ldr r1, [r5, #0x84]
    add r0, r0, #0x1000
    mul r0, r2, r0
    add r0, r1, r0, asr #0xd
    str r0, [r5, #0x30]
.L_2d0:
    ldr r2, [r5, #0xdc]
    cmp r2, #0x0
    beq .L_310
    add r0, r4, #0x100
    mov r0, r0, lsl #0x7
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    ldr r1, [r5, #0x88]
    add r0, r0, #0x1000
    mul r0, r2, r0
    add r0, r1, r0, asr #0xd
    str r0, [r5, #0x34]
.L_310:
    ldr r2, [r5, #0xe0]
    cmp r2, #0x0
    beq .L_350
    add r0, r4, #0x100
    mov r0, r0, lsl #0x7
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    ldr r1, [r5, #0x8c]
    add r0, r0, #0x1000
    mul r0, r2, r0
    add r0, r1, r0, asr #0xd
    str r0, [r5, #0x38]
.L_350:
    add r0, r5, #0x100
    ldrh r1, [r0, #0x3e]
    sub r1, r1, #0x2
    strh r1, [r0, #0x3e]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov000_021c7300
_LIT1: .word data_020bee8c

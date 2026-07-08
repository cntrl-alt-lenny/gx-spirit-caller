; func_ov002_0227a80c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd664
        .extern data_ov002_022cd888
        .extern data_ov002_022cf08c
        .extern func_ov002_021b1490
        .extern func_ov002_021e2c30
        .global func_ov002_0227a80c
        .arm
func_ov002_0227a80c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r3, #0x0
    ldr r0, [r2, #0x18]
    bic r0, r0, #0xff
    bic r0, r0, #0xff00
    bic r0, r0, #0xff0000
    bic r0, r0, #-16777216
    str r0, [r2, #0x18]
    ldrh r0, [r2, #0x16]
    orr r0, r0, #0x40
    bic r0, r0, #0x80
    strh r0, [r2, #0x16]
    ldrb r0, [r2, #0x8]
    cmp r0, #0x0
    ble .L_4ee4
    ldr r0, _LIT1
    ldr ip, _LIT2
    mov lr, #0x14
.L_4e94:
    add r1, r2, r3, lsl #0x1
    ldrh r6, [r1, #0x10]
    add r3, r3, #0x1
    and r4, r6, #0xff
    and r5, r4, #0x1
    mov r4, r6, asr #0x8
    mla r6, r5, ip, r0
    and r4, r4, #0xff
    mul r5, r4, lr
    add r4, r6, #0x30
    ldr r5, [r4, r5]
    mov r4, r5, lsl #0x2
    mov r4, r4, lsr #0x18
    mov r5, r5, lsl #0x12
    mov r4, r4, lsl #0x1
    add r4, r4, r5, lsr #0x1f
    strh r4, [r1, #0xa]
    ldrb r1, [r2, #0x8]
    cmp r3, r1
    blt .L_4e94
.L_4ee4:
    ldr r0, _LIT0
    ldr r1, [r0]
    mov r1, r1, lsl #0x1a
    movs r1, r1, lsr #0x1f
    bne .L_4f04
    ldrh r0, [r0, #0x4]
    tst r0, #0x4
    beq .L_4f38
.L_4f04:
    ldr r0, _LIT0
    mov r1, #0x10
    ldrh r0, [r0, #0x4]
    mov r2, #0x1
    and r0, r0, #0x10
    cmp r0, #0x0
    ldr r0, _LIT0
    movgt r3, #0x1
    ldr r0, [r0]
    movle r3, #0x0
    mov r0, r0, lsl #0x1f
    eor r0, r3, r0, lsr #0x1f
    bl func_ov002_021e2c30
.L_4f38:
    ldr r2, _LIT0
    ldr r0, _LIT3
    ldr r1, [r2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x2
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r3, [r2, #0x16]
    mov r0, #0x15
    sub r1, r0, #0x16
    orr ip, r3, #0x80
    mov r3, #0x1c
    strh ip, [r2, #0x16]
    bl func_ov002_021b1490
    ldr r0, _LIT4
    ldr r1, [r0, #0x300]
    bic r1, r1, #0x2
    str r1, [r0, #0x300]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cd664
_LIT4: .word data_ov002_022cd888

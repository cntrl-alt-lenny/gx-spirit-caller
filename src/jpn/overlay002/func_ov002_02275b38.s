; func_ov002_02275b38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd230
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021dec2c
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_022759c4
        .extern func_ov002_022903f0
        .global func_ov002_02275b38
        .arm
func_ov002_02275b38:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    ldr lr, _LIT0
    ldr r0, [lr, #0x18]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0xa
    bhi .L_48
    bcs .L_19c
    cmp r0, #0x2
    bhi .L_26c
    cmp r0, #0x0
    beq .L_54
    cmp r0, #0x1
    beq .L_cc
    cmp r0, #0x2
    beq .L_70
    b .L_26c
.L_48:
    cmp r0, #0xb
    beq .L_260
    b .L_26c
.L_54:
    mov r0, #0x0
    strb r0, [lr, #0x8]
    ldr r0, [lr]
    mov r1, #0x3a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
.L_70:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_a4
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_022903f0
    b .L_ac
.L_a4:
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_ac:
    ldr r1, _LIT0
    add sp, sp, #0x18
    ldr r2, [r1, #0x18]
    mov r0, #0x0
    bic r2, r2, #0xff
    orr r2, r2, #0x1
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
.L_cc:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_190
    ldr r2, _LIT0
    ldr r1, _LIT3
    ldrb r5, [r2, #0x8]
    ldr r3, _LIT4
    ldr r0, _LIT5
    add r4, r5, #0x1
    strb r4, [r2, #0x8]
    ldr lr, [r1, #0xd74]
    ldr ip, [r1, #0xd78]
    ldr r4, [r1, #0xd70]
    add r1, lr, ip
    and ip, r4, #0xff
    and r1, r1, #0xff
    orr r4, ip, r1, lsl #0x8
    mov r1, r5, lsl #0x1
    strh r4, [r3, r1]
    ldr r1, [r2]
    mov r1, r1, lsl #0x9
    mov r1, r1, lsr #0x11
    cmp r1, r0
    bne .L_134
    mov r2, #0x2
    b .L_138
.L_134:
    mov r2, #0x3
.L_138:
    ldr r1, _LIT0
    ldrb r0, [r1, #0x8]
    cmp r0, r2
    mov r0, #0x0
    blt .L_164
    ldr r2, [r1, #0x18]
    add sp, sp, #0x18
    bic r2, r2, #0xff
    orr r2, r2, #0xa
    str r2, [r1, #0x18]
    ldmia sp!, {r3, r4, r5, pc}
.L_164:
    ldr r3, _LIT6
    add sp, sp, #0x18
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_190:
    add sp, sp, #0x18
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_19c:
    ldr r0, [lr]
    mov r1, #0x0
    add r3, sp, #0x0
    mov r0, r0, lsl #0x1f
    str r1, [r3]
    mov r0, r0, lsr #0x1f
    ldrh r2, [sp, #0x2]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x1
    and r0, r0, #0x1
    orr r0, r2, r0
    str r1, [r3, #0x4]
    str r1, [r3, #0x8]
    str r1, [r3, #0xc]
    str r1, [r3, #0x10]
    str r1, [r3, #0x14]
    strh r0, [sp, #0x2]
    ldrb r5, [lr, #0x8]
    mov r4, r1
    cmp r5, #0x0
    ble .L_220
    mov r3, #0x1
.L_1f8:
    add r0, lr, r4, lsl #0x1
    ldrh ip, [r0, #0x10]
    add r4, r4, #0x1
    cmp r4, r5
    mov r0, ip, asr #0x8
    and r2, r0, #0xff
    and r0, ip, #0xff
    add r0, r2, r0, lsl #0x4
    orr r1, r1, r3, lsl r0
    blt .L_1f8
.L_220:
    add r0, sp, #0x0
    bl func_ov002_021dec2c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r3, _LIT6
    strb r0, [r1, #0x8]
    ldr r2, [r3]
    add sp, sp, #0x18
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, r4, r5, pc}
.L_260:
    add sp, sp, #0x18
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_26c:
    mov r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word func_ov002_022759c4
_LIT3: .word data_ov002_022d008c
_LIT4: .word data_ov002_022cd230
_LIT5: .word 0x000019c8
_LIT6: .word data_ov002_022cd238

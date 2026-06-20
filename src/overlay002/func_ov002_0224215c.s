; func_ov002_0224215c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_02203330
        .extern func_ov002_0223dcc0
        .extern func_ov002_022420ec
        .extern func_ov002_022575c8
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0228c81c
        .global func_ov002_0224215c
        .arm
func_ov002_0224215c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r3, [r5]
    ldr r2, _LIT0
    cmp r3, r2
    beq .L_38
    add r0, r2, #0x80
    cmp r3, r0
    beq .L_44
    add r0, r2, #0x238
    cmp r3, r0
    moveq r4, #0x64
    moveq ip, #0x7c
    b .L_4c
.L_38:
    mov r4, #0x94
    mov ip, #0x95
    b .L_4c
.L_44:
    mov r4, #0x64
    mov ip, #0x7c
.L_4c:
    ldr r0, _LIT1
    ldr r0, [r0, #0x5b8]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_264
    b .L_70
    b .L_20c
    b .L_1c8
    b .L_20c
.L_70:
    mov r0, r5
    bl func_ov002_02203330
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_18c
    mov r2, #0x1
    mvn r4, #0x0
    mov r0, r5
    mov r3, r2
    rsb r1, r1, #0x1
    str r4, [sp]
    bl func_ov002_0228c81c
    movs r4, r0
    bpl .L_f8
    mov r4, #0x0
.L_c8:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022575c8
    cmp r0, #0x0
    bne .L_f8
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_c8
.L_f8:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0223dcc0
    mvn r2, #0x0
    str r2, [sp]
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r3, r2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0228c81c
    movs r4, r0
    bpl .L_16c
    mov r4, #0x0
.L_140:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_022575c8
    cmp r0, #0x0
    bne .L_16c
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_140
.L_16c:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dcc0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_18c:
    mov r0, r1
    mov r1, r4
    bl func_ov002_021ae400
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1c8:
    ldrh r0, [r5, #0x2]
    mov r1, ip
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_20c:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_24c
    ldr r1, _LIT4
    mov r0, r5
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_24c:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_264:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001430
_LIT1: .word data_ov002_022ce288
_LIT2: .word data_ov002_022cd744
_LIT3: .word func_ov002_022420ec
_LIT4: .word data_ov002_022d016c

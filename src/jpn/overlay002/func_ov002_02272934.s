; func_ov002_02272934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3dc
        .extern func_ov002_021df590
        .extern func_ov002_0226ea6c
        .extern func_ov002_022719c4
        .global func_ov002_02272934
        .arm
func_ov002_02272934:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr r1, [r2, #0x18]
    mov r0, r1, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_f94
    cmp r0, #0x1
    beq .L_1088
    b .L_10c8
.L_f94:
    ldr r0, [r2]
    mov r2, #0x2
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x1e
    ldr r0, _LIT0
    movne r4, #0x40
    ldrh r1, [r0, #0x16]
    ldr ip, [r0]
    moveq r4, #0x10
    mov r3, r1, lsl #0x1a
    mov r0, ip, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, ip, lsr #0x17
    mov r3, r3, lsr #0x1e
    bl func_ov002_0226ea6c
    and r0, r4, r0
    cmp r0, #0x0
    ble .L_10c8
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r1, [r0, #0x16]
    ldr ip, [r0]
    mov r0, ip, lsl #0x1f
    mov r3, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, ip, lsr #0x17
    mov r3, r3, lsr #0x1e
    bl func_ov002_0226ea6c
    and r0, r4, r0
    cmp r0, #0x0
    ble .L_1050
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r0, [r1, r0, lsl #0x2]
    cmp r0, #0x1
    bne .L_1040
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_105c
.L_1040:
    mov r1, r2, lsr #0x17
    mov r0, #0x72
    bl func_ov002_021ae3dc
    b .L_105c
.L_1050:
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
.L_105c:
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, pc}
.L_1088:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    beq .L_10c0
    mov r0, #0x0
    ldr r1, _LIT4
    strb r0, [r2, #0x8]
    strh r1, [r2, #0x6]
    ldr r0, [r2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021df590
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_10c0:
    bic r0, r1, #0xff
    str r0, [r2, #0x18]
.L_10c8:
    bl func_ov002_022719c4
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022cd238
_LIT4: .word 0x00001aa3

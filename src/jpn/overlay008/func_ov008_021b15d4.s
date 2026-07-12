; func_ov008_021b15d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov008_021b2660
        .extern data_ov008_021b2cc4
        .extern func_0202ba40
        .extern func_0202bb98
        .extern func_ov008_021aa510
        .extern func_ov008_021aecd8
        .extern func_ov008_021b1780
        .extern func_ov008_021b1ce8
        .extern func_ov008_021b21c0
        .global func_ov008_021b15d4
        .arm
func_ov008_021b15d4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    ldr r5, _LIT0
    mov r4, #0x0
    ldrh r0, [r5, #0xa8]
    mov r7, r4
    cmp r0, #0x0
    ble .L_1278
    mov r6, #0x1
.L_125c:
    mov r0, r7
    bl func_ov008_021aecd8
    ldrh r1, [r5, #0xa8]
    add r7, r7, #0x1
    orr r4, r4, r6, lsl r0
    cmp r7, r1
    blt .L_125c
.L_1278:
    ldr lr, _LIT1
    mov r5, #0x0
.L_1280:
    mov r0, #0x1
    tst r4, r0, lsl r5
    beq .L_1334
    mov ip, #0x0
    add r2, sp, #0x0
    mov r3, ip
    str ip, [r2]
    str ip, [r2, #0x4]
    str ip, [r2, #0x8]
    str ip, [r2, #0xc]
.L_12a8:
    mov r0, r3, asr #0x3
    add r0, r3, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    mov r1, r3, lsr #0x1f
    add r6, lr, r0, lsl #0x2
    rsb r0, r1, r3, lsl #0x1c
    add r0, r1, r0, ror #0x1c
    ldr r1, [r6, #0x28]
    mov r0, r0, lsl #0x1
    mov r0, r1, lsr r0
    and r1, r0, #0x3
    cmp r1, #0x0
    ble .L_1308
    mov r0, ip, asr #0x3
    add r0, ip, r0, lsr #0x1c
    mov r7, ip, lsr #0x1f
    rsb r6, r7, ip, lsl #0x1c
    mov r0, r0, asr #0x4
    add r6, r7, r6, ror #0x1c
    ldr r7, [r2, r0, lsl #0x2]
    mov r6, r6, lsl #0x1
    orr r1, r7, r1, lsl r6
    str r1, [r2, r0, lsl #0x2]
    add ip, ip, #0x1
.L_1308:
    add r3, r3, #0x1
    cmp r3, #0x40
    blt .L_12a8
    ldr r1, [sp]
    ldr r0, [sp, #0x4]
    str r1, [lr, #0x28]
    ldr r1, [sp, #0x8]
    str r0, [lr, #0x2c]
    ldr r0, [sp, #0xc]
    str r1, [lr, #0x30]
    str r0, [lr, #0x34]
.L_1334:
    add r5, r5, #0x1
    cmp r5, #0x1a
    add lr, lr, #0x34
    blt .L_1280
    ldr r6, _LIT0
    mov r5, #0x0
    ldrh r0, [r6, #0xa8]
    add r0, r0, r0, lsl #0x2
    cmp r0, #0x0
    ble .L_13a0
    mov r4, #0x1
    mov r7, r4
.L_1364:
    ldr r1, [r6, #0xc0]
    mov r0, r5, lsl #0x1
    ldrh r0, [r1, r0]
    mov r1, r4
    bl func_0202ba40
    ldr r1, [r6, #0xc0]
    mov r0, r5, lsl #0x1
    ldrh r0, [r1, r0]
    mov r1, r7
    bl func_0202bb98
    ldrh r0, [r6, #0xa8]
    add r5, r5, #0x1
    add r0, r0, r0, lsl #0x2
    cmp r5, r0
    blt .L_1364
.L_13a0:
    ldr r0, _LIT0
    ldr r0, [r0, #0xc0]
    bl Task_InvokeLocked
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1, #0xc0]
    bl func_ov008_021b21c0
    mov r0, #0x0
    bl func_ov008_021b1780
    bl func_ov008_021aa510
    ldr r0, _LIT1
    ldr r0, [r0, #0x14]
    bl func_ov008_021b1ce8
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov008_021b2cc4
_LIT1: .word data_ov008_021b2660

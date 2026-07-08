; func_ov002_02275580 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd230
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021deb3c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_022719c4
        .extern func_ov002_0227539c
        .extern func_ov002_022903f0
        .global func_ov002_02275580
        .arm
func_ov002_02275580:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldrh r1, [r0, #0x16]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    bne .L_20
    bl func_ov002_022719c4
    ldmia sp!, {r4, pc}
.L_20:
    ldr r1, [r0, #0x18]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_1d0
    b .L_50
    b .L_d4
    b .L_6c
    b .L_d4
    b .L_14c
    b .L_1c8
.L_50:
    mov r1, #0x0
    strb r1, [r0, #0x8]
    ldr r0, [r0]
    mov r1, #0x3a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
.L_6c:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0]
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_a0
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_022903f0
    b .L_a8
.L_a0:
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_a8:
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
.L_d4:
    bl func_ov002_0225930c
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    ldr r0, _LIT4
    ldrb r4, [r1, #0x8]
    ldr r2, _LIT5
    ldr r3, _LIT3
    add ip, r4, #0x1
    strb ip, [r1, #0x8]
    ldr ip, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr lr, [r0, #0xd70]
    add r0, ip, r1
    and r1, lr, #0xff
    and r0, r0, #0xff
    orr r1, r1, r0, lsl #0x8
    mov r0, r4, lsl #0x1
    strh r1, [r2, r0]
    ldr r2, [r3]
    mov r0, #0x0
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, pc}
.L_14c:
    bl func_ov002_021e2a4c
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r0, [r0, #0x10]
    mov r3, r2
    mov r1, r0, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021deb3c
    ldr r0, _LIT0
    mov r2, #0x0
    ldrh r0, [r0, #0x12]
    mov r3, r2
    mov r1, r0, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021deb3c
    bl func_ov002_021e2b6c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r3, _LIT3
    strb r0, [r1, #0x8]
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r4, pc}
.L_1c8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_1d0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word func_ov002_0227539c
_LIT3: .word data_ov002_022cd238
_LIT4: .word data_ov002_022d008c
_LIT5: .word data_ov002_022cd230

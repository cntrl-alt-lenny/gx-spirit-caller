; func_ov002_0225085c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202e340
        .extern func_ov002_021e797c
        .extern func_ov002_02253458
        .global func_ov002_0225085c
        .arm
func_ov002_0225085c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x2c
    add r1, sp, #0x0
    mov r2, #0x0
    str r2, [r1]
    mov r7, r0
    ldrh r3, [sp, #0x2]
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0x1
    and r0, r0, #0x1
    orr r0, r3, r0
    strh r0, [sp, #0x2]
    ldrh r4, [sp, #0x2]
    ldr r0, _LIT0
    and r3, r7, #0x1
    mul r5, r3, r0
    bic r4, r4, #0x3e
    orr r4, r4, #0x16
    strh r4, [sp, #0x2]
    ldrh r4, [sp, #0x2]
    ldr r0, _LIT1
    str r2, [r1, #0x4]
    bic r6, r4, #0x3000
    add r4, r0, r5
    strh r6, [sp, #0x2]
    mov r0, r2
    mov r3, r4
    str r2, [r1, #0x8]
    str r2, [r1, #0xc]
    str r2, [r1, #0x10]
    str r2, [r1, #0x14]
    add r1, r4, #0x30
    mov r6, r2
    add r8, sp, #0x18
    mov r9, #0x1
.L_90:
    ldr sl, [r1]
    add r1, r1, #0x14
    mov sl, sl, lsl #0x13
    movs sl, sl, lsr #0x13
    ldrneh sl, [r3, #0x38]
    add r3, r3, #0x14
    cmpne sl, #0x0
    strne r9, [r8, r0, lsl #0x2]
    streq r6, [r8, r0, lsl #0x2]
    add r0, r0, #0x1
    movne r2, r9
    cmp r0, #0x4
    ble .L_90
    cmp r2, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r6, #0x0
    ldr r0, [r0, r5]
    cmp r0, #0x0
    addls sp, sp, #0x2c
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r1, _LIT1
    add r0, r4, #0x18
    add r4, r0, #0x400
    add r5, r1, r5
.L_f8:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r8, r0, lsr #0x13
    mov r0, r8
    bl func_0202e340
    cmp r0, #0x0
    beq .L_1a0
    ldr r2, [r4]
    strh r8, [sp]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r2, r1, lsl #0x10
    ldrh r0, [sp, #0x4]
    ldr r1, _LIT3
    mov r2, r2, lsr #0x10
    and r1, r0, r1
    mov r0, r2, lsl #0x17
    orr r0, r1, r0, lsr #0x11
    strh r0, [sp, #0x4]
    mov r9, #0x0
    add sl, sp, #0x0
    add r8, sp, #0x18
.L_15c:
    ldr r0, [r8, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_194
    mov r0, sl
    mov r1, r7
    mov r2, r9
    bl func_ov002_021e797c
    cmp r0, #0x1
    bne .L_194
    mov r0, r7
    mov r2, r6
    mov r1, #0xe
    bl func_ov002_02253458
    b .L_1a0
.L_194:
    add r9, r9, #0x1
    cmp r9, #0x4
    ble .L_15c
.L_1a0:
    ldr r0, [r5, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r4, r4, #0x4
    bcc .L_f8
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf180
_LIT3: .word 0xffff803f

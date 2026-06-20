; func_ov002_0223838c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021b004c
        .extern func_ov002_021bc618
        .extern func_ov002_021bc6c4
        .extern func_ov002_021d59cc
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021ff400
        .extern func_ov002_0225368c
        .extern func_ov002_0227adb8
        .global func_ov002_0223838c
        .arm
func_ov002_0223838c:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldrh r4, [r5, #0x2]
    ldr r2, _LIT0
    mov r6, r4, lsl #0x1f
    ldr r3, [r2, #0x5a8]
    mov r6, r6, lsr #0x1f
    sub r3, r3, #0x7c
    mov r4, r4, lsl #0x11
    cmp r3, #0x4
    eor r4, r6, r4, lsr #0x1f
    addls pc, pc, r3, lsl #0x2
    b .L_1b8
    b .L_168
    b .L_108
    b .L_d0
    b .L_1b8
    b .L_4c
.L_4c:
    bl func_ov002_021ff400
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    mov r0, r4
    bl func_ov002_021bc618
    mov r6, r0
    ldrh r1, [r5]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_0225368c
    cmp r6, r0
    bge .L_90
    mov r0, r4
    bl func_ov002_021bc618
    b .L_a0
.L_90:
    ldrh r1, [r5]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_0225368c
.L_a0:
    strh r0, [r5, #0xa]
    ldrh r0, [r5, #0xa]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldr r1, _LIT1
    mov r0, r4
    bl func_ov002_021ae400
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_d0:
    ldrh r1, [r5, #0xa]
    ldrh r2, [r5]
    mov r0, r4
    cmp r1, #0x20
    movcs r1, #0x20
    add r1, r1, #0x6
    mov r3, #0x0
    bl func_ov002_021af9d0
    mov r0, #0x0
    strh r0, [r5, #0x8]
    bl func_ov002_021e2b3c
    add sp, sp, #0x4
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_108:
    ldrh r1, [r5, #0x8]
    ldrh r0, [r5, #0xa]
    cmp r1, r0
    bcs .L_158
    mov r0, r4
    bl func_ov002_021bc6c4
    ldr r1, _LIT0
    str r0, [r1, #0x5ac]
    ldrh r0, [r5, #0x8]
    add r0, r0, #0x1
    bl func_ov002_021b004c
    ldrh r2, [r5]
    mov r1, r0
    mov r0, r4
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
    add sp, sp, #0x4
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_158:
    bl func_ov002_021e2c5c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_168:
    mov r0, #0x0
    str r0, [sp]
    ldrh r0, [r5, #0x2]
    and r3, r6, #0xff
    ldr r1, [r2, #0x5ac]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    and r0, r0, #0xff
    orr r0, r3, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    mov r0, r4
    mov r2, r2, lsr #0x10
    mov r3, #0x6
    bl func_ov002_021d59cc
    ldrh r1, [r5, #0x8]
    add sp, sp, #0x4
    mov r0, #0x7d
    add r1, r1, #0x1
    strh r1, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_1b8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000011d

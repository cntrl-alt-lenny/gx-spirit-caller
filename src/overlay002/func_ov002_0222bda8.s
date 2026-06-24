; func_ov002_0222bda8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d0e6c
        .extern func_0202e234
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca440
        .extern func_ov002_021d7970
        .extern func_ov002_0226af94
        .extern func_ov002_0227adb8
        .global func_ov002_0222bda8
        .arm
func_ov002_0222bda8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7f
    beq .L_3bc
    cmp r0, #0x80
    bne .L_470
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    and r2, r3, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r5]
    rsb r0, r3, #0x1
    mov r2, #0x0
    bl func_ov002_0226af94
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_3bc:
    ldrh r2, [r5, #0x2]
    ldr r1, _LIT3
    ldr r0, _LIT1
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, _LIT4
    and r3, r3, #0x1
    mla r0, r3, r0, r2
    ldrh r4, [r1, #0xb0]
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202e234
    cmp r0, #0x0
    beq .L_450
    ldrh r0, [r5, #0x2]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca440
    cmp r0, #0x0
    beq .L_450
    ldrh r0, [r5, #0x2]
    ldr r3, _LIT4
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x120
    add r1, r1, r4, lsl #0x2
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0227adb8
    b .L_468
.L_450:
    ldrh r0, [r5, #0x2]
    mov r1, r4
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d7970
.L_468:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_470:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022d0e6c
_LIT4: .word data_ov002_022cf16c

; func_ov002_0222f96c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c8940
        .extern func_ov002_021d5a08
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_0222f96c
        .arm
func_ov002_0222f96c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r1, #0x0
    mov r2, r1
    mov sl, r0
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_2d4
    mov r0, sl
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r8, r0, #0xff
    mov r0, sl
    mov r1, r4
    mov r2, r8
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_2d4
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    ldrh r3, [sl]
    mov r0, sl
    mov r1, r4
    mov r2, r8
    bl func_ov002_021d5a08
    mov r7, #0x0
    ldr r6, _LIT0
    ldr fp, _LIT1
    mov r9, r7
    mov r5, #0x2
    mov r4, r7
.L_24c:
    cmp r7, r8
    beq .L_2c4
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r2, r1, fp, r6
    add r2, r2, r9
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    ldrneh r1, [r2, #0x38]
    cmpne r1, #0x0
    beq .L_2c4
    ldrh r1, [r2, #0x36]
    cmp r1, #0x0
    bne .L_2c4
    mov r1, r7
    bl func_ov002_021c8940
    cmp r0, #0x12
    bne .L_2c4
    str r5, [sp]
    str r4, [sp, #0x4]
    ldrh r1, [sl, #0x2]
    ldrh r3, [sl]
    mov r0, sl
    mov r1, r1, lsl #0x1f
    mov r2, r7
    mov r1, r1, lsr #0x1f
    bl func_ov002_021d5a08
.L_2c4:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r9, r9, #0x14
    ble .L_24c
.L_2d4:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868

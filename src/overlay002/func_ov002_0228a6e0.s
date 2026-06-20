; func_ov002_0228a6e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022d0250
        .extern func_0202b878
        .extern func_ov002_0223de94
        .extern func_ov002_0223def4
        .global func_ov002_0228a6e0
        .arm
func_ov002_0228a6e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r7, r1
    mov r8, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r7, #0x2]
    ldrh r0, [r8, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r7, #0x6]
    mov r6, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_d8
    ldr r4, _LIT0
.L_50:
    mov r0, r7
    mov r1, r6
    bl func_ov002_0223de94
    ldrh r2, [r8, #0x2]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    and r1, r0, #0xff
    mov r0, r2, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    and r0, r3, #0xff
    beq .L_c4
    cmp r0, #0xe
    bne .L_c4
    mov r0, r7
    mov r1, r6
    bl func_ov002_0223def4
    mov r5, r0
    mov r0, r5, lsl #0x2
    ldrh r0, [r4, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b878
    cmp r0, #0x16
    bne .L_c4
    ldr r1, _LIT1
    mov r0, #0x1
    str r5, [r1, #0x10]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_c4:
    ldrh r0, [r7, #0x6]
    add r6, r6, #0x1
    mov r0, r0, lsl #0x18
    cmp r6, r0, lsr #0x18
    blt .L_50
.L_d8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d0250
_LIT1: .word data_ov002_022cd524

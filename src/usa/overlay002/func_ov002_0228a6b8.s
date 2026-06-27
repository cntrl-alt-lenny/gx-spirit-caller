; func_ov002_0228a6b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de04
        .global func_ov002_0228a6b8
        .arm
func_ov002_0228a6b8:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r1
    mov r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r5, #0x2]
    ldrh r0, [r6, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x6]
    mov r4, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_1ddc
.L_1d74:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223dda4
    ldrh r2, [r6, #0x2]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    and r1, r0, #0xff
    mov r0, r2, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    and r0, r3, #0xff
    beq .L_1dc8
    cmp r0, #0xe
    bne .L_1dc8
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223de04
    ldr r1, _LIT0
    str r0, [r1, #0x10]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_1dc8:
    ldrh r0, [r5, #0x6]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x18
    cmp r4, r0, lsr #0x18
    blt .L_1d74
.L_1ddc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd444

; func_ov002_02218784 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c2f24
        .extern func_ov002_021df818
        .extern func_ov002_021e05fc
        .global func_ov002_02218784
        .arm
func_ov002_02218784:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r1, [r5, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r2, [r5]
    ldr r1, _LIT0
    cmp r2, r1
    beq .L_3c
    add r1, r1, #0x8
    cmp r2, r1
    beq .L_ac
    b .L_124
.L_3c:
    ldrh r0, [r5, #0x2]
    mov r1, #0x3e8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e05fc
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r4, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2f24
    cmp r0, #0x0
    ble .L_124
    mov r6, #0x1f4
.L_74:
    ldrh r0, [r5, #0x2]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e05fc
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2f24
    cmp r4, r0
    blt .L_74
    b .L_124
.L_ac:
    ldrh r1, [r5, #0x2]
    mov r2, #0x2bc
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r4, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2f24
    cmp r0, #0x0
    ble .L_124
    mov r6, #0x12c
.L_e8:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2f24
    cmp r4, r0
    blt .L_e8
.L_124:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00001352

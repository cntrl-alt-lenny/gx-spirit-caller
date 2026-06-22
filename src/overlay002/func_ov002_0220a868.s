; func_ov002_0220a868 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf17c
        .extern func_ov002_021ca2b8
        .extern func_ov002_0223f6c4
        .extern func_ov002_022536e8
        .global func_ov002_0220a868
        .arm
func_ov002_0220a868:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bne .L_78
    mov r0, r4
    bl func_ov002_0223f6c4
    ldrh r3, [r4, #0x2]
    mov r2, r0
    ldrh r1, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_78:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x16
    bne .L_d4
    ldr r1, [r4, #0x14]
    mov r0, r0, lsl #0x1f
    mov r2, r1, lsl #0x16
    mov r2, r2, lsr #0x1f
    cmp r2, r0, lsr #0x1f
    bne .L_d4
    mov r0, r1, lsl #0x12
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    bhi .L_d4
    mov r0, r1, lsl #0xf
    movs r0, r0, lsr #0x1f
    beq .L_d4
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_d4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c

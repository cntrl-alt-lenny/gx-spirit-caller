; func_ov002_0220a480 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf17c
        .extern func_ov002_021c23ac
        .extern func_ov002_021ca2b8
        .extern func_ov002_0223f6c4
        .extern func_ov002_022536e8
        .extern func_ov002_022577dc
        .global func_ov002_0220a480
        .arm
func_ov002_0220a480:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021c23ac
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x6]
    mov r0, r5
    mov r2, r1, lsl #0x10
    bic r1, r1, #0xff00
    mov r4, r2, lsr #0x18
    strh r1, [r5, #0x6]
    bl func_ov002_022577dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x6]
    mov r0, r5
    bic r1, r1, #0xff00
    orr r1, r1, #0x100
    strh r1, [r5, #0x6]
    bl func_ov002_022577dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x6]
    mov r0, r5
    bic r1, r1, #0xff00
    orr r1, r1, #0x200
    strh r1, [r5, #0x6]
    bl func_ov002_022577dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x6]
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    strh r0, [r5, #0x6]
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bne .L_128
    mov r0, r5
    bl func_ov002_0223f6c4
    ldrh r3, [r5, #0x2]
    mov r2, r0
    ldrh r1, [r5]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_128:
    mov r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c

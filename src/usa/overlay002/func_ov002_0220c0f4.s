; func_ov002_0220c0f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bb82c
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ca310
        .extern func_ov002_022069a8
        .global func_ov002_0220c0f4
        .arm
func_ov002_0220c0f4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_022069a8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca310
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x3
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_c8
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT1
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    bne .L_b8
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb82c
    cmp r0, #0x0
    beq .L_c0
.L_b8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_c0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_c8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000019ba
_LIT1: .word 0x000019a3
_LIT2: .word 0x000019a4

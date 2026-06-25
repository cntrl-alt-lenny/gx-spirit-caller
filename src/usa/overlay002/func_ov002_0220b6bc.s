; func_ov002_0220b6bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ff1c8
        .extern func_ov002_02253600
        .global func_ov002_0220b6bc
        .arm
func_ov002_0220b6bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff1c8
    cmp r0, #0x3
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x2
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x1
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000194f
_LIT1: .word 0x00001950

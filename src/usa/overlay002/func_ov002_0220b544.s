; func_ov002_0220b544 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021c2d54
        .extern func_ov002_021ca5b8
        .extern func_ov002_02253600
        .global func_ov002_0220b544
        .arm
func_ov002_0220b544:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r3, r0, lsl #0x1f
    ldr r2, [r1, #0xcec]
    mov r0, r3, lsr #0x1f
    cmp r2, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r1, #0xcf8]
    cmp r1, #0x2
    cmpne r1, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r1, [r4]
    bl func_ov002_021c2d54
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021ca5b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x2
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c

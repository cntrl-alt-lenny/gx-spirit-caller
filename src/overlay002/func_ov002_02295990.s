; func_ov002_02295990 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e270
        .extern func_ov002_021afb74
        .extern func_ov002_021bbf50
        .extern func_ov002_022806a4
        .global func_ov002_02295990
        .arm
func_ov002_02295990:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbf50
    cmp r0, #0x2
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022806a4
    cmp r0, #0x0
    blt .L_74
    bl func_ov002_021afb74
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202e270
    cmp r0, #0x0
    ldrneh r0, [r4]
    cmpne r5, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_74:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}

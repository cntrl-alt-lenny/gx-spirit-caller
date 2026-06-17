; func_ov002_022961bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ba294
        .extern func_ov002_021bbf50
        .extern func_ov002_021c3bdc
        .extern func_ov002_02281994
        .global func_ov002_022961bc
        .arm
func_ov002_022961bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ba294
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02281994
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbf50
    ldrh r1, [r4, #0x2]
    mov r4, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3bdc
    add r0, r4, r0
    cmp r0, #0x3
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000012e5

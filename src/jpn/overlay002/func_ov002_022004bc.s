; func_ov002_022004bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern func_ov002_021bbe70
        .extern func_ov002_021ff1c8
        .global func_ov002_022004bc
        .arm
func_ov002_022004bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x12
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT0
    mov r2, r1, lsl #0x1f
    ldr r1, [r0]
    mov r0, r2, lsr #0x1f
    cmp r1, r2, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_021bbe70
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff1c8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd314

; func_ov002_02203f94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern func_ov002_021c8940
        .global func_ov002_02203f94
        .arm
func_ov002_02203f94:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r0, r2, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x14
    bne .L_160
    ldr r1, _LIT0
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r1]
    mov r2, r2, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    bne .L_134
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c8940
    cmp r0, #0x3
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_134:
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    ldr r0, [r1, #0x4]
    mov r2, r2, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    bne .L_160
    ldr r1, [r1, #0x20]
    bl func_ov002_021c8940
    cmp r0, #0x3
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_160:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd3f4

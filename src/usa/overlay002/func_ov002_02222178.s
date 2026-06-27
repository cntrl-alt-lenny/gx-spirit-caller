; func_ov002_02222178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021e0f5c
        .global func_ov002_02222178
        .arm
func_ov002_02222178:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r2, [r1, #0x5a8]
    cmp r2, #0x7f
    beq .L_b0
    cmp r2, #0x80
    bne .L_f0
    ldr r2, [r0, #0x14]
    str r2, [r1, #0x5ac]
.L_b0:
    ldr r1, _LIT0
    ldr r1, [r1, #0x5ac]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r0, [r0, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e0f5c
    ldr r1, _LIT0
    mov r0, #0x7f
    ldr r2, [r1, #0x5ac]
    sub r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r3, pc}
.L_f0:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8

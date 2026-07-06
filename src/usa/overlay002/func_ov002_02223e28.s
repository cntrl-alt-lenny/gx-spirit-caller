; func_ov002_02223e28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d0d8c
        .extern func_ov002_021e1780
        .extern func_ov002_021e277c
        .extern func_ov002_0226af64
        .extern func_ov002_0226b0a4
        .global func_ov002_02223e28
        .arm
func_ov002_02223e28:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7d
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_1a8
    b .L_18c
    b .L_174
    b .L_13c
    b .L_118
.L_118:
    ldrh r3, [r0, #0x2]
    ldrh r1, [r0]
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b0a4
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_13c:
    ldr r1, _LIT1
    ldrh r2, [r1, #0xb0]
    cmp r2, #0x0
    moveq r0, #0x7e
    ldmeqia sp!, {r3, pc}
    ldrh r0, [r0, #0x2]
    ldrh r1, [r1, #0xb2]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e1780
    mov r0, #0x7d
    ldmia sp!, {r3, pc}
.L_174:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226af64
    mov r0, #0x7d
    ldmia sp!, {r3, pc}
.L_18c:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1a8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c

; func_ov002_022067d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_0202e1e0
        .global func_ov002_022067d4
        .arm
func_ov002_022067d4:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x16
    bne .L_84
    ldr r1, [r0, #0x14]
    mov r0, r2, lsl #0x1f
    mov r2, r1, lsl #0x16
    mov r2, r2, lsr #0x1f
    cmp r2, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r0, r1, lsl #0x11
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r1, r1, lsl #0x17
    ldr r0, _LIT0
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
.L_84:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d0170

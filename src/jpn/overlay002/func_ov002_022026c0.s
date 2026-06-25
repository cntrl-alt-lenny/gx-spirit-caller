; func_ov002_022026c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern func_ov002_021c8860
        .global func_ov002_022026c0
        .arm
func_ov002_022026c0:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    ldr r1, _LIT0
    ldr lr, [r1]
    mov ip, r2, lsl #0x1f
    cmp lr, ip, lsr #0x1f
    ldreq r3, [r1, #0x1c]
    moveq r2, r2, lsl #0x1a
    cmpeq r3, r2, lsr #0x1b
    bne .L_44
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    bl func_ov002_021c8860
    cmp r0, #0xf
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_44:
    ldr r1, _LIT0
    ldr r2, [r1, #0x4]
    cmp r2, ip, lsr #0x1f
    bne .L_84
    ldrh r0, [r0, #0x2]
    ldr r2, [r1, #0x20]
    mov r0, r0, lsl #0x1a
    cmp r2, r0, lsr #0x1b
    bne .L_84
    ldr r1, [r1, #0x1c]
    mov r0, lr
    bl func_ov002_021c8860
    cmp r0, #0xf
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_84:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd314

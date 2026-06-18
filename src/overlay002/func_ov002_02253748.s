; func_ov002_02253748 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce588
        .global func_ov002_02253748
        .arm
func_ov002_02253748:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov lr, #0x0
    ldr r5, [r3, #0x480]
    cmp r5, #0x0
    ble .L_54
    ldr r4, _LIT1
.L_1c:
    ldrh r3, [r4, #0x2]
    mov ip, r3, lsl #0x1f
    cmp r0, ip, lsr #0x1f
    moveq r3, r3, lsl #0x1a
    cmpeq r1, r3, lsr #0x1b
    ldreqh r3, [r4, #0x4]
    moveq r3, r3, lsl #0x11
    cmpeq r2, r3, lsr #0x17
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    add lr, lr, #0x1
    cmp lr, r5
    add r4, r4, #0x18
    blt .L_1c
.L_54:
    ldr lr, _LIT0
    mov r5, #0x0
    ldr r4, [lr, #0x490]
    cmp r4, #0x0
    bls .L_a0
.L_68:
    ldrh r3, [lr, #0x2]
    mov ip, r3, lsl #0x1f
    cmp r0, ip, lsr #0x1f
    moveq r3, r3, lsl #0x1a
    cmpeq r1, r3, lsr #0x1b
    ldreqh r3, [lr, #0x4]
    moveq r3, r3, lsl #0x11
    cmpeq r2, r3, lsr #0x17
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    add r5, r5, #0x1
    cmp r5, r4
    add lr, lr, #0x18
    bcc .L_68
.L_a0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022ce588

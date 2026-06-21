; func_ov002_0220d43c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_0202ed04
        .extern func_ov002_021bb264
        .extern func_ov002_021c1ad0
        .global func_ov002_0220d43c
        .arm
func_ov002_0220d43c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021c1ad0
    ldrh r2, [r5, #0x4]
    ldr r1, _LIT0
    mov r4, r0
    mov r0, r2, lsl #0x11
    mov r0, r0, lsr #0x17
    mov r0, r0, lsl #0x2
    ldrh r0, [r1, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202ed04
    cmp r0, #0x0
    beq .L_84
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT1
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021bb264
    cmp r0, #0x0
    beq .L_84
    ldr r0, [r5, #0x14]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_84:
    ldr r0, [r5, #0x14]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0250
_LIT1: .word 0x00001a77

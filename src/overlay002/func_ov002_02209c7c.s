; func_ov002_02209c7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern func_ov002_021b359c
        .global func_ov002_02209c7c
        .arm
func_ov002_02209c7c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_1f4
    ldrh r1, [r1]
    ldrh r0, [r4]
    cmp r1, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_1f4:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x12
    bne .L_238
    ldr r1, _LIT0
    mov r2, r0, lsl #0x1f
    ldr r0, [r1, #0x4]
    cmp r0, r2, lsr #0x1f
    ldreq r1, [r1, #0x8]
    cmpeq r1, #0x0
    bne .L_238
    ldr r1, _LIT1
    bl func_ov002_021b359c
    cmp r0, #0x0
    moveq r0, #0x2
    ldmeqia sp!, {r4, pc}
.L_238:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00001318

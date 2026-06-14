; func_ov015_021b3ecc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov015_021b5e28
        .extern func_0200a2f4
        .extern func_ov005_021ab3a0
        .extern func_ov005_021ab3b4
        .extern func_ov015_021b35d0
        .global func_ov015_021b3ecc
        .arm
func_ov015_021b3ecc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r4, r0
    ldr r0, [r3, #0x890]
    mov r6, r1
    mov r1, r4
    mov r5, r2
    bl func_ov005_021ab3a0
    ldr r0, _LIT0
    mov r1, r4
    ldr r0, [r0, #0x890]
    bl func_ov005_021ab3b4
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    sub r0, r4, #0x1
    bl func_0200a2f4
    mov r4, r0
    ldrh r0, [r4]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_ov015_021b35d0
    cmp r6, #0x0
    beq .L_834
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    moveq r1, #0x0
    streq r1, [r6]
    ldrne r1, _LIT1
    strne r1, [r6]
.L_834:
    cmp r5, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1e
    mov r1, r1, lsr #0x1f
    cmp r1, #0x1
    moveq r1, #0x1
    streq r1, [r5]
    movne r1, #0x2
    strne r1, [r5]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov015_021b5e28
_LIT1: .word 0x00003fff

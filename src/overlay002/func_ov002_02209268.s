; func_ov002_02209268 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b9bd4
        .extern func_ov002_021bc288
        .extern func_ov002_021bc8c8
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca3f0
        .extern func_ov002_021ff2b8
        .global func_ov002_02209268
        .arm
func_ov002_02209268:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9bd4
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x2]
    mov r0, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r0
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff2b8
    ldrh r1, [r5, #0x2]
    mov r5, r0
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021bc288
    add r0, r5, r0
    cmp r4, r0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001813

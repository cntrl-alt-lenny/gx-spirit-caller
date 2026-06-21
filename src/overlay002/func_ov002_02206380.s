; func_ov002_02206380 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b9e00
        .extern func_ov002_021bc288
        .extern func_ov002_021bc8c8
        .extern func_ov002_021ca2b8
        .extern func_ov002_021f4194
        .extern func_ov002_021ff2b8
        .global func_ov002_02206380
        .arm
func_ov002_02206380:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r1, [r5, #0x2]
    mov r0, r1, lsl #0x11
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r4, r0, r1, lsr #0x1f
    mov r0, r4
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9e00
    mov r6, r0
    mov r0, r5
    bl func_ov002_021f4194
    cmp r6, r0
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    ldrh r1, [r5, #0x2]
    mov r0, r4
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff2b8
    cmp r0, #0x0
    bne .L_c4
    ldrh r1, [r5, #0x2]
    mov r0, r1, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    mov r0, r0, lsr #0x1f
    bne .L_cc
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    bl func_ov002_021bc288
    cmp r0, #0x0
    beq .L_cc
.L_c4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_cc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}

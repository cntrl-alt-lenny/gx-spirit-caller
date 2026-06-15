; func_ov002_02202840 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b99b4
        .extern func_ov002_021ff3bc
        .global func_ov002_02202840
        .arm
func_ov002_02202840:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r2, r2, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x16
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    cmp r2, #0x2
    bne .L_f4
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99b4
    cmp r0, #0x0
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
.L_f4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}

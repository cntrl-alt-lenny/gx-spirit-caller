; func_ov002_02203c48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ca55c
        .extern func_ov002_02253600
        .global func_ov002_02203c48
        .arm
func_ov002_02203c48:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca55c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r2, #0x0
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    beq .L_e4
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x5
    bge .L_f8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_e4:
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x3
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
.L_f8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}

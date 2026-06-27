; func_ov002_0220b76c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ff1c8
        .extern func_ov002_02207a4c
        .extern func_ov002_022576f4
        .global func_ov002_0220b76c
        .arm
func_ov002_0220b76c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_02207a4c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_68
    mov r1, #0x0
    mov r0, r4
    strh r1, [r4, #0xc]
    bl func_ov002_022576f4
    cmp r0, #0x2
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    mov r1, #0x2
    mov r0, r4
    strh r1, [r4, #0xc]
    bl func_ov002_022576f4
    cmp r0, #0x0
    bne .L_84
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_68:
    mov r1, r0, lsl #0x1f
    mov r0, r4
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff1c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_84:
    mov r0, #0x2
    ldmia sp!, {r4, pc}

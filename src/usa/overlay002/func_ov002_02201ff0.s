; func_ov002_02201ff0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ff1c8
        .extern func_ov002_02253600
        .global func_ov002_02201ff0
        .arm
func_ov002_02201ff0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r5, #0x0
    mov r4, r5
.L_170:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021ff1c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r6]
    mov r0, r5
    mov r2, r4
    bl func_ov002_02253600
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_170
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}

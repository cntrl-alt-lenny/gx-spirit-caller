; func_ov002_02243420 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0223dda4
        .extern func_ov002_022574e0
        .global func_ov002_02243420
        .arm
func_ov002_02243420:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    mov r4, r1
    mov r6, r2
    bl func_ov002_022574e0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x6]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x18
    beq .L_2d4
    cmp r0, #0x1
    beq .L_2ac
    cmp r0, #0x2
    bne .L_2ec
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_2ac:
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_0223dda4
    and r2, r4, #0xff
    and r1, r6, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    cmp r0, r1, lsr #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_2d4:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r4
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_2ec:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}

; func_ov002_0220cdd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b422c
        .extern func_ov002_021bbf50
        .extern func_ov002_021bcd80
        .extern func_ov002_021c3ae4
        .extern func_ov002_021ca2b8
        .global func_ov002_0220cdd4
        .arm
func_ov002_0220cdd4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    bne .L_98
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    mvn r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bcd80
    movs r5, r0
    beq .L_90
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbf50
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_90:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_98:
    ldrh r0, [r4, #0x4]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b422c
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}

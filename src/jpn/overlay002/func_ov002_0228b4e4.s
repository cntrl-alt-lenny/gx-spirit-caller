; func_ov002_0228b4e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b58d0
        .extern func_ov002_0223dda4
        .global func_ov002_0228b4e4
        .arm
func_ov002_0228b4e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r1, #0x6]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_174
    b .L_168
.L_128:
    mov r0, r1
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    ldrh r2, [r4, #0x2]
    and r1, r0, #0xff
    mov r0, r2, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    and r1, r3, #0xff
    moveq r0, r2, lsl #0x1a
    cmpeq r1, r0, lsr #0x1b
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_168:
    cmp r0, #0x0
    bgt .L_128
    b .L_188
.L_174:
    mov r0, r1
    bl func_ov002_021b58d0
    cmp r0, #0x4
    movge r0, #0x1
    ldmgeia sp!, {r4, pc}
.L_188:
    mov r0, #0x0
    ldmia sp!, {r4, pc}

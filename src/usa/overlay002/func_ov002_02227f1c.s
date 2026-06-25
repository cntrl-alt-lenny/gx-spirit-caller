; func_ov002_02227f1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b9d20
        .extern func_ov002_021d90f0
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .global func_ov002_02227f1c
        .arm
func_ov002_02227f1c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r1, [r6, #0xc]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_2b0
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_2b0
    ldrh r0, [r6, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9d20
    cmp r0, #0x0
    beq .L_2b0
    ldrh r0, [r6, #0x2]
    mvn r2, #0x0
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d90f0
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_021d90f0
.L_2b0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}

; func_ov002_0222800c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b9e00
        .extern func_ov002_021d91e0
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_0222800c
        .arm
func_ov002_0222800c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r1, [r6, #0xc]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_2b0
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    and r4, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r5, r0, #0xff
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_2b0
    ldrh r0, [r6, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9e00
    cmp r0, #0x0
    beq .L_2b0
    ldrh r0, [r6, #0x2]
    mvn r2, #0x0
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d91e0
    mov r0, r4
    mov r1, r5
    mov r2, #0x1
    bl func_ov002_021d91e0
.L_2b0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}

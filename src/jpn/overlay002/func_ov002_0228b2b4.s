; func_ov002_0228b2b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bbe70
        .extern func_ov002_021ff1c8
        .extern func_ov002_0223dda4
        .global func_ov002_0228b2b4
        .arm
func_ov002_0228b2b4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5, #0x2]
    mov r4, r1
    mov r1, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021ff1c8
    cmp r0, #0x3
    bne .L_26c
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_26c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xa
    movhi r0, #0x1
    ldmhiia sp!, {r3, r4, r5, pc}
.L_26c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}

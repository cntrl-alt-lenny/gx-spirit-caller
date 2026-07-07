; func_ov002_02216334 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b939c
        .extern func_ov002_021c9310
        .extern func_ov002_021ca5b8
        .extern func_ov002_021d8038
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0223de04
        .global func_ov002_02216334
        .arm
func_ov002_02216334:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrh r0, [r5, #0x6]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x18
    beq .L_104
    subs r4, r0, #0x1
    bmi .L_70
.L_20:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223de04
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xe
    bne .L_68
    ldrh r2, [r5, #0x2]
    and r1, r0, #0xff
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca5b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_68:
    subs r4, r4, #0x1
    bpl .L_20
.L_70:
    bl func_ov002_021e2a4c
    ldrh r0, [r5, #0x6]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    subs r4, r0, #0x1
    bmi .L_100
    mov r6, #0x0
    mov r7, #0x1
.L_90:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223de04
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xe
    bne .L_f8
    mov r2, r0, lsr #0x10
    mov r2, r2, lsl #0x10
    and r0, r0, #0xff
    mov r2, r2, lsr #0x10
    bl func_ov002_021c9310
    mov r1, r0
    ldrh r2, [r5, #0x2]
    ldr r3, [r1]
    mov r0, r2, lsl #0x1f
    mov r2, r3, lsl #0x12
    mov r0, r0, lsr #0x1f
    cmp r0, r2, lsr #0x1f
    mov r0, r2, lsr #0x1f
    movne r2, r7
    moveq r2, r6
    bl func_ov002_021d8038
.L_f8:
    subs r4, r4, #0x1
    bpl .L_90
.L_100:
    bl func_ov002_021e2b6c
.L_104:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}

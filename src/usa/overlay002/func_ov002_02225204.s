; func_ov002_02225204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c194c
        .extern func_ov002_021c1c48
        .extern func_ov002_021d5918
        .extern func_ov002_021d6718
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_0226b02c
        .global func_ov002_02225204
        .arm
func_ov002_02225204:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r1, #0x0
    mov r2, r1
    mov r6, r0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_120
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
    beq .L_120
    ldrh r0, [r6, #0xc]
    cmp r0, #0x1
    beq .L_70
    cmp r0, #0x2
    beq .L_98
    b .L_120
.L_70:
    mov ip, #0x1
    mov r0, r6
    mov r1, r4
    mov r2, r5
    mov r3, #0x0
    str ip, [sp]
    bl func_ov002_021d6718
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_98:
    mov r0, #0x1
    str r0, [sp]
    ldrh r2, [r6, #0x2]
    mov r0, r6
    mov r1, r4
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    str r2, [sp, #0x4]
    ldrh r3, [r6]
    mov r2, r5
    bl func_ov002_021d5918
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    beq .L_114
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c1c48
    cmp r0, #0x0
    bne .L_114
    ldrh r2, [r6]
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c194c
    cmp r0, #0x0
    beq .L_114
    mov r0, r4
    mov r1, r5
    bl func_ov002_0226b02c
.L_114:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_120:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}

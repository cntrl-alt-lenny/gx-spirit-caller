; func_ov002_021fb4c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c8860
        .extern func_ov002_021dea94
        .extern func_ov002_021f4994
        .extern func_ov002_0220cce4
        .global func_ov002_021fb4c4
        .arm
func_ov002_021fb4c4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    mov r4, r1
    bl func_ov002_0220cce4
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r4
    bl func_ov002_021f4994
    mov r4, r0
    cmp r4, #0x1
    bne .L_4bc
    mov r5, #0x0
    mov r7, r5
.L_474:
    ldrh r0, [r6, #0x2]
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8860
    cmp r0, #0x11
    add r7, r7, #0x1
    addeq r5, r5, #0x1
    cmp r7, #0x5
    blt .L_474
    ldrh r0, [r6, #0x2]
    mov r2, #0x1f
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0, lsl #0x4
    mov r1, r2, lsl r1
    bl func_ov002_021dea94
    strh r5, [r6, #0x8]
.L_4bc:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}

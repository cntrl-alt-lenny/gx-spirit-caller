; func_ov002_022929ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c1d64
        .extern func_ov002_02215f14
        .extern func_ov002_02280870
        .global func_ov002_022929ec
        .arm
func_ov002_022929ec:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280870
    cmp r0, #0x0
    addgt sp, sp, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, pc}
    add r1, sp, #0x0
    mov r0, r4
    bl func_ov002_02215f14
    cmp r0, #0x0
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, pc}
    ldrh r2, [sp]
    ldrh r0, [r4, #0x2]
    and r1, r2, #0xff
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    mov r2, r2, asr #0x8
    mov r0, r4
    and r2, r2, #0xff
    bl func_ov002_021c1d64
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}

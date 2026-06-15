; func_0209ade4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209b0b8
        .global func_0209ade4
        .arm
func_0209ade4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r5, r0
    add r1, sp, #0x0
    mov r0, #0x0
    bl func_0209b0b8
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    cmp r5, #0x0
    beq .L_3a8
    ldrh r1, [sp]
    ands r1, r1, #0x8
    movne r1, #0x1
    moveq r1, #0x0
    str r1, [r5]
.L_3a8:
    cmp r4, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldrh r1, [sp]
    ands r1, r1, #0x4
    movne r1, #0x1
    moveq r1, #0x0
    str r1, [r4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr

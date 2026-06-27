; func_ov002_02204460 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021f4004
        .extern func_ov002_021ff080
        .extern func_ov002_02253600
        .global func_ov002_02204460
        .arm
func_ov002_02204460:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    beq .L_60
    bl func_ov002_021f4004
    mov r1, #0x1
    str r1, [sp]
    ldrh r2, [r4, #0x4]
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, r2, lsl #0x11
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsr #0x17
    mov r3, #0x0
    bl func_ov002_021ff080
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
.L_60:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}

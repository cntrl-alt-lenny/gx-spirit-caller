; func_ov002_02295458 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bbe70
        .extern func_ov002_02259e8c
        .extern func_ov002_02280a64
        .global func_ov002_02295458
        .arm
func_ov002_02295458:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259e8c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    mov ip, #0x0
    sub r2, ip, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    mov r3, #0x1
    str ip, [sp]
    bl func_ov002_02280a64
    cmp r0, #0x3e8
    movge r0, #0x1
    movlt r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}

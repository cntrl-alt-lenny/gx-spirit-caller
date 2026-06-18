; func_ov002_0220af9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ff14c
        .extern func_ov002_021ff320
        .extern func_ov002_021ff400
        .global func_ov002_0220af9c
        .arm
func_ov002_0220af9c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r1, #0x1
    mov r5, r0
    str r1, [sp]
    ldrh r2, [r5, #0x2]
    ldrh r0, [r5, #0x4]
    mov r3, #0x0
    mov ip, r2, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r0, ip, lsr #0x1f
    mov r2, r2, lsr #0x17
    bl func_ov002_021ff14c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff320
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff400
    ldmia sp!, {r3, r4, r5, pc}

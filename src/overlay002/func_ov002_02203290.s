; func_ov002_02203290 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ff14c
        .global func_ov002_02203290
        .arm
func_ov002_02203290:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r1, #0x1
    mov r4, r0
    str r1, [sp]
    ldrh r2, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, #0x0
    mov ip, r2, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r0, ip, lsr #0x1f
    mov r2, r2, lsr #0x17
    bl func_ov002_021ff14c
    cmp r0, #0x0
    addne sp, sp, #0x4
    movne r0, #0x2
    ldmneia sp!, {r3, r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}

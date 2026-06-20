; func_ov002_021ecce8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern func_ov002_021bf294
        .extern func_ov002_021c1ef0
        .global func_ov002_021ecce8
        .arm
func_ov002_021ecce8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r2
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    ldrh r3, [r0, #0x2]
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    cmp r3, r5
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x4]
    cmp r1, r5
    ldreq r0, [r0, #0x20]
    cmpeq r0, r4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    ldr r1, _LIT0
    str r0, [sp]
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    mov r2, r5
    mov r3, r4
    bl func_ov002_021bf294
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd3f4

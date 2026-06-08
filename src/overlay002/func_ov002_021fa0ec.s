; func_ov002_021fa0ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ea390
        .global func_ov002_021fa0ec
        .arm
func_ov002_021fa0ec:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov002_021ea390
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x2
    add r0, r6, r0, lsl #0x1
    ldrh r1, [r0, #0x8]
    mov r0, #0x1
    tst r1, r0, lsl r4
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}

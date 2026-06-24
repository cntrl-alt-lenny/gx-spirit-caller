; func_ov002_021b9ac0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02030538
        .global func_ov002_021b9ac0
        .arm
func_ov002_021b9ac0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_02030538
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x1f
    ldmia sp!, {r4, pc}

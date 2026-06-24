; func_0203c648 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203a7fc
        .extern func_02089114
        .global func_0203c648
        .arm
func_0203c648:
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r0, [r0, #0xac]
    bl func_02089114
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0]
    bl func_0203a7fc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrsb r0, [r0, #0x1d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}

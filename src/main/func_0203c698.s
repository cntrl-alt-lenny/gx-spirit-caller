; func_0203c698 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203a84c
        .extern func_020891fc
        .global func_0203c698
        .arm
func_0203c698:
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r0, [r0, #0xac]
    bl func_020891fc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0]
    bl func_0203a84c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrsb r0, [r0, #0x1d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}

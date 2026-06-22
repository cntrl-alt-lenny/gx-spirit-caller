; func_0200efc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0200ed9c
        .extern func_0200ef44
        .global func_0200efc4
        .arm
func_0200efc4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r2
    mov r4, r3
    bl func_0200ef44
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r4, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0200ed9c
    cmp r0, #0x0
    cmpne r5, #0x0
    strne r5, [r0, #0x98]
    strne r4, [r0, #0x9c]
    ldmia sp!, {r3, r4, r5, pc}

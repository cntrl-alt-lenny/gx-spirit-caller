; func_02011730 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020196a4
        .extern func_02034734
        .global func_02011730
        .arm
func_02011730:
    stmdb sp!, {r3, lr}
    bl func_02034734
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_020196a4
    ldmia sp!, {r3, pc}

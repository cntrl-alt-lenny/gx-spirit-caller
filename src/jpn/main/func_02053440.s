; func_02053440 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053460
        .global func_02053440
        .arm
func_02053440:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02053460
    cmp r0, #0x0
    mvnne r0, #0x0
    andne r0, r4, r0
    moveq r0, #0x0
    ldmia sp!, {r4, pc}

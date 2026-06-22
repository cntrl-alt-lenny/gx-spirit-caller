; func_02032bd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02032bd8
        .arm
func_02032bd8:
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0xef4]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    blx r0
    ldmia sp!, {r3, pc}

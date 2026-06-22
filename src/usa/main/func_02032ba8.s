; func_02032ba8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02032ba8
        .arm
func_02032ba8:
    stmdb sp!, {r3, lr}
    ldr r1, [r1, #0xee8]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    blx r1
    ldmia sp!, {r3, pc}

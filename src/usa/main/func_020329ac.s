; func_020329ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020329ac
        .arm
func_020329ac:
    stmdb sp!, {r3, lr}
    ldr r3, [r3, #0xed4]
    cmp r3, #0x0
    ldmeqia sp!, {r3, pc}
    blx r3
    ldmia sp!, {r3, pc}

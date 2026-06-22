; func_02032bc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02032bc0
        .arm
func_02032bc0:
    stmdb sp!, {r3, lr}
    ldr r2, [r2, #0xeec]
    cmp r2, #0x0
    ldmeqia sp!, {r3, pc}
    blx r2
    ldmia sp!, {r3, pc}

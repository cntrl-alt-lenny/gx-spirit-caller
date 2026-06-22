; func_02032e18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02032e18
        .arm
func_02032e18:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0xeb8]
    mov r0, r1
    blx r2
    ldmia sp!, {r3, pc}

; func_02031fc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031fc0
        .arm
func_02031fc0:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x14]
    mov r0, r1
    blx r2
    ldmia sp!, {r3, pc}

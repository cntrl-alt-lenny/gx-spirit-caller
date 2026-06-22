; func_02031fa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02031fa8
        .arm
func_02031fa8:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x10]
    mov r0, r1
    mov r1, #0x4
    blx r2
    ldmia sp!, {r3, pc}

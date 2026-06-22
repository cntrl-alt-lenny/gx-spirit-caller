; func_020aff68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aff68
        .arm
func_020aff68:
    stmdb sp!, {r0, r1, r2, r3}
    add r2, sp, #0x0
    ldr r1, [r2, #0x4]
    ldr r0, [sp]
    bic r1, r1, #-2147483648
    str r1, [r2, #0x4]
    add sp, sp, #0x10
    bx lr

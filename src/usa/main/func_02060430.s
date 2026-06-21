; func_02060430 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02060430
        .arm
func_02060430:
    stmdb sp!, {r0, r1, r2, r3}
    add sp, sp, #0x10
    bx lr

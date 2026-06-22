; func_020b174c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b174c
        .arm
func_020b174c:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r0, [sp, #0x4]
    and r0, r0, #-2147483648
    add sp, sp, #0x10
    bx lr

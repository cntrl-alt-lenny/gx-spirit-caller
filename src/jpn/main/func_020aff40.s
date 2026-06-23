; func_020aff40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aff40
        .arm
func_020aff40:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0xc]
    bic r1, r1, #-2147483648
    and r0, r0, #-2147483648
    orr r1, r1, r0
    ldr r0, [sp]
    str r1, [sp, #0x4]
    add sp, sp, #0x10
    bx lr

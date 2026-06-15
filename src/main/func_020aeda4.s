; func_020aeda4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020aedcc
        .global func_020aeda4
        .arm
func_020aeda4:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, lr}
    add r3, sp, #0x10
    bic r3, r3, #0x3
    ldr r2, [sp, #0x10]
    add r3, r3, #0x4
    bl func_020aedcc
    ldmia sp!, {r3, lr}
    add sp, sp, #0x10
    bx lr

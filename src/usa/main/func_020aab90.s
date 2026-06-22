; func_020aab90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020aab3c
        .global func_020aab90
        .arm
func_020aab90:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, lr}
    add r2, sp, #0xc
    bic r2, r2, #0x3
    ldr r1, [sp, #0xc]
    add r2, r2, #0x4
    bl func_020aab3c
    ldmia sp!, {r3, lr}
    add sp, sp, #0x10
    bx lr

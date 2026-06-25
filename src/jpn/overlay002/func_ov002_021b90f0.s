; func_ov002_021b90f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b90f0
        .arm
func_ov002_021b90f0:
    stmfd sp!, {r3}
    sub sp, sp, #0x4
    ldr r3, [r0]
    ldr r2, [r1]
    str r3, [sp]
    str r2, [r0]
    str r3, [r1]
    add sp, sp, #0x4
    ldmfd sp!, {r3}
    bx lr

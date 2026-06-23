; func_020a9698 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a9608
        .global func_020a9698
        .arm
func_020a9698:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, lr}
    add r1, sp, #0xc
    bic r1, r1, #0x3
    add r3, r1, #0x4
    ldr r2, [sp, #0xc]
    mvn r1, #0x0
    bl func_020a9608
    ldmia sp!, {r3, lr}
    add sp, sp, #0x10
    bx lr

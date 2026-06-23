; func_0206a8e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206a8e4
        .arm
func_0206a8e4:
    mov r2, #0x5
    ands r1, r0, #0x2
    addne r2, r2, #0x4
    ands r1, r0, #0x8
    addne r2, r2, #0x4
    ands r1, r0, #0x10
    addne r2, r2, #0x2
    ands r0, r0, #0x20
    addne r2, r2, #0x2
    mov r0, r2
    bx lr

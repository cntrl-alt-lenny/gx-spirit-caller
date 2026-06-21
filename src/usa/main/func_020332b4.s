; func_020332b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020332b4
        .arm
func_020332b4:
    ldr r2, [r0, #0xdf4]
    ldr r1, [r0, #0xdf8]
    mov r0, r2
    bx lr

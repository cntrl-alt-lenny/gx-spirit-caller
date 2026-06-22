; func_0207d0d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207d0d0
        .arm
func_0207d0d0:
    mov r2, #0x0
    str r2, [r0]
    str r2, [r0, #0x4]
    strh r2, [r0, #0x8]
    strh r1, [r0, #0xa]
    bx lr

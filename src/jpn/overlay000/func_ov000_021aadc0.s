; func_ov000_021aadc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021aadc0
        .arm
func_ov000_021aadc0:
    mov r1, #0x0
    str r1, [r0]
    ldr r1, [r0, #0x44]
    bic r1, r1, #-2147483648
    str r1, [r0, #0x44]
    bx lr

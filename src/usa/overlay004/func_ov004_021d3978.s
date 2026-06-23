; func_ov004_021d3978 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov004_021d3978
        .arm
func_ov004_021d3978:
    str r1, [r0, #0x40]
    str r2, [r0, #0x44]
    mov r1, #0x23
    str r1, [r0, #0x30]
    mov r1, #0x1
    str r1, [r0, #0x38]
    mov r1, #0x0
    str r1, [r0, #0x3c]
    bx lr

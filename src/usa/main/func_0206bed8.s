; func_0206bed8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206bed8
        .arm
func_0206bed8:
    ldr r1, [r0, #0x64]
    cmp r1, #0x0
    ldreq r1, [r0, #0x68]
    mov r0, r1
    bx lr

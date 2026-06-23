; func_ov006_021c1558 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021c1558
        .arm
func_ov006_021c1558:
    str r1, [r0, #0x18]
    mov r1, #0x1
    str r1, [r0, #0x1c]
    mov r0, r1
    bx lr

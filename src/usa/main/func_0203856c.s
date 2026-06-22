; func_0203856c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203856c
        .arm
func_0203856c:
    mov r1, r1, lsl #0x8
    str r1, [r0, #0x4]
    str r1, [r0]
    mov r1, #0x0
    strh r1, [r0, #0xa]
    strh r1, [r0, #0x8]
    bx lr

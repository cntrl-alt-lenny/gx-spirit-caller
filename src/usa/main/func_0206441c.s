; func_0206441c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206441c
        .arm
func_0206441c:
    mov r3, r2, asr #0x8
    strb r3, [r0, r1]
    add r1, r1, #0x1
    strb r2, [r0, r1]
    bx lr

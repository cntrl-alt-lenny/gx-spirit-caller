; func_0206e5fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206e5fc
        .arm
func_0206e5fc:
    mov r2, r0, lsr #0x18
    strb r2, [r1]
    mov r2, r0, lsr #0x10
    strb r2, [r1, #0x1]
    mov r2, r0, lsr #0x8
    strb r2, [r1, #0x2]
    strb r0, [r1, #0x3]
    bx lr

; func_0201d05c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0218feac
        .extern data_0219052c
        .global func_0201d05c
        .arm
func_0201d05c:
    cmp r0, #0x0
    movlt r0, #0x0
    bxlt lr
    ldr r1, _LIT0
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r2, _LIT1
    mov r1, #0xc0
    mla r0, r1, r0, r2
    bx lr
_LIT0: .word data_0218feac
_LIT1: .word data_0219052c

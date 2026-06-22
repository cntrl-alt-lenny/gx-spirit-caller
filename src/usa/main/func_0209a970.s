; func_0209a970 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209a990
        .global func_0209a970
        .arm
func_0209a970:
    ldr ip, _LIT0
    mov r1, #0x0
    cmp r0, #0x1
    movne r0, #0x0
    mov r2, r1
    mov r3, #0x1
    bx ip
_LIT0: .word func_0209a990

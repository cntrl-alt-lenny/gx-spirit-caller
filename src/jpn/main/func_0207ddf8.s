; func_0207ddf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d3ac
        .global func_0207ddf8
        .arm
func_0207ddf8:
    ldr ip, _LIT0
    mov r2, r0
    ldr r0, [r2, #0x4]
    ldr r2, [r2, #0x8]
    bx ip
_LIT0: .word func_0207d3ac

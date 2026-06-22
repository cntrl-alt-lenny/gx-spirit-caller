; func_02053d68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a96c4
        .global func_02053d68
        .arm
func_02053d68:
    ldr ip, _LIT0
    mov r2, r0
    mov r3, r1
    ldr r0, [r2, #0x14]
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    bx ip
_LIT0: .word func_020a96c4

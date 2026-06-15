; func_020a3afc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a98fc
        .extern func_020a3b20
        .global func_020a3afc
        .arm
func_020a3afc:
    ldr r1, _LIT0
    ldr ip, _LIT1
    ldr r1, [r1]
    mov r2, #0x1
    add r1, r1, #0x1000
    str r2, [r1, #0x320]
    bx ip
_LIT0: .word data_021a98fc
_LIT1: .word func_020a3b20

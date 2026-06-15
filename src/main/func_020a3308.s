; func_020a3308 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a984c
        .extern data_021a9850
        .extern func_020a32e4
        .global func_020a3308
        .arm
func_020a3308:
    ldr r1, _LIT0
    mov r3, #0x0
    ldr r0, _LIT1
    mov r2, #0x1
    ldr ip, _LIT2
    str r3, [r1]
    str r3, [r1, #0x4]
    strb r2, [r1, #0xc]
    str r3, [r0]
    bx ip
_LIT0: .word data_021a9850
_LIT1: .word data_021a984c
_LIT2: .word func_020a32e4

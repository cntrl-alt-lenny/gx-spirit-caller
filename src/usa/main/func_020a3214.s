; func_020a3214 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a976c
        .extern data_021a9770
        .extern func_020a31f0
        .global func_020a3214
        .arm
func_020a3214:
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
_LIT0: .word data_021a9770
_LIT1: .word data_021a976c
_LIT2: .word func_020a31f0

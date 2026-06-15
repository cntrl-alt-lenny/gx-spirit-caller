; func_020379c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern func_02088f94
        .global func_020379c4
        .arm
func_020379c4:
    ldr r1, _LIT0
    mov r2, #0x0
    strh r2, [r1, #0x2]
    sub r2, r2, #0x1
    strh r2, [r1, #0xe]
    ldr ip, _LIT1
    strh r2, [r1, #0x10]
    bx ip
_LIT0: .word data_0219b2e0
_LIT1: .word func_02088f94

; func_02037974 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern func_02088eac
        .global func_02037974
        .arm
func_02037974:
    ldr r1, _LIT0
    mov r2, #0x0
    strh r2, [r1, #0x2]
    sub r2, r2, #0x1
    strh r2, [r1, #0xe]
    ldr ip, _LIT1
    strh r2, [r1, #0x10]
    bx ip
_LIT0: .word data_0219b200
_LIT1: .word func_02088eac

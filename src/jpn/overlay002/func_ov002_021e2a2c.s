; func_ov002_021e2a2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d46ac
        .global func_ov002_021e2a2c
        .arm
func_ov002_021e2a2c:
    ldr ip, _LIT0
    mov r0, r0, lsl #0x10
    mov r2, #0x0
    mov r1, r0, lsr #0x10
    mov r3, r2
    mov r0, #0xa
    bx ip
_LIT0: .word func_ov002_021d46ac

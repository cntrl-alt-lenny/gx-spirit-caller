; func_ov002_021e349c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021e2d90
        .global func_ov002_021e349c
        .arm
func_ov002_021e349c:
    ldr ip, _LIT0
    mov r3, r0
    mov r2, r1
    mov r0, #0x0
    mov r1, r3
    mov r3, r0
    bx ip
_LIT0: .word func_ov002_021e2d90

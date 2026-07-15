; func_ov010_021b6b00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020371b8
        .global func_ov010_021b6b00
        .arm
func_ov010_021b6b00:
    ldr ip, _LIT0
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bx ip
_LIT0: .word func_020371b8

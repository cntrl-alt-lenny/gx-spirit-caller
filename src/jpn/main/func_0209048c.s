; func_0209048c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_027e0000
        .global func_0209048c
        .arm
func_0209048c:
    ldr ip, _LIT0
    ldr r3, _LIT1
    add r0, ip, #0x3000
    ldr r2, _LIT2
    ldr r1, _LIT3
    str r3, [r0, #0xf7c]
    add r0, ip, #0x3f80
    str r2, [r0, -r1]
    bx lr
_LIT0: .word data_027e0000
_LIT1: .word 0xfddb597d
_LIT2: .word 0x7bf9dd5b
_LIT3: .word 0x00000400

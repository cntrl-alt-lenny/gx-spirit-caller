; func_020996c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020996c8
        .arm
func_020996c8:
    ldr r1, _LIT0
    ldr r2, _LIT1
    str r1, [r0]
    ldr r1, _LIT2
    str r2, [r0, #0x4]
    ldr r2, _LIT3
    str r1, [r0, #0x8]
    ldr r1, _LIT4
    str r2, [r0, #0xc]
    str r1, [r0, #0x10]
    mov r1, #0x0
    str r1, [r0, #0x14]
    str r1, [r0, #0x18]
    str r1, [r0, #0x1c]
    bx lr
_LIT0: .word 0x67452301
_LIT1: .word 0xefcdab89
_LIT2: .word 0x98badcfe
_LIT3: .word 0x10325476
_LIT4: .word 0xc3d2e1f0

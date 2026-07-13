; func_ov021_021aba60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov021_021aba60
        .arm
func_ov021_021aba60:
    ldr ip, [r0, #0x54]
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r3, _LIT2
    mla r1, ip, r1, r2
    str r1, [r0, #0x54]
    and r0, r3, r1, lsr #0x10
    bx lr
_LIT0: .word 0x000343fd
_LIT1: .word 0x00269ec3
_LIT2: .word 0x00007fff

; func_0202c418 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219a85c
        .global func_0202c418
        .arm
func_0202c418:
    ldr r1, _LIT0
    ldr r2, [r1, #0x4]
    ldr r1, [r2]
    ldr r2, [r2, #0x8]
    add r0, r1, r0, lsl #0x3
    ldr r0, [r0, #0x4]
    add r0, r2, r0
    bx lr
_LIT0: .word data_0219a85c

; func_02082184 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a1858
        .global func_02082184
        .arm
func_02082184:
    stmdb sp!, {r4, lr}
    ldr ip, _LIT0
    ldr lr, _LIT1
    and r4, ip, r1, asr #0x3
    and r1, ip, r2, asr #0x3
    and r2, ip, r3, asr #0x3
    orr r1, r4, r1, lsl #0xa
    orr r1, r1, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x1e
    str r1, [lr, r0, lsl #0x2]
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000003ff
_LIT1: .word data_021a1858

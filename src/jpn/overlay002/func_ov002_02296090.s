; func_ov002_02296090 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ba5ec
        .global func_ov002_02296090
        .arm
func_ov002_02296090:
    ldrh r2, [r0, #0x2]
    ldrh r1, [r0]
    ldr ip, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bx ip
_LIT0: .word func_ov002_021ba5ec

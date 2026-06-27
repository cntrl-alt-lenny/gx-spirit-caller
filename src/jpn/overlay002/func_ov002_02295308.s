; func_ov002_02295308 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02281884
        .global func_ov002_02295308
        .arm
func_ov002_02295308:
    ldrh r0, [r0, #0x2]
    ldr ip, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bx ip
_LIT0: .word func_ov002_02281884
_LIT1: .word 0x000015a3

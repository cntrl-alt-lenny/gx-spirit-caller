; func_ov002_02203f30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3fb8
        .global func_ov002_02203f30
        .arm
func_ov002_02203f30:
    ldrh r0, [r0, #0x2]
    ldr ip, _LIT0
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r2, #0x14c0
    mov r0, r0, lsr #0x1f
    bx ip
_LIT0: .word func_ov002_021b3fb8

; func_ov002_021b4174 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0172
        .extern func_ov002_021b3c4c
        .global func_ov002_021b4174
        .arm
func_ov002_021b4174:
    ldr r2, _LIT0
    mov r0, r0, lsl #0x2
    ldr ip, _LIT1
    ldrh r0, [r2, r0]
    bx ip
_LIT0: .word data_ov002_022d0172
_LIT1: .word func_ov002_021b3c4c

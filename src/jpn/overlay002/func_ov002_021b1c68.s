; func_ov002_021b1c68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d048c
        .extern data_ov002_022d057a
        .global func_ov002_021b1c68
        .arm
func_ov002_021b1c68:
    ldr r1, _LIT0
    mov r0, #0x1
    ldrh r1, [r1, #0xee]
    mov r1, r1, lsl #0x1c
    movs r1, r1, lsr #0x1c
    bxeq lr
    ldr r2, _LIT1
.L_74:
    ldrh r1, [r2, #0x8]!
    add r0, r0, #0x1
    mov r1, r1, lsl #0x1c
    movs r1, r1, lsr #0x1c
    bne .L_74
    bx lr
_LIT0: .word data_ov002_022d048c
_LIT1: .word data_ov002_022d057a

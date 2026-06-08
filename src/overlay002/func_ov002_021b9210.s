; func_ov002_021b9210 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf170
        .extern data_ov002_022cf174
        .global func_ov002_021b9210
        .arm
func_ov002_021b9210:
    ldr r1, _LIT0
    and r0, r0, #0x1
    mul r3, r0, r1
    ldr r2, _LIT1
    ldr r0, [r2, r3]
    add r1, r0, #0x1
    str r1, [r2, r3]
    cmp r1, #0x80
    bxcc lr
    ldr r1, _LIT2
    ldr r1, [r1, r3]
    add r1, r1, #0x2
    str r1, [r2, r3]
    bx lr
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf170
_LIT2: .word data_ov002_022cf174

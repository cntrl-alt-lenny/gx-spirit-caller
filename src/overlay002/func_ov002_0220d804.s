; func_ov002_0220d804 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021bb950
        .global func_ov002_0220d804
        .arm
func_ov002_0220d804:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    ldr r1, _LIT0
    mov r3, r0, lsl #0x1f
    ldr r2, [r1, #0xcec]
    mov r0, r3, lsr #0x1f
    cmp r2, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, [r1, #0xcf8]
    cmp r1, #0x5
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, _LIT1
    bl func_ov002_021bb950
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00001aa7

; func_ov002_02256108 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021bb068
        .extern func_ov002_021e28fc
        .global func_ov002_02256108
        .arm
func_ov002_02256108:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    bl func_ov002_021bb068
    ldr r1, _LIT1
    cmp r0, #0x0
    ldr r1, [r1, #0xd0]
    movgt r0, #0x1
    mov r1, r1, lsr #0x2
    movle r0, #0x0
    and r1, r1, #0x1
    cmp r0, r1
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_021e28fc
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00001510
_LIT1: .word data_ov002_022d016c

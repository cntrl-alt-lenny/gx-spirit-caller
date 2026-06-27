; func_ov002_021bbeb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022d008c
        .extern func_ov002_021bbe70
        .global func_ov002_021bbeb8
        .arm
func_ov002_021bbeb8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021bbe70
    ldr r1, _LIT0
    ldr r1, [r1, #0xd0]
    tst r1, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT1
    ldr r2, [r1]
    cmp r4, r2
    bne .L_3c
    ldr r1, [r1, #0xc4]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    addne r0, r0, #0x1
.L_3c:
    ldr r1, _LIT1
    ldr r2, [r1, #0x4]
    cmp r4, r2
    ldmneia sp!, {r4, pc}
    ldr r1, [r1, #0xd8]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    addne r0, r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd314

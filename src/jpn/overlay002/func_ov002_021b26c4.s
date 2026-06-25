; func_ov002_021b26c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0172
        .extern data_ov002_022d0570
        .extern func_ov002_021b1ca4
        .global func_ov002_021b26c4
        .arm
func_ov002_021b26c4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r0, r0, lsl #0x2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r4, _LIT1
.L_6f4:
    add r2, r4, r0, lsl #0x3
    ldrh r1, [r2, #0x2]
    ldrh r5, [r2, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x3
    bne .L_714
    bl func_ov002_021b1ca4
.L_714:
    mov r0, r5
    cmp r5, #0x0
    bne .L_6f4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d0172
_LIT1: .word data_ov002_022d0570

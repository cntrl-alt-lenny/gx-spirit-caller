; func_ov002_021b1fb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b1ca4
        .global func_ov002_021b1fb4
        .arm
func_ov002_021b1fb4:
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r0, [r0, #0xa]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r4, _LIT0
.L_3b8:
    add r1, r4, r0, lsl #0x3
    add r1, r1, #0x1400
    ldrh r5, [r1, #0xea]
    bl func_ov002_021b1ca4
    mov r0, r5
    cmp r5, #0x0
    bne .L_3b8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf08c

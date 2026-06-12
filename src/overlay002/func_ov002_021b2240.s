; func_ov002_021b2240 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0650
        .extern func_ov002_021b1d84
        .global func_ov002_021b2240
        .arm
func_ov002_021b2240:
    stmdb sp!, {r4, r5, r6, lr}
    ldrh r0, [r0, #0xa]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r6, _LIT0
    ldr r5, _LIT1
.L_18:
    add r2, r6, r0, lsl #0x3
    ldrh r1, [r2, #0x2]
    ldrh r4, [r2, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x6
    bcs .L_40
    ldrh r1, [r2]
    cmp r1, r5
    beq .L_44
.L_40:
    bl func_ov002_021b1d84
.L_44:
    mov r0, r4
    cmp r4, #0x0
    bne .L_18
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d0650
_LIT1: .word 0x0000164f

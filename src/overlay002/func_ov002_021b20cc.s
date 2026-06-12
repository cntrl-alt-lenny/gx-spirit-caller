; func_ov002_021b20cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0650
        .extern func_ov002_021b1d84
        .global func_ov002_021b20cc
        .arm
func_ov002_021b20cc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r6, r2
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r4, _LIT0
.L_18:
    add r2, r4, r0, lsl #0x3
    ldrh r1, [r2, #0x2]
    ldrh r5, [r2, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x6
    bcc .L_4c
    ldrh r1, [r2]
    cmp r1, r7
    bne .L_4c
    bl func_ov002_021b1d84
    cmp r6, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_4c:
    mov r0, r5
    cmp r5, #0x0
    bne .L_18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d0650

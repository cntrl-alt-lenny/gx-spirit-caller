; func_ov002_021b2108 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0570
        .extern func_ov002_021b1ca4
        .global func_ov002_021b2108
        .arm
func_ov002_021b2108:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r6, r2
    mov r5, r3
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r8, _LIT0
.L_138:
    add r2, r8, r0, lsl #0x3
    ldrh r1, [r2, #0x4]
    ldrh r4, [r2, #0x6]
    cmp r1, r6
    ldreqh r1, [r2]
    cmpeq r1, r7
    bne .L_160
    bl func_ov002_021b1ca4
    cmp r5, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_160:
    mov r0, r4
    cmp r4, #0x0
    bne .L_138
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d0570

; func_ov002_021b20ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0570
        .extern func_ov002_021b1ca4
        .global func_ov002_021b20ac
        .arm
func_ov002_021b20ac:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r1
    mov r7, r2
    mov r6, r3
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r4, _LIT0
.L_dc:
    add r2, r4, r0, lsl #0x3
    ldrh r1, [r2, #0x2]
    ldrh r5, [r2, #0x6]
    mov r1, r1, lsl #0x1c
    cmp r7, r1, lsr #0x1c
    ldreqh r1, [r2]
    cmpeq r1, r8
    bne .L_108
    bl func_ov002_021b1ca4
    cmp r6, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_108:
    mov r0, r5
    cmp r5, #0x0
    bne .L_dc
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d0570

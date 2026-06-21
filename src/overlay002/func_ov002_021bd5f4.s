; func_ov002_021bd5f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b9ecc
        .extern func_ov002_021ba104
        .global func_ov002_021bd5f4
        .arm
func_ov002_021bd5f4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r9, r1
    bl func_ov002_021b9ecc
    mov r1, #0x14
    ldr fp, _LIT0
    ldr r3, _LIT1
    and r4, sl, #0x1
    mul r2, r9, r1
    mla r1, r4, fp, r3
    ldrh r1, [r2, r1]
    mov r7, r0
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r7, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r6, #0x0
    mov r4, r6
.L_50:
    ldr r0, _LIT2
    and r1, r4, #0x1
    mla r8, r1, fp, r0
    mov r5, #0x0
.L_60:
    cmp r4, sl
    cmpeq r5, r9
    beq .L_a4
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_a4
    ldr r1, [r8, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_a4
    mov r0, r4
    mov r1, r5
    mov r2, r7
    bl func_ov002_021ba104
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_a4:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r8, r8, #0x14
    blt .L_60
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_50
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
_LIT2: .word data_ov002_022cf16c

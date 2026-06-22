; func_ov002_021f0478 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_0202e2f8
        .extern func_ov002_021b90a8
        .extern func_ov002_021b9ecc
        .extern func_ov002_021ba104
        .global func_ov002_021f0478
        .arm
func_ov002_021f0478:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r1
    ldr r3, _LIT0
    and r4, sl, #0x1
    mov r9, r2
    mov r1, #0x14
    mul r7, r4, r3
    ldr r2, _LIT1
    mov fp, r0
    mul r6, r9, r1
    add r8, r2, r7
    add r1, r8, r6
    ldr r1, [r1, #0x30]
    mov r0, sl
    mov r2, r1, lsl #0x13
    mov r1, r9
    mov r4, r2, lsr #0x13
    bl func_ov002_021b9ecc
    mov r5, r0
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [fp, #0x2]
    mov r0, r0, lsl #0x1f
    cmp sl, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r9, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    add r0, r0, r7
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b90a8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    bl func_0202e2f8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r6, #0x0
    mov r4, r6
.L_c4:
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_e8
    mov r0, sl
    mov r1, r4
    mov r2, r5
    bl func_ov002_021ba104
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_e8:
    add r4, r4, #0x1
    cmp r4, #0x4
    add r8, r8, #0x14
    ble .L_c4
    cmp r6, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4

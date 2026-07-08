; func_ov002_02291898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdba8
        .extern data_ov002_022cf08c
        .extern func_0202b89c
        .extern func_0202b8cc
        .extern func_ov002_021b9ac0
        .extern func_ov002_021bbe70
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_0223b378
        .extern func_ov002_0223bbc4
        .extern func_ov002_022535a4
        .extern func_ov002_022574e0
        .global func_ov002_02291898
        .arm
func_ov002_02291898:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r6, #0x0
    ldr fp, _LIT0
    mov r9, r6
.L_50:
    ldrh r1, [sl, #0x2]
    mov r0, sl
    mov r2, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_178
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    ldr r0, _LIT1
    mla r0, r1, r0, fp
    add r0, r0, #0x30
    add r0, r0, r9
    bl func_ov002_021b9ac0
    cmp r0, #0x0
    beq .L_178
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    ldr r0, _LIT1
    mla r2, r1, r0, fp
    add r0, r2, r9
    ldr r0, [r0, #0x40]
    mov r1, r0, lsr #0x16
    mov r0, r0, lsr #0x17
    and r1, r1, #0x1
    and r0, r0, #0x1
    adds r0, r1, r0
    beq .L_178
    add r0, r2, #0x30
    ldr r2, [r0, r9]
    mov r1, r2, lsl #0x13
    mov r0, r2, lsl #0x2
    mov r7, r1, lsr #0x13
    mov r1, r0, lsr #0x18
    mov r0, r7
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r8, r1, r2, lsr #0x1f
    bl func_ov002_0223b378
    mov r5, r0
    mov r0, r7
    bl func_0202b89c
    mov r4, r0
    mov r0, r7
    bl func_0202b8cc
    cmp r4, r0
    blt .L_178
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    add r0, r0, #0x1
    cmp r0, r5
    blt .L_178
    ldrh r0, [sl, #0x2]
    ldrh r1, [sl]
    mov r2, r8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r5, r0
    bne .L_178
    ldr r2, _LIT2
    mov r0, r7
    mov r1, r5
    bl func_ov002_0223bbc4
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_178:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r9, r9, #0x14
    ble .L_50
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cdba8

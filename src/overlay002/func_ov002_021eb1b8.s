; func_ov002_021eb1b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b33b0
        .extern func_ov002_021b3ac0
        .extern func_ov002_021c1ef0
        .extern func_ov002_021ef41c
        .global func_ov002_021eb1b8
        .arm
func_ov002_021eb1b8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r8, r2
    mov sl, r0
    mov r9, r1
    cmp r8, #0x5
    blt .L_20
    cmp r8, #0xa
    blt .L_28
.L_20:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_28:
    ldr r3, _LIT0
    ldr r4, _LIT1
    and r5, r9, #0x1
    mla r4, r5, r3, r4
    mov r3, #0x14
    mla r3, r8, r3, r4
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0xc]
    cmp r0, #0x2
    bne .L_124
    ldr r4, _LIT1
    ldr fp, _LIT0
    mov r5, #0x0
.L_7c:
    and r0, r5, #0x1
    mla r1, r0, fp, r4
    mov r6, #0x0
    add r7, r1, #0x30
.L_8c:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_104
    mov r0, r9
    mov r1, r8
    mov r2, r5
    mov r3, r6
    bl func_ov002_021b33b0
    cmp r0, #0x0
    beq .L_104
    ldrh r0, [sl, #0x2]
    mov r1, r0, lsl #0x1f
    cmp r5, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    mov r2, r1, lsr #0x1f
    cmpeq r0, r6
    beq .L_fc
    ldrh r3, [sl, #0x2]
    mov r0, r9
    mov r1, r8
    mov r3, r3, lsl #0x1a
    mov r3, r3, lsr #0x1b
    bl func_ov002_021b3ac0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_104:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x14
    ble .L_8c
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_7c
    b .L_138
.L_124:
    mov r0, sl
    mov r1, r9
    mov r2, r8
    bl func_ov002_021ef41c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_138:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c

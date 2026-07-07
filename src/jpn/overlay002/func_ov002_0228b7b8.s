; func_ov002_0228b7b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202e1e0
        .extern func_0202e2a4
        .extern func_ov002_021c1008
        .extern func_ov002_0223dda4
        .global func_ov002_0228b7b8
        .arm
func_ov002_0228b7b8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs r9, r1
    mov sl, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [r9, #0x2]
    ldrh r0, [sl, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r9, #0x6]
    mov r5, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_100
    ldr r4, _LIT0
    mov fp, #0x14
.L_54:
    mov r0, r9
    mov r1, r5
    bl func_ov002_0223dda4
    ldrh r2, [sl, #0x2]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r6, r0, #0xff
    mov r0, r2, lsl #0x1f
    cmp r6, r0, lsr #0x1f
    and r7, r1, #0xff
    bne .L_ec
    cmp r7, #0x4
    bgt .L_ec
    ldr r0, _LIT1
    and r1, r6, #0x1
    mla r0, r1, r0, r4
    mla r0, r7, fp, r0
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r8, r0, lsr #0x13
    mov r0, r8
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_ec
    mov r0, r8
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_ec
    mov r0, r6
    mov r1, r7
    mov r2, #0x1
    bl func_ov002_021c1008
    ldrh r1, [sl, #0x2]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_ec:
    ldrh r0, [r9, #0x6]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x18
    cmp r5, r0, lsr #0x18
    blt .L_54
.L_100:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868

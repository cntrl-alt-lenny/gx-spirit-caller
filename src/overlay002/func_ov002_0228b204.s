; func_ov002_0228b204 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202e340
        .extern func_ov002_021b39c4
        .extern func_ov002_021bd030
        .extern func_ov002_021ff3bc
        .extern func_ov002_0223de94
        .extern func_ov002_022575c8
        .global func_ov002_0228b204
        .arm
func_ov002_0228b204:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r1
    mov r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r5, #0x2]
    ldrh r0, [r6, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_1ac
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xa
    bhi .L_1ac
    mov r0, r5
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    ldrh r2, [r6, #0x2]
    and r0, r0, #0xff
    and r4, r3, #0xff
    mov r1, r2, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_021b39c4
    ldr r1, _LIT0
    cmp r0, r1
    beq .L_e0
    ldrh r1, [r6, #0x2]
    and r2, r0, #0xff
    mov r1, r1, lsl #0x1f
    cmp r2, r1, lsr #0x1f
    bne .L_e0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r4, r0, #0xff
.L_e0:
    ldrh r2, [r6, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e340
    cmp r0, #0x0
    beq .L_1ac
    cmp r4, #0x5
    blt .L_168
    mov r2, #0x2
    mov r0, r6
    mov r1, r5
    strh r2, [r6, #0xc]
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    beq .L_1ac
    ldrh r1, [r6, #0x2]
    mov r0, r6
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_1ac
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_168:
    mov r0, #0x1
    strh r0, [r6, #0xc]
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd030
    cmp r0, #0x0
    blt .L_1ac
    ldrh r1, [r6, #0x2]
    mov r0, r6
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_022575c8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_1ac:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c

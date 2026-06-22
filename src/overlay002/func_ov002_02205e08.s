; func_ov002_02205e08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf17c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bc288
        .extern func_ov002_021bc8c8
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ff2b8
        .extern func_ov002_0223f6c4
        .extern func_ov002_022536e8
        .global func_ov002_02205e08
        .arm
func_ov002_02205e08:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r1, [r5, #0x2]
    mov r0, r1, lsl #0x11
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r4, r0, r1, lsr #0x1f
    mov r0, r4
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bne .L_84
    mov r0, r5
    bl func_ov002_0223f6c4
    ldrh r3, [r5, #0x2]
    mov r2, r0
    ldrh r1, [r5]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_84:
    ldrh r0, [r5, #0x2]
    ldr r2, _LIT2
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x2]
    mov r0, r4
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff2b8
    cmp r0, #0x0
    bne .L_10c
    ldrh r1, [r5, #0x2]
    mov r0, r1, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    mov r0, r0, lsr #0x1f
    bne .L_114
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    bl func_ov002_021bc288
    cmp r0, #0x0
    beq .L_114
.L_10c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_114:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word 0x00000fa7

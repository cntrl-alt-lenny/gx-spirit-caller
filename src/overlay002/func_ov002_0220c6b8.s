; func_ov002_0220c6b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf17c
        .extern func_ov002_021b3618
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bc288
        .extern func_ov002_021bc68c
        .extern func_ov002_021bc8c8
        .extern func_ov002_021ca2b8
        .extern func_ov002_0223f6c4
        .extern func_ov002_022536e8
        .global func_ov002_0220c6b8
        .arm
func_ov002_0220c6b8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrh r2, [r6, #0x2]
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsl #0x11
    mov r1, r1, lsr #0x1b
    eor r5, r0, r2, lsr #0x1f
    bl func_ov002_021b3618
    ldr r1, _LIT0
    mov r4, r0
    cmp r4, r1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6, #0x2]
    ldrh r2, [r6]
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4, asr #0x8
    and r7, r0, #0xff
    and r4, r4, #0xff
    mov r0, r5
    mov r1, r4
    mov r2, r7
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5
    bl func_ov002_021bc68c
    cmp r0, #0x0
    bne .L_c0
    cmp r4, r5
    bne .L_b8
    mov r0, r4
    mov r1, r7
    bl func_ov002_021bc288
    cmp r0, #0x0
    bne .L_c0
.L_b8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c0:
    mov r0, r5
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r2, [r6, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bne .L_128
    mov r0, r6
    bl func_ov002_0223f6c4
    ldrh r3, [r6, #0x2]
    mov r2, r0
    ldrh r1, [r6]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_128:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf17c

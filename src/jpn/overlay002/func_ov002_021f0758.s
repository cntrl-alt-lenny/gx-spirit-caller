; func_ov002_021f0758 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern func_0202ea5c
        .extern func_0202f5cc
        .extern func_ov002_021b9dec
        .extern func_ov002_021bc1a8
        .extern func_ov002_021bc538
        .extern func_ov002_021c22cc
        .global func_ov002_021f0758
        .arm
func_ov002_021f0758:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r5, r2
    mov r7, r0
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9dec
    ldrh r1, [r7, #0x2]
    mov r4, r0
    mov r2, r1, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x23
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r5, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    cmp r1, r6
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT0
    mov r2, #0x14
    ldr r3, _LIT1
    and ip, r6, #0x1
    mul r2, r5, r2
    mla r1, ip, r1, r3
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_0202ea5c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    mov r1, #0x0
    bl func_0202f5cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c22cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    bne .L_fc
    mov r0, r6
    mov r1, r5
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_fc:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4

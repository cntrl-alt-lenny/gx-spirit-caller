; func_ov002_021ee3d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202ed3c
        .extern func_ov002_021b9dec
        .extern func_ov002_021c1d64
        .extern func_ov002_021c8400
        .extern func_ov002_021ee35c
        .global func_ov002_021ee3d8
        .arm
func_ov002_021ee3d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r3, [sl, #0x2]
    mov r9, r1
    mov r8, r2
    mov r3, r3, lsl #0x1f
    cmp r9, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r8, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, _LIT0
    and r5, r9, #0x1
    mov r3, #0x14
    mul r4, r5, r4
    ldr r5, _LIT1
    mul r6, r8, r3
    add r5, r5, r4
    add r3, r5, r6
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [sl]
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_94
    ldr r0, _LIT3
    cmp r1, r0
    beq .L_120
    b .L_15c
.L_94:
    mov r0, r9
    mov r1, r8
    mov r6, #0x0
    bl func_ov002_021c8400
    movs fp, r0
    moveq r0, r6
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, _LIT4
    add r7, r5, #0x30
    mov r5, r6
.L_bc:
    cmp r8, r5
    beq .L_fc
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_fc
    mov r0, r9
    mov r1, r5
    bl func_ov002_021c8400
    ldr r1, [r4, #0x494]
    add r1, r1, r6
    mov r1, r1, lsl #0x19
    add r1, r4, r1, lsr #0x18
    add r1, r1, #0x400
    strh r0, [r1, #0x98]
    add r6, r6, #0x1
.L_fc:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r7, r7, #0x14
    ble .L_bc
    ldrh r1, [sl, #0xc]
    sub r0, r6, #0x1
    sub r1, r1, fp
    bl func_ov002_021ee35c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_120:
    ldr r0, _LIT5
    add r0, r0, r4
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    beq .L_154
    mov r0, r9
    mov r1, r8
    bl func_ov002_021b9dec
    bl func_0202ed3c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_154:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_15c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x000014c1
_LIT3: .word 0x00001a05
_LIT4: .word data_ov002_022ce1a8
_LIT5: .word data_ov002_022cf0c4

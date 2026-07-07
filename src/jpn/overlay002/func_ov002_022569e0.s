; func_ov002_022569e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_ov002_021b3d48
        .extern func_ov002_021b9dec
        .extern func_ov002_021d5a90
        .extern func_ov002_021d90f0
        .global func_ov002_022569e0
        .arm
func_ov002_022569e0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r4, _LIT0
    ldr r5, _LIT1
    ldr fp, _LIT2
    mov r8, #0x0
.L_14:
    ldr r0, [fp, #0xcec]
    mov r7, #0x0
    eor r6, r0, r8
    ldr r0, _LIT3
    and r1, r6, #0x1
    mul sl, r1, r0
    add r9, r5, sl
.L_30:
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9dec
    cmp r0, r4
    bne .L_d8
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_d8
    ldr r1, [r9, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_d8
    mov r0, r6
    mov r1, r7
    mov r2, r4
    bl func_ov002_021b3d48
    cmp r0, #0x0
    beq .L_d8
    mov r0, #0x14
    mul r1, r7, r0
    ldr r0, _LIT4
    add r0, r0, sl
    ldr r0, [r1, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_bc
    ldr r2, _LIT0
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b3d48
    mov r2, r0
    mov r0, r6
    mov r1, r7
    bl func_ov002_021d90f0
.L_bc:
    ldr r2, _LIT0
    mov r0, r6
    mov r1, r7
    mov r3, #0x1
    bl func_ov002_021d5a90
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d8:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r9, r9, #0x14
    ble .L_30
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_14
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001817
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf0cc

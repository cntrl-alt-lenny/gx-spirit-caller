; func_ov002_02253bec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202e234
        .extern func_ov002_021b9ecc
        .extern func_ov002_021e2d94
        .extern func_ov002_021e30b4
        .global func_ov002_02253bec
        .arm
func_ov002_02253bec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    bl func_0202e234
    cmp r0, #0x0
    movne r7, #0x0
    movne r8, #0x4
    moveq r7, #0x5
    mov r0, #0x14
    mul fp, r7, r0
    moveq r8, #0x9
    mov r6, #0x0
.L_2c:
    ldr r0, _LIT0
    mov r5, r7
    ldr r0, [r0, #0xcec]
    cmp r7, r8
    eor r4, r0, r6
    bgt .L_120
    ldr r1, _LIT1
    ldr r0, _LIT2
    and r2, r4, #0x1
    mla r0, r2, r1, r0
    str r0, [sp]
    add r9, r0, fp
.L_5c:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9ecc
    cmp sl, r0
    bne .L_110
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_110
    ldr r1, [r9, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_110
    mov r0, r1, lsr #0x5
    tst r0, #0x1
    beq .L_110
    mov r0, #0x14
    mul r1, r5, r0
    ldr r0, [sp]
    mov r2, r4, lsl #0x1f
    add r0, r0, #0x30
    ldr r1, [r0, r1]
    and r3, r2, #-2147483648
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r5, lsl #0x10
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r1, r0, lsl #0x10
    orr r3, r3, #0x200000
    and r2, r2, #0x1f0000
    mov r0, sl, lsl #0x10
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
    mov r0, r4
    mov r1, r5
    mov r2, #0x5
    mov r3, #0x0
    bl func_ov002_021e2d94
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_110:
    add r5, r5, #0x1
    cmp r5, r8
    add r9, r9, #0x14
    ble .L_5c
.L_120:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c

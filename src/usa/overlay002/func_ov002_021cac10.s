; func_ov002_021cac10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022d008c
        .extern func_ov002_021b1e40
        .extern func_ov002_021b204c
        .extern func_ov002_021b9dec
        .extern func_ov002_021babc8
        .extern func_ov002_021bbe70
        .extern func_ov002_021be1f8
        .extern func_ov002_021c9aa0
        .global func_ov002_021cac10
        .arm
func_ov002_021cac10:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r6, _LIT1
    ldrh r0, [r0]
    ldr fp, _LIT2
    ldr r2, _LIT3
    tst r0, #0x8000
    movne sl, #0x1
    moveq sl, #0x0
    ldr r0, _LIT4
    and r1, sl, #0x1
    mla r9, r1, r0, r2
    mov r8, r9
    mov r7, #0x0
    sub r5, r6, #0x3a
    add r4, fp, #0x8d
.L_44:
    ldr r1, [r8, #0x40]
    mov r0, sl
    bic r2, r1, #0x400000
    bic r2, r2, #0x800000
    mov r1, r7
    str r2, [r8, #0x40]
    bl func_ov002_021b9dec
    cmp r0, r6
    bgt .L_78
    bge .L_90
    cmp r0, r5
    beq .L_90
    b .L_b0
.L_78:
    cmp r0, fp
    bgt .L_88
    beq .L_90
    b .L_b0
.L_88:
    cmp r0, r4
    bne .L_b0
.L_90:
    mov r0, sl
    mov r1, r7
    bl func_ov002_021b9dec
    mov r1, r0, lsl #0x10
    ldrh r0, [r8, #0x3a]
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021b204c
.L_b0:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r8, r8, #0x14
    ble .L_44
    rsb r7, sl, #0x1
    ldr r0, _LIT4
    and r1, r7, #0x1
    mul r4, r1, r0
    ldr r0, _LIT5
    ldr r1, _LIT6
    ldrh r0, [r0, r4]
    mov r2, #0x1
    bl func_ov002_021b204c
    mov r0, r7
    bl func_ov002_021bbe70
    cmp r0, #0x2
    blt .L_15c
    ldr r0, _LIT3
    mov r8, #0x0
    add r0, r0, r4
    add r6, r0, #0x30
    mov r5, #0x19
    mov fp, #0x1
    mov r4, r8
.L_110:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_14c
    mov r0, r7
    mov r1, r8
    mov r2, r5
    mov r3, fp
    bl func_ov002_021c9aa0
    ldr r3, _LIT7
    mov r0, r7
    mov r1, #0xb
    mov r2, #0x1
    str r4, [sp]
    bl func_ov002_021b1e40
.L_14c:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r6, r6, #0x14
    ble .L_110
.L_15c:
    mov r0, r7
    bl func_ov002_021bbe70
    cmp r0, #0x0
    beq .L_210
    ldr r1, _LIT8
    mov r6, #0x0
    ldr r0, [r1, #0xcf8]
    mov r4, #0x1
    str r0, [sp, #0x4]
    mov r0, #0x3
    ldr r5, _LIT9
    mov r8, r6
    mov r7, r9
    str r0, [r1, #0xcf8]
    mov fp, r4
.L_198:
    mov r0, sl
    mov r1, r8
    mov r2, r5
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_1d4
    ldrh r0, [r7, #0x36]
    cmp r0, #0x0
    bne .L_1d4
    mov r0, sl
    mov r1, r8
    mov r2, fp
    bl func_ov002_021be1f8
    cmp r0, #0x0
    orrne r6, r6, r4, lsl r8
.L_1d4:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r7, r7, #0x14
    ble .L_198
    mov r1, #0x0
    mov r0, #0x1
.L_1ec:
    tst r6, r0, lsl r1
    strne r0, [r9, #0x3c]
    add r1, r1, #0x1
    cmp r1, #0x4
    add r9, r9, #0x14
    ble .L_1ec
    ldr r1, _LIT8
    ldr r0, [sp, #0x4]
    str r0, [r1, #0xcf8]
.L_210:
    ldr r1, _LIT10
    mov r2, #0x0
    ldr r0, _LIT0
    str r2, [r1, #0x28]
    str r2, [r0, #0x80c]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x000018a6
_LIT2: .word 0x000019c1
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf1a2
_LIT6: .word 0x00001571
_LIT7: .word 0x0000197d
_LIT8: .word data_ov002_022d008c
_LIT9: .word 0x00001a79
_LIT10: .word data_ov002_022cd314

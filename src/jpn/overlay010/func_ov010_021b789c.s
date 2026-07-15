; func_ov010_021b789c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov010_021b8808
        .extern data_ov010_021b8840
        .extern data_ov010_021b9790
        .extern data_ov010_021b98ec
        .extern data_ov010_021b98f0
        .extern data_ov010_021b98f4
        .extern data_ov010_021b98f8
        .extern func_02013980
        .extern func_0203737c
        .extern func_0207e2d4
        .extern func_0207e550
        .extern func_0207fbf8
        .extern func_0207fc78
        .extern func_ov005_021ab5cc
        .extern func_ov005_021abd7c
        .extern func_ov005_021ac814
        .extern func_ov005_021ac9d4
        .extern func_ov010_021b2350
        .extern func_ov010_021b2390
        .extern func_ov010_021b2414
        .extern func_ov010_021b24f8
        .extern func_ov010_021b277c
        .extern func_ov010_021b2788
        .extern func_ov010_021b2790
        .extern func_ov010_021b27f0
        .extern func_ov010_021b2b18
        .extern func_ov010_021b31ac
        .extern func_ov010_021b33dc
        .extern func_ov010_021b3464
        .extern func_ov010_021b3564
        .extern func_ov010_021b35e4
        .extern func_ov010_021b6714
        .extern func_ov010_021b6b1c
        .extern func_ov010_021b6b34
        .global func_ov010_021b789c
        .arm
func_ov010_021b789c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x2
    ldr r9, _LIT0
    bl func_ov010_021b33dc
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, _LIT3
    ldr r3, _LIT4
    bl func_ov010_021b3464
    mov r4, #0xa
    ldr r8, _LIT5
    ldr r6, _LIT6
    mov sl, #0x0
    mov fp, #0x1000
    mov r7, #0x1
    mov r5, r4
.L_728:
    cmp sl, #0x4
    ldr r0, [r6, #0x4]
    bne .L_780
    mov r0, r0, lsl #0x1d
    mov r2, r0, lsr #0x1d
    mla r0, r2, r5, r8
    mov r1, sl, lsl #0x1
    ldrh r1, [r1, r0]
    ldr r0, [r9, #0x164]
    bl func_0207e2d4
    mov r1, r0
    ldr r2, [r9, #0x168]
    add r0, r9, #0x180
    bl func_0207fc78
    mov r1, fp
    add r0, r9, #0x180
    bl func_0207fbf8
    ldr r1, [r9, #0x1ac]
    str r7, [r9, #0x188]
    add r0, r9, sl, lsl #0x2
    str r1, [r0, #0x16c]
    b .L_7a4
.L_780:
    mov r0, r0, lsl #0x1d
    mov r2, r0, lsr #0x1d
    mla r0, r2, r4, r8
    mov r1, sl, lsl #0x1
    ldrh r1, [r1, r0]
    ldr r0, [r9, #0x168]
    bl func_0207e550
    add r1, r9, sl, lsl #0x2
    str r0, [r1, #0x16c]
.L_7a4:
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_728
    ldr r0, [r9, #0x168]
    add r2, r9, #0x16c
    str r0, [sp]
    ldr r0, [r9, #0x88]
    ldr r3, [r9, #0x164]
    mov r1, #0x2
    bl func_ov005_021ac9d4
    ldr r3, _LIT7
    ldr r0, [r9, #0x34]
    ldrh r2, [r3, #0x2c]
    ldrh r1, [r3, #0x2e]
    ldrh r5, [r3, #0x30]
    strh r2, [sp, #0x1c]
    strh r1, [sp, #0x1e]
    ldrh r4, [r3, #0x32]
    mov r1, #0x0
    mov r2, #0xe4
    strh r5, [sp, #0x20]
    strh r4, [sp, #0x22]
    ldrh r5, [r3, #0x34]
    ldrh r4, [r3, #0x36]
    mov r3, #0x23
    strh r5, [sp, #0x24]
    strh r4, [sp, #0x26]
    bl func_ov010_021b2414
    ldr r0, [r9, #0x34]
    mov r1, #0x1
    mov r2, #0xe4
    mov r3, #0xa4
    bl func_ov010_021b2414
    ldr r0, [r9, #0x34]
    mov r1, #0x2
    mov r2, #0xe4
    mov r3, #0x23
    bl func_ov010_021b2414
    bl func_ov010_021b6714
    mov r2, r0
    ldr r0, [r9, #0x34]
    mov r1, #0x0
    bl func_ov010_021b2350
    ldr r0, [r9, #0x34]
    mov r1, #0x97
    bl func_ov010_021b2390
    ldr r0, [r9, #0x34]
    ldr r1, [r9, #0x168]
    add r2, sp, #0x1c
    bl func_ov010_021b24f8
    ldr r1, _LIT7
    add r2, sp, #0x18
    ldrh r3, [r1, #0x2]
    ldrh r4, [r1]
    ldr r1, [r9, #0x168]
    add r0, r9, #0x3c
    strh r4, [sp, #0x18]
    strh r3, [sp, #0x1a]
    bl func_ov010_021b27f0
    mov r3, #0x18
    add r0, r9, #0x3c
    mov r1, #0xe4
    mov r2, #0x4
    str r3, [sp]
    bl func_ov010_021b2790
    ldr r1, _LIT8
    add r0, r9, #0x3c
    mov r2, #0x1
    bl func_ov010_021b277c
    add r0, r9, #0x3c
    mov r1, #0x0
    bl func_ov010_021b2788
    ldr r0, _LIT7
    ldr r1, [r9, #0x168]
    ldrh r3, [r0, #0x6]
    ldrh r4, [r0, #0x4]
    add r2, sp, #0x14
    add r0, r9, #0x60
    strh r4, [sp, #0x14]
    strh r3, [sp, #0x16]
    bl func_ov010_021b27f0
    mov r4, #0x10
    add r0, r9, #0x60
    mov r1, #0x7
    mov r2, #0x90
    mov r3, #0xda
    str r4, [sp]
    bl func_ov010_021b2790
    ldr r1, _LIT9
    add r0, r9, #0x60
    mov r2, #0x1
    bl func_ov010_021b277c
    add r0, r9, #0x60
    mov r1, #0x0
    bl func_ov010_021b2788
    ldr r2, _LIT7
    ldr r1, [r9, #0x164]
    ldrh r4, [r2, #0x18]
    ldrh r3, [r2, #0x1a]
    add r0, r9, #0x8c
    strh r4, [sp, #0xc]
    strh r3, [sp, #0xe]
    ldrh r4, [r2, #0x1c]
    ldrh r3, [r2, #0x1e]
    ldr r2, [r9, #0x168]
    strh r4, [sp, #0x10]
    strh r3, [sp, #0x12]
    bl func_ov010_021b3564
    add r0, r9, #0x8c
    add r1, sp, #0xc
    bl func_ov010_021b35e4
    ldr r1, [r9, #0x100]
    ldr r0, [r9, #0x88]
    bic r1, r1, #0x1
    str r1, [r9, #0x100]
    bl func_ov005_021ab5cc
    ldr r0, [r9, #0x88]
    bl func_ov005_021abd7c
    ldr r0, [r9, #0x88]
    bl func_ov005_021ac814
    ldr r1, _LIT7
    add r2, sp, #0x4
    ldrh r5, [r1, #0x10]
    ldrh r4, [r1, #0x12]
    mov r3, #0x1
    strh r5, [sp, #0x4]
    strh r4, [sp, #0x6]
    ldrh r5, [r1, #0x14]
    ldrh r4, [r1, #0x16]
    mov r0, #0x2
    mov r1, #0x5
    strh r5, [sp, #0x8]
    strh r4, [sp, #0xa]
    str r3, [sp]
    bl func_ov010_021b2b18
    mov r0, #0x6
    mov r1, #0x1
    mov r2, #0x2
    bl func_ov010_021b31ac
    mov r0, #0x7
    mov r1, #0x1
    mov r2, #0x2
    bl func_ov010_021b31ac
    ldr r4, _LIT10
    ldr r2, _LIT11
    ldrh r3, [r4]
    ldr r0, _LIT12
    sub r1, r4, #0x48
    bic r3, r3, #0x3f
    orr r3, r3, #0x3b
    strh r3, [r4]
    ldrh r3, [r4, #0x2]
    bic r3, r3, #0x3f
    orr r3, r3, #0x1f
    strh r3, [r4, #0x2]
    strh r2, [r4, #-8]
    strh r0, [r4, #-4]
    ldr r0, [r1]
    bic r0, r0, #0xe000
    orr r0, r0, #0x2000
    str r0, [r1]
    ldr r1, [r9, #0x34]
    ldr r0, [r1, #0x70]
    orr r0, r0, #0x2
    str r0, [r1, #0x70]
    ldr r0, [r9, #0x100]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r9, #0x100]
    bl func_02013980
    mov r2, #0x0
    add r0, r0, #0xf
    sub r3, r2, #0x1
    mov r1, #0x1
    bl func_0203737c
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov010_021b9790
_LIT1: .word data_ov010_021b98ec
_LIT2: .word data_ov010_021b98f0
_LIT3: .word data_ov010_021b98f4
_LIT4: .word data_ov010_021b98f8
_LIT5: .word data_ov010_021b8840
_LIT6: .word data_02104e6c
_LIT7: .word data_ov010_021b8808
_LIT8: .word func_ov010_021b6b1c
_LIT9: .word func_ov010_021b6b34
_LIT10: .word 0x04001048
_LIT11: .word 0x000004e4
_LIT12: .word 0x000024bb

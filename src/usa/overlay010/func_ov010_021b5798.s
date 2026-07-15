; func_ov010_021b5798 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov010_021b8770
        .extern data_ov010_021b879c
        .extern data_ov010_021b9160
        .extern data_ov010_021b92b4
        .extern data_ov010_021b92b8
        .extern data_ov010_021b92bc
        .extern data_ov010_021b92c0
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
        .extern func_ov010_021b3f3c
        .extern func_ov010_021b4578
        .extern func_ov010_021b4590
        .global func_ov010_021b5798
        .arm
func_ov010_021b5798:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    ldr r0, _LIT0
    mov r1, #0x0
    ldrh r4, [r0, #0x8]
    ldrh r3, [r0, #0xa]
    mov r2, r1
    strh r4, [sp, #0x14]
    strh r3, [sp, #0x16]
    ldrh r4, [r0, #0xc]
    ldrh r3, [r0, #0xe]
    mov r0, #0x2
    ldr r9, _LIT1
    strh r4, [sp, #0x18]
    strh r3, [sp, #0x1a]
    bl func_ov010_021b33dc
    ldr r0, _LIT2
    ldr r1, _LIT3
    ldr r2, _LIT4
    ldr r3, _LIT5
    bl func_ov010_021b3464
    mov r4, #0x6
    ldr r8, _LIT6
    ldr r6, _LIT7
    mov sl, #0x0
    mov fp, #0x1000
    mov r7, #0x1
    mov r5, r4
.L_a9c:
    cmp sl, #0x2
    ldr r0, [r6, #0x4]
    bne .L_af4
    mov r0, r0, lsl #0x1d
    mov r2, r0, lsr #0x1d
    mla r0, r2, r5, r8
    mov r1, sl, lsl #0x1
    ldrh r1, [r1, r0]
    ldr r0, [r9, #0x15c]
    bl func_0207e2d4
    mov r1, r0
    ldr r2, [r9, #0x160]
    add r0, r9, #0x1cc
    bl func_0207fc78
    mov r1, fp
    add r0, r9, #0x1cc
    bl func_0207fbf8
    ldr r1, [r9, #0x1f8]
    str r7, [r9, #0x1d4]
    add r0, r9, sl, lsl #0x2
    str r1, [r0, #0x1c0]
    b .L_b18
.L_af4:
    mov r0, r0, lsl #0x1d
    mov r2, r0, lsr #0x1d
    mla r0, r2, r4, r8
    mov r1, sl, lsl #0x1
    ldrh r1, [r1, r0]
    ldr r0, [r9, #0x160]
    bl func_0207e550
    add r1, r9, sl, lsl #0x2
    str r0, [r1, #0x1c0]
.L_b18:
    add sl, sl, #0x1
    cmp sl, #0x3
    blt .L_a9c
    ldr r0, [r9, #0x160]
    add r2, r9, #0x1c0
    str r0, [sp]
    ldr r0, [r9, #0x80]
    ldr r3, [r9, #0x15c]
    mov r1, #0x2
    bl func_ov005_021ac9d4
    ldr r3, _LIT0
    ldr r0, [r9, #0x2c]
    ldrh r2, [r3, #0x20]
    ldrh r1, [r3, #0x22]
    ldrh r5, [r3, #0x24]
    strh r2, [sp, #0x1c]
    strh r1, [sp, #0x1e]
    ldrh r4, [r3, #0x26]
    mov r1, #0x0
    mov r2, #0xe4
    strh r5, [sp, #0x20]
    strh r4, [sp, #0x22]
    ldrh r5, [r3, #0x28]
    ldrh r4, [r3, #0x2a]
    mov r3, #0x23
    strh r5, [sp, #0x24]
    strh r4, [sp, #0x26]
    bl func_ov010_021b2414
    ldr r0, [r9, #0x2c]
    mov r1, #0x1
    mov r2, #0xe4
    mov r3, #0xa4
    bl func_ov010_021b2414
    ldr r0, [r9, #0x2c]
    mov r1, #0x2
    mov r2, #0xe4
    mov r3, #0x23
    bl func_ov010_021b2414
    bl func_ov010_021b3f3c
    mov r2, r0
    ldr r0, [r9, #0x2c]
    mov r1, #0x0
    bl func_ov010_021b2350
    ldr r0, [r9, #0x2c]
    mov r1, #0x97
    bl func_ov010_021b2390
    ldr r0, [r9, #0x2c]
    ldr r1, [r9, #0x160]
    add r2, sp, #0x1c
    bl func_ov010_021b24f8
    ldr r1, _LIT0
    add r2, sp, #0x10
    ldrh r3, [r1, #0x6]
    ldrh r4, [r1, #0x4]
    ldr r1, [r9, #0x160]
    add r0, r9, #0x34
    strh r4, [sp, #0x10]
    strh r3, [sp, #0x12]
    bl func_ov010_021b27f0
    mov r3, #0x18
    add r0, r9, #0x34
    mov r1, #0xe4
    mov r2, #0x4
    str r3, [sp]
    bl func_ov010_021b2790
    ldr r1, _LIT8
    add r0, r9, #0x34
    mov r2, #0x1
    bl func_ov010_021b277c
    add r0, r9, #0x34
    mov r1, #0x0
    bl func_ov010_021b2788
    ldr r0, _LIT0
    ldr r1, [r9, #0x160]
    ldrh r3, [r0, #0x2]
    ldrh r4, [r0]
    add r2, sp, #0xc
    add r0, r9, #0x58
    strh r4, [sp, #0xc]
    strh r3, [sp, #0xe]
    bl func_ov010_021b27f0
    mov r4, #0x1a
    add r0, r9, #0x58
    mov r1, #0xbd
    mov r2, #0x3
    mov r3, #0x22
    str r4, [sp]
    bl func_ov010_021b2790
    ldr r1, _LIT9
    add r0, r9, #0x58
    mov r2, #0x1
    bl func_ov010_021b277c
    add r0, r9, #0x58
    mov r1, #0x0
    bl func_ov010_021b2788
    ldr r2, _LIT0
    ldr r1, [r9, #0x15c]
    ldrh r4, [r2, #0x18]
    ldrh r3, [r2, #0x1a]
    add r0, r9, #0x84
    strh r4, [sp, #0x4]
    strh r3, [sp, #0x6]
    ldrh r4, [r2, #0x1c]
    ldrh r3, [r2, #0x1e]
    ldr r2, [r9, #0x160]
    strh r4, [sp, #0x8]
    strh r3, [sp, #0xa]
    bl func_ov010_021b3564
    add r0, r9, #0x84
    add r1, sp, #0x4
    bl func_ov010_021b35e4
    ldr r0, [r9, #0x80]
    bl func_ov005_021ab5cc
    ldr r0, [r9, #0x80]
    bl func_ov005_021abd7c
    ldr r0, [r9, #0x80]
    bl func_ov005_021ac814
    mov r0, #0x1
    mov r1, #0x5
    add r2, sp, #0x14
    mov r3, r0
    str r0, [sp]
    bl func_ov010_021b2b18
    mov r1, #0x1
    mov r0, #0x6
    mov r2, r1
    bl func_ov010_021b31ac
    mov r1, #0x1
    mov r0, #0x7
    mov r2, r1
    bl func_ov010_021b31ac
    ldr r3, _LIT10
    ldr r1, _LIT11
    ldrh r0, [r3]
    bic r0, r0, #0x3f
    orr r0, r0, #0x1b
    orr r0, r0, #0x20
    strh r0, [r3]
    ldrh r2, [r3, #0x2]
    ldr r0, _LIT12
    bic r2, r2, #0x3f
    orr r2, r2, #0x1f
    strh r2, [r3, #0x2]
    strh r1, [r3, #-8]
    strh r0, [r3, #-4]
    sub r2, r3, #0x48
    ldr r1, [r2]
    mov r0, #0x1
    bic r1, r1, #0xe000
    orr r1, r1, #0x2000
    str r1, [r2]
    ldr r2, [r9, #0x2c]
    ldr r1, [r2, #0x70]
    orr r1, r1, #0x2
    str r1, [r2, #0x70]
    ldr r1, [r9, #0xf8]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r9, #0xf8]
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov010_021b8770
_LIT1: .word data_ov010_021b9160
_LIT2: .word data_ov010_021b92b4
_LIT3: .word data_ov010_021b92b8
_LIT4: .word data_ov010_021b92bc
_LIT5: .word data_ov010_021b92c0
_LIT6: .word data_ov010_021b879c
_LIT7: .word data_02104e6c
_LIT8: .word func_ov010_021b4578
_LIT9: .word func_ov010_021b4590
_LIT10: .word 0x04001048
_LIT11: .word 0x000004e4
_LIT12: .word 0x000024bb

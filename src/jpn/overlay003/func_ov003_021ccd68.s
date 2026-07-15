; func_ov003_021ccd68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104b88
        .extern data_02104e6c
        .extern data_ov003_021cf248
        .extern data_ov003_021cf268
        .extern data_ov003_021cf288
        .extern data_ov003_021cf2a8
        .extern data_ov003_021cf2c8
        .extern data_ov003_021cf2e8
        .extern data_ov003_021cf308
        .extern data_ov003_021cf328
        .extern data_ov003_021cf348
        .extern data_ov003_021cf368
        .extern data_ov003_021cf388
        .extern data_ov003_021cf3a8
        .extern data_ov003_021cf3c8
        .extern data_ov003_021cf3e8
        .extern data_ov003_021cf408
        .extern data_ov003_021cf428
        .extern data_ov003_021cf448
        .extern data_ov003_021cf460
        .extern data_ov003_021cf478
        .extern data_ov003_021cf490
        .extern data_ov003_021cf4a8
        .extern data_ov003_021cf4c0
        .extern data_ov003_021cf4d8
        .extern data_ov003_021cf4f0
        .extern data_ov003_021cf508
        .extern data_ov003_021cf520
        .extern data_ov003_021cf538
        .extern data_ov003_021cf550
        .extern func_0201e78c
        .extern func_02091554
        .extern func_ov003_021ccd1c
        .extern func_ov003_021cd21c
        .global func_ov003_021ccd68
        .arm
func_ov003_021ccd68:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x110
    ldr r2, _LIT0
    add ip, sp, #0x10
    ldr lr, [r2, #0xc3c]
    add r4, sp, #0x50
    add r3, sp, #0x90
    add r2, sp, #0xd0
    mov r5, r1
    str r4, [sp, #0x4]
    mov r6, r0
    str ip, [sp]
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    eor r4, lr, r5
    bl func_0201e78c
    ldr r0, _LIT1
    ldr r2, [r0, r4, lsl #0x2]
    cmp r2, #0x0
    bne .L_248
    cmp r5, #0x0
    ldrne r0, _LIT0
    ldr r1, _LIT2
    ldrne r4, [r0, #0xba8]
    ldreq r0, _LIT3
    ldreq r4, [r0, #0xa64]
    ldr r0, [sp]
    and r7, r4, #0x1f
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0x4]
    ldr r1, _LIT4
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0x8]
    ldr r1, _LIT5
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0xc]
    ldr r1, _LIT6
    mov r2, r7
    bl func_02091554
    mov r0, r6
    mov r1, r5
    mov r2, #0x0
    add r3, sp, #0x0
    bl func_ov003_021cd21c
    and r0, r4, #0x3e0
    mov r7, r0, lsr #0x5
    ldr r0, [sp]
    ldr r1, _LIT7
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0x4]
    ldr r1, _LIT8
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0x8]
    ldr r1, _LIT9
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0xc]
    ldr r1, _LIT10
    mov r2, r7
    bl func_02091554
    mov r0, r6
    mov r1, r5
    mov r2, #0x1
    add r3, sp, #0x0
    bl func_ov003_021cd21c
    and r0, r4, #0x7c00
    mov r7, r0, lsr #0xa
    ldr r0, [sp]
    ldr r1, _LIT11
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0x4]
    ldr r1, _LIT12
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0x8]
    ldr r1, _LIT13
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0xc]
    ldr r1, _LIT14
    mov r2, r7
    bl func_02091554
    add r3, sp, #0x0
    mov r0, r6
    mov r1, r5
    mov r2, #0x2
    bl func_ov003_021cd21c
    cmp r7, #0x6
    cmpne r7, #0xb
    beq .L_1dc
    and r0, r4, #0xf8000
    mov r7, r0, lsr #0xf
    ldr r0, [sp]
    ldr r1, _LIT15
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0x4]
    ldr r1, _LIT16
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0x8]
    ldr r1, _LIT17
    mov r2, r7
    bl func_02091554
    ldr r0, [sp, #0xc]
    ldr r1, _LIT18
    mov r2, r7
    bl func_02091554
    mov r0, r6
    mov r1, r5
    mov r2, #0x3
    add r3, sp, #0x0
    bl func_ov003_021cd21c
.L_1dc:
    and r0, r4, #0x1f00000
    movs r4, r0, lsr #0x14
    addeq sp, sp, #0x110
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [sp]
    ldr r1, _LIT19
    add r2, r4, #0x4b
    bl func_02091554
    ldr r0, [sp, #0x4]
    ldr r1, _LIT20
    add r2, r4, #0x4b
    bl func_02091554
    ldr r0, [sp, #0x8]
    ldr r1, _LIT21
    add r2, r4, #0x4b
    bl func_02091554
    ldr r0, [sp, #0xc]
    ldr r1, _LIT22
    add r2, r4, #0x4b
    bl func_02091554
    mov r0, r6
    mov r1, r5
    mov r2, #0x4
    add r3, sp, #0x0
    bl func_ov003_021cd21c
    add sp, sp, #0x110
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_248:
    cmp r2, #0x37
    bne .L_2e8
    ldr r0, _LIT3
    mov r2, #0x37
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    bne .L_2a8
    ldr r0, [sp]
    ldr r1, _LIT23
    bl func_02091554
    ldr r0, [sp, #0x4]
    ldr r1, _LIT24
    mov r2, #0x37
    bl func_02091554
    ldr r0, [sp, #0x8]
    ldr r1, _LIT25
    mov r2, #0x37
    bl func_02091554
    ldr r0, [sp, #0xc]
    ldr r1, _LIT26
    mov r2, #0x37
    bl func_02091554
    b .L_330
.L_2a8:
    ldr r0, [sp]
    ldr r1, _LIT27
    bl func_02091554
    ldr r0, [sp, #0x4]
    ldr r1, _LIT28
    mov r2, #0x37
    bl func_02091554
    ldr r0, [sp, #0x8]
    ldr r1, _LIT29
    mov r2, #0x37
    bl func_02091554
    ldr r0, [sp, #0xc]
    ldr r1, _LIT30
    mov r2, #0x37
    bl func_02091554
    b .L_330
.L_2e8:
    ldr r0, [sp]
    ldr r1, _LIT19
    bl func_02091554
    ldr r1, _LIT1
    ldr r0, [sp, #0x4]
    ldr r2, [r1, r4, lsl #0x2]
    ldr r1, _LIT20
    bl func_02091554
    ldr r1, _LIT1
    ldr r0, [sp, #0x8]
    ldr r2, [r1, r4, lsl #0x2]
    ldr r1, _LIT21
    bl func_02091554
    ldr r1, _LIT1
    ldr r0, [sp, #0xc]
    ldr r2, [r1, r4, lsl #0x2]
    ldr r1, _LIT22
    bl func_02091554
.L_330:
    add r3, sp, #0x0
    mov r0, r6
    mov r1, r5
    mov r2, #0x0
    bl func_ov003_021cd21c
    ldr r1, _LIT1
    mov r0, r6
    ldr r1, [r1, r4, lsl #0x2]
    bl func_ov003_021ccd1c
    cmp r0, #0x0
    addeq sp, sp, #0x110
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT1
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    beq .L_380
    cmp r0, #0x4b
    beq .L_3dc
    add sp, sp, #0x110
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_380:
    ldr r0, [sp]
    ldr r1, _LIT19
    mov r2, #0x5c
    bl func_02091554
    ldr r0, [sp, #0x4]
    ldr r1, _LIT20
    mov r2, #0x5c
    bl func_02091554
    ldr r0, [sp, #0x8]
    ldr r1, _LIT21
    mov r2, #0x5c
    bl func_02091554
    ldr r0, [sp, #0xc]
    ldr r1, _LIT22
    mov r2, #0x5c
    bl func_02091554
    mov r0, r6
    mov r1, r5
    mov r2, #0x4
    add r3, sp, #0x0
    bl func_ov003_021cd21c
    add sp, sp, #0x110
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3dc:
    ldr r0, [sp]
    ldr r1, _LIT19
    mov r2, #0x5d
    bl func_02091554
    ldr r0, [sp, #0x4]
    ldr r1, _LIT20
    mov r2, #0x5d
    bl func_02091554
    ldr r0, [sp, #0x8]
    ldr r1, _LIT21
    mov r2, #0x5d
    bl func_02091554
    ldr r0, [sp, #0xc]
    ldr r1, _LIT22
    mov r2, #0x5d
    bl func_02091554
    mov r0, r6
    mov r1, r5
    mov r2, #0x4
    add r3, sp, #0x0
    bl func_ov003_021cd21c
    add sp, sp, #0x110
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_02104b88
_LIT2: .word data_ov003_021cf248
_LIT3: .word data_02104e6c
_LIT4: .word data_ov003_021cf268
_LIT5: .word data_ov003_021cf288
_LIT6: .word data_ov003_021cf2a8
_LIT7: .word data_ov003_021cf2c8
_LIT8: .word data_ov003_021cf2e8
_LIT9: .word data_ov003_021cf308
_LIT10: .word data_ov003_021cf328
_LIT11: .word data_ov003_021cf348
_LIT12: .word data_ov003_021cf368
_LIT13: .word data_ov003_021cf388
_LIT14: .word data_ov003_021cf3a8
_LIT15: .word data_ov003_021cf3c8
_LIT16: .word data_ov003_021cf3e8
_LIT17: .word data_ov003_021cf408
_LIT18: .word data_ov003_021cf428
_LIT19: .word data_ov003_021cf448
_LIT20: .word data_ov003_021cf460
_LIT21: .word data_ov003_021cf478
_LIT22: .word data_ov003_021cf490
_LIT23: .word data_ov003_021cf4a8
_LIT24: .word data_ov003_021cf4c0
_LIT25: .word data_ov003_021cf4d8
_LIT26: .word data_ov003_021cf4f0
_LIT27: .word data_ov003_021cf508
_LIT28: .word data_ov003_021cf520
_LIT29: .word data_ov003_021cf538
_LIT30: .word data_ov003_021cf550

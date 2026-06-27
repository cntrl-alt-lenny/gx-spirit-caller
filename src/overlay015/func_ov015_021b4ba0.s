; func_ov015_021b4ba0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210249c
        .extern data_02104f4c
        .extern data_ov015_021b5a8c
        .extern data_ov015_021b5ac8
        .extern data_ov015_021b5ae8
        .extern data_ov015_021b5e28
        .extern data_ov015_021b5e44
        .extern data_ov015_021b67c0
        .extern data_ov015_021b67c4
        .extern data_ov015_021b67c8
        .extern data_ov015_021b67cc
        .extern func_02001bc8
        .extern func_0207e3bc
        .extern func_0207e638
        .extern func_0207fce0
        .extern func_0207fd60
        .extern func_0208c884
        .extern func_0208f2a8
        .extern func_0208f2f4
        .extern func_0208f368
        .extern func_02092904
        .extern func_ov005_021ab6ac
        .extern func_ov005_021abe5c
        .extern func_ov005_021ac91c
        .extern func_ov005_021acadc
        .extern func_ov015_021b2450
        .extern func_ov015_021b2490
        .extern func_ov015_021b2514
        .extern func_ov015_021b25f8
        .extern func_ov015_021b287c
        .extern func_ov015_021b2888
        .extern func_ov015_021b2890
        .extern func_ov015_021b28f0
        .extern func_ov015_021b2c18
        .extern func_ov015_021b2df8
        .extern Ov015_DrawStatusFields
        .extern func_ov015_021b30b0
        .extern Ov015_InitScroller
        .extern func_ov015_021b31f0
        .extern func_ov015_021b36c4
        .extern func_ov015_021b3d2c
        .extern func_ov015_021b3f80
        .global func_ov015_021b4ba0
        .arm
func_ov015_021b4ba0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x74
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x2
    ldr r9, _LIT0
    bl Ov015_DrawStatusFields
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, _LIT3
    ldr r3, _LIT4
    bl func_ov015_021b30b0
    ldr r0, _LIT5
    ldr r0, [r0, #0x898]
    cmp r0, #0x0
    beq .L_52c
    mov fp, #0x6
    ldr r8, _LIT6
    ldr r6, _LIT7
    mov sl, #0x0
    add r5, r9, #0x198
    mov r7, #0x1
    mov r4, fp
.L_430:
    cmp sl, #0x0
    ldr r0, [r6, #0x4]
    bne .L_488
    mov r0, r0, lsl #0x1d
    mov r2, r0, lsr #0x1d
    mla r0, r2, r4, r8
    mov r1, sl, lsl #0x1
    ldrh r1, [r1, r0]
    ldr r0, [r9, #0x984]
    bl func_0207e3bc
    mov r1, r0
    ldr r2, [r9, #0x988]
    add r0, r5, #0x800
    bl func_0207fd60
    add r0, r5, #0x800
    mov r1, #0x1000
    bl func_0207fce0
    ldr r1, [r9, #0x9c4]
    str r7, [r9, #0x9a0]
    add r0, r9, sl, lsl #0x2
    str r1, [r0, #0x98c]
    b .L_4ac
.L_488:
    mov r0, r0, lsl #0x1d
    mov r2, r0, lsr #0x1d
    mla r0, r2, fp, r8
    mov r1, sl, lsl #0x1
    ldrh r1, [r1, r0]
    ldr r0, [r9, #0x988]
    bl func_0207e638
    add r1, r9, sl, lsl #0x2
    str r0, [r1, #0x98c]
.L_4ac:
    add sl, sl, #0x1
    cmp sl, #0x3
    blt .L_430
    ldr r1, _LIT8
    add r0, r9, #0x18c
    ldrh r8, [r1, #0x24]
    ldrh r7, [r1, #0x26]
    ldrh r6, [r1, #0x28]
    ldrh r5, [r1, #0x2a]
    ldrh r4, [r1, #0x2c]
    ldrh sl, [r1, #0x2e]
    ldr r1, [r9, #0x988]
    add r2, r0, #0x800
    str r1, [sp]
    ldr r0, [r9, #0x878]
    ldr r3, [r9, #0x984]
    mov r1, #0x2
    strh r8, [sp, #0x68]
    strh r7, [sp, #0x6a]
    strh r6, [sp, #0x6c]
    strh r5, [sp, #0x6e]
    strh r4, [sp, #0x70]
    strh sl, [sp, #0x72]
    bl func_ov005_021acadc
    ldr r0, _LIT7
    add r1, sp, #0x68
    ldr r2, [r0, #0x4]
    ldr r0, [r9, #0x878]
    mov r2, r2, lsl #0x1d
    mov r2, r2, lsr #0x1c
    ldrh r1, [r1, r2]
    strh r1, [r0, #0x3a]
.L_52c:
    ldr r0, [r9, #0x87c]
    cmp r0, #0x0
    beq .L_5d8
    ldr r3, _LIT8
    ldr r0, [r9, #0x848]
    ldrh r2, [r3, #0x30]
    ldrh r1, [r3, #0x32]
    ldrh r5, [r3, #0x34]
    strh r2, [sp, #0x5c]
    strh r1, [sp, #0x5e]
    ldrh r4, [r3, #0x36]
    mov r1, #0x0
    mov r2, #0xe4
    strh r5, [sp, #0x60]
    strh r4, [sp, #0x62]
    ldrh r5, [r3, #0x38]
    ldrh r4, [r3, #0x3a]
    mov r3, #0x23
    strh r5, [sp, #0x64]
    strh r4, [sp, #0x66]
    bl func_ov015_021b2514
    ldr r0, [r9, #0x848]
    mov r1, #0x1
    mov r2, #0xe4
    mov r3, #0xa4
    bl func_ov015_021b2514
    ldr r0, [r9, #0x848]
    mov r1, #0x2
    mov r2, #0xe4
    mov r3, #0x23
    bl func_ov015_021b2514
    bl func_ov015_021b36c4
    mov r2, r0
    ldr r0, [r9, #0x848]
    mov r1, #0x0
    bl func_ov015_021b2450
    ldr r0, [r9, #0x848]
    mov r1, #0x97
    bl func_ov015_021b2490
    ldr r0, [r9, #0x848]
    ldr r1, [r9, #0x988]
    add r2, sp, #0x5c
    bl func_ov015_021b25f8
.L_5d8:
    ldr r0, _LIT8
    ldr r1, [r9, #0x988]
    ldrh r3, [r0, #0x2]
    ldrh r4, [r0]
    add r2, sp, #0x18
    add r0, r9, #0x850
    strh r4, [sp, #0x18]
    strh r3, [sp, #0x1a]
    bl func_ov015_021b28f0
    mov r3, #0x18
    add r0, r9, #0x850
    mov r1, #0xe4
    mov r2, #0x4
    str r3, [sp]
    bl func_ov015_021b2890
    ldr r1, _LIT9
    add r0, r9, #0x850
    mov r2, #0x1
    bl func_ov015_021b287c
    add r0, r9, #0x850
    mov r1, #0x0
    bl func_ov015_021b2888
    ldr r0, [r9, #0x87c]
    cmp r0, #0x0
    beq .L_688
    ldr r0, _LIT8
    ldr r1, [r9, #0x984]
    ldrh r4, [r0, #0xc]
    ldrh r3, [r0, #0xe]
    ldr r2, [r9, #0x988]
    strh r4, [sp, #0x10]
    strh r3, [sp, #0x12]
    ldrh r4, [r0, #0x10]
    ldrh r3, [r0, #0x12]
    add r0, r9, #0x880
    strh r4, [sp, #0x14]
    strh r3, [sp, #0x16]
    bl Ov015_InitScroller
    add r1, sp, #0x10
    add r0, r9, #0x880
    bl func_ov015_021b31f0
    ldr r0, [r9, #0x8f4]
    bic r0, r0, #0x1
    str r0, [r9, #0x8f4]
.L_688:
    mov r0, #0x3
    mov r1, #0x1
    mov r2, #0x4
    bl func_ov015_021b2df8
    ldr r0, [r9, #0x87c]
    cmp r0, #0x0
    beq .L_6c0
    ldr r0, [r9, #0x878]
    bl func_ov005_021ab6ac
    ldr r0, [r9, #0x878]
    bl func_ov005_021abe5c
    ldr r0, [r9, #0x878]
    bl func_ov005_021ac91c
    b .L_6c4
.L_6c0:
    bl func_ov015_021b3d2c
.L_6c4:
    ldr r0, _LIT8
    add r2, sp, #0x8
    ldrh r4, [r0, #0x1c]
    ldrh r1, [r0, #0x1e]
    mov r3, #0x1
    strh r4, [sp, #0x8]
    strh r1, [sp, #0xa]
    ldrh r5, [r0, #0x20]
    ldrh r4, [r0, #0x22]
    mov r0, #0x3
    mov r1, #0x5
    strh r5, [sp, #0xc]
    strh r4, [sp, #0xe]
    str r3, [sp]
    bl func_ov015_021b2c18
    mov r0, #0x6
    mov r1, #0x1
    mov r2, #0x3
    bl func_ov015_021b2df8
    mov r0, #0x7
    mov r1, #0x1
    mov r2, #0x3
    bl func_ov015_021b2df8
    ldr r6, _LIT10
    ldr r3, _LIT11
    ldrh r0, [r6]
    ldr r2, _LIT12
    sub r4, r6, #0x48
    bic r0, r0, #0x3f
    orr r0, r0, #0x3b
    strh r0, [r6]
    ldrh r5, [r6, #0x2]
    sub r1, r3, #0xe5
    ldr r0, _LIT13
    bic r5, r5, #0x3f
    orr r5, r5, #0x1f
    strh r5, [r6, #0x2]
    strh r3, [r6, #-8]
    strh r2, [r6, #-4]
    ldr r3, [r4]
    mov r2, #0x1f
    bic r3, r3, #0xe000
    orr r3, r3, #0x2000
    str r3, [r4]
    bl func_02001bc8
    ldr r0, [r9, #0x87c]
    cmp r0, #0x0
    bne .L_794
    ldr r0, _LIT14
    ldr r1, _LIT15
    ldr r2, _LIT16
    bl func_02001bc8
.L_794:
    ldr r4, _LIT17
    add r3, sp, #0x1c
    mov r2, #0x8
.L_7a0:
    ldrh r1, [r4]
    ldrh r0, [r4, #0x2]
    add r4, r4, #0x4
    strh r1, [r3]
    strh r0, [r3, #0x2]
    add r3, r3, #0x4
    subs r2, r2, #0x1
    bne .L_7a0
    ldr r1, _LIT18
    mvn r2, #0x0
    ldr r0, [r1]
    str r0, [sp, #0x4]
    str r2, [r1]
    bl func_0208f368
    mov r8, #0x0
    mov r4, #0x20
    mov sl, #0x100
    add r7, sp, #0x3c
    add r6, sp, #0x1c
    mov r5, r8
    mov fp, r4
.L_7f4:
    mov r0, r8, lsl #0x1
    ldrh r1, [r6, r0]
    mov r0, r7
    mov r2, r5
    bl func_02001bc8
    mov r0, r7
    mov r1, r4
    bl func_02092904
    mov r0, r7
    mov r1, sl
    mov r2, fp
    bl func_0208f2f4
    add sl, sl, #0x20
    add r8, r8, #0x1
    cmp r8, #0x8
    blt .L_7f4
    bl func_0208f2a8
    ldr r3, _LIT5
    mov r5, #0x14000
    str r5, [r3, #0x24]
    ldr r4, _LIT18
    ldr r2, [sp, #0x4]
    ldr r0, _LIT19
    mvn r1, #0xf
    str r2, [r4]
    str r5, [r3, #0x28]
    bl func_0208c884
    ldr r0, _LIT20
    mvn r1, #0xf
    bl func_0208c884
    ldr r2, [r9, #0x848]
    mov r0, #0x1
    ldr r1, [r2, #0x70]
    orr r1, r1, #0x2
    str r1, [r2, #0x70]
    ldr r1, [r9, #0x8f4]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r9, #0x8f4]
    add sp, sp, #0x74
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov015_021b5e44
_LIT1: .word data_ov015_021b67c0
_LIT2: .word data_ov015_021b67c4
_LIT3: .word data_ov015_021b67c8
_LIT4: .word data_ov015_021b67cc
_LIT5: .word data_ov015_021b5e28
_LIT6: .word data_ov015_021b5ae8
_LIT7: .word data_02104f4c
_LIT8: .word data_ov015_021b5a8c
_LIT9: .word func_ov015_021b3f80
_LIT10: .word 0x04001048
_LIT11: .word 0x000004e4
_LIT12: .word 0x000024bb
_LIT13: .word 0x05000420
_LIT14: .word 0x050005e0
_LIT15: .word 0x00007fff
_LIT16: .word 0x00000421
_LIT17: .word data_ov015_021b5ac8
_LIT18: .word data_0210249c
_LIT19: .word 0x0400006c
_LIT20: .word 0x0400106c

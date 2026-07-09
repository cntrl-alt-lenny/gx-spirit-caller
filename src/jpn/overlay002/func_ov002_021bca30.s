; func_ov002_021bca30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202b83c
        .extern func_020317e4
        .extern func_ov002_021b3414
        .extern func_ov002_021baf88
        .extern func_ov002_021bc64c
        .extern func_ov002_021bc920
        .extern func_ov002_021c8390
        .extern func_ov002_021c92ec
        .global func_ov002_021bca30
        .arm
func_ov002_021bca30:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    mov sl, r0
    mov r9, r1
    mov r1, #0x0
    ldr r0, _LIT0
    str r2, [sp]
    str r1, [sp, #0x10]
    bl func_ov002_021baf88
    cmp r0, #0x0
    addgt sp, sp, #0x18
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    str r0, [sp, #0xc]
    mov r4, #0x0
.L_4c:
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    str r0, [sp, #0x4]
    add r0, r0, #0x30
    str r0, [sp, #0x8]
    sub r0, r9, #0x4a
    sub r0, r0, #0x1600
    mov r5, #0x0
    str r0, [sp, #0x14]
.L_78:
    ldr r0, [sp, #0x8]
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_224
    ldr r0, [sp, #0x4]
    ldr r1, [r0, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_224
    mov r0, sl
    mov r1, r4
    mov r2, r5
    bl func_ov002_021bc64c
    cmp r0, #0x0
    beq .L_224
    ldr r0, _LIT3
    mov fp, #0x1
    cmp r9, r0
    bgt .L_fc
    cmp r9, r0
    bge .L_180
    ldr r0, [sp, #0x14]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_1f8
    b .L_108
    b .L_108
    b .L_108
    b .L_108
    b .L_108
    b .L_108
.L_fc:
    cmp r9, #0x1a40
    beq .L_1b8
    b .L_1f8
.L_108:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1f8
    ldr r0, [sp, #0xc]
    mov fp, #0x0
    mov r6, #0x5
    add r7, r0, #0x94
    add r8, r0, #0x64
.L_128:
    mov r0, r9
    bl func_020317e4
    ldr r1, [r7]
    mov r1, r1, lsl #0x13
    cmp r0, r1, lsr #0x13
    bne .L_168
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_168
    mov r0, r4
    mov r1, r5
    mov r2, sl
    mov r3, r6
    bl func_ov002_021b3414
    cmp r0, #0x0
    moveq fp, #0x1
.L_168:
    add r7, r7, #0x14
    add r8, r8, #0x14
    add r6, r6, #0x1
    cmp r6, #0xa
    blt .L_128
    b .L_1f8
.L_180:
    cmp r4, sl
    beq .L_198
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_1b0
.L_198:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8390
    cmp r0, #0x7d0
    movge fp, #0x1
    bge .L_1f8
.L_1b0:
    mov fp, #0x0
    b .L_1f8
.L_1b8:
    cmp r4, sl
    beq .L_1d0
    ldr r0, [sp, #0x4]
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_1f4
.L_1d0:
    mov r0, r9
    bl func_0202b83c
    mov r2, r0
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c92ec
    cmp r0, #0x0
    movne fp, #0x1
    bne .L_1f8
.L_1f4:
    mov fp, #0x0
.L_1f8:
    cmp fp, #0x0
    beq .L_224
    mov r0, sl
    mov r1, r9
    mov r2, r4
    mov r3, r5
    bl func_ov002_021bc920
    add r1, r0, #0x1
    ldr r0, [sp, #0x10]
    add r0, r0, r1
    str r0, [sp, #0x10]
.L_224:
    ldr r0, [sp, #0x8]
    add r5, r5, #0x1
    add r0, r0, #0x14
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x4]
    cmp r5, #0x5
    add r0, r0, #0x14
    str r0, [sp, #0x4]
    blt .L_78
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_4c
    ldr r0, [sp, #0x10]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000013f2
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word 0x0000194c

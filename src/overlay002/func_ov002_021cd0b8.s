; func_ov002_021cd0b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_ov002_021b0c04
        .extern func_ov002_021b2be8
        .extern func_ov002_021c9b2c
        .extern func_ov002_021c9b80
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021cd0b8
        .arm
func_ov002_021cd0b8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldrh r0, [r0]
    mov r1, #0x14
    ldr r3, _LIT2
    tst r0, #0x8000
    movne r9, #0x1
    ldr r0, _LIT0
    moveq r9, #0x0
    and fp, r9, #0x1
    ldrh r4, [r0, #0x2]
    mul sl, fp, r2
    mul r6, r4, r1
    add r1, r3, sl
    add r3, r1, #0x30
    ldrh r2, [r0, #0x6]
    ldr r1, [r3, r6]
    add r7, r3, r6
    mov r1, r1, lsl #0x13
    movs r8, r1, lsr #0x13
    and r1, r2, #0x1
    and r3, r2, #0x2
    and r5, r2, #0x4
    and r2, r2, #0x8
    str r2, [sp]
    ldrh r2, [r0, #0x4]
    moveq r1, #0x0
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    streq r1, [r0, #0x80c]
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r0, #0x810]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1e6c
    b .L_1bdc
    b .L_1c34
    b .L_1d2c
    b .L_1e38
.L_1bdc:
    cmp r1, #0x0
    beq .L_1c00
    ldr r4, _LIT3
    mov r1, r9
    mov r2, r8
    mov r0, #0x47
    mov r3, #0x0
    str r8, [r4, #0x24]
    bl func_ov002_0229ade0
.L_1c00:
    cmp r5, #0x0
    beq .L_1c1c
    mov r1, r9
    mov r2, r8
    mov r0, #0x47
    mov r3, #0x1
    bl func_ov002_0229ade0
.L_1c1c:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c34:
    mov r0, #0x47
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r5, #0x0
    beq .L_1c64
    mov r2, #0x1
    mov r0, r9
    mov r1, r4
    mov r3, r2
    bl func_ov002_021c9b80
.L_1c64:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_1c84
    mov r0, r9
    mov r1, r4
    mov r2, #0x2
    mov r3, #0x1
    bl func_ov002_021c9b80
.L_1c84:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1ccc
    ldr r0, [sp, #0x8]
    ldrh r3, [r7, #0x6]
    mov r1, r4, lsl #0x1b
    mov r2, r0, lsl #0x1f
    orr r0, fp, r1, lsr #0x1a
    mov r1, r3, lsl #0x1f
    orr r0, r0, r2, lsr #0x11
    orr r0, r0, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x1a
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0229ade0
    b .L_1d14
.L_1ccc:
    ldrh r1, [r7, #0x8]
    ldr r0, [sp, #0x4]
    ldrh r3, [r7, #0x6]
    cmp r0, #0x0
    mov r0, r4, lsl #0x1b
    rsb r1, r1, #0x1
    mov r1, r1, lsl #0x1f
    orr r0, fp, r0, lsr #0x1a
    moveq r2, #0x1
    mov r3, r3, lsl #0x1f
    orr r0, r0, r1, lsr #0x11
    orr r0, r0, r3, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    movne r2, #0x0
    mov r0, #0x1a
    mov r3, #0x0
    bl func_ov002_0229ade0
.L_1d14:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1d2c:
    mov r0, #0x1a
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp]
    cmp r0, #0x0
    bne .L_1dd0
    ldrh r0, [r7, #0x8]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    strh r0, [r7, #0x8]
    ldrh r0, [r7, #0x8]
    cmp r0, #0x0
    beq .L_1d84
    ldr r0, _LIT4
    ldr r1, [r0, #0xce8]
    add r1, r1, #0x1
    str r1, [r0, #0xce8]
    strh r1, [r7, #0x4]
    b .L_1db4
.L_1d84:
    mov r0, r9
    mov r1, r4
    bl func_ov002_021b2be8
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    cmp r9, r0
    bne .L_1db4
    cmp r4, #0x4
    bgt .L_1db4
    mov r0, #0x1c
    mov r1, #0x1
    bl func_ov002_021b0c04
.L_1db4:
    cmp r4, #0x4
    bgt .L_1dd0
    ldrh r3, [r7, #0x8]
    mov r0, r9
    mov r1, r4
    mov r2, #0x13
    bl func_ov002_021c9b80
.L_1dd0:
    cmp r5, #0x0
    beq .L_1e0c
    mov r0, r8
    bl func_0202b878
    cmp r0, #0x16
    bne .L_1df8
    mov r0, r9
    mov r1, #0x1a
    mov r2, #0x1
    bl func_ov002_021c9b2c
.L_1df8:
    mov r1, r9
    mov r2, r8
    mov r0, #0x43
    mov r3, #0x1
    bl func_ov002_0229ade0
.L_1e0c:
    ldr r1, _LIT6
    ldr r0, _LIT0
    add r2, r1, sl
    ldr r1, [r2, r6]
    add sp, sp, #0xc
    orr r1, r1, #0x100
    str r1, [r2, r6]
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e38:
    mov r0, #0x43
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
.L_1e6c:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cd3f4
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022cd73c
_LIT6: .word data_ov002_022cf1ac

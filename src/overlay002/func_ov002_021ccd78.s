; func_ov002_021ccd78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1ac
        .extern data_ov002_022cf288
        .extern data_ov002_022d016c
        .extern func_ov002_021b0c04
        .extern func_ov002_021b20cc
        .extern func_ov002_021b2be8
        .extern func_ov002_021b9ecc
        .extern func_ov002_021c9b80
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021ccd78
        .arm
func_ov002_021ccd78:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldr r3, _LIT1
    ldrh r0, [r0]
    mov r2, #0x14
    tst r0, #0x8000
    ldr r0, _LIT0
    movne fp, #0x1
    ldrh r1, [r0, #0x2]
    moveq fp, #0x0
    and r5, fp, #0x1
    str r1, [sp, #0x8]
    mul r1, r5, r3
    str r1, [sp]
    ldr r1, [sp, #0x8]
    ldr r3, _LIT2
    mul r2, r1, r2
    ldr r1, [sp]
    str r2, [sp, #0x4]
    add r1, r3, r1
    add r3, r1, #0x30
    mov r1, r2
    ldr r2, [r3, r1]
    ldr r1, [sp, #0x4]
    ldrh r6, [r0, #0x4]
    add r7, r3, r1
    mov r1, r2, lsl #0x13
    mov r1, r1, lsr #0x13
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    ldrh r4, [r0, #0x6]
    moveq r1, #0x0
    addeq sp, sp, #0xc
    streq r1, [r0, #0x80c]
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r0, #0x810]
    cmp r0, #0x0
    beq .L_18a8
    cmp r0, #0x1
    beq .L_18e8
    cmp r0, #0x2
    beq .L_198c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18a8:
    cmp r4, #0x0
    beq .L_18d0
    cmp r6, #0x0
    bne .L_18d0
    ldrh r2, [r7, #0x6]
    mov r1, fp
    mov r0, #0x46
    rsb r2, r2, #0x1
    mov r3, #0x0
    bl func_ov002_0229ade0
.L_18d0:
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_18e8:
    mov r0, #0x46
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r4, #0x0
    cmpne r6, #0x0
    beq .L_191c
    ldr r1, [sp, #0x8]
    mov r0, fp
    mov r2, #0x2
    mov r3, #0x1
    bl func_ov002_021c9b80
.L_191c:
    ldrh r1, [r7, #0x8]
    ldrh r0, [r7, #0x6]
    cmp r4, #0x0
    eor r1, r6, r1
    rsb r3, r0, #0x1
    bne .L_1940
    cmp r6, #0x0
    movne r2, #0x1
    bne .L_1944
.L_1940:
    mov r2, #0x0
.L_1944:
    ldr r0, [sp, #0x8]
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsl #0x1b
    orr r0, r5, r0, lsr #0x1a
    mov r3, r3, lsl #0x1f
    orr r0, r0, r1, lsr #0x11
    orr r0, r0, r3, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x1a
    mov r3, #0x0
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    add sp, sp, #0xc
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_198c:
    mov r0, #0x1a
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [r7, #0x6]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    strh r0, [r7, #0x6]
    ldrh r0, [r7, #0x8]
    eor r0, r6, r0
    strh r0, [r7, #0x8]
    ldrh r0, [r7, #0x8]
    cmp r0, #0x0
    bne .L_19fc
    cmp r6, #0x0
    beq .L_19fc
    ldr r1, [sp, #0x8]
    mov r0, fp
    bl func_ov002_021b2be8
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    cmp fp, r0
    bne .L_19fc
    mov r0, #0x1c
    mov r1, #0x1
    bl func_ov002_021b0c04
.L_19fc:
    ldrh r0, [r7, #0x6]
    cmp r0, #0x0
    beq .L_1a80
    ldr r1, [sp, #0x8]
    mov r0, fp
    bl func_ov002_021b9ecc
    ldr r1, _LIT4
    cmp r0, r1
    bne .L_1a80
    ldr r0, [sp, #0x8]
    and r1, fp, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r8, #0x0
    mov r5, r0, lsr #0x10
    mov r4, #0x1
.L_1a40:
    ldr r1, _LIT1
    ldr r0, _LIT2
    and r2, r8, #0x1
    mla sl, r2, r1, r0
    mov r9, #0x0
.L_1a54:
    ldrh r0, [sl, #0x3a]
    mov r1, r5
    mov r2, r4
    bl func_ov002_021b20cc
    add sl, sl, #0x14
    add r9, r9, #0x1
    cmp r9, #0x4
    ble .L_1a54
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_1a40
.L_1a80:
    ldr r0, _LIT5
    ldr r1, [r0, #0xcf8]
    cmp r1, #0x2
    bne .L_1ab0
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r1, _LIT6
    ldr r0, [r1, r2]
    orr r0, r0, #0x100000
    str r0, [r1, r2]
.L_1ab0:
    cmp r6, #0x0
    beq .L_1aec
    ldrh r3, [r7, #0x8]
    ldr r1, [sp, #0x8]
    mov r0, fp
    mov r2, #0x13
    bl func_ov002_021c9b80
    ldr r1, _LIT7
    ldr r0, [sp]
    add r2, r1, r0
    ldr r0, [sp, #0x4]
    ldr r0, [r2, r0]
    orr r1, r0, #0x100
    ldr r0, [sp, #0x4]
    str r1, [r2, r0]
.L_1aec:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cd73c
_LIT4: .word 0x00001743
_LIT5: .word data_ov002_022d016c
_LIT6: .word data_ov002_022cf288
_LIT7: .word data_ov002_022cf1ac

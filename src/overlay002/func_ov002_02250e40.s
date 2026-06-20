; func_ov002_02250e40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b8a8
        .extern func_0202e234
        .extern func_0202f050
        .extern func_ov002_021c38c4
        .extern func_ov002_0224ae3c
        .extern func_ov002_02253458
        .global func_ov002_02250e40
        .arm
func_ov002_02250e40:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x40
    mov r1, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    str r0, [sp]
    movs r0, r1, lsr #0x10
    str r0, [sp, #0x8]
    mov r4, r2, lsr #0x10
    bne .L_a8
    ldr r0, [sp]
    ldr r1, _LIT0
    ldr r2, _LIT1
    and r3, r0, #0x1
    mla r0, r3, r1, r2
    add r5, r0, #0x120
    ldr r0, [r5, r4, lsl #0x2]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202e234
    cmp r0, #0x0
    addeq sp, sp, #0x40
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r6
    bl func_0202f050
    cmp r0, #0x0
    addeq sp, sp, #0x40
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [r5, r4, lsl #0x2]
    ldr r0, [sp]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c38c4
    cmp r0, #0x4
    addle sp, sp, #0x40
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r0, lsl #0x1
    str r0, [sp, #0x8]
.L_a8:
    mov r1, #0x1
    mov r6, #0x0
    add r0, sp, #0xc
.L_b4:
    str r6, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0xc
    ble .L_b4
    ldr r0, [sp]
    ldr r1, _LIT0
    and r2, r0, #0x1
    mul r0, r2, r1
    ldr r1, _LIT2
    str r0, [sp, #0x4]
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bls .L_154
    ldr r1, _LIT1
    ldr r0, [sp, #0x4]
    add r7, sp, #0xc
    add r5, r1, r0
    add r0, r5, #0x18
    add r4, r0, #0x400
.L_100:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r8, r0, lsr #0x13
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    beq .L_140
    mov r0, r8
    bl func_0202f050
    cmp r0, #0x0
    beq .L_140
    mov r0, r8
    bl func_0202b8a8
    ldr r1, [r7, r0, lsl #0x2]
    add r1, r1, #0x1
    str r1, [r7, r0, lsl #0x2]
.L_140:
    ldr r0, [r5, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r4, r4, #0x4
    bcc .L_100
.L_154:
    mov r7, #0x0
    mov r8, #0x1
    ldr r5, _LIT3
    mov r4, #0xc
    add r9, sp, #0xc
    mov fp, r7
    mov r6, r8
.L_170:
    ldr r0, [r9, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_204
    ldr sl, _LIT3
    mov r2, #0x0
    mov r1, #0xc
.L_188:
    cmp r4, r1
    moveq ip, r8
    movne ip, r7
    cmp r4, r1
    moveq r0, r6
    ldr r3, [r9, r1, lsl #0x2]
    movne r0, fp
    cmp r0, r3
    bge .L_1dc
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
.L_1b4:
    ldr lr, [sl, #0x494]
    add ip, ip, #0x1
    add lr, lr, r2
    mov lr, lr, lsl #0x19
    add lr, r5, lr, lsr #0x18
    add lr, lr, #0x400
    strh r0, [lr, #0x98]
    cmp ip, r3
    add r2, r2, #0x1
    blt .L_1b4
.L_1dc:
    sub r1, r1, #0x1
    cmp r1, #0x1
    bge .L_188
    ldr r1, [sp, #0x8]
    sub r0, r2, #0x1
    sub r1, r1, r4
    bl func_ov002_0224ae3c
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r9, r4, lsl #0x2]
.L_204:
    sub r4, r4, #0x1
    cmp r4, #0x1
    bge .L_170
    ldr r1, _LIT2
    ldr r0, [sp, #0x4]
    mov r6, #0x0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    addls sp, sp, #0x40
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT1
    ldr r0, [sp, #0x4]
    mov r7, #0xe
    add r5, r1, r0
    add r0, r5, #0x18
    add r4, r0, #0x400
    add r8, sp, #0xc
.L_248:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e234
    cmp r0, #0x0
    beq .L_298
    mov r0, r9
    bl func_0202f050
    cmp r0, #0x0
    beq .L_298
    mov r0, r9
    bl func_0202b8a8
    ldr r0, [r8, r0, lsl #0x2]
    cmp r0, #0x0
    beq .L_298
    ldr r0, [sp]
    mov r1, r7
    mov r2, r6
    bl func_ov002_02253458
.L_298:
    ldr r0, [r5, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r4, r4, #0x4
    bcc .L_248
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf180
_LIT3: .word data_ov002_022ce288

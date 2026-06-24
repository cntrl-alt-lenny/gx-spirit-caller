; func_ov002_021f9eb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021deb28
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0223b430
        .extern func_ov002_0223b468
        .extern func_ov002_0223b4c4
        .extern func_ov002_022575c8
        .extern func_ov002_022593a8
        .extern func_ov002_022593f4
        .global func_ov002_021f9eb4
        .arm
func_ov002_021f9eb4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_224
    b .L_34
    b .L_60
    b .L_98
    b .L_e4
    b .L_114
    b .L_1f0
.L_34:
    ldrh r0, [r4, #0x2]
    mov r1, #0x1a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_60:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    bl func_ov002_021e2b3c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_98:
    bl func_ov002_021afb74
    ldr r1, [r0]
    mov r0, #0x0
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    strh r1, [r4, #0x8]
    strh r0, [r4, #0xa]
    strh r0, [r4, #0xc]
    ldrh r0, [r4, #0x2]
    mov r1, #0x12
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e4:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT1
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022593a8
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_114:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_1d8
    ldrh r9, [r4, #0x8]
    ldr r1, _LIT2
    mov r0, r9
    ldr r8, [r1, #0xd70]
    ldr r6, [r1, #0xd74]
    ldr r5, [r1, #0xd78]
    bl func_ov002_0223b468
    mov sl, r0
    cmp sl, #0x0
    mov r7, #0x0
    ble .L_198
    mov fp, #0x1
.L_150:
    ldrh r0, [r4, #0xa]
    tst r0, fp, lsl r7
    bne .L_18c
    mov r0, r9
    mov r1, r7
    bl func_ov002_0223b4c4
    mov r1, r8
    add r2, r6, r5
    bl func_ov002_0223b430
    cmp r0, #0x0
    beq .L_18c
    ldrh r0, [r4, #0xa]
    orr r0, r0, fp, lsl r7
    strh r0, [r4, #0xa]
    b .L_198
.L_18c:
    add r7, r7, #0x1
    cmp r7, sl
    blt .L_150
.L_198:
    mov r0, r8
    add r1, r6, r5
    bl func_ov002_021deb28
    ldrh r1, [r4, #0xc]
    sub r0, sl, #0x1
    add r1, r1, #0x1
    strh r1, [r4, #0xc]
    ldrh r1, [r4, #0xc]
    cmp r1, r0
    blt .L_1d8
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1d8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f0:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021deb28
    bl func_ov002_021e2c5c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_224:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_022575c8
_LIT2: .word data_ov002_022d016c

; func_ov002_0224eb3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf184
        .extern func_0202b890
        .extern func_02030808
        .extern func_02030b84
        .extern func_ov002_021b9128
        .extern func_ov002_021bc8c8
        .extern func_ov002_021ca3f0
        .extern func_ov002_0223b430
        .extern func_ov002_0223b468
        .extern func_ov002_0223b4c4
        .extern func_ov002_02253458
        .global func_ov002_0224eb3c
        .arm
func_ov002_0224eb3c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x48
    mov r9, #0x0
    ldr sl, _LIT0
    mov fp, r0
    str r1, [sp]
    mov r5, r9
    add r4, sp, #0x20
.L_20:
    ldr r0, _LIT1
    and r1, r5, #0x1
    mla r7, r1, r0, sl
    mov r6, #0x0
    and r8, r5, #0xff
.L_34:
    mov r0, fp
    mov r1, r5
    mov r2, r6
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    beq .L_78
    cmp r5, fp
    beq .L_60
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    beq .L_78
.L_60:
    and r0, r6, #0xff
    orr r0, r8, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r4, r9, lsl #0x2]
    add r9, r9, #0x1
.L_78:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x14
    ble .L_34
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_20
    ldr r0, _LIT1
    and r1, fp, #0x1
    mul r2, r1, r0
    mov r0, #0x0
    ldr r1, _LIT2
    str r0, [sp, #0x4]
    ldr r0, [r1, r2]
    cmp r0, #0x0
    addls sp, sp, #0x48
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    add r0, r0, r2
    str r0, [sp, #0x8]
    add r0, r0, #0x3a0
    str r0, [sp, #0xc]
.L_d0:
    ldr r0, [sp, #0xc]
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_02030808
    cmp r0, #0x0
    beq .L_214
    mov r0, r5
    bl func_02030b84
    cmp r0, #0x0
    beq .L_214
    ldr r0, [sp]
    bl func_0202b890
    mov r1, r0
    mov r0, r5
    bl func_ov002_021b9128
    cmp r0, #0x0
    beq .L_214
    mov r0, fp
    mov r1, r5
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    beq .L_214
    mov r0, r5
    bl func_ov002_0223b468
    mov r8, r0
    mov r6, #0x0
    str r6, [sp, #0x10]
    cmp r8, #0x0
    ble .L_16c
    add r4, sp, #0x14
.L_150:
    mov r0, r5
    mov r1, r6
    bl func_ov002_0223b4c4
    str r0, [r4, r6, lsl #0x2]
    add r6, r6, #0x1
    cmp r6, r8
    blt .L_150
.L_16c:
    cmp r9, #0x0
    mov r7, #0x0
    ble .L_1f4
    add r6, sp, #0x14
.L_17c:
    mov sl, #0x0
    cmp r8, #0x0
    ble .L_1e8
    add r0, sp, #0x20
    ldr r0, [r0, r7, lsl #0x2]
    and r5, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r4, r0, #0xff
.L_1a4:
    ldr r0, [r6, sl, lsl #0x2]
    cmp r0, #0x0
    beq .L_1dc
    mov r1, r5
    mov r2, r4
    bl func_ov002_0223b430
    cmp r0, #0x0
    beq .L_1dc
    mov r0, #0x0
    str r0, [r6, sl, lsl #0x2]
    ldr r0, [sp, #0x10]
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    b .L_1e8
.L_1dc:
    add sl, sl, #0x1
    cmp sl, r8
    blt .L_1a4
.L_1e8:
    add r7, r7, #0x1
    cmp r7, r9
    blt .L_17c
.L_1f4:
    ldr r0, [sp, #0x10]
    add r0, r0, #0x1
    cmp r0, r8
    blt .L_214
    ldr r2, [sp, #0x4]
    mov r0, fp
    mov r1, #0xc
    bl func_ov002_02253458
.L_214:
    ldr r0, [sp, #0x8]
    ldr r1, [r0, #0x18]
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, r1
    ldr r0, [sp, #0xc]
    add r0, r0, #0x4
    str r0, [sp, #0xc]
    bcc .L_d0
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf184

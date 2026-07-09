; func_ov002_0228ccb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021afff0
        .extern func_ov002_021be2a4
        .extern func_ov002_0227afa0
        .extern func_ov002_02281494
        .extern func_ov002_0228c474
        .extern func_ov002_0228ca98
        .global func_ov002_0228ccb0
        .arm
func_ov002_0228ccb0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x58
    mov sl, r0
    mov r6, sl, lsl #0x4
    mov r9, r1
    mov r4, #0x0
    mov r8, r2
    mov r2, r4
    mov r3, r6
    add r0, sp, #0x2c
    mov r1, #0x1
.L_244:
    tst r9, r1, lsl r3
    strne r2, [r0, r4, lsl #0x2]
    add r2, r2, #0x1
    addne r4, r4, #0x1
    cmp r2, #0xa
    add r3, r3, #0x1
    ble .L_244
    sub r7, r4, #0x1
    cmp r7, #0x0
    ble .L_294
    add r5, sp, #0x2c
.L_270:
    add r0, r7, #0x1
    bl func_ov002_021afff0
    ldr r2, [r5, r7, lsl #0x2]
    ldr r1, [r5, r0, lsl #0x2]
    str r1, [r5, r7, lsl #0x2]
    sub r7, r7, #0x1
    str r2, [r5, r0, lsl #0x2]
    cmp r7, #0x0
    bgt .L_270
.L_294:
    cmp r4, #0x0
    mov r7, #0x0
    ble .L_300
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, sl, #0x1
    mla r5, r1, r0, r2
.L_2b0:
    add r0, sp, #0x2c
    ldr fp, [r0, r7, lsl #0x2]
    mov r0, #0x14
    mla r1, fp, r0, r5
    ldr r0, [r1, #0x40]
    mov r0, r0, lsr #0x8
    tst r0, #0x1
    beq .L_2f4
    ldr r0, [r1, #0x30]
    mov r1, r8
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_02281494
    cmp r0, #0x0
    addne sp, sp, #0x58
    movne r0, fp
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2f4:
    add r7, r7, #0x1
    cmp r7, r4
    blt .L_2b0
.L_300:
    ldr r0, _LIT2
    ldr r1, [r0, #0xcf8]
    cmp r1, #0x3
    ldreq r0, [r0, #0xcec]
    cmpeq r0, sl
    bne .L_3ac
    mov r5, #0x0
    mov r7, r5
    mov r4, #0x1
.L_324:
    tst r9, r4, lsl r6
    beq .L_344
    mov r0, sl
    mov r1, r7
    mov r2, r4
    bl func_ov002_021be2a4
    cmp r0, #0x0
    orrne r5, r5, r4, lsl r6
.L_344:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r6, r6, #0x1
    ble .L_324
    mov r0, sl
    mov r1, r5
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0228c474
    movs r4, r0
    bmi .L_3ac
    add r2, sp, #0x0
    mov r0, sl
    mov r1, r4
    bl func_ov002_0227afa0
    rsb r1, sl, #0x1
    ldr r0, _LIT1
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT0
    ldr r1, [sp, #0x14]
    ldr r0, [r0, r2]
    cmp r1, r0
    addge sp, sp, #0x58
    movge r0, r4
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3ac:
    mov r2, #0x1
    mov r0, sl
    mov r1, r9
    mov r3, r2
    bl func_ov002_0228c474
    cmp r0, #0x0
    addge sp, sp, #0x58
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    mov r1, r9
    bl func_ov002_0228ca98
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d008c

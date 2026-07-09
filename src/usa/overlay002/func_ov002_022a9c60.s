; func_ov002_022a9c60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee8c
        .extern data_02103fcc
        .extern data_ov002_022cd65c
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d0eb8
        .extern data_ov002_022d19bc
        .extern func_02006178
        .extern func_0207ef74
        .extern func_ov002_022a69c0
        .extern func_ov002_022a6aa0
        .extern func_ov002_022a6cc8
        .extern func_ov002_022a8558
        .extern func_ov002_022ae5dc
        .global func_ov002_022a9c60
        .arm
func_ov002_022a9c60:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x78
    mov sl, r0
    ldr r0, _LIT0
    ldrh r1, [r0]
    cmp r1, #0x0
    beq .L_3b8
    ldr r1, _LIT1
    mov r2, #-2147483648
    str r2, [sp, #0x58]
    strh r1, [sp, #0x5c]
    bl func_ov002_022ae5dc
    cmp r0, #0x0
    beq .L_12c
    mov r1, #0x0
    str r1, [sp]
    ldr r0, _LIT2
    mov r1, sl
    ldr r2, [r0, #0x4]
    add r0, sp, #0x28
    mov r3, #0xd
    bl func_ov002_022a6cc8
    ldr r0, _LIT3
    ldrh r1, [sp, #0x5c]
    ldr r3, [r0, #0x38]
    ldr r4, [sp, #0x2c]
    mov r0, r3, lsl #0x1b
    bic r1, r1, #0xc00
    strh r1, [sp, #0x5c]
    mov r0, r0, lsr #0x10
    mov r1, r3, asr #0x3
    add r1, r3, r1, lsr #0x1c
    mov r0, r0, asr #0x4
    ldrh r2, [sp, #0x5c]
    ldr r5, [sp, #0x28]
    mov r1, r1, asr #0x4
    bic r2, r2, #0xf000
    orr r2, r2, #0x1000
    ldr r3, _LIT4
    mov r0, r0, lsl #0x2
    ldrsh r0, [r3, r0]
    sub r8, r4, #0x20
    ldr r9, [sp, #0x58]
    mov r3, r0, lsl #0x2
    add r3, r8, r3, asr #0xc
    ldr r0, _LIT5
    mov r1, r1, lsl #0x1f
    strh r2, [sp, #0x5c]
    mov r2, r1, lsr #0x15
    sub r1, r5, #0x10
    and r8, r9, r0
    and r3, r3, #0xff
    add r2, r2, #0x3980
    add r7, r2, #0x8000
    mov r2, #0x400
    ldrh r0, [sp, #0x5c]
    orr r3, r8, r3
    mov r1, r1, lsl #0x17
    orr r1, r3, r1, lsr #0x7
    orr r1, r1, #0x2000
    bic r3, r1, #0xc00
    rsb r2, r2, #0x0
    and r1, r0, r2
    mov r6, r7, asr #0x6
    add r0, r7, r6, lsr #0x19
    orr r6, r1, r0, asr #0x7
    ldr r0, _LIT6
    add r1, sp, #0x58
    mov r2, #0x1
    str r5, [sp, #0x50]
    str r4, [sp, #0x54]
    str r3, [sp, #0x58]
    strh r6, [sp, #0x5c]
    bl func_0207ef74
    b .L_3b8
.L_12c:
    ldr r2, [sl, #0x580]
    str sl, [sp, #0x4]
    mov r0, r2, lsr #0x1
    mov r1, r0, lsl #0x1e
    mov r0, r2, lsl #0x1e
    mov r5, r1, lsr #0x15
    mov r6, r0, lsr #0x15
    mov r7, #0x0
.L_14c:
    add r0, sl, #0x500
    ldrh r0, [r0, #0x94]
    mov r0, r0, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    bne .L_190
    bl func_02006178
    cmp r0, #0x0
    beq .L_190
    mov r0, sl
    bl func_ov002_022a8558
    cmp r0, #0x0
    beq .L_190
    add r0, sl, #0x500
    ldrh r0, [r0, #0x94]
    mov r0, r0, lsl #0x1a
    mov fp, r0, lsr #0x1b
    b .L_194
.L_190:
    mvn fp, #0x0
.L_194:
    mov r4, #0x400
    add r0, sl, r7, lsl #0x2
    mov r8, #0x0
    str r0, [sp, #0x8]
    rsb r4, r4, #0x0
.L_1a8:
    ldr r0, [sp, #0x8]
    ldr r1, [r0, #0x588]
    mov r0, #0x1
    tst r1, r0, lsl r8
    cmpne r8, #0xb
    beq .L_260
    mov r0, #0x0
    cmp fp, r8
    moveq r9, r6
    str r0, [sp]
    add r0, sp, #0x20
    mov r1, sl
    mov r2, r7
    mov r3, r8
    movne r9, r5
    bl func_ov002_022a6cc8
    ldr r1, [sp, #0x24]
    ldr r0, [sp, #0x20]
    str r1, [sp, #0x4c]
    sub r1, r1, #0x10
    and r2, r1, #0xff
    str r0, [sp, #0x48]
    sub r0, r0, #0x10
    ldr r3, [sp, #0x58]
    ldr r1, _LIT5
    mov r0, r0, lsl #0x17
    and r1, r3, r1
    orr r1, r1, r2
    orr r0, r1, r0, lsr #0x7
    cmp r8, #0xa
    str r0, [sp, #0x58]
    movlt r1, #0x1
    add r0, r9, #0x3980
    movge r1, #0x0
    add r0, r0, #0x8000
    add r1, r0, r1, lsl #0xb
    mov r0, r1, asr #0x6
    ldrh r2, [sp, #0x5c]
    add r0, r1, r0, lsr #0x19
    and r1, r2, r4
    orr r0, r1, r0, asr #0x7
    strh r0, [sp, #0x5c]
    ldr r0, _LIT6
    add r1, sp, #0x58
    mov r2, #0x1
    bl func_0207ef74
.L_260:
    add r8, r8, #0x1
    cmp r8, #0xf
    blt .L_1a8
    add r0, sl, #0x500
    ldrh r0, [r0, #0x94]
    mov r1, r0, lsl #0x1f
    cmp r7, r1, lsr #0x1f
    moveq r0, r0, lsl #0x1a
    moveq r0, r0, lsr #0x1b
    cmpeq r0, #0xb
    bne .L_2bc
    bl func_02006178
    cmp r0, #0x0
    beq .L_2bc
    mov r0, sl
    bl func_ov002_022a8558
    cmp r0, #0x0
    beq .L_2bc
    add r0, sl, #0x500
    ldrh r0, [r0, #0x94]
    mov r0, r0, lsl #0x12
    mov fp, r0, lsr #0x18
    b .L_2c0
.L_2bc:
    mvn fp, #0x0
.L_2c0:
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x484]
    cmp r0, #0x8
    movge r0, #0x8
    subs r8, r0, #0x1
    bmi .L_3a0
    mov r4, #0x400
    add r0, sl, r7, lsl #0x2
    str r0, [sp, #0xc]
    rsb r4, r4, #0x0
.L_2e8:
    ldr r0, [sp, #0x4]
    add r2, r8, #0x10
    ldr r0, [r0, #0x488]
    add r3, r8, r0
    ldr r0, [sp, #0xc]
    ldr r1, [r0, #0x588]
    mov r0, #0x1
    tst r1, r0, lsl r2
    beq .L_398
    cmp fp, r3
    moveq r9, r6
    str r3, [sp]
    add r0, sp, #0x18
    mov r1, sl
    mov r2, r7
    mov r3, #0xb
    movne r9, r5
    bl func_ov002_022a6cc8
    ldr r1, [sp, #0x1c]
    add r0, r9, #0x3980
    str r1, [sp, #0x44]
    sub r1, r1, #0x10
    add r2, r0, #0x8000
    ldr r0, [sp, #0x18]
    and r9, r1, #0xff
    str r0, [sp, #0x40]
    sub r0, r0, #0x10
    ldr ip, [sp, #0x58]
    ldr r1, _LIT5
    mov r0, r0, lsl #0x17
    and r1, ip, r1
    orr r1, r1, r9
    orr r0, r1, r0, lsr #0x7
    ldrh r3, [sp, #0x5c]
    str r0, [sp, #0x58]
    mov r0, r2, asr #0x6
    add r0, r2, r0, lsr #0x19
    and r1, r3, r4
    orr r0, r1, r0, asr #0x7
    strh r0, [sp, #0x5c]
    ldr r0, _LIT6
    add r1, sp, #0x58
    mov r2, #0x1
    bl func_0207ef74
.L_398:
    subs r8, r8, #0x1
    bpl .L_2e8
.L_3a0:
    ldr r0, [sp, #0x4]
    add r7, r7, #0x1
    add r0, r0, #0xcc
    cmp r7, #0x2
    str r0, [sp, #0x4]
    blt .L_14c
.L_3b8:
    add r2, sl, #0x500
    ldrh r0, [r2, #0x90]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x78
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sl, #0x578]
    tst r0, #0x4
    ldreq r0, [sl, #0x57c]
    cmpeq r0, #0x0
    addne sp, sp, #0x78
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r3, [r2, #0x90]
    add r0, sp, #0x10
    mov r1, sl
    mov r3, r3, lsl #0x12
    mov r3, r3, lsr #0x18
    str r3, [sp]
    ldrh r2, [r2, #0x90]
    mov r3, r2, lsl #0x1a
    mov r4, r2, lsl #0x1f
    mov r2, r4, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6cc8
    ldr r3, [sp, #0x14]
    ldr r4, [sp, #0x10]
    sub r0, r3, #0x10
    sub r1, r4, #0x10
    and r0, r0, #0xff
    mov r2, #0x400
    mov r1, r1, lsl #0x17
    orr r0, r0, #-2147483648
    orr r0, r0, r1, lsr #0x7
    str r0, [sp, #0x38]
    strh r2, [sp, #0x3c]
    add r0, sl, #0x500
    ldrh r0, [r0, #0x90]
    str r4, [sp, #0x30]
    str r3, [sp, #0x34]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x9
    bhi .L_478
    ldrh r1, [sp, #0x3c]
    sub r0, r2, #0x800
    and r0, r1, r0
    orr r0, r0, #0x4
    strh r0, [sp, #0x3c]
.L_478:
    ldr r0, _LIT6
    add r1, sp, #0x38
    mov r2, #0x1
    bl func_0207ef74
    mov r0, sl
    bl func_ov002_022a69c0
    cmp r0, #0x0
    beq .L_4c8
    mov r4, #0x1f
    mov r3, #0x18
    mov r2, #0x1c
    mov r1, #0x3
    mov r0, #0x12
    str r4, [sp, #0x60]
    str r3, [sp, #0x64]
    str r2, [sp, #0x68]
    str r4, [sp, #0x6c]
    str r1, [sp, #0x70]
    str r0, [sp, #0x74]
    b .L_4f0
.L_4c8:
    mov r3, #0x0
    mov r2, #0x1f
    mov r1, #0x1e
    mov r0, #0xe
    str r3, [sp, #0x60]
    str r2, [sp, #0x64]
    str r1, [sp, #0x68]
    str r3, [sp, #0x6c]
    str r0, [sp, #0x70]
    str r2, [sp, #0x74]
.L_4f0:
    ldr r1, _LIT7
    mov r0, #0x0
    ldr r1, [r1, #0xd0]
    cmp r1, #0x0
    bne .L_50c
    mov r0, sl
    bl func_ov002_022a6aa0
.L_50c:
    rsb r2, r0, #0x100
    mov r3, #0x0
    add r1, sp, #0x60
.L_518:
    ldr r0, [r1, r3, lsl #0x2]
    sub r0, r0, #0x1f
    mul r0, r2, r0
    mov r0, r0, asr #0x8
    add r0, r0, #0x1f
    str r0, [r1, r3, lsl #0x2]
    add r3, r3, #0x1
    cmp r3, #0x6
    blt .L_518
    ldr r1, [sp, #0x60]
    ldr r0, [sp, #0x64]
    ldr r4, [sp, #0x68]
    orr r3, r1, r0, lsl #0x5
    ldr r1, [sp, #0x6c]
    ldr r0, [sp, #0x70]
    ldr r2, [sp, #0x74]
    orr r0, r1, r0, lsl #0x5
    ldr r1, _LIT8
    orr r3, r3, r4, lsl #0xa
    strh r3, [r1]
    orr r0, r0, r2, lsl #0xa
    strh r0, [r1, #-2]
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d19bc
_LIT1: .word 0x00003573
_LIT2: .word data_ov002_022cd65c
_LIT3: .word data_02103fcc
_LIT4: .word data_020bee8c
_LIT5: .word 0xfe00ff00
_LIT6: .word data_ov002_022d0eb8
_LIT7: .word data_ov002_022d0e4c
_LIT8: .word 0x0500061e

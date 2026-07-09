; func_ov002_0228d434 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_0202b854
        .extern func_0202b95c
        .extern func_02030538
        .extern func_ov002_021afff0
        .extern func_ov002_021c2e44
        .extern func_ov002_021c3a80
        .extern func_ov002_0227c588
        .extern func_ov002_0227da20
        .extern func_ov002_0228c2c4
        .global func_ov002_0228d434
        .arm
func_ov002_0228d434:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x38
    mov sl, r0
    ldr r0, _LIT0
    and r4, sl, #0x1
    mul r7, r4, r0
    mvn r5, #0x0
    ldr r0, _LIT1
    str r1, [sp]
    ldr r0, [r0, r7]
    str r2, [sp, #0x4]
    str r3, [sp, #0x8]
    str r5, [sp, #0x10]
    str r5, [sp, #0xc]
    mov r6, r5
    mov fp, r5
    cmp r0, #0x0
    mov r4, #0x0
    bls .L_6f4
    ldr r0, _LIT2
    add r9, r0, r7
    rsb r0, r5, #0x1180
    str r0, [sp, #0x24]
    add r0, r5, #0x1980
    str r0, [sp, #0x1c]
    rsb r0, r5, #0x1180
    str r0, [sp, #0x20]
    ldr r0, _LIT3
    add r8, r9, #0x120
    add r0, r0, #0x310
    str r0, [sp, #0x2c]
    ldr r0, _LIT3
    add r0, r0, #0x264
    str r0, [sp, #0x30]
    add r0, r5, #0x1980
    str r0, [sp, #0x18]
    ldr r0, _LIT3
    add r0, r0, #0x310
    str r0, [sp, #0x28]
    ldr r0, _LIT3
    add r0, r0, #0x390
    str r0, [sp, #0x34]
.L_540:
    ldr r3, [sp]
    mov r0, sl
    mov r1, #0xb
    mov r2, r4
    blx r3
    cmp r0, #0x0
    beq .L_6e0
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202b854
    cmp r0, #0x4
    ble .L_5c0
    mov r0, r7
    bl func_02030538
    cmp r0, #0x0
    bne .L_5c0
    cmp r5, #0x0
    blt .L_5bc
    mov r0, r7
    bl func_0202b854
    str r0, [sp, #0x14]
    add r0, r9, r5, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b854
    ldr r1, [sp, #0x14]
    cmp r1, r0
    ble .L_5c0
.L_5bc:
    mov r5, r4
.L_5c0:
    ldr r0, [sp, #0x18]
    cmp r7, r0
    bgt .L_604
    ldr r0, [sp, #0x1c]
    cmp r7, r0
    bge .L_64c
    ldr r0, [sp, #0x20]
    cmp r7, r0
    bgt .L_5f4
    ldr r0, [sp, #0x24]
    cmp r7, r0
    beq .L_63c
    b .L_658
.L_5f4:
    ldr r0, _LIT3
    cmp r7, r0
    beq .L_644
    b .L_658
.L_604:
    ldr r0, [sp, #0x28]
    cmp r7, r0
    bgt .L_62c
    ldr r0, [sp, #0x2c]
    cmp r7, r0
    bge .L_64c
    ldr r0, [sp, #0x30]
    cmp r7, r0
    beq .L_64c
    b .L_658
.L_62c:
    ldr r0, [sp, #0x34]
    cmp r7, r0
    beq .L_64c
    b .L_658
.L_63c:
    str r4, [sp, #0xc]
    b .L_678
.L_644:
    str r4, [sp, #0x10]
    b .L_678
.L_64c:
    add sp, sp, #0x38
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_658:
    ldr r1, [sp, #0x4]
    mov r0, r7
    mov r2, #0x1
    bl func_ov002_0227da20
    cmp r0, #0x0
    addne sp, sp, #0x38
    movne r0, r4
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_678:
    mov r2, r7, lsl #0x10
    mov r0, sl
    mov r1, #0x1
    mov r2, r2, lsr #0x10
    bl func_ov002_0227c588
    cmp r0, #0x0
    bne .L_6c4
    mov r0, r7
    bl func_0202b95c
    cmp r0, #0x3
    bne .L_6c4
    cmp r6, #0x0
    blt .L_6bc
    mov r0, #0x2
    bl func_ov002_021afff0
    cmp r0, #0x0
    beq .L_6e0
.L_6bc:
    mov r6, r4
    b .L_6e0
.L_6c4:
    cmp fp, #0x0
    blt .L_6dc
    mov r0, #0x2
    bl func_ov002_021afff0
    cmp r0, #0x0
    beq .L_6e0
.L_6dc:
    mov fp, r4
.L_6e0:
    add r8, r8, #0x4
    add r4, r4, #0x1
    ldr r0, [r9, #0xc]
    cmp r4, r0
    bcc .L_540
.L_6f4:
    ldr r1, _LIT4
    mov r0, sl
    bl func_ov002_021c3a80
    mvn r1, #0x0
    cmp r0, r1
    bgt .L_750
    ldr r1, _LIT5
    mov r0, sl
    bl func_ov002_021c3a80
    mvn r1, #0x0
    cmp r0, r1
    bgt .L_750
    ldr r1, _LIT6
    mov r0, sl
    bl func_ov002_021c3a80
    mvn r1, #0x0
    cmp r0, r1
    bgt .L_750
    ldr r1, _LIT7
    mov r0, sl
    bl func_ov002_0228c2c4
    cmp r0, #0x0
    beq .L_760
.L_750:
    cmp r5, #0x0
    addge sp, sp, #0x38
    movge r0, r5
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_760:
    ldr r1, _LIT3
    mov r0, sl
    bl func_ov002_021c2e44
    cmp r0, #0x0
    ldrne r0, _LIT8
    ldrne r0, [r0, #0xcf8]
    cmpne r0, #0x5
    beq .L_790
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    addge sp, sp, #0x38
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_790:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    addge sp, sp, #0x38
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r6, #0x0
    addge sp, sp, #0x38
    movge r0, r6
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    mvnne fp, #0x0
    mov r0, fp
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x0000179a
_LIT4: .word 0x000012ea
_LIT5: .word 0x00001366
_LIT6: .word 0x00001a12
_LIT7: .word 0x0000137d
_LIT8: .word data_ov002_022d008c

; func_ov004_021cf2c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_ov004_0220b2a0
        .extern func_02001cec
        .extern func_02004f3c
        .extern func_02005488
        .extern func_0202c06c
        .extern func_0208dd64
        .extern func_02094410
        .extern func_ov004_021c9fc4
        .extern func_ov004_021ce8d8
        .extern func_ov004_021cea8c
        .global func_ov004_021cf2c8
        .arm
func_ov004_021cf2c8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r8, _LIT0
    bl func_ov004_021cea8c
    mov r9, #0x0
    str r0, [sp, #0x8]
    mov sl, #0x3e
    add r4, r8, #0xf90
    mov r6, r9
    mov r7, #0x1
    mov r5, #0x2
    mov fp, #0x2e
.L_5e0:
    ldr r0, [r8, #0x234]
    cmp r0, #0x0
    beq .L_5fc
    ldr r0, [r8, #0x22c]
    cmp r0, r9
    moveq r0, r7
    beq .L_600
.L_5fc:
    mov r0, r6
.L_600:
    mov r1, r5
    mov r2, fp
    mov r3, sl
    str r5, [sp]
    add ip, r0, #0x12
    add r0, r4, #0x5000
    str ip, [sp, #0x4]
    bl func_ov004_021c9fc4
    add r9, r9, #0x1
    cmp r9, #0x4
    add sl, sl, #0x1a
    blt .L_5e0
    ldr r0, [r8, #0x54]
    cmp r0, #0x4
    beq .L_740
    ldr r0, [r8, #0x60]
    cmp r0, #0x0
    bne .L_6c4
    ldr r1, [r8, #0x22c]
    ldr r0, [r8, #0x224]
    cmp r1, #0x3
    movge r1, #0x3
    cmp r0, #0x0
    beq .L_698
    bics r0, r0, #0x1b
    beq .L_6c4
    mov r0, #0x1a
    mul r2, r1, r0
    add r0, r8, #0xf90
    mov r1, #0x2
    str r1, [sp]
    mov r4, #0x16
    add r0, r0, #0x5000
    add r3, r2, #0x3e
    mov r2, #0xe
    str r4, [sp, #0x4]
    bl func_ov004_021c9fc4
    b .L_6c4
.L_698:
    mov r0, #0x1a
    mul r2, r1, r0
    add r0, r8, #0xf90
    mov r1, #0x2
    str r1, [sp]
    mov r4, #0x18
    add r0, r0, #0x5000
    add r3, r2, #0x40
    mov r2, #0xe
    str r4, [sp, #0x4]
    bl func_ov004_021c9fc4
.L_6c4:
    ldr r1, [r8, #0x230]
    ldr r0, [r8, #0x228]
    cmp r1, #0x3
    movge r1, #0x3
    cmp r0, #0x0
    beq .L_714
    bics r0, r0, #0x1b
    beq .L_740
    mov r0, #0x1a
    mul r2, r1, r0
    add r0, r8, #0xf90
    mov r1, #0x2
    str r1, [sp]
    mov r4, #0x17
    add r0, r0, #0x5000
    add r3, r2, #0x3e
    mov r2, #0xd2
    str r4, [sp, #0x4]
    bl func_ov004_021c9fc4
    b .L_740
.L_714:
    mov r0, #0x1a
    mul r2, r1, r0
    add r0, r8, #0xf90
    mov r1, #0x2
    str r1, [sp]
    mov r4, #0x19
    add r0, r0, #0x5000
    add r3, r2, #0x40
    mov r2, #0xd7
    str r4, [sp, #0x4]
    bl func_ov004_021c9fc4
.L_740:
    mov r1, #0x2
    ldr r0, [sp, #0x8]
    str r1, [sp]
    add r2, r8, #0xf90
    str r0, [sp, #0x4]
    add r0, r2, #0x5000
    mov r2, #0xe4
    mov r3, #0x3
    bl func_ov004_021c9fc4
    bl func_ov004_021ce8d8
    ldr r1, [r8, #0x238]
    cmp r1, r0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov004_021ce8d8
    str r0, [r8, #0x238]
    ldr r0, _LIT1
    mov r1, #0x14
    mov r2, #0xc
    bl func_02001cec
    bl func_0208dd64
    add r4, r0, #0xe20
    add r1, r4, #0x2680
    mov r0, #0x0
    mov r2, #0x780
    bl func_02094410
    ldr r0, [r8, #0x238]
    add r0, r0, #0xe5
    bl func_0202c06c
    mov r1, #0xc
    mov r5, r0
    bl func_02005488
    rsb r0, r0, #0xa0
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    cmp r3, #0x0
    movle r3, #0x0
    mov r2, #0x51
    mov r1, r5
    str r2, [sp]
    mov r5, #0xc
    ldr r0, _LIT1
    add r2, r4, #0x1000
    add r3, r3, #0x1
    str r5, [sp, #0x4]
    bl func_02004f3c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_02102bb0

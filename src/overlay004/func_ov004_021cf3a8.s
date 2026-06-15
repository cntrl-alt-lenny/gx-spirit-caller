; func_ov004_021cf3a8 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_ov004_0220b500
        .extern func_02001d0c
        .extern func_02004f58
        .extern func_020054a4
        .extern func_0202c0c0
        .extern func_0208de4c
        .extern func_02094504
        .extern func_ov004_021ca0a4
        .extern func_ov004_021ce9b8
        .extern func_ov004_021ceb6c
        .global func_ov004_021cf3a8
        .arm
func_ov004_021cf3a8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r8, _LIT0
    bl func_ov004_021ceb6c
    mov r9, #0x0
    str r0, [sp, #0x8]
    mov sl, #0x3e
    add r4, r8, #0xf90
    mov r6, r9
    mov r7, #0x1
    mov r5, #0x2
    mov fp, #0x2e
.L_660:
    ldr r0, [r8, #0x234]
    cmp r0, #0x0
    beq .L_67c
    ldr r0, [r8, #0x22c]
    cmp r0, r9
    moveq r0, r7
    beq .L_680
.L_67c:
    mov r0, r6
.L_680:
    mov r1, r5
    mov r2, fp
    mov r3, sl
    str r5, [sp]
    add ip, r0, #0x12
    add r0, r4, #0x5000
    str ip, [sp, #0x4]
    bl func_ov004_021ca0a4
    add r9, r9, #0x1
    cmp r9, #0x4
    add sl, sl, #0x1a
    blt .L_660
    ldr r0, [r8, #0x54]
    cmp r0, #0x4
    beq .L_7c0
    ldr r0, [r8, #0x60]
    cmp r0, #0x0
    bne .L_744
    ldr r1, [r8, #0x22c]
    ldr r0, [r8, #0x224]
    cmp r1, #0x3
    movge r1, #0x3
    cmp r0, #0x0
    beq .L_718
    bics r0, r0, #0x1b
    beq .L_744
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
    bl func_ov004_021ca0a4
    b .L_744
.L_718:
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
    bl func_ov004_021ca0a4
.L_744:
    ldr r1, [r8, #0x230]
    ldr r0, [r8, #0x228]
    cmp r1, #0x3
    movge r1, #0x3
    cmp r0, #0x0
    beq .L_794
    bics r0, r0, #0x1b
    beq .L_7c0
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
    bl func_ov004_021ca0a4
    b .L_7c0
.L_794:
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
    bl func_ov004_021ca0a4
.L_7c0:
    mov r1, #0x2
    ldr r0, [sp, #0x8]
    str r1, [sp]
    add r2, r8, #0xf90
    str r0, [sp, #0x4]
    add r0, r2, #0x5000
    mov r2, #0xe4
    mov r3, #0x3
    bl func_ov004_021ca0a4
    bl func_ov004_021ce9b8
    ldr r1, [r8, #0x238]
    cmp r1, r0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov004_021ce9b8
    str r0, [r8, #0x238]
    ldr r0, _LIT1
    mov r1, #0x14
    mov r2, #0xc
    bl func_02001d0c
    bl func_0208de4c
    add r4, r0, #0xe20
    add r1, r4, #0x2680
    mov r0, #0x0
    mov r2, #0x780
    bl func_02094504
    ldr r0, [r8, #0x238]
    add r0, r0, #0xe5
    bl func_0202c0c0
    mov r1, #0xc
    mov r5, r0
    bl func_020054a4
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
    bl func_02004f58
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_02102c90

; func_ov004_021d3578 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_02102c90
        .extern data_021040ac
        .extern data_02104dac
        .extern data_02104f4c
        .extern data_021a18b8
        .extern data_021a1974
        .extern data_ov004_02200de8
        .extern data_ov004_02200e00
        .extern data_ov004_0220b500
        .extern data_ov004_02211548
        .extern data_ov004_022915e8
        .extern func_02001d0c
        .extern func_0201d530
        .extern func_0202b100
        .extern func_0202ba94
        .extern func_0202c0c0
        .extern func_02037208
        .extern func_020822a0
        .extern func_020822c8
        .extern func_020822f0
        .extern func_02084aec
        .extern func_02084fe0
        .extern func_0208b16c
        .extern func_0208e318
        .extern func_02091554
        .extern func_02094588
        .extern func_ov004_021d0168
        .extern func_ov004_021d02f4
        .extern func_ov004_021d03ec
        .extern func_ov004_021d8798
        .extern func_ov004_021d8d58
        .extern func_ov004_021d9134
        .global func_ov004_021d3578
        .arm
func_ov004_021d3578:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x140
    ldr r4, _LIT0
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r2, [r4, #0x5c]
    ldrh r6, [r0, #0x60]
    cmp r2, #0x0
    ldr r5, [r1, #0xd54]
    addne sp, sp, #0x140
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [r4]
    cmp r1, #0x40
    blt .L_70
    ldr r0, _LIT3
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_70
    mov r0, #0x0
    mov r1, #0x1
    add sp, sp, #0x140
    str r0, [r4, #0x48]
    str r1, [r4, #0x54]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_70:
    cmp r1, #0x20
    bge .L_84
    subs r7, r1, #0x14
    movmi r7, #0x0
    b .L_90
.L_84:
    mov r0, r6
    mov r7, #0xc
    bl func_ov004_021d0168
.L_90:
    ldr r0, [r4]
    cmp r0, #0x20
    bne .L_150
    ldr r0, _LIT4
    mov r1, #0x1a
    mov r2, #0x7
    bl func_02001d0c
    mov r0, #0x6
    bl func_0201d530
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, #0xd8
    beq .L_f4
    bl func_0202c0c0
    mov r8, r0
    mov r0, r6
    bl func_0202b100
    mov r3, r0
    mov r1, r8
    add r0, sp, #0x40
    mov r2, r5
    bl func_02091554
    b .L_118
.L_f4:
    bl func_0202c0c0
    mov r8, r0
    mov r0, r6
    bl func_0202b100
    mov r2, r0
    mov r1, r8
    add r0, sp, #0x40
    mov r3, r5
    bl func_02091554
.L_118:
    ldr r0, _LIT3
    add r1, sp, #0x40
    mov r2, #0x2
    bl func_ov004_021d8798
    mov r0, r6
    mov r1, r5
    bl func_0202ba94
    mov r0, #0x5f
    ldr r3, _LIT2
    mov r2, #0x0
    str r2, [r3, #0xd54]
    sub r1, r0, #0x60
    mov r3, #0x1
    bl func_02037208
.L_150:
    bl func_ov004_021d02f4
    ldr r0, _LIT3
    bl func_ov004_021d8d58
    ldr r0, _LIT3
    bl func_ov004_021d9134
    ldr r0, [r4]
    subs r0, r0, #0x20
    rsbmi r0, r0, #0x0
    cmp r0, #0x20
    movgt r0, #0x20
    mov r0, r0, lsl #0x9
    mov r1, r0, asr #0x4
    ldr r0, _LIT6
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    bl func_ov004_021d03ec
    ldr r0, _LIT7
    add r3, sp, #0x34
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r5, _LIT8
    add r3, sp, #0x28
    ldmia r5, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    add r0, sp, #0x4
    bl func_0208b16c
    ldr r1, _LIT9
    add r0, sp, #0x4
    bl func_02094588
    ldr r1, _LIT10
    add r0, sp, #0x34
    ldr r2, [r1, #0xfc]
    bic r2, r2, #0xa4
    str r2, [r1, #0xfc]
    bl func_020822a0
    add r0, sp, #0x28
    bl func_020822c8
    bl func_020822f0
    ldr r0, _LIT11
    bl func_02084aec
    ldr r0, [r4]
    add r0, r0, #0x1
    str r0, [r4]
    bl func_020822f0
    bl func_02084fe0
    ldr r0, _LIT12
    mov r2, #0x0
    str r2, [r0]
    str r2, [sp]
    mov r1, #0x1
    sub r0, r0, #0x4f0
    mov r2, #0x3f
    mov r3, #0x10
    bl func_0208e318
    ldr r0, _LIT13
    rsb r2, r7, #0xc
    and r0, r0, r2, lsl #0x12
    ldr r1, _LIT14
    mov r3, r7
    str r0, [r1]
    add r0, r1, #0x38
    rsb r1, r7, #0x10
    str r1, [sp]
    mov r1, #0x4
    mov r2, #0x3f
    bl func_0208e318
    mov r0, #0x0
    add sp, sp, #0x140
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_02104dac
_LIT2: .word data_021040ac
_LIT3: .word data_ov004_022915e8
_LIT4: .word data_02102c90
_LIT5: .word data_02104f4c
_LIT6: .word data_020bef80
_LIT7: .word data_ov004_02200e00+0x18
_LIT8: .word data_ov004_02200de8
_LIT9: .word data_021a1974
_LIT10: .word data_021a18b8
_LIT11: .word data_ov004_02211548
_LIT12: .word 0x04000540
_LIT13: .word 0x01ff0000
_LIT14: .word 0x04001018

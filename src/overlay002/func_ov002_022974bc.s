; func_ov002_022974bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_0202e234
        .extern func_ov002_021afb90
        .extern func_ov002_021afbc4
        .extern func_ov002_021afbd4
        .extern func_ov002_021bbd14
        .extern func_ov002_021bbf50
        .extern func_ov002_021bc1d0
        .extern func_ov002_021bcf18
        .extern func_ov002_021c325c
        .extern func_ov002_021c3ae4
        .extern func_ov002_0225368c
        .extern func_ov002_022536e8
        .extern func_ov002_02259774
        .extern func_ov002_02259ee8
        .extern func_ov002_0226f4dc
        .extern func_ov002_0227da08
        .extern func_ov002_022812ac
        .global func_ov002_022974bc
        .arm
func_ov002_022974bc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x44
    mov sl, r0
    ldr r2, _LIT0
    and r0, sl, #0x1
    mul r3, r0, r2
    ldr r0, _LIT1
    str r1, [sp]
    ldr r0, [r0, r3]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_708
    rsb r8, sl, #0x1
    and r0, r8, #0x1
    mul r4, r0, r2
    ldr r0, _LIT2
    add fp, r2, #0xd10
    add r9, r0, r3
    add r0, r2, #0x350
    str r0, [sp, #0x40]
    add r0, r2, #0xc20
    str r0, [sp, #0x20]
    add r0, r2, #0xd10
    str r0, [sp, #0x4]
    add r0, r2, #0xc20
    str r0, [sp, #0x1c]
    ldr r0, _LIT3
    add r7, r9, #0x120
    sub r0, r0, #0x2ac
    str r0, [sp, #0x24]
    ldr r0, _LIT4
    sub r0, r0, #0x26
    str r0, [sp, #0x18]
    ldr r0, _LIT4
    sub r0, r0, #0x27
    str r0, [sp, #0x14]
    ldr r0, _LIT4
    sub r0, r0, #0x28
    str r0, [sp, #0x10]
    ldr r0, _LIT3
    add r0, r0, #0xbe
    str r0, [sp, #0x2c]
    ldr r0, _LIT3
    add r0, r0, #0x9e
    str r0, [sp, #0x30]
    ldr r0, _LIT4
    add r0, r0, #0x700
    str r0, [sp, #0x38]
    ldr r0, _LIT3
    add r0, r0, #0xbe
    str r0, [sp, #0x28]
    ldr r0, _LIT4
    add r0, r0, #0x700
    str r0, [sp, #0x34]
    ldr r0, _LIT3
    add r0, r0, #0x29c
    str r0, [sp, #0x3c]
    ldr r0, _LIT4
    sub r0, r0, #0x28
    str r0, [sp, #0xc]
    ldr r0, _LIT4
    sub r0, r0, #0x26
    str r0, [sp, #0x8]
.L_460:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202e234
    cmp r0, #0x0
    beq .L_6f4
    cmp r6, fp
    mov r0, #0x1
    bgt .L_508
    ldr r1, [sp, #0x4]
    cmp r6, r1
    bge .L_57c
    ldr r1, _LIT4
    cmp r6, r1
    bgt .L_4dc
    bge .L_5f8
    ldr r1, [sp, #0x8]
    cmp r6, r1
    bgt .L_688
    ldr r1, [sp, #0xc]
    cmp r6, r1
    blt .L_688
    ldr r1, [sp, #0x10]
    cmp r6, r1
    ldrne r1, [sp, #0x14]
    cmpne r6, r1
    ldrne r1, [sp, #0x18]
    cmpne r6, r1
    beq .L_5f8
    b .L_688
.L_4dc:
    ldr r1, [sp, #0x1c]
    cmp r6, r1
    bgt .L_4f8
    ldr r1, [sp, #0x20]
    cmp r6, r1
    beq .L_5e0
    b .L_688
.L_4f8:
    ldr r1, [sp, #0x24]
    cmp r6, r1
    beq .L_5f8
    b .L_688
.L_508:
    ldr r1, [sp, #0x28]
    cmp r6, r1
    bgt .L_530
    ldr r1, [sp, #0x2c]
    cmp r6, r1
    bge .L_55c
    ldr r1, [sp, #0x30]
    cmp r6, r1
    beq .L_63c
    b .L_688
.L_530:
    ldr r1, [sp, #0x34]
    cmp r6, r1
    bgt .L_54c
    ldr r1, [sp, #0x38]
    cmp r6, r1
    beq .L_658
    b .L_688
.L_54c:
    ldr r1, [sp, #0x3c]
    cmp r6, r1
    beq .L_674
    b .L_688
.L_55c:
    mov r1, r6
    mov r0, sl
    mov r2, #0x0
    bl func_ov002_022536e8
    cmp r0, #0x4
    movge r0, #0x1
    movlt r0, #0x0
    b .L_688
.L_57c:
    ldr r0, _LIT2
    ldr r0, [r0, r4]
    cmp r0, #0x3e8
    ble .L_5d0
    mov r1, #0x0
    mov r0, sl
    mov r2, #0x1
    mov r3, r1
    bl func_ov002_021bcf18
    cmp r0, #0x0
    bgt .L_5d0
    mov r0, sl
    mov r1, r8
    bl func_ov002_022812ac
    ldr r1, [sp, #0x40]
    cmp r0, r1
    blt .L_5d8
    mov r0, sl
    bl func_ov002_021bbf50
    cmp r0, #0x0
    bne .L_5d8
.L_5d0:
    mov r0, #0x1
    b .L_688
.L_5d8:
    mov r0, #0x0
    b .L_688
.L_5e0:
    mov r0, r8
    bl func_ov002_021c325c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_688
.L_5f8:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_634
    ldr r3, [r7]
    mov r0, sl
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    mov r2, #0x1
    add r1, r3, r1, lsr #0x1f
    bl func_ov002_0227da08
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_688
.L_634:
    mov r0, #0x0
    b .L_688
.L_63c:
    ldr r1, _LIT3
    mov r0, sl
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_688
.L_658:
    mov r1, r6
    mov r0, sl
    bl func_ov002_021bbd14
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    b .L_688
.L_674:
    mov r0, sl
    bl func_ov002_021bbf50
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
.L_688:
    cmp r0, #0x0
    beq .L_6f4
    mov r0, sl
    ldr r1, [r7]
    mov r2, r1, lsl #0x12
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_0226f4dc
    cmp r0, #0x0
    beq .L_6f4
    ldr r4, _LIT5
    mov r0, sl
    mov r2, r5
    mov r1, #0xb
    mov r3, #0x2
    str sl, [r4, #0xd6c]
    bl func_ov002_02259774
    mov r2, r4
    mov r0, #0x1
    str r0, [r2, #0xd54]
    ldr r1, _LIT6
    mov r2, #0x0
    str r2, [r1, #0x1cc]
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_6f4:
    add r7, r7, #0x4
    add r5, r5, #0x1
    ldr r0, [r9, #0xc]
    cmp r5, r0
    bcc .L_460
.L_708:
    ldr r1, _LIT7
    mov r0, sl
    mov r2, #0xc
    bl func_ov002_0225368c
    cmp r0, #0x0
    beq .L_834
    mov r9, #0x0
    bl func_ov002_021afbc4
    cmp r0, #0x0
    ble .L_834
    ldr fp, _LIT8
    rsb r8, sl, #0x1
    add r4, fp, #0x1
    sub r5, fp, #0x48
    mov r6, #0x1
.L_744:
    mov r0, r9
    bl func_ov002_021afbd4
    mov r7, r0
    cmp r7, r5
    mov r0, r6
    beq .L_770
    cmp r7, fp
    beq .L_794
    cmp r7, r4
    beq .L_7b8
    b .L_7d0
.L_770:
    mov r0, r8
    mov r1, r6
    mov r2, #0x0
    mov r3, r6
    bl func_ov002_021bcf18
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    b .L_7d0
.L_794:
    mov r0, r8
    mov r1, #0x0
    mov r2, r6
    mov r3, r6
    bl func_ov002_021bcf18
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    b .L_7d0
.L_7b8:
    mov r0, r8
    mov r1, #0x0
    bl func_ov002_021bc1d0
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
.L_7d0:
    cmp r0, #0x0
    beq .L_824
    mov r0, r9
    bl func_ov002_021afb90
    mov r4, r0
    mov r0, r9
    bl func_ov002_021afb90
    ldr r0, [r0]
    ldr r1, [r4]
    mov r0, r0, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    add r3, r1, r3, lsr #0x1f
    mov r0, sl
    mov r2, r7
    mov r1, #0xc
    bl func_ov002_02259ee8
    add sp, sp, #0x44
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_824:
    add r9, r9, #0x1
    bl func_ov002_021afbc4
    cmp r9, r0
    blt .L_744
.L_834:
    mov r0, #0x0
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x000017f6
_LIT4: .word 0x000012a5
_LIT5: .word data_ov002_022d016c
_LIT6: .word data_ov002_022cd524
_LIT7: .word 0x0000fffe
_LIT8: .word 0x000015f9

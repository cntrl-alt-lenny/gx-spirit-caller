; func_ov002_022aa1fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_ov002_022cd65c
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d0eb8
        .extern func_0207ef74
        .extern func_ov002_021ca618
        .global func_ov002_022aa1fc
        .arm
func_ov002_022aa1fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    ldr r0, _LIT0
    ldr r0, [r0, #0xbb0]
    cmp r0, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT1
    ldr r2, _LIT2
    ldr r0, [r0, #0x4]
    mov r3, #-2147483648
    mov r0, r0, lsl #0x1b
    mov r5, r0, lsr #0x1e
    mov r1, r5, lsr #0x1f
    rsb r0, r1, r5, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    moveq r0, #0xe0
    str r3, [sp, #0x8]
    strh r2, [sp, #0xc]
    streq r0, [sp, #0x4]
    moveq r4, #0x9
    beq .L_600
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r4, #0x2
.L_600:
    ldr r3, _LIT0
    add r0, r5, r5, lsr #0x1f
    ldr r7, [r3, #0xbb4]
    ldr r2, _LIT3
    mov r1, r0, asr #0x1
    smull r0, r5, r2, r7
    mov r0, r1, lsl #0x4
    rsb r0, r0, #0x28
    add r5, r7, r5
    mov r1, r7, lsr #0x1f
    cmp r7, #0x0
    str r0, [sp]
    add r5, r1, r5, asr #0x5
    ble .L_644
    ldr r0, [r3, #0xb88]
    cmp r0, #0x2
    bne .L_65c
.L_644:
    mvn r0, #0x0
    str r0, [sp, #0x1c]
    str r0, [sp, #0x18]
    str r0, [sp, #0x14]
    str r0, [sp, #0x10]
    b .L_70c
.L_65c:
    smull r0, r6, r2, r5
    add r6, r5, r6
    mov r0, r5, lsr #0x1f
    add r6, r0, r6, asr #0x5
    ldr r2, _LIT4
    mov r0, r6, lsr #0x1f
    smull r1, r3, r2, r6
    adds r3, r0, r3, asr #0x2
    str r3, [sp, #0x10]
    ldr r3, _LIT3
    mvneq r0, #0x0
    smull r1, r2, r3, r5
    streq r0, [sp, #0x10]
    add r2, r5, r2
    mov r1, r5, lsr #0x1f
    add r2, r1, r2, asr #0x5
    mov r3, #0x3c
    smull r1, r2, r3, r2
    sub r2, r5, r1
    ldr r0, _LIT4
    cmp r5, #0x3c
    smull r1, r3, r0, r6
    smull r9, r1, r0, r2
    smull r5, r9, r0, r2
    mov r8, r2, lsr #0x1f
    mov r7, r6, lsr #0x1f
    add r9, r8, r9, asr #0x2
    add r3, r7, r3, asr #0x2
    mov r5, #0xa
    smull r0, r3, r5, r3
    sub r3, r6, r0
    add r1, r8, r1, asr #0x2
    smull r0, r1, r5, r1
    sub r1, r2, r0
    str r9, [sp, #0x18]
    str r3, [sp, #0x14]
    str r1, [sp, #0x1c]
    bge .L_708
    ldr r0, _LIT0
    ldr r0, [r0, #0x38]
    tst r0, #0x8
    movne r6, #0x1
    bne .L_70c
.L_708:
    mov r6, #0x0
.L_70c:
    ldrh r1, [sp, #0xc]
    ldr r2, [sp, #0x8]
    ldr r0, _LIT5
    bic r1, r1, #0xf000
    and r2, r2, r0
    add r0, r6, #0xd
    orr r1, r1, r0, lsl #0xc
    ldr r0, [sp, #0x4]
    bic r2, r2, #0xc00
    add sl, r0, r4
    ldr r0, [sp]
    mov r5, #0x400
    add r0, r0, #0xb
    ldr r4, _LIT6
    mov r8, sl
    str r2, [sp, #0x8]
    strh r1, [sp, #0xc]
    and r9, r0, #0xff
    mov r7, #0x0
    rsb r5, r5, #0x0
    mov fp, #0x1
    add r6, sp, #0x10
.L_764:
    ldr r0, [r6, r7, lsl #0x2]
    cmp r0, #0x0
    blt .L_7cc
    mov r0, r0, lsl #0x7
    add r0, r0, #0x980
    add r1, r0, #0x8000
    mov r0, r1, asr #0x6
    ldrh r2, [sp, #0xc]
    add r0, r1, r0, lsr #0x19
    cmp r7, #0x2
    and r1, r2, r5
    orr r0, r1, r0, asr #0x7
    strh r0, [sp, #0xc]
    movge r0, fp
    ldr r1, [sp, #0x8]
    movlt r0, #0x0
    add r0, r8, r0, lsl #0x1
    and r1, r1, r4
    mov r2, r0, lsl #0x17
    orr r1, r1, r9
    orr r1, r1, r2, lsr #0x7
    str r1, [sp, #0x8]
    ldr r0, _LIT7
    add r1, sp, #0x8
    mov r2, #0x1
    bl func_0207ef74
.L_7cc:
    add r8, r8, #0x5
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_764
    ldr r0, _LIT8
    ldr r1, _LIT3
    ldr r2, [r0, #0xdc]
    ldr r6, _LIT9
    cmp r2, #0x0
    movlt r2, #0x0
    smull r0, r5, r1, r2
    add r5, r2, r5
    mov r0, r2, lsr #0x1f
    add r5, r0, r5, asr #0x5
    smull r0, r3, r1, r5
    smull r0, r4, r1, r5
    mvn r1, #0x0
    mov r0, r5, lsr #0x1f
    add r4, r5, r4
    add r3, r5, r3
    ldr r2, _LIT4
    add r4, r0, r4, asr #0x5
    add r3, r0, r3, asr #0x5
    str r1, [sp, #0x10]
    ldr r0, [r6, #0x4]
    smull r1, r6, r2, r4
    mov r1, r4, lsr #0x1f
    add r6, r1, r6, asr #0x2
    mov r1, #0xa
    smull r6, r7, r1, r6
    sub r6, r4, r6
    str r6, [sp, #0x14]
    mov r6, #0x3c
    smull r3, r4, r6, r3
    sub r3, r5, r3
    smull r4, r7, r2, r3
    smull r4, r6, r2, r3
    mov r2, r3, lsr #0x1f
    add r7, r2, r7, asr #0x2
    add r6, r2, r6, asr #0x2
    smull r2, r4, r1, r6
    sub r6, r3, r2
    str r6, [sp, #0x1c]
    str r7, [sp, #0x18]
    mov r6, #0x0
    bl func_ov002_021ca618
    cmp r0, #0x0
    beq .L_8b0
    ldr r0, _LIT0
    cmp r5, #0x3c
    movlt r1, #0x8
    ldr r0, [r0, #0x38]
    movge r1, #0x20
    and r0, r0, r1
    cmp r0, #0x0
    movgt r6, #0x1
    movle r6, #0x0
.L_8b0:
    ldrh r1, [sp, #0xc]
    ldr r2, [sp, #0x8]
    ldr r0, _LIT5
    bic r1, r1, #0xf000
    and r2, r2, r0
    add r0, r6, #0xd
    orr r1, r1, r0, lsl #0xc
    ldr r0, [sp]
    bic r2, r2, #0xc00
    add r0, r0, #0x16
    mov r9, #0x0
    mov r5, #0x400
    ldr r4, _LIT6
    str r2, [sp, #0x8]
    strh r1, [sp, #0xc]
    and r8, r0, #0xff
    rsb r5, r5, #0x0
    mov fp, r9
    mov r6, #0x1
    add r7, sp, #0x10
.L_900:
    ldr r0, [r7, r9, lsl #0x2]
    cmp r0, #0x0
    blt .L_968
    mov r0, r0, lsl #0x7
    add r0, r0, #0x980
    add r1, r0, #0x8000
    mov r0, r1, asr #0x6
    ldrh r2, [sp, #0xc]
    add r0, r1, r0, lsr #0x19
    cmp r9, #0x2
    and r1, r2, r5
    orr r0, r1, r0, asr #0x7
    strh r0, [sp, #0xc]
    movge r0, r6
    ldr r1, [sp, #0x8]
    movlt r0, fp
    add r0, sl, r0, lsl #0x1
    and r1, r1, r4
    mov r2, r0, lsl #0x17
    orr r1, r1, r8
    orr r1, r1, r2, lsr #0x7
    str r1, [sp, #0x8]
    ldr r0, _LIT7
    add r1, sp, #0x8
    mov r2, #0x1
    bl func_0207ef74
.L_968:
    add r9, r9, #0x1
    cmp r9, #0x4
    add sl, sl, #0x5
    blt .L_900
    ldrh r1, [sp, #0xc]
    mov r0, #0x400
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0xf
    orr r0, r0, #0x100
    strh r0, [sp, #0xc]
    ldrh r1, [sp, #0xc]
    ldr r2, [sp, #0x8]
    ldr r0, _LIT6
    bic r1, r1, #0xf000
    and r2, r2, r0
    orr r3, r1, #0xc000
    ldr r0, [sp]
    strh r3, [sp, #0xc]
    and r1, r0, #0xff
    ldr r0, [sp, #0x4]
    orr r1, r2, r1
    mov r4, r0, lsl #0x17
    ldr r0, _LIT5
    orr r1, r1, r4, lsr #0x7
    and r0, r1, r0
    orr r0, r0, #-2147483648
    bic r4, r0, #0xc00
    ldr r0, _LIT7
    add r1, sp, #0x8
    mov r2, #0x1
    str r4, [sp, #0x8]
    bl func_0207ef74
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_02104e6c
_LIT2: .word 0x0000c10f
_LIT3: .word 0x88888889
_LIT4: .word 0x66666667
_LIT5: .word 0x3fff3fff
_LIT6: .word 0xfe00ff00
_LIT7: .word data_ov002_022d0eb8
_LIT8: .word data_ov002_022d0e4c
_LIT9: .word data_ov002_022cd65c

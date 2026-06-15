; func_020409d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_020fe73c
        .extern data_020fe744
        .extern data_020fe74c
        .extern data_020fe754
        .extern data_020fe760
        .extern data_020fe77c
        .extern func_0203cb90
        .extern func_0203f6cc
        .extern func_0207cbe0
        .extern func_0207cc50
        .extern func_0209150c
        .extern func_02091554
        .extern func_020928cc
        .extern func_020939a4
        .extern func_02093a20
        .extern func_02093bfc
        .extern func_020945f4
        .extern func_02094688
        .extern func_0209bb60
        .extern func_0209bc20
        .global func_020409d8
        .arm
func_020409d8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8c
    mov r6, r1
    mov r1, #0x0
    mov r2, #0x94
    mov r4, r0
    bl func_020945f4
    ldr r3, [r6]
    ldr r5, [r6, #0x4]
    mov r0, #0x0
    cmp r5, r0
    cmpeq r3, r0
    beq .L_398
    ldr r2, _LIT0
    mov r0, r4
    mov r1, #0xe
    str r5, [sp]
    bl func_0209150c
    b .L_3b4
.L_398:
    ldr r3, [r6, #0x8]
    ldr r5, [r6, #0xc]
    ldr r2, _LIT0
    mov r0, r4
    mov r1, #0xe
    str r5, [sp]
    bl func_0209150c
.L_3b4:
    ldrh r3, [r6, #0x10]
    ldr r2, _LIT1
    add r0, r4, #0xe
    mov r1, #0x7
    bl func_0209150c
    ldr r0, _LIT2
    ldrb r0, [r0]
    cmp r0, #0x0
    bne .L_3dc
    bl func_02093bfc
.L_3dc:
    ldr r0, _LIT2
    add r1, r4, #0x15
    mov r2, #0x4
    bl func_02094688
    ldr r0, _LIT3
    ldrb r0, [r0]
    cmp r0, #0x0
    bne .L_400
    bl func_02093bfc
.L_400:
    ldr r0, _LIT3
    add r1, r4, #0x1a
    mov r2, #0x2
    bl func_02094688
    mov r1, #0x30
    add r0, sp, #0x16
    strb r1, [r4, #0x1d]
    bl func_02093a20
    ldr r5, _LIT4
    add r7, sp, #0x16
    add r6, r4, #0x1f
    mov r8, #0x0
.L_430:
    ldrb r2, [r7]
    mov r0, r6
    mov r1, r5
    bl func_02091554
    add r8, r8, #0x1
    cmp r8, #0x6
    add r7, r7, #0x1
    add r6, r6, #0x2
    blt .L_430
    add r0, sp, #0x38
    bl func_020939a4
    ldrb r0, [sp, #0x38]
    ldr r2, _LIT4
    mov r1, #0x3
    cmp r0, #0x6
    movhi r0, #0x1
    strhib r0, [sp, #0x38]
    ldrb r3, [sp, #0x38]
    add r0, r4, #0x2c
    bl func_0209150c
    add r0, sp, #0x3c
    add r1, r4, #0x7e
    mov r2, #0x14
    bl func_02094688
    ldrb r1, [sp, #0x3b]
    ldr r2, _LIT5
    add r0, r4, #0x2f
    str r1, [sp]
    ldrb r3, [sp, #0x3a]
    mov r1, #0x5
    bl func_0209150c
    add r0, sp, #0x1c
    bl func_0209bc20
    cmp r0, #0x0
    bne .L_4cc
    add r0, sp, #0x2c
    bl func_0209bb60
    cmp r0, #0x0
    beq .L_4d8
.L_4cc:
    add sp, sp, #0x8c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_4d8:
    ldr r0, [sp, #0x20]
    ldr r2, _LIT6
    str r0, [sp]
    ldr r1, [sp, #0x24]
    add r0, r4, #0x34
    str r1, [sp, #0x4]
    ldr r3, [sp, #0x2c]
    mov r1, #0xd
    str r3, [sp, #0x8]
    ldr r3, [sp, #0x30]
    str r3, [sp, #0xc]
    ldr r3, [sp, #0x34]
    str r3, [sp, #0x10]
    ldr r3, [sp, #0x1c]
    bl func_0209150c
    bl OS_DisableIrq
    mov r9, r0
    bl func_0207cc50
    mov r8, r0
    mov r1, #0x6
    bl func_020928cc
    cmp r8, #0x0
    bne .L_548
    mov r0, r9
    bl OS_RestoreIrq
    add sp, sp, #0x8c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_548:
    add r7, r4, #0x41
    mov r6, #0x0
    ldr r5, _LIT4
.L_554:
    ldrb r2, [r8, r6]
    mov r0, r7
    mov r1, r5
    bl func_02091554
    add r6, r6, #0x1
    cmp r6, #0x6
    add r7, r7, #0x2
    blt .L_554
    bl func_0203cb90
    mov r3, r0
    ldr r2, _LIT7
    add r0, r4, #0x6f
    mov r1, #0xe
    bl func_0209150c
    add r0, sp, #0x14
    bl func_0207cbe0
    mov r5, r0
    mov r1, #0x20
    bl func_020928cc
    cmp r5, #0x0
    bne .L_5bc
    mov r0, r9
    bl OS_RestoreIrq
    add sp, sp, #0x8c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_5bc:
    mov r0, r5
    add r1, r4, #0x72
    bl func_0203f6cc
    mov r0, r5
    add r1, r4, #0x4e
    mov r2, #0x20
    bl func_02094688
    mov r0, r9
    bl OS_RestoreIrq
    mov r0, #0x1
    add sp, sp, #0x8c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_020fe73c
_LIT1: .word data_020fe744
_LIT2: .word 0x027ffe0c
_LIT3: .word 0x027ffe10
_LIT4: .word data_020fe74c
_LIT5: .word data_020fe754
_LIT6: .word data_020fe760
_LIT7: .word data_020fe77c

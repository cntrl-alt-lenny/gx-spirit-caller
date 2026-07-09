; func_ov002_021d2930 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d0170
        .extern func_0202e2a4
        .extern func_ov002_021b0b24
        .extern func_ov002_021b0b54
        .extern func_ov002_021c9aa0
        .extern func_ov002_0229acd0
        .global func_ov002_021d2930
        .arm
func_ov002_021d2930:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    ldrh fp, [r1, #0x2]
    ldrh r6, [r1, #0x4]
    tst r0, #0x8000
    movne sl, #0x1
    moveq sl, #0x0
    ldr r0, _LIT1
    and r2, sl, #0x1
    mul r9, r2, r0
    mov r0, #0x14
    ldr r2, _LIT2
    mul r8, fp, r0
    ldrh r0, [r1, #0x6]
    add r2, r2, r9
    mov r5, sl
    add r4, r2, #0x30
    ands r7, r6, #0x1
    str r0, [sp]
    beq .L_808
    tst r6, #0x4
    beq .L_808
    ldr r0, [r4, r8]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x13
    cmp r2, r0, lsr #0x13
    mov r0, r0, lsr #0x13
    bcc .L_7f8
    sub r1, r2, #0x2
    cmp r0, r1
    bcc .L_7e8
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    beq .L_804
    b .L_808
.L_7e8:
    sub r1, r2, #0xfa
    cmp r0, r1
    beq .L_804
    b .L_808
.L_7f8:
    add r1, r2, #0x420
    cmp r0, r1
    bne .L_808
.L_804:
    rsb r5, sl, #0x1
.L_808:
    cmp r7, #0x0
    beq .L_868
    ldr r0, _LIT4
    ldr r1, [r4, r8]
    ldr r0, [r0, #0x4]
    orr r1, r1, #0x4000
    str r1, [r4, r8]
    cmp r5, r0
    bne .L_868
    ldr r2, [r4, r8]
    ldr r0, _LIT5
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r2, r1, lsl #0x2
    ldrh r1, [r0, r2]
    orr r1, r1, #0x8000
    strh r1, [r0, r2]
    ldr r0, [r4, r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_021b0b54
.L_868:
    tst r6, #0x4
    beq .L_8ec
    ldr r1, _LIT6
    ldr r0, _LIT4
    add r2, r1, r9
    ldr r1, [r2, r8]
    ldr r0, [r0, #0x4]
    orr r1, r1, #0x10
    orr r1, r1, #0x40000
    str r1, [r2, r8]
    cmp r5, r0
    bne .L_980
    mov r0, #0x19
    mov r1, #0x1
    bl func_ov002_021b0b24
    ldr r0, _LIT7
    add r0, r0, r9
    ldrh r0, [r8, r0]
    cmp r0, #0x0
    bne .L_8c4
    mov r0, #0x1c
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_8c4:
    ldr r0, [r4, r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2a4
    cmp r0, #0x0
    beq .L_980
    mov r0, #0x17
    mov r1, #0x1
    bl func_ov002_021b0b24
    b .L_980
.L_8ec:
    cmp r7, #0x0
    beq .L_928
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    cmp r5, r0
    bne .L_910
    mov r0, #0x16
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_910:
    ldr r0, _LIT6
    add r1, r0, r9
    ldr r0, [r1, r8]
    orr r0, r0, #0x20000
    str r0, [r1, r8]
    b .L_958
.L_928:
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    cmp r5, r0
    bne .L_944
    mov r0, #0x15
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_944:
    ldr r0, _LIT6
    add r1, r0, r9
    ldr r0, [r1, r8]
    orr r0, r0, #0x10000
    str r0, [r1, r8]
.L_958:
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    cmp r5, r0
    bne .L_980
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_980
    mov r0, #0x18
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_980:
    mov r0, sl
    mov r1, fp
    mov r2, #0x2
    mov r3, #0x0
    bl func_ov002_021c9aa0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00001672
_LIT4: .word data_ov002_022cd65c
_LIT5: .word data_ov002_022d0170
_LIT6: .word data_ov002_022cf0cc
_LIT7: .word data_ov002_022cf0c4

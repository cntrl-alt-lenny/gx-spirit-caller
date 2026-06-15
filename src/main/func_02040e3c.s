; func_02040e3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe7f0
        .extern data_020fe7f8
        .extern data_020fe7fc
        .extern data_020fe808
        .extern data_020fe80c
        .extern data_020fe810
        .extern data_020fe814
        .extern data_020fe818
        .extern func_020410ec
        .extern func_020945f4
        .extern func_020aaddc
        .extern func_020ab054
        .extern func_020ab0c4
        .global func_02040e3c
        .arm
func_02040e3c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    ldr r2, _LIT0
    mov fp, r0
    add r0, fp, r2
    mov r6, r1
    mov r3, #0x20
    mov r1, #0x0
    mov r2, #0x100
    str r0, [sp, #0x8]
    str r3, [sp, #0xc]
    str r1, [sp, #0x10]
    bl func_020945f4
    add r0, fp, #0x1000
    ldr r5, [r0, #0xa04]
    ldr r1, _LIT1
    mov r0, r5
    bl func_020ab0c4
    str r0, [sp]
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, r0, #0x4
    bl func_020aaddc
    ldr r1, [sp]
    add r1, r1, #0x4
    add r0, r1, r0
    str r0, [sp, #0x4]
    ldr r1, _LIT2
    mov r0, r5
    bl func_020ab0c4
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r8, r0, #0x1
    ldrsb r7, [r8, #0x3]
    ldr r2, _LIT3
    mov r5, #0x0
    add r1, sp, #0x8
    mov r0, fp
    mov r3, r8
    strb r5, [r8, #0x3]
    bl func_020410ec
    cmp r0, #0x1
    addne sp, sp, #0x14
    strneb r7, [r8, #0x3]
    movne r0, r5
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    strb r7, [r8, #0x3]
    cmp r6, #0x1
    beq .L_89c
    ldr r1, _LIT4
    mov r0, r8
    mov r2, #0x3
    bl func_020ab054
    cmp r0, #0x0
    beq .L_8a8
.L_89c:
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8a8:
    ldr r1, _LIT5
    add r0, r8, #0x4
    bl func_020ab0c4
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, r5
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r9, r0, #0x2
    mov r6, r5
    b .L_954
.L_8d0:
    ldr r1, _LIT6
    mov r0, r9
    bl func_020ab0c4
    movs r7, r0
    beq .L_96c
    ldrsb sl, [r7]
    add r8, r7, #0x2
    ldr r1, _LIT5
    mov r0, r8
    strb r6, [r7]
    bl func_020ab0c4
    movs r5, r0
    streqb sl, [r7]
    beq .L_96c
    ldrsb r4, [r5]
    mov r0, fp
    mov r2, r9
    strb r6, [r5]
    add r1, sp, #0x8
    mov r3, r8
    bl func_020410ec
    cmp r0, #0x1
    strneb sl, [r7]
    addne sp, sp, #0x14
    strneb r4, [r5]
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    bl func_020aaddc
    strb sl, [r7]
    add r0, r8, r0
    strb r4, [r5]
    add r9, r0, #0x2
.L_954:
    ldrsb r0, [r9]
    cmp r0, #0xd
    beq .L_96c
    ldrsb r0, [r9, #0x1]
    cmp r0, #0xa
    bne .L_8d0
.L_96c:
    ldr r0, [sp]
    add r8, r0, #0x4
    ldr r0, [sp, #0x4]
    cmp r8, r0
    bcs .L_a30
    mov r5, #0x0
.L_984:
    ldr r1, _LIT7
    mov r0, r8
    bl func_020ab0c4
    movs sl, r0
    beq .L_a30
    ldrsb r7, [sl]
    add r9, sl, #0x1
    ldr r1, _LIT8
    mov r0, r9
    strb r5, [sl]
    bl func_020ab0c4
    movs r6, r0
    bne .L_9c8
    ldr r1, _LIT5
    mov r0, r9
    bl func_020ab0c4
    mov r6, r0
.L_9c8:
    cmp r6, #0x0
    ldrnesb r4, [r6]
    mov r0, fp
    mov r2, r8
    add r1, sp, #0x8
    mov r3, r9
    strneb r5, [r6]
    bl func_020410ec
    cmp r0, #0x1
    beq .L_a08
    strb r7, [sl]
    cmp r6, #0x0
    add sp, sp, #0x14
    strneb r4, [r6]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a08:
    mov r0, r9
    bl func_020aaddc
    add r0, r9, r0
    add r8, r0, #0x1
    ldr r0, [sp, #0x4]
    strb r7, [sl]
    cmp r6, #0x0
    strneb r4, [r6]
    cmp r8, r0
    bcc .L_984
.L_a30:
    mov r0, #0x1
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001a34
_LIT1: .word data_020fe7f0
_LIT2: .word data_020fe7f8
_LIT3: .word data_020fe7fc
_LIT4: .word data_020fe808
_LIT5: .word data_020fe80c
_LIT6: .word data_020fe810
_LIT7: .word data_020fe814
_LIT8: .word data_020fe818

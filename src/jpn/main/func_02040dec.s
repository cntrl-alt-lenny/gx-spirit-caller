; func_02040dec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe710
        .extern data_020fe718
        .extern data_020fe71c
        .extern data_020fe728
        .extern data_020fe72c
        .extern data_020fe730
        .extern data_020fe734
        .extern data_020fe738
        .extern func_0204109c
        .extern func_02094500
        .extern func_020aace8
        .extern func_020aaf60
        .extern func_020aafd0
        .global func_02040dec
        .arm
func_02040dec:
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
    bl func_02094500
    add r0, fp, #0x1000
    ldr r5, [r0, #0xa04]
    ldr r1, _LIT1
    mov r0, r5
    bl func_020aafd0
    str r0, [sp]
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, r0, #0x4
    bl func_020aace8
    ldr r1, [sp]
    add r1, r1, #0x4
    add r0, r1, r0
    str r0, [sp, #0x4]
    ldr r1, _LIT2
    mov r0, r5
    bl func_020aafd0
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
    bl func_0204109c
    cmp r0, #0x1
    addne sp, sp, #0x14
    strneb r7, [r8, #0x3]
    movne r0, r5
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    strb r7, [r8, #0x3]
    cmp r6, #0x1
    beq .L_ec
    ldr r1, _LIT4
    mov r0, r8
    mov r2, #0x3
    bl func_020aaf60
    cmp r0, #0x0
    beq .L_f8
.L_ec:
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f8:
    ldr r1, _LIT5
    add r0, r8, #0x4
    bl func_020aafd0
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, r5
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r9, r0, #0x2
    mov r6, r5
    b .L_1a4
.L_120:
    ldr r1, _LIT6
    mov r0, r9
    bl func_020aafd0
    movs r7, r0
    beq .L_1bc
    ldrsb sl, [r7]
    add r8, r7, #0x2
    ldr r1, _LIT5
    mov r0, r8
    strb r6, [r7]
    bl func_020aafd0
    movs r5, r0
    streqb sl, [r7]
    beq .L_1bc
    ldrsb r4, [r5]
    mov r0, fp
    mov r2, r9
    strb r6, [r5]
    add r1, sp, #0x8
    mov r3, r8
    bl func_0204109c
    cmp r0, #0x1
    strneb sl, [r7]
    addne sp, sp, #0x14
    strneb r4, [r5]
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r8
    bl func_020aace8
    strb sl, [r7]
    add r0, r8, r0
    strb r4, [r5]
    add r9, r0, #0x2
.L_1a4:
    ldrsb r0, [r9]
    cmp r0, #0xd
    beq .L_1bc
    ldrsb r0, [r9, #0x1]
    cmp r0, #0xa
    bne .L_120
.L_1bc:
    ldr r0, [sp]
    add r8, r0, #0x4
    ldr r0, [sp, #0x4]
    cmp r8, r0
    bcs .L_280
    mov r5, #0x0
.L_1d4:
    ldr r1, _LIT7
    mov r0, r8
    bl func_020aafd0
    movs sl, r0
    beq .L_280
    ldrsb r7, [sl]
    add r9, sl, #0x1
    ldr r1, _LIT8
    mov r0, r9
    strb r5, [sl]
    bl func_020aafd0
    movs r6, r0
    bne .L_218
    ldr r1, _LIT5
    mov r0, r9
    bl func_020aafd0
    mov r6, r0
.L_218:
    cmp r6, #0x0
    ldrnesb r4, [r6]
    mov r0, fp
    mov r2, r8
    add r1, sp, #0x8
    mov r3, r9
    strneb r5, [r6]
    bl func_0204109c
    cmp r0, #0x1
    beq .L_258
    strb r7, [sl]
    cmp r6, #0x0
    add sp, sp, #0x14
    strneb r4, [r6]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_258:
    mov r0, r9
    bl func_020aace8
    add r0, r9, r0
    add r8, r0, #0x1
    ldr r0, [sp, #0x4]
    strb r7, [sl]
    cmp r6, #0x0
    strneb r4, [r6]
    cmp r8, r0
    bcc .L_1d4
.L_280:
    mov r0, #0x1
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001a34
_LIT1: .word data_020fe710
_LIT2: .word data_020fe718
_LIT3: .word data_020fe71c
_LIT4: .word data_020fe728
_LIT5: .word data_020fe72c
_LIT6: .word data_020fe730
_LIT7: .word data_020fe734
_LIT8: .word data_020fe738

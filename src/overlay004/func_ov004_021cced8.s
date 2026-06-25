; func_ov004_021cced8 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov004_02209c70
        .extern data_ov004_02209c8c
        .extern data_ov004_02209ca8
        .extern data_ov004_02209cc8
        .extern data_ov004_02209ce8
        .extern data_ov004_0220b500
        .extern data_ov004_0220b5b8
        .extern func_02001d68
        .extern func_02005dac
        .extern func_02006b10
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02091554
        .extern func_020a7440
        .extern func_ov004_021ca0a4
        .extern func_ov004_021cb568
        .extern func_ov004_021cb63c
        .extern func_ov004_021cb778
        .extern func_ov004_021cb834
        .extern func_ov004_021cb940
        .global func_ov004_021cced8
        .arm
func_ov004_021cced8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x58
    mov r5, r0
    ldr r3, _LIT0
    mov r1, r5, lsr #0x1f
    smull r2, r4, r3, r5
    add r4, r1, r4, asr #0x1
    mov r3, #0x5
    smull r1, r2, r3, r4
    ldr r2, _LIT1
    sub r4, r5, r1
    ldr r6, [r2, r4, lsl #0x5]
    add r8, r2, r4, lsl #0x5
    cmp r6, #0x0
    ldr r7, _LIT2
    beq .L_bac
    add r0, r7, #0x158
    mov r1, r8
    add r0, r0, r4, lsl #0x5
    mov r2, #0x20
    bl func_020a7440
    cmp r0, #0x0
    beq .L_984
    cmp r6, #0xfa0
    bcc .L_7a8
    ldrsb r0, [r8, #0x8]
    bl func_02001d68
    add r0, r4, #0x1
    add r1, r8, #0x9
    mov r2, #0x80
    bl func_ov004_021cb63c
    add r0, r7, r4, lsl #0x2
    mov r1, #0x0
    str r1, [r0, #0x20c]
    b .L_858
.L_7a8:
    cmp r6, #0x1
    bne .L_7d8
    ldrsb r0, [r8, #0x4]
    bl func_02001d68
    add r0, r4, #0x1
    add r1, r8, #0x6
    mov r2, #0x80
    bl func_ov004_021cb63c
    add r0, r7, r4, lsl #0x2
    mov r1, #0x1
    str r1, [r0, #0x20c]
    b .L_858
.L_7d8:
    cmp r6, #0x3
    bne .L_834
    add r0, r7, r4, lsl #0x2
    ldr r0, [r0, #0x20c]
    cmp r0, #0x0
    beq .L_80c
    ldrsb r0, [r8, #0x4]
    bl func_02001d68
    add r0, r4, #0x1
    add r1, r8, #0x6
    mov r2, #0x80
    bl func_ov004_021cb63c
    b .L_858
.L_80c:
    ldrsb r0, [r8, #0x8]
    bl func_02001d68
    add r0, r4, #0x1
    add r1, r8, #0x9
    mov r2, #0x80
    bl func_ov004_021cb63c
    add r0, r7, r4, lsl #0x2
    mov r1, #0x0
    str r1, [r0, #0x20c]
    b .L_858
.L_834:
    ldrsb r0, [r8, #0x8]
    bl func_02001d68
    add r0, r4, #0x1
    add r1, r8, #0x9
    mov r2, #0x80
    bl func_ov004_021cb63c
    add r0, r7, r4, lsl #0x2
    mov r1, #0x0
    str r1, [r0, #0x20c]
.L_858:
    ldr r2, [r8]
    add r0, r7, r4, lsl #0x2
    mov r1, #0x1
    cmp r2, #0x5
    ldr r0, [r0, #0x20c]
    moveq r1, #0x0
    cmp r0, #0x0
    movne r1, #0x2
    cmp r2, #0xfa0
    movcs r1, #0x3
    mov r0, r5
    add r1, r1, #0x4
    bl func_ov004_021cb834
    add r0, r7, r4, lsl #0x2
    ldr r0, [r0, #0x20c]
    cmp r0, #0x0
    beq .L_8c4
    ldrsb r0, [r8, #0x4]
    cmp r0, #0x0
    add r0, sp, #0x38
    bne .L_8b8
    ldr r1, _LIT3
    bl func_02091554
    b .L_924
.L_8b8:
    ldr r1, _LIT4
    bl func_02091554
    b .L_924
.L_8c4:
    ldr r0, [r8]
    cmp r0, #0xfa0
    bcc .L_8e0
    ldr r1, _LIT5
    add r0, sp, #0x38
    bl func_02091554
    b .L_924
.L_8e0:
    ldr r2, [r8, #0x4]
    mov r0, #0xa
    and r1, r2, #0x3e0
    mov r1, r1, lsr #0x5
    and r2, r2, #0x1f
    sub r1, r1, #0x1
    mla r2, r1, r0, r2
    ldr r1, _LIT6
    add r0, sp, #0x38
    bl func_02091554
    add r0, sp, #0x38
    bl func_02006b10
    cmp r0, #0x0
    bne .L_924
    ldr r1, _LIT7
    add r0, sp, #0x38
    bl func_02091554
.L_924:
    add r0, sp, #0x38
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r6, r0
    add r0, sp, #0x10
    bl func_0201d47c
    mov r0, r4, lsl #0xc
    add r3, r0, #0x3080
    ldrh r1, [sp, #0x24]
    str r6, [sp, #0x10]
    str r3, [sp, #0x1c]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x24]
    ldrh r2, [sp, #0x24]
    mvn r1, #0x0
    add r0, sp, #0x10
    orr r2, r2, #0x10
    strh r2, [sp, #0x24]
    strh r1, [sp, #0x20]
    bl func_0201e5b8
    mov r0, r6
    bl Task_Invoke
.L_984:
    ldr r0, _LIT8
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    mov r0, #0x30
    mul r9, r5, r0
    mov r0, r4, lsl #0xc
    ldr r1, [r7, #0x8c]
    add r2, r0, #0x3080
    add r0, r1, #0x9
    mov r1, r2, asr #0x6
    add r1, r2, r1, lsr #0x19
    mov r1, r1, asr #0x7
    orr r2, r1, #0x2800
    ldr r1, [r7, #0xa4]
    add r6, r9, #0x24
    sub r1, r6, r1
    and r1, r1, #0xff
    orr r1, r1, #0x2000
    mov r0, r0, lsl #0x17
    orr r1, r1, #-1073741824
    orr r0, r1, r0, lsr #0x7
    str r0, [sp, #0x8]
    mov r0, #0x2
    mov r1, #0x0
    strh r2, [sp, #0xc]
    bl func_02005dac
    ldr r2, [sp, #0x8]
    ldr r1, [sp, #0xc]
    str r2, [r0]
    str r1, [r0, #0x4]
    mov r0, #0x80
    str r0, [sp]
    ldr r0, [r7, #0x8c]
    ldr r1, [r7, #0xa4]
    add r0, r0, #0x40
    sub r1, r6, r1
    add r2, r4, #0x1
    mov r3, #0x2
    bl func_ov004_021cb778
    ldr r0, [r8]
    add r6, r9, #0x2d
    cmp r0, #0xfa0
    movcs r1, #0x1
    movcc r1, #0x0
    cmp r0, #0x1
    add r0, r7, r4, lsl #0x2
    moveq r2, #0x1
    ldr r0, [r0, #0x20c]
    movne r2, #0x0
    add r1, r1, #0x1a
    cmp r0, #0x0
    add r0, r1, r2, lsl #0x1
    mov r1, #0x2
    movne r0, #0x1c
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r2, [r7, #0x8c]
    ldr r3, [r7, #0xa4]
    add r0, r7, #0xf90
    add r0, r0, #0x5000
    add r2, r2, #0xc4
    sub r3, r6, r3
    bl func_ov004_021ca0a4
    ldr r0, [r8]
    add r6, r9, #0x3b
    cmp r0, #0xfa0
    movcs r1, #0x1
    movcc r1, #0x0
    cmp r0, #0x5
    mov r0, #0x80
    str r0, [sp]
    moveq r2, #0x1
    ldr r0, [r7, #0x8c]
    add r3, r1, #0x6
    ldr r1, [r7, #0xa4]
    movne r2, #0x0
    add r2, r3, r2, lsl #0x1
    add r0, r0, #0x40
    sub r1, r6, r1
    mov r3, #0x3
    bl func_ov004_021cb778
    ldr r2, [r7, #0x8c]
    cmp r2, #0x200
    moveq r1, #0x15
    beq .L_af4
    ldr r0, [r7, #0xa8]
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    add r1, r0, #0xc
.L_af4:
    mov r0, #0x3
    stmia sp, {r0, r1}
    add r0, r7, #0xf90
    ldr r1, [r7, #0xa4]
    add r6, r9, #0x35
    sub r3, r6, r1
    add r0, r0, #0x5000
    add r2, r2, #0x3d
    mov r1, #0x2
    bl func_ov004_021ca0a4
    ldr r2, [r7, #0x8c]
    cmp r2, #0x0
    ldreq r0, [r7, #0x60]
    cmpeq r0, #0x0
    ldreq r0, [r7, #0x90]
    cmpeq r5, r0
    bne .L_b50
    ldr r1, [r7, #0xa4]
    add r0, r2, #0x3d
    sub r1, r6, r1
    mov r2, #0x85
    mov r3, #0x18
    bl func_ov004_021cb568
.L_b50:
    ldr r0, [r8]
    add r2, r7, r4, lsl #0x5
    str r0, [r2, #0x158]
    ldr r1, [r8, #0x4]
    add r0, r2, #0x61
    str r1, [r2, #0x15c]
    ldrsb r1, [r8, #0x8]
    add r4, r8, #0x9
    add r3, r0, #0x100
    strb r1, [r2, #0x160]
    mov r2, #0xa
.L_b7c:
    ldrb r1, [r4]
    ldrb r0, [r4, #0x1]
    add r4, r4, #0x2
    subs r2, r2, #0x1
    strb r1, [r3]
    strb r0, [r3, #0x1]
    add r3, r3, #0x2
    bne .L_b7c
    ldrb r0, [r4]
    add sp, sp, #0x58
    strb r0, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_bac:
    add r2, r7, r4, lsl #0x5
    ldr r1, [r2, #0x158]
    cmp r1, #0x0
    addeq sp, sp, #0x58
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r1, #0x0
    str r1, [r2, #0x158]
    bl func_ov004_021cb940
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_ov004_0220b5b8
_LIT2: .word data_ov004_0220b500
_LIT3: .word data_ov004_02209c70
_LIT4: .word data_ov004_02209c8c
_LIT5: .word data_ov004_02209ca8
_LIT6: .word data_ov004_02209cc8
_LIT7: .word data_ov004_02209ce8
_LIT8: .word data_02104f4c

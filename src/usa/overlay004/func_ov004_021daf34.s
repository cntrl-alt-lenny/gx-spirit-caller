; func_ov004_021daf34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov004_02209ff0
        .extern data_ov004_0220a010
        .extern data_ov004_0220b2a0
        .extern data_ov004_0220b358
        .extern func_02001d48
        .extern func_02005d90
        .extern func_02006af4
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern OS_SPrintf
        .extern func_020a734c
        .extern func_ov004_021c9fc4
        .extern func_ov004_021d9cdc
        .extern func_ov004_021d9db0
        .extern func_ov004_021d9eec
        .extern func_ov004_021d9fa8
        .extern func_ov004_021da0b4
        .global func_ov004_021daf34
        .arm
func_ov004_021daf34:
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
    beq .L_874
    add r0, r7, #0x158
    mov r1, r8
    add r0, r0, r4, lsl #0x5
    mov r2, #0x20
    bl func_020a734c
    cmp r0, #0x0
    beq .L_650
    cmp r6, #0xfa0
    bcc .L_54c
    ldrsb r0, [r8, #0x8]
    bl func_02001d48
    add r0, r4, #0x1
    add r1, r8, #0x9
    mov r2, #0x80
    bl func_ov004_021d9db0
    b .L_588
.L_54c:
    cmp r6, #0x1
    bne .L_570
    ldrsb r0, [r8, #0x4]
    bl func_02001d48
    add r0, r4, #0x1
    add r1, r8, #0x6
    mov r2, #0x80
    bl func_ov004_021d9db0
    b .L_588
.L_570:
    ldrsb r0, [r8, #0x8]
    bl func_02001d48
    add r0, r4, #0x1
    add r1, r8, #0x9
    mov r2, #0x80
    bl func_ov004_021d9db0
.L_588:
    ldr r0, [r8]
    mov r1, #0x2
    cmp r0, #0x5
    moveq r1, #0x0
    cmp r0, #0x6
    moveq r1, #0x1
    mov r0, r5
    add r1, r1, #0x4
    bl func_ov004_021d9fa8
    ldr r2, [r8, #0x4]
    mov r0, #0xa
    and r1, r2, #0x3e0
    mov r1, r1, lsr #0x5
    and r2, r2, #0x1f
    sub r1, r1, #0x1
    mla r2, r1, r0, r2
    ldr r1, _LIT3
    add r0, sp, #0x38
    bl OS_SPrintf
    add r0, sp, #0x38
    bl func_02006af4
    cmp r0, #0x0
    bne .L_5f0
    ldr r1, _LIT4
    add r0, sp, #0x38
    bl OS_SPrintf
.L_5f0:
    add r0, sp, #0x38
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r6, r0
    add r0, sp, #0x10
    bl func_0201d428
    mov r0, r4, lsl #0xc
    add r3, r0, #0x3480
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
    bl func_0201e564
    mov r0, r6
    bl func_02006e00
.L_650:
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    mov r0, #0x30
    mul r9, r5, r0
    mov r0, r4, lsl #0xc
    ldr r1, [r7, #0x8c]
    add r2, r0, #0x3480
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
    bl func_02005d90
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
    bl func_ov004_021d9eec
    ldr r0, [r8]
    mov r1, #0x2
    cmp r0, #0x6
    mov r2, #0x0
    cmpne r0, #0x5
    movne r2, #0x1
    str r1, [sp]
    add r0, r2, #0x20
    str r0, [sp, #0x4]
    ldr r2, [r7, #0x8c]
    add r0, r7, #0xf90
    ldr r3, [r7, #0xa4]
    add r6, r9, #0x2d
    add r0, r0, #0x5000
    add r2, r2, #0xc4
    sub r3, r6, r3
    bl func_ov004_021c9fc4
    ldr r1, [r8]
    mov r2, #0x80
    str r2, [sp]
    cmp r1, #0x5
    moveq r3, #0x1
    movne r3, #0x0
    cmp r1, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r1, #0x2
    moveq r1, #0x1
    add r2, r3, #0x6
    movne r1, #0x0
    add r3, r2, r0, lsl #0x1
    ldr lr, [r7, #0x8c]
    add r2, r1, r1, lsl #0x1
    add r2, r3, r2
    ldr r6, [r7, #0xa4]
    add ip, r9, #0x3b
    add r0, lr, #0x40
    sub r1, ip, r6
    mov r3, #0x3
    bl func_ov004_021d9eec
    ldr r0, [r8]
    cmp r0, #0x6
    movne r1, #0x15
    bne .L_7b8
    ldr r0, [r7, #0xa8]
    cmp r5, r0
    moveq r0, #0x1
    movne r0, #0x0
    add r1, r0, #0xc
.L_7b8:
    mov r0, #0x3
    stmia sp, {r0, r1}
    ldr r2, [r7, #0x8c]
    add r0, r7, #0xf90
    ldr r1, [r7, #0xa4]
    add r6, r9, #0x35
    sub r3, r6, r1
    add r0, r0, #0x5000
    add r2, r2, #0x3d
    mov r1, #0x2
    bl func_ov004_021c9fc4
    ldr r2, [r7, #0x8c]
    cmp r2, #0x0
    ldreq r0, [r7, #0x60]
    cmpeq r0, #0x0
    ldreq r0, [r7, #0x90]
    cmpeq r5, r0
    bne .L_818
    ldr r1, [r7, #0xa4]
    add r0, r2, #0x3d
    sub r1, r6, r1
    mov r2, #0x85
    mov r3, #0x18
    bl func_ov004_021d9cdc
.L_818:
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
.L_844:
    ldrb r1, [r4]
    ldrb r0, [r4, #0x1]
    add r4, r4, #0x2
    subs r2, r2, #0x1
    strb r1, [r3]
    strb r0, [r3, #0x1]
    add r3, r3, #0x2
    bne .L_844
    ldrb r0, [r4]
    add sp, sp, #0x58
    strb r0, [r3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_874:
    add r2, r7, r4, lsl #0x5
    ldr r1, [r2, #0x158]
    cmp r1, #0x0
    addeq sp, sp, #0x58
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r1, #0x0
    str r1, [r2, #0x158]
    bl func_ov004_021da0b4
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_ov004_0220b358
_LIT2: .word data_ov004_0220b2a0
_LIT3: .word data_ov004_02209ff0
_LIT4: .word data_ov004_0220a010
_LIT5: .word data_02104e6c

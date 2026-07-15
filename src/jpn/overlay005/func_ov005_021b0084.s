; func_ov005_021b0084 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov005_021b1b8c
        .extern data_ov005_021b214c
        .extern func_02005488
        .extern func_0202c06c
        .extern func_020371b8
        .extern func_ov005_021aef88
        .extern func_ov005_021af1d4
        .extern func_ov005_021afa98
        .extern func_ov005_021b0a28
        .global func_ov005_021b0084
        .arm
func_ov005_021b0084:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x4]
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1d
    bne .L_848
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_aa0
    b .L_624
    b .L_6b4
    b .L_764
    b .L_76c
.L_624:
    ldrh r5, [r4, #0x28]
    add lr, r4, #0x48
    ldr r1, _LIT1
    add r0, lr, r5, lsl #0x1
    ldrb ip, [r1]
    ldrb r3, [r1, #0x1]
    ldrb r2, [lr, r5, lsl #0x1]
    ldrb r1, [r0, #0x1]
    add r3, r3, ip, lsl #0x8
    mov ip, r5, lsl #0x1
    add r1, r1, r2, lsl #0x8
    cmp r3, r1
    bne .L_68c
    add r1, ip, #0x2
    add r3, lr, r1
    ldrb r2, [lr, r1]
    ldrb r1, [r3, #0x1]
    adds r1, r1, r2, lsl #0x8
    bne .L_68c
    mov r1, #0x0
    strb r1, [r0]
    ldrh r0, [r4, #0x28]
    mov r0, r0, lsl #0x1
    add r0, r0, #0x1
    add r0, r4, r0
    strb r1, [r0, #0x48]
.L_68c:
    ldrh r0, [r4, #0x28]
    mov r2, #0x0
    mov r3, #0x1
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneh r0, [r4, #0x28]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    b .L_aa0
.L_6b4:
    ldrh r0, [r4, #0x28]
    add ip, r4, #0x48
    mov r3, r0, lsl #0x1
    ldrsb r0, [ip, r3]
    cmp r0, #0x0
    bne .L_70c
    ldr r1, _LIT1
    ldrb r2, [r1]
    ldrb r0, [r1, #0x1]
    add r0, r0, r2, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    strb r0, [ip, r3]
    ldrh r0, [r4, #0x28]
    ldrb r2, [r1]
    ldrb r1, [r1, #0x1]
    mov r0, r0, lsl #0x1
    add r0, r0, #0x1
    add r1, r1, r2, lsl #0x8
    add r0, r4, r0
    strb r1, [r0, #0x48]
.L_70c:
    ldr r1, [r4, #0x8]
    mov r2, #0x0
    cmp r1, #0x4
    bhi .L_72c
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_72c:
    cmp r2, #0x0
    movne r0, #0xa
    moveq r0, #0xc
    ldrh r1, [r4, #0x28]
    sub r0, r0, #0x1
    mov r2, #0x0
    cmp r1, r0
    addlt r0, r1, #0x1
    strlth r0, [r4, #0x28]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_020371b8
    b .L_aa0
.L_764:
    bl func_ov005_021aef88
    b .L_aa0
.L_76c:
    bl func_ov005_021af1d4
    cmp r0, #0x0
    beq .L_830
    ldrsb r0, [r4, #0x48]
    cmp r0, #0x0
    bne .L_79c
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_aa0
.L_79c:
    mov r0, r4
    add r1, r4, #0x48
    bl func_ov005_021afa98
    cmp r0, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_800
    mov r0, #0x3a
    str r3, [r4, #0x88]
    sub r1, r0, #0x3b
    bl func_020371b8
    ldr r0, [r4, #0x8]
    cmp r0, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    bl func_0202c06c
    mov r2, r0
    ldr r0, _LIT3
    mov r1, #0x2
    bl func_ov005_021b0a28
    mov r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_800:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    mov r0, #0xfa
    bl func_0202c06c
    mov r2, r0
    ldr r0, _LIT3
    mov r1, #0x11
    bl func_ov005_021b0a28
    mov r0, #0x1
    str r0, [r4, #0x4]
    b .L_aa0
.L_830:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_aa0
.L_848:
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_aa0
    b .L_864
    b .L_8c8
    b .L_9c0
    b .L_9c8
.L_864:
    ldrh r3, [r4, #0x28]
    add r2, r4, #0x48
    ldrsb r0, [r2, r3]
    cmp r0, #0x20
    bne .L_8a0
    add r0, r3, #0x1
    add r0, r4, r0
    ldrsb r0, [r0, #0x48]
    cmp r0, #0x0
    bne .L_8a0
    mov r1, #0x0
    strb r1, [r2, r3]
    ldrh r0, [r4, #0x28]
    add r0, r4, r0
    strb r1, [r0, #0x68]
.L_8a0:
    ldrh r0, [r4, #0x28]
    mov r2, #0x0
    mov r3, #0x1
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneh r0, [r4, #0x28]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    bl func_020371b8
    b .L_aa0
.L_8c8:
    ldrh r1, [r4, #0x28]
    add r2, r4, #0x48
    ldrsb r0, [r2, r1]
    cmp r0, #0x0
    bne .L_964
    mov r0, #0x20
    strb r0, [r2, r1]
    ldr r1, [r4, #0x8]
    mov r2, #0x0
    cmp r1, #0x4
    bhi .L_904
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_904:
    cmp r2, #0x0
    movne r5, #0xa
    add r0, r4, #0x48
    mov r1, #0xc
    moveq r5, #0xc
    bl func_02005488
    mov r1, #0xc
    mul r1, r5, r1
    cmp r0, r1
    ble .L_954
    ldrh r2, [r4, #0x28]
    mov r0, #0x43
    sub r1, r0, #0x44
    add r4, r4, r2
    mov r2, #0x0
    mov r3, #0x1
    strb r2, [r4, #0x48]
    bl func_020371b8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_954:
    ldrh r0, [r4, #0x28]
    mov r1, #0x6
    add r0, r4, r0
    strb r1, [r0, #0x68]
.L_964:
    ldr r1, [r4, #0x8]
    mov r2, #0x0
    cmp r1, #0x4
    bhi .L_984
    mov r0, #0x1
    mov r1, r0, lsl r1
    tst r1, #0x19
    movne r2, r0
.L_984:
    cmp r2, #0x0
    movne r0, #0xa
    moveq r0, #0xc
    mov r0, r0, lsl #0x1
    ldrh r1, [r4, #0x28]
    sub r0, r0, #0x1
    mov r2, #0x0
    cmp r1, r0
    addlt r0, r1, #0x1
    strlth r0, [r4, #0x28]
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r3, #0x1
    bl func_020371b8
    b .L_aa0
.L_9c0:
    bl func_ov005_021aef88
    b .L_aa0
.L_9c8:
    bl func_ov005_021af1d4
    cmp r0, #0x0
    beq .L_a8c
    ldrsb r0, [r4, #0x48]
    cmp r0, #0x0
    bne .L_9f8
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_aa0
.L_9f8:
    mov r0, r4
    add r1, r4, #0x48
    bl func_ov005_021afa98
    cmp r0, #0x0
    mov r2, #0x0
    mov r3, #0x1
    beq .L_a5c
    mov r0, #0x3a
    str r3, [r4, #0x88]
    sub r1, r0, #0x3b
    bl func_020371b8
    ldr r0, [r4, #0x8]
    cmp r0, #0x4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    bl func_0202c06c
    mov r2, r0
    ldr r0, _LIT3
    mov r1, #0x2
    bl func_ov005_021b0a28
    mov r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_a5c:
    mov r0, #0x43
    sub r1, r0, #0x44
    bl func_020371b8
    mov r0, #0xfa
    bl func_0202c06c
    mov r2, r0
    ldr r0, _LIT3
    mov r1, #0x11
    bl func_ov005_021b0a28
    mov r0, #0x1
    str r0, [r4, #0x4]
    b .L_aa0
.L_a8c:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_aa0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov005_021b1b8c
_LIT2: .word 0x000006a8
_LIT3: .word data_ov005_021b214c

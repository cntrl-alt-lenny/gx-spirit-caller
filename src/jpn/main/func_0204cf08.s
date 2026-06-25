; func_0204cf08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff8e8
        .extern data_020ff8ec
        .extern data_020ff8f0
        .extern func_02045a74
        .extern func_02048094
        .extern func_0204987c
        .extern func_0204d210
        .extern func_02052e90
        .extern func_020530f0
        .extern func_020556c4
        .extern func_02055744
        .extern func_02092fc8
        .extern func_020acbac
        .global func_0204cf08
        .arm
func_0204cf08:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x23c
    movs r4, r1
    str r0, [sp]
    str r2, [sp, #0x4]
    beq .L_28
    bl func_0204987c
    ldrb r0, [r0, #0x19d]
    str r0, [sp, #0xc]
    b .L_60
.L_28:
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldr r0, [r0, #0x33c]
    ldrb r1, [r5, #0x19d]
    sub r0, r0, #0x1
    cmp r1, r0
    movge r0, #0x0
    strge r0, [sp, #0xc]
    bge .L_60
    bl func_0204987c
    ldrb r0, [r0, #0x19d]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
.L_60:
    cmp r4, #0x0
    moveq r0, #0x1
    mov r9, #0x0
    streq r0, [sp, #0x8]
    strne r9, [sp, #0x8]
    mov r7, #0x1
    mov r8, #0x0
    mov r5, #0x2f
    mov r4, #0xa
.L_84:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_98
    cmp r9, #0x0
    beq .L_cc
.L_98:
    bl func_0204987c
    ldrb r1, [r0, #0x19d]
    add r1, r1, #0x1
    strb r1, [r0, #0x19d]
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r1, [r6, #0x19d]
    ldr r0, [r0, #0x33c]
    cmp r1, r0
    blt .L_cc
    bl func_0204987c
    strb r8, [r0, #0x19d]
.L_cc:
    cmp r9, #0x0
    beq .L_120
    bl func_0204987c
    ldrb r1, [r0, #0x19d]
    ldr r0, [sp, #0xc]
    cmp r0, r1
    bne .L_120
    bl func_0204987c
    ldr r1, _LIT0
    str r1, [r0, #0x1c0]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0x1c4]
    str r1, [r4, #0x1c8]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1b4]
    add sp, sp, #0x23c
    mov r0, r1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_120:
    mov r9, r7
    bl func_02048094
    mov fp, r0
    bl func_0204987c
    mov sl, r0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    mov r1, r0
    ldrb r2, [r1, #0x19d]
    ldr r3, [sl, #0x2f4]
    mov r1, #0xc
    add r2, r6, r2
    ldrb r2, [r2, #0x2fc]
    mov r0, fp
    mla r1, r2, r1, r3
    bl func_02052e90
    movs sl, r0
    beq .L_84
    mvn r0, #0x0
    cmp sl, r0
    beq .L_84
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    mov fp, r0
    bl func_0204987c
    ldr r2, [r6, #0x2f4]
    ldrb r1, [r0, #0x19d]
    mov r0, #0xc
    add r1, fp, r1
    ldrb r1, [r1, #0x2fc]
    mla r0, r1, r0, r2
    bl func_020530f0
    cmp r0, #0x0
    beq .L_84
    mov r6, r7
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_1ec
.L_1c4:
    bl func_0204987c
    add r0, r0, r6, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp sl, r0
    beq .L_1ec
    add r6, r6, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r6, r0
    ble .L_1c4
.L_1ec:
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r6, r0
    ble .L_84
    bl func_0204987c
    ldr r0, [r0]
    mov r1, sl
    add r2, sp, #0x18
    bl func_020556c4
    mov r6, r0
    bl func_0204987c
    ldr r0, [r0]
    ldr r1, [sp, #0x18]
    add r2, sp, #0x28
    bl func_02055744
    orrs r0, r6, r0
    bne .L_84
    ldr r0, [sp, #0x2c]
    cmp r0, #0x4
    bne .L_84
    ldr r0, _LIT1
    add r1, sp, #0x1c
    add r2, sp, #0x30
    mov r3, r5
    bl func_02045a74
    mov r6, r0
    ldr r0, _LIT2
    add r1, sp, #0x12
    add r2, sp, #0x30
    mov r3, r5
    bl func_02045a74
    mov fp, r0
    ldr r0, _LIT3
    add r1, sp, #0x10
    add r2, sp, #0x30
    mov r3, r5
    bl func_02045a74
    cmp r6, #0x0
    ble .L_84
    cmp fp, #0x0
    ble .L_84
    cmp r0, #0x0
    ble .L_84
    add r0, sp, #0x1c
    mov r1, r8
    mov r2, r4
    bl func_020acbac
    cmp r0, #0x3
    bne .L_84
    add r0, sp, #0x12
    mov r1, r8
    mov r2, r4
    bl func_020acbac
    mov r6, r0
    bl func_0204987c
    ldrb r0, [r0, #0x16]
    cmp r6, r0
    bne .L_84
    ldr r0, [sp, #0x4]
    cmp sl, r0
    moveq r0, #0x1
    streq r0, [sp]
    ldr r1, [sp]
    mov r0, sl
    bl func_0204d210
    add sp, sp, #0x23c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000bb8
_LIT1: .word data_020ff8e8
_LIT2: .word data_020ff8ec
_LIT3: .word data_020ff8f0

; func_0200886c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern .L_02020fb4
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_020c3f48
        .extern data_02104e5c
        .extern data_02104e6c
        .extern func_02000d0c
        .extern func_02007214
        .extern func_02007224
        .extern func_02090780
        .extern func_020907d8
        .extern func_02094a30
        .extern func_0209bee0
        .extern func_0209bef0
        .extern func_0209bfd8
        .extern func_0209c6e8
        .global func_0200886c
        .arm
func_0200886c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    bl func_02000d0c
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [sp, #0x18]
    ldr r3, _LIT1
    ldr r5, _LIT2
    ldr r1, [r3, #0x8]
    ldr r2, [sp, #0x18]
    add r4, r1, #0x1
    ldr r0, _LIT3
    ldr r1, _LIT0
    mov r9, r2
    str r5, [sp, #0x20]
    str r4, [r3, #0x8]
    str r4, [sp, #0x24]
    bl func_02094a30
    cmp r0, #0x0
    str r0, [sp, #0x28]
    ldreq r0, _LIT0
    ldreq r9, _LIT3
    streq r0, [sp, #0x28]
    ldr r1, [sp, #0x28]
    mov r0, r9
    bl func_02007224
    str r0, [sp, #0x2c]
    bl func_0209bfd8
    cmp r0, #0x0
    beq .L_49c
    bl func_02090780
    mvn r1, #0x2
    str r0, [sp, #0x14]
    cmp r0, r1
    beq .L_49c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bef0
    mov r0, #0x0
    str r0, [sp]
    str r0, [sp, #0x4]
    mov r1, #0x6
    str r1, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    add r1, sp, #0x1c
    mov r3, r0
    mov r2, #0x4
    str r0, [sp, #0x10]
    bl func_0209c6e8
    cmp r0, #0x0
    mov r0, #0x0
    ldr r4, _LIT4
    moveq r2, #0x1
    mov r7, #0x7
    ldr r1, [r4, #0x4]
    movne r2, #0x0
    orr r1, r1, r2
    str r0, [sp, #0x1c]
    str r1, [r4, #0x4]
    mov r8, r0
    mov r6, #0xa
    mov r5, #0x2
    mov fp, r7
    b .L_46c
.L_3b0:
    ldr r1, [r4, #0xc]
    add r0, sp, #0x20
    add r1, r1, #0x1
    str r1, [r4, #0xc]
    mov r2, r1, lsr #0x1f
    str r8, [sp]
    rsb r1, r2, r1, lsl #0x1d
    add r1, r2, r1, ror #0x1d
    str r8, [sp, #0x4]
    str r7, [sp, #0x8]
    mov r1, r1, lsl #0xe
    str r6, [sp, #0xc]
    add sl, r1, #0x20000
    str r5, [sp, #0x10]
    mov r1, sl
    mov r2, #0x10
    mov r3, r8
    bl func_0209c6e8
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, [r4, #0x4]
    movne r1, #0x0
    orrs r0, r0, r1
    str r0, [r4, #0x4]
    bne .L_47c
    mov r0, #0x0
    str r0, [sp]
    stmib sp, {r0, fp}
    mov r0, #0xa
    str r0, [sp, #0xc]
    mov r0, #0x2
    str r0, [sp, #0x10]
    ldr r2, [sp, #0x28]
    add r1, sl, #0x10
    mov r0, r9
    mov r3, #0x0
    bl func_0209c6e8
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, [r4, #0x4]
    movne r1, #0x0
    orrs r1, r0, r1
    str r1, [r4, #0x4]
    bne .L_47c
    ldr r0, [sp, #0x1c]
    add r0, r0, #0x1
    str r0, [sp, #0x1c]
.L_46c:
    cmp r0, #0x2
    bge .L_47c
    cmp r1, #0x0
    beq .L_3b0
.L_47c:
    ldr r0, [sp, #0x14]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0209bee0
    ldr r0, [sp, #0x14]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_020907d8
.L_49c:
    ldr r0, [sp, #0x18]
    bl Task_InvokeLocked
    bl func_02007214
    cmp r0, #0x0
    beq .L_4b4
    bl .L_02020fb4
.L_4b4:
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001b0c
_LIT1: .word data_020c3f48
_LIT2: .word 0x59474454
_LIT3: .word data_02104e6c
_LIT4: .word data_02104e5c

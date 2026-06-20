; func_ov002_02258d4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_0202e234
        .extern func_0203158c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bd710
        .extern func_ov002_021fc1a0
        .extern func_ov002_021fd584
        .extern func_ov002_021fd668
        .extern func_ov002_0225753c
        .global func_ov002_02258d4c
        .arm
func_ov002_02258d4c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    mov r7, r1
    ldr r1, _LIT0
    ldr r3, _LIT1
    and r4, r7, #0x1
    mla r1, r4, r1, r3
    mov r6, r2
    mov r8, r0
    add r1, r1, #0x30
    mov r0, #0x14
    mla r5, r6, r0, r1
    mov r0, r7
    mov r1, r6
    mov r4, #0x0
    bl func_ov002_021bd710
    cmp r0, #0x0
    beq .L_728
    ldr r0, _LIT2
    add sp, sp, #0x18
    ldr r0, [r0, #0x4]
    cmp r7, r0
    ldreq r0, _LIT3
    moveq r1, #0x10
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_728:
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r7, r0
    bne .L_848
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    bne .L_83c
    ldrh r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_83c
    mov r0, r8
    bl func_0203158c
    cmp r0, #0x0
    beq .L_83c
    add r0, sp, #0x0
    mov r1, r4
    str r1, [r0]
    ldrh r3, [sp, #0x2]
    mov r2, r7, lsl #0x10
    mov r2, r2, lsr #0x10
    bic r3, r3, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0x2]
    ldrh r7, [sp, #0x2]
    ldr r3, [r5]
    mov r2, r6, lsl #0x10
    orr r5, r7, #0x4000
    strh r5, [sp, #0x2]
    ldrh r5, [sp, #0x2]
    mov r2, r2, lsr #0x10
    mov r2, r2, lsl #0x1b
    bic r5, r5, #0x3e
    orr r2, r5, r2, lsr #0x1a
    strh r2, [sp, #0x2]
    mov r2, r3, lsl #0x2
    ldrh r5, [sp, #0x2]
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    bic r5, r5, #0xfc0
    strh r5, [sp, #0x2]
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    ldrh r5, [sp, #0x2]
    str r1, [r0, #0x4]
    mov r3, r3, lsl #0x17
    bic r2, r5, #0x3000
    orr r6, r2, #0x3000
    ldrh r5, [sp, #0x4]
    ldr r2, _LIT4
    str r1, [r0, #0x8]
    and r2, r5, r2
    orr r3, r2, r3, lsr #0x11
    strh r3, [sp, #0x4]
    ldr r2, _LIT3
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    strh r8, [sp]
    strh r6, [sp, #0x2]
    mov r3, #0x4
    str r3, [r2, #0xd80]
    bl func_ov002_021fc1a0
    cmp r0, #0x0
    orrne r4, r4, #0x8
.L_83c:
    add sp, sp, #0x18
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_848:
    ldrh r0, [r5, #0x8]
    cmp r0, #0x0
    mov r0, r8
    bne .L_948
    bl func_0202b878
    cmp r0, #0x16
    beq .L_870
    cmp r0, #0x17
    beq .L_920
    b .L_978
.L_870:
    ldr r1, _LIT3
    mov r2, #0x4
    mov r0, r8
    str r2, [r1, #0xd80]
    mov r5, r4
    bl func_0202b8c0
    cmp r0, #0x5
    ldr r0, _LIT3
    moveq r5, #0x1
    ldr r2, [r0, #0xcf8]
    cmp r2, #0x2
    cmpne r2, #0x4
    bne .L_8bc
    ldr r1, _LIT3
    ldr r0, _LIT2
    ldr r1, [r1, #0xcec]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    moveq r5, #0x1
.L_8bc:
    cmp r2, #0x1
    ldreq r0, _LIT5
    cmpeq r8, r0
    moveq r5, #0x1
    cmp r5, #0x0
    beq .L_908
    mov r0, r8
    bl func_0202b8c0
    cmp r0, #0x3
    ldreq r0, _LIT3
    moveq r1, #0xa
    streq r1, [r0, #0xd80]
    mov r0, r7
    mov r1, r6
    mov r2, r8
    bl func_ov002_021fd668
    cmp r0, #0x0
    orrne r4, r4, #0x8
    b .L_978
.L_908:
    cmp r2, #0x3
    bne .L_978
    ldr r0, _LIT3
    mov r1, #0x5
    str r1, [r0, #0xd80]
    b .L_978
.L_920:
    ldr r3, _LIT3
    mov r5, #0x4
    mov r0, r7
    mov r1, r6
    mov r2, r8
    str r5, [r3, #0xd80]
    bl func_ov002_021fd668
    cmp r0, #0x0
    orrne r4, r4, #0x8
    b .L_978
.L_948:
    bl func_ov002_0225753c
    cmp r0, #0x0
    beq .L_978
    ldr r3, _LIT3
    mov r5, #0x4
    mov r0, r7
    mov r1, r6
    mov r2, r8
    str r5, [r3, #0xd80]
    bl func_ov002_021fd584
    cmp r0, #0x0
    orrne r4, r4, #0x8
.L_978:
    mov r0, r8
    bl func_0202e234
    cmp r0, #0x0
    bne .L_9a0
    ldr r2, _LIT6
    mov r0, #0x0
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    bicne r4, r4, #0x8
.L_9a0:
    mov r0, r4
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cd73c
_LIT3: .word data_ov002_022d016c
_LIT4: .word 0xffff803f
_LIT5: .word 0x0000131e
_LIT6: .word 0x00001407

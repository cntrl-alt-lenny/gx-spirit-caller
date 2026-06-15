; func_02058a08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021003c0
        .extern data_021003c8
        .extern data_021003d0
        .extern data_021003d8
        .extern data_02100408
        .extern data_02100414
        .extern data_0210041c
        .extern data_02100428
        .extern data_02100458
        .extern data_02100464
        .extern data_0210046c
        .extern data_02100478
        .extern data_02100488
        .extern data_02100490
        .extern data_02100498
        .extern data_021004a8
        .extern data_021004dc
        .extern data_021004e4
        .extern data_02100504
        .extern func_020453e8
        .extern func_02054868
        .extern func_02058528
        .extern func_020585d4
        .extern func_020590f0
        .extern func_0205938c
        .extern func_0205bd58
        .extern func_0205d688
        .extern func_0205d6f8
        .extern func_0205ffc0
        .extern func_0205ffd4
        .extern func_020602c4
        .extern func_020603cc
        .extern func_020604b0
        .extern func_020a73d4
        .extern func_020a7440
        .extern func_020a978c
        .extern func_020aaddc
        .extern func_020ab054
        .extern func_020ab0c4
        .extern func_020ace00
        .global func_02058a08
        .arm
func_02058a08:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x2a0
    mov r6, r2
    mov r8, r0
    mov r7, r1
    mov r1, r6
    mov r2, #0x0
    ldr r5, [r8]
    bl func_020603cc
    cmp r0, #0x0
    beq .L_a68
    ldr r2, [r5, #0x418]
    ldr r0, _LIT0
    cmp r2, r0
    bne .L_9c8
    ldr r1, [r5, #0x1a0]
    cmp r1, #0x0
    beq .L_9c8
    mov r0, r8
    bl func_0205d688
    mov r0, #0x0
    str r0, [r5, #0x19c]
    str r0, [r5, #0x1a0]
    b .L_9fc
.L_9c8:
    ldr r0, _LIT1
    cmp r2, r0
    bne .L_9fc
    ldr r1, _LIT2
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_020602c4
    cmp r0, #0x0
    beq .L_9fc
    add r0, sp, #0x4e
    bl func_020ace00
    str r0, [r5, #0x1a0]
.L_9fc:
    ldr r1, _LIT3
    mov r0, r6
    bl func_020ab0c4
    cmp r0, #0x0
    beq .L_a3c
    ldr r1, [r5, #0x418]
    mov r0, r8
    mov r2, r5
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x4
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a3c:
    ldr r1, [r5, #0x418]
    mov r0, r8
    mov r2, r5
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x4
    mov r2, #0x0
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a68:
    ldr r0, [r7, #0x14]
    ldr r4, [r7, #0x4]
    cmp r0, #0x1
    beq .L_a8c
    cmp r0, #0x2
    beq .L_c7c
    cmp r0, #0x3
    beq .L_b6c
    b .L_fe8
.L_a8c:
    ldr r1, _LIT4
    mov r0, r6
    mov r2, #0x5
    bl func_020ab054
    cmp r0, #0x0
    beq .L_ad0
    ldr r2, _LIT5
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_ad0:
    ldr r1, _LIT6
    mov r0, r6
    mov r2, r4
    mov r3, #0x80
    bl func_020602c4
    cmp r0, #0x0
    bne .L_b18
    ldr r2, _LIT5
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_b18:
    ldr r0, [r4, #0x304]
    cmp r0, #0x0
    beq .L_b48
    mov r0, r8
    mov r1, r4
    bl func_020590f0
    cmp r0, #0x0
    addne sp, sp, #0x2a0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, #0x3
    str r0, [r7, #0x14]
    b .L_fe8
.L_b48:
    mov r0, r8
    mov r1, r4
    bl func_0205938c
    cmp r0, #0x0
    addne sp, sp, #0x2a0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, #0x2
    str r0, [r7, #0x14]
    b .L_fe8
.L_b6c:
    ldr r1, _LIT7
    mov r0, r6
    mov r2, #0x5
    bl func_020ab054
    cmp r0, #0x0
    beq .L_bb0
    ldr r2, _LIT5
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_bb0:
    ldr r1, _LIT8
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_020602c4
    cmp r0, #0x0
    bne .L_bf8
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_bf8:
    add r0, sp, #0x4e
    bl func_020ace00
    str r0, [r5, #0x19c]
    ldr r1, _LIT10
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_020602c4
    cmp r0, #0x0
    bne .L_c4c
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_c4c:
    add r0, sp, #0x4e
    bl func_020ace00
    str r0, [r5, #0x1a0]
    mov r0, r8
    mov r1, r4
    bl func_0205938c
    cmp r0, #0x0
    addne sp, sp, #0x2a0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, #0x2
    str r0, [r7, #0x14]
    b .L_fe8
.L_c7c:
    ldr r1, _LIT11
    mov r0, r6
    mov r2, #0x5
    bl func_020ab054
    cmp r0, #0x0
    beq .L_cc0
    ldr r2, _LIT5
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_cc0:
    ldr r1, _LIT12
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_020602c4
    cmp r0, #0x0
    bne .L_d08
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_d08:
    add r0, sp, #0x4e
    bl func_020ace00
    str r0, [r5, #0x198]
    ldr r1, _LIT8
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_020602c4
    cmp r0, #0x0
    bne .L_d5c
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_d5c:
    add r0, sp, #0x4e
    bl func_020ace00
    str r0, [r5, #0x19c]
    ldr r1, _LIT10
    add r2, sp, #0x4e
    mov r0, r6
    mov r3, #0x200
    bl func_020602c4
    cmp r0, #0x0
    bne .L_db0
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_db0:
    add r0, sp, #0x4e
    bl func_020ace00
    str r0, [r5, #0x1a0]
    ldr r1, _LIT13
    add r2, sp, #0x39
    mov r0, r6
    mov r3, #0x15
    bl func_020602c4
    ldr r2, _LIT14
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [sp, #0x39]
    ldr r1, _LIT15
    mov r0, r6
    add r2, r5, r2
    mov r3, #0x19
    bl func_020602c4
    cmp r0, #0x0
    moveq r0, #0x0
    streqb r0, [r5, #0x474]
    ldrsb r0, [r4, #0xc2]
    cmp r0, #0x0
    addne r0, r4, #0xc2
    bne .L_e48
    add r0, r5, #0x100
    ldrsb r0, [r0, #0x2f]
    cmp r0, #0x0
    ldrne r0, _LIT16
    addne r0, r5, r0
    bne .L_e48
    add r0, sp, #0x200
    ldr r1, _LIT17
    add r0, r0, #0x4e
    add r2, r5, #0x110
    add r3, r5, #0x144
    bl func_020a978c
    add r0, sp, #0x200
    add r0, r0, #0x4e
.L_e48:
    str r0, [sp]
    str r4, [sp, #0x4]
    add r2, r4, #0x80
    str r2, [sp, #0x8]
    add r2, r4, #0xa1
    ldr r1, _LIT18
    ldr r3, _LIT19
    add r0, sp, #0x4e
    str r2, [sp, #0xc]
    bl func_020a978c
    add r0, sp, #0x4e
    bl func_020aaddc
    mov r1, r0
    add r0, sp, #0x4e
    add r2, sp, #0x18
    bl func_02054868
    ldr r1, _LIT20
    mov r0, r6
    add r2, sp, #0x4e
    mov r3, #0x200
    bl func_020602c4
    cmp r0, #0x0
    bne .L_ed0
    ldr r2, _LIT9
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_ed0:
    add r0, sp, #0x18
    add r1, sp, #0x4e
    mov r2, #0x20
    bl func_020a7440
    cmp r0, #0x0
    beq .L_f14
    ldr r2, _LIT21
    mov r0, r8
    mov r1, #0x108
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x2a0
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_f14:
    ldr r0, [r5, #0x100]
    cmp r0, #0x0
    beq .L_f3c
    ldr r1, [r5, #0x1a0]
    mov r0, r8
    bl func_0205d6f8
    ldr r1, [r5, #0x1a0]
    str r1, [r0]
    ldr r1, [r5, #0x19c]
    str r1, [r0, #0x4]
.L_f3c:
    mov r0, #0x3
    str r0, [r5, #0x1d8]
    ldr r1, [r7, #0xc]
    ldr r0, [r7, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0x10]
    str r0, [sp, #0x14]
    beq .L_fdc
    mov r0, #0x20
    bl func_020453e8
    movs r4, r0
    bne .L_f84
    ldr r1, _LIT22
    mov r0, r8
    bl func_0205ffc0
    add sp, sp, #0x2a0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_f84:
    mov r1, #0x0
    mov r2, #0x20
    bl func_020a73d4
    ldr r1, [r5, #0x1a0]
    mov r0, #0x0
    str r1, [r4, #0x4]
    str r0, [r4]
    add r1, sp, #0x39
    add r0, r4, #0x8
    mov r2, #0x15
    bl func_020604b0
    str r7, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    add r1, sp, #0x10
    mov r0, r8
    mov r3, r4
    ldmia r1, {r1, r2}
    bl func_02058528
    cmp r0, #0x0
    addne sp, sp, #0x2a0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_fdc:
    mov r0, r8
    mov r1, r7
    bl func_0205bd58
.L_fe8:
    mov r0, #0x0
    add sp, sp, #0x2a0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000106
_LIT1: .word 0x00000201
_LIT2: .word data_021003c0
_LIT3: .word data_021003c8
_LIT4: .word data_021003d0
_LIT5: .word data_021003d8
_LIT6: .word data_02100408
_LIT7: .word data_02100414
_LIT8: .word data_0210041c
_LIT9: .word data_02100428
_LIT10: .word data_02100458
_LIT11: .word data_02100464
_LIT12: .word data_0210046c
_LIT13: .word data_02100478
_LIT14: .word 0x00000474
_LIT15: .word data_02100488
_LIT16: .word 0x0000012f
_LIT17: .word data_02100490
_LIT18: .word data_02100498
_LIT19: .word data_021004a8
_LIT20: .word data_021004dc
_LIT21: .word data_021004e4
_LIT22: .word data_02100504

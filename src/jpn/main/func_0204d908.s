; func_0204d908 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba4
        .extern func_02046948
        .extern func_02046ad0
        .extern func_020490ac
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204991c
        .extern func_0204a93c
        .extern func_0204aa80
        .extern func_0204b034
        .extern func_0204b0c0
        .extern func_0204b20c
        .extern func_0204b5b8
        .extern func_0204bd18
        .extern func_0204bdcc
        .extern func_0204be8c
        .extern func_0204bed0
        .extern func_0204bfd8
        .extern func_0204c310
        .extern func_0204c398
        .extern func_0204c9fc
        .extern func_0204cae0
        .extern func_0204cbac
        .extern func_0204cdc8
        .extern func_0204ce1c
        .extern func_0204cf08
        .extern func_0204d3c4
        .extern func_0204d3f4
        .extern func_0204d440
        .extern func_0204d600
        .extern func_0204ea5c
        .extern func_0204ecdc
        .extern func_0204f034
        .extern func_0204ffe0
        .extern func_0206249c
        .extern func_020624bc
        .extern func_02065714
        .extern func_02067368
        .extern func_02068c54
        .extern func_02092fc8
        .extern func_020b3714
        .global func_0204d908
        .arm
func_0204d908:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x118
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov sl, r3
    ldr r6, [sp, #0x138]
    ldr r5, [sp, #0x13c]
    mov r4, #0x0
    bl func_0204987c
    cmp r0, #0x0
    beq .L_40
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x0
    bne .L_4c
.L_40:
    add sp, sp, #0x118
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_4c:
    bl func_02046948
    cmp r0, #0x5
    bne .L_7c
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x1
    bne .L_7c
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_7c
    bl func_0204b034
.L_7c:
    cmp r9, #0x40
    bgt .L_11c
    cmp r9, #0x40
    bge .L_e64
    cmp r9, #0x20
    addls pc, pc, r9, lsl #0x2
    b .L_ed8
    b .L_ed8
    b .L_124
    b .L_2f0
    b .L_4c8
    b .L_528
    b .L_648
    b .L_6c4
    b .L_7d4
    b .L_8ec
    b .L_a6c
    b .L_ac0
    b .L_124
    b .L_b68
    b .L_bdc
    b .L_bdc
    b .L_bdc
    b .L_c00
    b .L_c50
    b .L_cf4
    b .L_d50
    b .L_ed8
    b .L_ed8
    b .L_ed8
    b .L_ed8
    b .L_ed8
    b .L_ed8
    b .L_ed8
    b .L_ed8
    b .L_ed8
    b .L_ed8
    b .L_ed8
    b .L_ed8
    b .L_d68
.L_11c:
    cmp r9, #0x41
    b .L_ed8
.L_124:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    ldrne r0, [r6, #0x8]
    ldrne r7, [r6, #0x4]
    movne r0, r0, lsl #0x10
    movne sl, r0, lsr #0x10
    cmp r9, #0xb
    moveq r0, #0x1
    movne r0, #0x0
    str r0, [sp]
    ldr r3, [r6]
    mov r0, r8
    mov r1, r7
    mov r2, sl
    bl func_0204d600
    mov r5, r0
    cmp r5, #0x2
    bne .L_264
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1d4]
    mov r0, r8
    mov r1, r7
    mov r2, sl
    bl func_0204d440
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_1e8
    bl func_0204987c
    ldr r0, [r0, #0x464]
    cmp r0, #0x0
    beq .L_1e8
    bl func_0204987c
    mov r6, r0
    mov r0, r8
    bl func_020490ac
    mov r4, r0
    bl func_0204987c
    ldr r1, [r0, #0x468]
    ldr r2, [r6, #0x464]
    mov r0, r4
    blx r2
.L_1e8:
    bl func_0204987c
    ldrb r0, [r0, #0x14]
    mov r4, #0x1
    str r0, [sp, #0x14]
    bl func_0204987c
    ldrb r0, [r0, #0x14]
    cmp r0, #0x1
    blt .L_230
    add r6, sp, #0x14
.L_20c:
    bl func_0204987c
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xf4]
    str r0, [r6, r4, lsl #0x2]
    add r4, r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0x14]
    cmp r4, r0
    ble .L_20c
.L_230:
    bl func_0204987c
    ldr r1, [r0, #0x1c]
    add r0, sp, #0x14
    str r1, [r0, r4, lsl #0x2]
    bl func_0204987c
    ldrh r2, [r0, #0x1a]
    add r3, r4, #0x1
    add r1, sp, #0x14
    mov r0, #0xb
    str r2, [r1, r3, lsl #0x2]
    add r4, r4, #0x2
    bl func_02049868
    b .L_2b0
.L_264:
    cmp r5, #0x3
    bne .L_2b0
    bl func_0204987c
    ldrb r0, [r0, #0x16]
    cmp r0, #0x0
    beq .L_2b0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r1, [r6, #0x14]
    ldrb r0, [r0, #0x16]
    cmp r1, r0
    bne .L_2b0
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    moveq r0, #0x10
    streq r0, [sp, #0x14]
    moveq r4, #0x1
.L_2b0:
    cmp r5, #0xff
    beq .L_ed8
    add r1, sp, #0x14
    str r1, [sp]
    mov r0, r5
    mov r1, r8
    mov r2, r7
    mov r3, sl
    str r4, [sp, #0x4]
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_ed8
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_2f0:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x4
    bne .L_ed8
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    cmp r8, r0
    bne .L_ed8
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x200]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x19f]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1c0]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1b4]
    bl func_0204987c
    ldr r1, [r6]
    add r1, r6, r1, lsl #0x2
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x24]
    bl func_0204987c
    ldr r1, [r6]
    add r1, r6, r1, lsl #0x2
    ldr r1, [r1, #0x8]
    strh r1, [r0, #0xa4]
    bl func_0204987c
    ldr r1, [r6]
    add r1, r6, r1, lsl #0x2
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x1b0]
    bl func_0204987c
    ldr r1, [r6]
    add r0, r0, #0x100
    add r1, r6, r1, lsl #0x2
    ldr r1, [r1, #0x8]
    strh r1, [r0, #0xac]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_41c
    ldr r1, [r6]
    add r0, r6, #0x4
    bl func_0204c310
    cmp r0, #0x0
    beq .L_3d8
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_41c
    mov r0, r8
    mov r1, r6
    bl func_0204d3f4
    b .L_41c
.L_3d8:
    mov r0, r8
    bl func_0204cdc8
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, #0x0
    mov r1, r0
    mov r2, r8
    bl func_0204cf08
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_ed8
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_41c:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_4a0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_460
    mov r0, r8
    mov r1, r6
    bl func_0204d3f4
    bl func_0204c9fc
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_460:
    mov r0, #0x6
    bl func_02049868
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    mov r1, #0x0
    bl func_02068c54
    mov r2, r0
    mov r0, #0x0
    mov r1, r0
    bl func_0204ecdc
    bl func_0204a93c
    cmp r0, #0x0
    beq .L_ed8
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_4a0:
    mov r0, #0x5
    bl func_02049868
    mov r0, r8
    bl func_0204f034
    bl func_0204aa80
    cmp r0, #0x0
    beq .L_ed8
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_4c8:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x4
    bne .L_ed8
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    cmp r8, r0
    bne .L_ed8
    cmp r5, #0x0
    ble .L_514
    ldr r0, [r6]
    cmp r0, #0x10
    bne .L_514
    mov r0, #0xd
    mov r1, #0x0
    bl func_0204ffe0
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_514:
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    bl func_0204ce1c
    add sp, sp, #0x118
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_528:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x4
    bne .L_ed8
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    cmp r8, r0
    bne .L_ed8
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0x1c4]
    str r1, [r4, #0x1c8]
    bl func_0204987c
    ldr r0, [r0, #0x200]
    cmp r0, #0x0
    beq .L_57c
    bl func_0204987c
    ldrb r0, [r0, #0x19f]
    cmp r0, #0x10
    bcc .L_58c
.L_57c:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_5d0
.L_58c:
    bl func_0204987c
    mov r1, #0x1
    str r1, [r0, #0x1b4]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0x1b8]
    str r1, [r4, #0x1bc]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_ed8
    bl func_0204987c
    ldrb r1, [r0, #0x19f]
    add r1, r1, #0x1
    strb r1, [r0, #0x19f]
    b .L_ed8
.L_5d0:
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x200]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x19f]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_624
    mov r0, #0x3
    bl func_02049868
    bl func_0204987c
    mov r1, #0x1
    str r1, [r0, #0xe8]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0xec]
    str r1, [r4, #0xf0]
    b .L_ed8
.L_624:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_ed8
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0204cf08
    b .L_ed8
.L_648:
    bl func_0204987c
    ldrb r0, [r0, #0x17]
    cmp r0, #0x0
    beq .L_ed8
    bl func_0204987c
    ldr r0, [r0, #0x20]
    cmp r8, r0
    bne .L_ed8
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_6a8
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    bne .L_6a8
    bl func_0204987c
    ldr r0, [r0, #0xf8]
    cmp r8, r0
    bne .L_6a8
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_020624bc
.L_6a8:
    mov r0, r8
    bl func_0204cbac
    cmp r0, #0x0
    bne .L_ed8
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_6c4:
    ldr r0, [r6, #0x4]
    ldr r4, [r6]
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x1
    bne .L_6f0
    mov r0, #0x6
    bl func_02049868
    b .L_720
.L_6f0:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x6
    beq .L_710
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xb
    bne .L_ed8
.L_710:
    bl func_0204987c
    ldr r0, [r0, #0x20]
    cmp r8, r0
    bne .L_ed8
.L_720:
    bl func_0204987c
    mov r1, #0xff
    strb r1, [r0, #0x3c4]
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r0, #0x1
    add r0, r6, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    beq .L_76c
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r0, #0x1
    add r0, r6, r0, lsl #0x2
    str r8, [r0, #0xf4]
.L_76c:
    mov r1, r5, asr #0x8
    mov r0, r5, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    str r4, [sp, #0x10]
    strh r0, [sp, #0xe]
    bl func_0204987c
    mov r1, #0x1
    strb r1, [r0, #0x18c]
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_0206249c
    mov r4, r0
    bl func_0204987c
    add r3, r0, #0x18c
    mov r1, r4
    mov r0, #0x0
    add r2, sp, #0xc
    bl func_0204991c
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x184]
    str r1, [r0, #0x188]
    b .L_ed8
.L_7d4:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x1
    bne .L_ed8
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_ed8
    ldr r0, [r6]
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x4]
    and r4, r0, #0xff
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_868
    bl func_0204987c
    ldrb r0, [r0, #0x19e]
    cmp r0, #0x0
    bne .L_868
    ldr r0, [sp, #0x8]
    bl func_0204b20c
    str r0, [sp, #0x14]
    add r0, sp, #0x14
    str r0, [sp]
    mov r5, #0x1
    mov r1, r8
    mov r2, r7
    mov r3, sl
    mov r0, #0x20
    str r5, [sp, #0x4]
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_868:
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldrb r0, [r0, #0x14]
    ldr r1, [sp, #0x8]
    add r0, r0, #0x1
    add r0, r5, r0, lsl #0x2
    str r1, [r0, #0xf4]
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldrb r0, [r0, #0x14]
    add r0, r0, #0x1
    add r0, r5, r0
    strb r4, [r0, #0x2c8]
    bl func_0204987c
    ldr r0, [r0, #0x10]
    bl func_02067368
    bl func_0204987c
    ldr r0, [r0, #0x464]
    cmp r0, #0x0
    beq .L_ed8
    bl func_0204987c
    mov r5, r0
    ldr r0, [sp, #0x8]
    bl func_020490ac
    mov r4, r0
    bl func_0204987c
    ldr r1, [r0, #0x468]
    ldr r2, [r5, #0x464]
    mov r0, r4
    blx r2
    b .L_ed8
.L_8ec:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x1
    bne .L_ed8
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_ed8
    ldr r0, [r6]
    str r0, [sp, #0x8]
    cmp r0, #0x0
    bne .L_954
    ldr r5, [r6, #0x4]
    ldr r4, [r6, #0x8]
    bl func_0204987c
    add r0, r5, r0
    strb r4, [r0, #0x2c8]
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldr r2, [r0, #0x1f8]
    add r1, r4, r5, lsl #0x2
    mov r0, #0x3
    str r2, [r1, #0xf4]
    bl func_0204c398
    b .L_ed8
.L_954:
    ldr r0, [r6, #0x8]
    ldr r4, [r6, #0x4]
    and r5, r0, #0xff
    bl func_0204987c
    add r0, r0, r4, lsl #0x2
    ldr r1, [sp, #0x8]
    ldr r0, [r0, #0xf4]
    cmp r1, r0
    bne .L_9d4
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    sub r0, r0, #0x1
    cmp r4, r0
    bne .L_9d4
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    add r1, sp, #0x8
    str r1, [sp]
    mov r1, #0x1
    str r1, [sp, #0x4]
    ldrh r3, [r0, #0xa4]
    ldr r2, [r4, #0x24]
    mov r1, r8
    mov r0, #0x9
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_ed8
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_9d4:
    bl func_0204987c
    ldr r1, [sp, #0x8]
    add r0, r0, r4, lsl #0x2
    str r1, [r0, #0xf4]
    bl func_0204987c
    add r0, r4, r0
    strb r5, [r0, #0x2c8]
    bl func_0204987c
    ldr r1, [r6, #0xc]
    add r0, r0, r4, lsl #0x2
    str r1, [r0, #0x24]
    bl func_0204987c
    ldr r1, [r6, #0x10]
    add r0, r0, r4, lsl #0x1
    strh r1, [r0, #0xa4]
    bl func_0204987c
    ldr r1, [r6, #0xc]
    str r1, [r0, #0x1b0]
    bl func_0204987c
    add r1, r0, #0x100
    ldr r2, [r6, #0x10]
    mov r0, #0x5
    strh r2, [r1, #0xac]
    bl func_02049868
    ldr r0, [sp, #0x8]
    bl func_0204f034
    bl func_0204aa80
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1c0]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1b4]
    b .L_ed8
.L_a6c:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xd
    bne .L_ed8
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0x19c]
    ldr r1, [r6]
    add r0, r0, #0x1
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r1, r0
    bne .L_ed8
    bl func_0204987c
    ldrb r1, [r0, #0x19c]
    add r1, r1, #0x1
    strb r1, [r0, #0x19c]
    mov r0, #0x0
    bl func_0204c398
    b .L_ed8
.L_ac0:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x1
    beq .L_ae0
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x12
    bne .L_ed8
.L_ae0:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_b04
    ldr r1, [r6]
    add r0, r6, #0x4
    bl func_0204c310
    cmp r0, #0x0
    beq .L_b20
.L_b04:
    bl func_0204987c
    ldr r1, [r6, #0x4]
    str r1, [r0, #0x200]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x19f]
    b .L_b2c
.L_b20:
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x200]
.L_b2c:
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_b50
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_020624bc
    b .L_ed8
.L_b50:
    bl func_0204bdcc
    cmp r0, #0x0
    beq .L_ed8
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_b68:
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_ed8
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_b98
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_bb4
.L_b98:
    mov r0, r8
    bl func_0204cae0
    cmp r0, #0x0
    bne .L_ed8
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_bb4:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_ed8
    bl func_0204987c
    str r8, [r0, #0x204]
    bl func_0204bd18
    mov r0, #0x0
    bl func_0204bed0
    b .L_ed8
.L_bdc:
    ldr r2, [r6]
    mov r0, r8
    mov r1, r9
    bl func_0204b5b8
    cmp r0, #0x0
    bne .L_ed8
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_c00:
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    addne sp, sp, #0x118
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r5, #0x0
    mov r7, #0x0
    ble .L_ed8
    mov r4, r7
.L_c28:
    ldr r0, [r6, r7, lsl #0x2]
    mov r1, r4
    bl func_0204b0c0
    cmp r0, #0xff
    beq .L_c40
    bl func_02046ad0
.L_c40:
    add r7, r7, #0x1
    cmp r7, r5
    blt .L_c28
    b .L_ed8
.L_c50:
    ldr r0, _LIT0
    ldr r4, [r0]
    cmp r4, #0x0
    beq .L_cb0
    ldrb r0, [r4]
    cmp r0, #0x0
    beq .L_cb0
    bl func_02092fc8
    ldr r3, [r4, #0x10]
    ldr r2, [r4, #0x14]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT1
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, [r4, #0x4]
    cmp r1, #0x0
    cmpeq r0, r2
    movcs r0, #0x1
    strcs r0, [sp, #0x14]
    bcs .L_cb8
.L_cb0:
    mov r0, #0x0
    str r0, [sp, #0x14]
.L_cb8:
    add r0, sp, #0x14
    str r0, [sp]
    mov r4, #0x1
    mov r1, r8
    mov r2, r7
    mov r3, sl
    mov r0, #0x12
    str r4, [sp, #0x4]
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_ed8
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_cf4:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x13
    bne .L_ed8
    mov r0, r8
    mov r1, #0x0
    bl func_0204b0c0
    cmp r0, #0xff
    beq .L_ed8
    ldr r1, _LIT0
    mov r4, #0x1
    ldr r3, [r1]
    mov r5, r4, lsl r0
    ldr r2, [r3, #0x8]
    orr r0, r2, r4, lsl r0
    str r0, [r3, #0x8]
    ldr r0, [r6]
    cmp r0, #0x0
    ldrne r1, [r1]
    ldrne r0, [r1, #0xc]
    orrne r0, r0, r5
    strne r0, [r1, #0xc]
    b .L_ed8
.L_d50:
    mov r0, #0xc
    mov r1, #0x0
    bl func_0204ffe0
    add sp, sp, #0x118
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_d68:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_ed8
    bl func_0204987c
    ldrb r0, [r0, #0x19e]
    cmp r0, #0x0
    bne .L_ed8
    mov r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_ed8
.L_d9c:
    bl func_0204987c
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_e4c
    ldr r0, [r6]
    cmp r0, #0x0
    bne .L_e24
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xb
    beq .L_ddc
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xc
    bne .L_df4
.L_ddc:
    bl func_0204bfd8
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x118
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_df4:
    bl func_0204987c
    ldr r0, [r0, #0x194]
    cmp r0, #0x0
    beq .L_e1c
    bl func_0204987c
    ldr r0, [r0, #0x194]
    bl func_02065714
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x194]
.L_e1c:
    bl func_0204be8c
    b .L_ed8
.L_e24:
    bl func_0204987c
    mov r4, r0
    mov r0, r8
    mov r1, #0x0
    bl func_0204b0c0
    ldr r2, [r4, #0x1d4]
    mov r1, #0x1
    orr r0, r2, r1, lsl r0
    str r0, [r4, #0x1d4]
    b .L_ed8
.L_e4c:
    add r4, r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_d9c
    b .L_ed8
.L_e64:
    mov r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_ed8
.L_e78:
    bl func_0204987c
    add r0, r0, r4, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r8, r0
    bne .L_ec4
    mov r4, #0x0
    str r4, [sp]
    mov r1, r8
    mov r2, r7
    mov r3, sl
    mov r0, #0x41
    str r4, [sp, #0x4]
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_ed8
    add sp, sp, #0x118
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_ec4:
    add r4, r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_e78
.L_ed8:
    mov r0, #0x1
    add sp, sp, #0x118
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219dba4
_LIT1: .word 0x000082ea

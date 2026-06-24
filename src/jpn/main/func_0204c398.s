; func_0204c398 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff8e4
        .extern data_0219dbac
        .extern func_02048fc4
        .extern func_020490ac
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204ab14
        .extern func_0204b034
        .extern func_0204b05c
        .extern func_0204bae8
        .extern func_0204be8c
        .extern func_0204cf08
        .extern func_0204d3c4
        .extern func_0204ea5c
        .extern func_0204f20c
        .extern func_0204f7ac
        .extern func_02065dcc
        .extern func_02067368
        .extern func_02068c64
        .extern func_02068ee0
        .extern func_02092fc8
        .global func_0204c398
        .arm
func_0204c398:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x20
    cmp r0, #0x4
    mov r5, #0x3
    mov r4, #0x0
    addls pc, pc, r0, lsl #0x2
    b .L_628
    b .L_30
    b .L_3d4
    b .L_418
    b .L_4dc
    b .L_4fc
.L_30:
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    ldrb r1, [r6, #0x19c]
    sub r0, r0, #0x1
    cmp r1, r0
    bge .L_f0
    mov r0, #0xd
    bl func_02049868
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldrb r0, [r0, #0x19c]
    add r0, r0, #0x1
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    str r0, [sp, #0x8]
    bl func_0204987c
    ldrb r0, [r0, #0x19c]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldrb r0, [r0, #0x19c]
    add r0, r0, #0x1
    add r0, r5, r0
    ldrb r0, [r0, #0x2c8]
    str r0, [sp, #0x10]
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldrb r0, [r0, #0x19c]
    add r0, r0, #0x1
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0x24]
    str r0, [sp, #0x14]
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r0, [r0, #0x19c]
    mov r5, #0x5
    add r0, r0, #0x1
    add r0, r6, r0, lsl #0x1
    ldrh r0, [r0, #0xa4]
    str r0, [sp, #0x18]
    b .L_33c
.L_f0:
    bl func_0204987c
    mov r1, r4
    strb r1, [r0, #0x17]
    bl func_0204987c
    mov r1, r4
    str r1, [r0, #0x20]
    bl func_0204987c
    ldr r0, [r0, #0x10]
    bl func_02067368
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_130
    mov r0, r5
    bl func_02049868
    b .L_154
.L_130:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_14c
    mov r0, #0x4
    bl func_02049868
    b .L_154
.L_14c:
    mov r0, #0xa
    bl func_02049868
.L_154:
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x19c]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    beq .L_18c
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r1, [r6, #0xd]
    ldrb r0, [r0, #0x16]
    cmp r1, r0
    bne .L_23c
.L_18c:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_1c4
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r6, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    str r0, [r7, #0x204]
    b .L_1e4
.L_1c4:
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x204]
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    str r0, [r6, #0xf4]
.L_1e4:
    mov r0, #0x10
    bl func_02049868
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1cc]
    mov r7, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_32c
    mov r6, #0x2
.L_210:
    bl func_0204987c
    add r0, r0, r7
    ldrb r0, [r0, #0x2c8]
    mov r1, r6
    bl func_0204bae8
    add r7, r7, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r7, r0
    ble .L_210
    b .L_32c
.L_23c:
    mov r0, #0x0
    str r0, [sp, #0x8]
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    str r0, [sp, #0xc]
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r6, r0
    ldrb r0, [r0, #0x2c8]
    str r0, [sp, #0x10]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_2a0
    bl func_0204987c
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_0204987c
    mov r6, r0
    bl func_02092fc8
    str r0, [r6, #0xec]
    str r1, [r6, #0xf0]
    b .L_32c
.L_2a0:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_32c
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0204cf08
    bl func_0204987c
    ldrb r0, [r0, #0x19e]
    cmp r0, #0x0
    bne .L_32c
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x2
    bcc .L_32c
    bl func_0204987c
    mov r8, r0
    mov r0, #0x0
    bl func_0204b05c
    mov r6, r0
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    mov r1, #0x1
    ldr r2, [r8, #0x1d4]
    add r0, r7, r0
    ldrb r0, [r0, #0x2c8]
    mvn r0, r1, lsl r0
    and r0, r6, r0
    cmp r2, r0
    beq .L_32c
    bl func_0204be8c
    b .L_628
.L_32c:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    movne r4, #0x1
.L_33c:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x10
    beq .L_628
    bl func_0204987c
    mov sl, r0
    bl func_0204987c
    mov r9, r0
    bl func_0204987c
    mov r8, r0
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    add r1, sp, #0x8
    str r1, [sp]
    str r5, [sp, #0x4]
    mov ip, r0
    ldrb r3, [r9, #0xd]
    ldrb r2, [r7, #0xd]
    ldrb r1, [ip, #0xd]
    add r5, sl, r3, lsl #0x2
    add r2, r8, r2, lsl #0x2
    add r3, r6, r1, lsl #0x1
    ldrh r3, [r3, #0xa4]
    ldr r1, [r5, #0xf4]
    ldr r2, [r2, #0x24]
    mov r0, #0x8
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x3c5]
    b .L_628
.L_3d4:
    mov r0, #0x1
    bl func_02049868
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_410
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    str r0, [r5, #0x204]
.L_410:
    mov r4, #0x1
    b .L_628
.L_418:
    mov r0, #0x1
    bl func_02049868
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_440
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_460
.L_440:
    bl func_0204987c
    mov r1, #0x1
    strb r1, [r0, #0x17]
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    str r0, [r5, #0x20]
.L_460:
    bl func_0204b034
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    bls .L_628
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    mov r8, r0
    bl func_0204987c
    add r3, r8, #0xf4
    ldrb r2, [r0, #0xd]
    mov r1, #0x1
    mov r0, #0x9
    sub r2, r2, #0x1
    add r2, r3, r2, lsl #0x2
    str r2, [sp]
    str r1, [sp, #0x4]
    ldr r1, [r7, #0xf4]
    ldr r2, [r6, #0x24]
    ldrh r3, [r5, #0xa4]
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    beq .L_628
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_4dc:
    mov r0, #0x1
    bl func_02049868
    bl func_0204b034
    bl func_0204987c
    mov r1, r4
    str r1, [r0, #0x204]
    mov r4, #0x1
    b .L_628
.L_4fc:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    beq .L_51c
    ldr r1, _LIT0
    mov r0, #0x2
    mov r2, r4
    bl func_02048fc4
.L_51c:
    bl func_0204987c
    ldr r0, [r0, #0x204]
    cmp r0, #0x0
    moveq r7, #0x1
    movne r7, #0x0
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldr r0, [r0, #0x204]
    bl func_020490ac
    mov r5, r0
    bl func_0204987c
    str r5, [sp]
    ldr r1, [r0, #0x460]
    mov r0, #0x0
    str r1, [sp, #0x4]
    ldr r5, [r6, #0x45c]
    mov r2, r7
    mov r1, r0
    mov r3, r0
    blx r5
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_590
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_598
.L_590:
    bl func_0204f20c
    b .L_61c
.L_598:
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    beq .L_5c0
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068ee0
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0xe4]
.L_5c0:
    bl func_02065dcc
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_608
    bl func_0204f7ac
    bl func_0204ab14
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT1
    ldrb r1, [r0]
    cmp r1, #0x1
    moveq r1, #0x1
    streqb r1, [r0, #0x1]
    mov r0, #0xa
    bl func_02049868
    b .L_610
.L_608:
    mov r0, #0x1
    bl func_02049868
.L_610:
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x204]
.L_61c:
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a1]
.L_628:
    cmp r4, #0x0
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    addeq sp, sp, #0x20
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c64
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_020ff8e4
_LIT1: .word data_0219dbac

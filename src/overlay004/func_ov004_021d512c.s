; func_ov004_021d512c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern func_0203268c
        .extern func_02033c2c
        .extern func_02033c74
        .extern func_02033d28
        .extern func_020945f4
        .global func_ov004_021d512c
        .arm
func_ov004_021d512c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x38]
    mov r4, #0x0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, r4
    strne r4, [r5, #0x38]
    cmp r0, #0x0
    beq .L_394
    add r0, r5, #0x358
    mov r1, #0x0
    mov r2, #0xf0
    bl func_020945f4
    add r1, r5, #0x358
    add r0, r5, #0x48
    str r1, [sp]
    add ip, r0, #0x400
    add r0, r5, #0x344
    mov r1, #0x8
    mov r2, #0x1e
    mov r3, #0x0
    str ip, [sp, #0x4]
    bl func_02033c2c
    mov r0, #0x0
    strb r0, [r5, #0x261]
    strb r0, [r5, #0x260]
    strb r0, [r5, #0x262]
.L_394:
    bl func_0203268c
    ldr r1, [r0, #0xe7c]
    ldr r2, [r0, #0xeac]
    add r0, r5, #0x344
    mov r3, #0x6e
    bl func_02033c74
    ldr r2, _LIT0
    ldr r0, [r2, #0x88]
    cmp r0, #0x0
    blt .L_424
    ldr r0, [r2, #0x88]
    ldr r1, [r5, #0x350]
    mov r0, r0, lsl #0x18
    add r3, r1, r0, asr #0x16
    ldrb r0, [r3, #0x1]
    cmp r0, #0x6
    bne .L_3ec
    ldrb r1, [r3, #0x3]
    ldrb r0, [r3, #0x2]
    cmp r1, r0
    movcc r0, #0x1
    bcc .L_3f0
.L_3ec:
    mov r0, #0x0
.L_3f0:
    cmp r0, #0x0
    mvneq r0, #0x0
    streq r0, [r2, #0x88]
    beq .L_474
    ldrsb r1, [r3]
    mov r0, #0x1e
    mov r4, #0x1
    strb r1, [r5, #0x260]
    str r0, [r5, #0x30]
    str r4, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_474
.L_424:
    add r0, r2, #0x3000
    ldr r0, [r0, #0xc90]
    cmp r0, #0x0
    beq .L_450
    mov r0, #0x1c
    str r0, [r5, #0x30]
    mov r4, #0x1
    str r4, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_474
.L_450:
    ldr r0, [r2, #0x48]
    cmp r0, #0x1
    bne .L_474
    mov r0, #0x18
    str r0, [r5, #0x30]
    mov r4, #0x1
    str r4, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
.L_474:
    cmp r4, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    add r0, r5, #0x344
    bl func_02033d28
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220b500

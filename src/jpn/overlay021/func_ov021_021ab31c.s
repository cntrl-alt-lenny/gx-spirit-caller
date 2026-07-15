; func_ov021_021ab31c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern func_020060f4
        .extern func_02006160
        .extern func_02006178
        .extern func_0202160c
        .extern func_0202165c
        .extern func_02021668
        .extern func_020221f8
        .extern func_ov021_021ab8f0
        .extern func_ov021_021abbcc
        .global func_ov021_021ab31c
        .arm
func_ov021_021ab31c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r0
    mov r0, #0x0
    bl func_020221f8
    tst r0, #0x1
    mov r1, #0x3
    mov r2, #0x2
    beq .L_300
    ldr r0, [r7]
    bl func_0202160c
    mov r1, #0xb
    mov r2, #0x0
    bl func_0202165c
    mov r0, r7
    bl func_ov021_021abbcc
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_300:
    ldr r0, [r7, #0x50]
    cmp r0, #0x0
    ble .L_33c
    sub r0, r0, #0x1
    str r0, [r7, #0x50]
    ldr r0, [r7]
    bl func_0202160c
    mov r1, #0xb
    mov r2, #0x0
    bl func_0202165c
    mov r0, r7
    bl func_ov021_021abbcc
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_33c:
    ldr r0, [r7]
    bl func_0202160c
    mov r1, #0xb
    mov r2, #0x1f
    bl func_0202165c
    ldr r0, _LIT0
    mov r4, #0x0
    mov r6, r4
    ldrh r5, [r0, #0x54]
    ldrh r8, [r0, #0x56]
    bl func_02006178
    cmp r0, #0x0
    bne .L_37c
    bl func_02006160
    cmp r0, #0x0
    beq .L_3f8
.L_37c:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    ldr r1, [sp, #0x4]
    ldr r0, [sp]
    add r5, r1, #0x28
    ldr r1, _LIT1
    add r3, r0, #0x30
    smull r0, ip, r1, r5
    mov r0, r5, lsr #0x1f
    ldr r2, _LIT2
    add ip, r0, ip, asr #0x3
    smull r0, r1, r2, r3
    mov r0, r3, lsr #0x1f
    add r1, r0, r1, asr #0x4
    subs r2, ip, #0x1
    sub r0, r1, #0x1
    bmi .L_494
    cmp r2, #0x5
    bge .L_494
    cmp r0, #0x0
    blt .L_494
    cmp r0, #0x2
    bge .L_494
    str r2, [r7, #0x44]
    mov r4, #0x1
    str r0, [r7, #0x48]
    bl func_02006160
    cmp r0, #0x0
    movne r6, r4
    b .L_494
.L_3f8:
    tst r5, #0x1
    movne r6, #0x1
    bne .L_494
    tst r8, #0xf0
    beq .L_494
    tst r8, #0x20
    beq .L_42c
    ldr r0, [r7, #0x44]
    subs r0, r0, #0x1
    str r0, [r7, #0x44]
    movmi r0, #0x4
    strmi r0, [r7, #0x44]
    b .L_490
.L_42c:
    tst r8, #0x10
    beq .L_450
    ldr r0, [r7, #0x44]
    add r0, r0, #0x1
    str r0, [r7, #0x44]
    cmp r0, #0x5
    movge r0, r4
    strge r0, [r7, #0x44]
    b .L_490
.L_450:
    tst r8, #0x40
    beq .L_470
    ldr r0, [r7, #0x48]
    subs r0, r0, #0x1
    str r0, [r7, #0x48]
    movmi r0, #0x1
    strmi r0, [r7, #0x48]
    b .L_490
.L_470:
    tst r8, #0x80
    beq .L_490
    ldr r0, [r7, #0x48]
    add r0, r0, #0x1
    str r0, [r7, #0x48]
    cmp r0, #0x2
    movge r0, r4
    strge r0, [r7, #0x48]
.L_490:
    mov r4, #0x1
.L_494:
    cmp r4, #0x0
    beq .L_504
    ldr r0, [r7]
    mov r1, #0x3
    mov r2, #0x2
    bl func_0202160c
    mov r1, #0x0
    mov r4, r0
    bl func_02021668
    ldr r1, [r7, #0x44]
    orr r5, r0, #0x10
    sub r1, r1, #0x2
    mov r0, #0x48
    mul r2, r1, r0
    mov r0, r4
    mov r1, #0x3
    bl func_0202165c
    ldr r0, [r7, #0x48]
    mov r1, #0x4
    cmp r0, #0x0
    moveq r2, #0x38
    mvnne r2, #0x37
    mov r0, r4
    bl func_0202165c
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_0202165c
.L_504:
    cmp r6, #0x0
    beq .L_558
    ldr r0, [r7, #0x48]
    ldr r1, [r7, #0x44]
    add r0, r0, r0, lsl #0x2
    add r0, r1, r0
    add r0, r7, r0, lsl #0x2
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    bne .L_558
    mov r0, r7
    bl func_ov021_021ab8f0
    ldr r0, [r7]
    mov r1, #0x3
    mov r2, #0x2
    bl func_0202160c
    mov r1, #0xb
    mov r2, #0x0
    bl func_0202165c
    mov r0, #0x1
    str r0, [r7, #0x3c]
.L_558:
    mov r0, r7
    bl func_ov021_021abbcc
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02104acc
_LIT1: .word 0x2aaaaaab
_LIT2: .word 0x38e38e39

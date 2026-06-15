; func_ov021_021ab3fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern func_02006110
        .extern func_0200617c
        .extern func_02006194
        .extern func_02021660
        .extern func_020216b0
        .extern func_020216bc
        .extern func_0202224c
        .extern func_ov021_021ab9d0
        .extern func_ov021_021abcac
        .global func_ov021_021ab3fc
        .arm
func_ov021_021ab3fc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r0
    mov r0, #0x0
    bl func_0202224c
    tst r0, #0x1
    mov r1, #0x3
    mov r2, #0x2
    beq .L_2f8
    ldr r0, [r7]
    bl func_02021660
    mov r1, #0xb
    mov r2, #0x0
    bl func_020216b0
    mov r0, r7
    bl func_ov021_021abcac
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2f8:
    ldr r0, [r7, #0x50]
    cmp r0, #0x0
    ble .L_334
    sub r0, r0, #0x1
    str r0, [r7, #0x50]
    ldr r0, [r7]
    bl func_02021660
    mov r1, #0xb
    mov r2, #0x0
    bl func_020216b0
    mov r0, r7
    bl func_ov021_021abcac
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_334:
    ldr r0, [r7]
    bl func_02021660
    mov r1, #0xb
    mov r2, #0x1f
    bl func_020216b0
    ldr r0, _LIT0
    mov r4, #0x0
    mov r6, r4
    ldrh r5, [r0, #0x54]
    ldrh r8, [r0, #0x56]
    bl func_02006194
    cmp r0, #0x0
    bne .L_374
    bl func_0200617c
    cmp r0, #0x0
    beq .L_3f0
.L_374:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
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
    bmi .L_48c
    cmp r2, #0x5
    bge .L_48c
    cmp r0, #0x0
    blt .L_48c
    cmp r0, #0x2
    bge .L_48c
    str r2, [r7, #0x44]
    mov r4, #0x1
    str r0, [r7, #0x48]
    bl func_0200617c
    cmp r0, #0x0
    movne r6, r4
    b .L_48c
.L_3f0:
    tst r5, #0x1
    movne r6, #0x1
    bne .L_48c
    tst r8, #0xf0
    beq .L_48c
    tst r8, #0x20
    beq .L_424
    ldr r0, [r7, #0x44]
    subs r0, r0, #0x1
    str r0, [r7, #0x44]
    movmi r0, #0x4
    strmi r0, [r7, #0x44]
    b .L_488
.L_424:
    tst r8, #0x10
    beq .L_448
    ldr r0, [r7, #0x44]
    add r0, r0, #0x1
    str r0, [r7, #0x44]
    cmp r0, #0x5
    movge r0, r4
    strge r0, [r7, #0x44]
    b .L_488
.L_448:
    tst r8, #0x40
    beq .L_468
    ldr r0, [r7, #0x48]
    subs r0, r0, #0x1
    str r0, [r7, #0x48]
    movmi r0, #0x1
    strmi r0, [r7, #0x48]
    b .L_488
.L_468:
    tst r8, #0x80
    beq .L_488
    ldr r0, [r7, #0x48]
    add r0, r0, #0x1
    str r0, [r7, #0x48]
    cmp r0, #0x2
    movge r0, r4
    strge r0, [r7, #0x48]
.L_488:
    mov r4, #0x1
.L_48c:
    cmp r4, #0x0
    beq .L_4fc
    ldr r0, [r7]
    mov r1, #0x3
    mov r2, #0x2
    bl func_02021660
    mov r1, #0x0
    mov r4, r0
    bl func_020216bc
    ldr r1, [r7, #0x44]
    orr r5, r0, #0x10
    sub r1, r1, #0x2
    mov r0, #0x48
    mul r2, r1, r0
    mov r0, r4
    mov r1, #0x3
    bl func_020216b0
    ldr r0, [r7, #0x48]
    mov r1, #0x4
    cmp r0, #0x0
    moveq r2, #0x38
    mvnne r2, #0x37
    mov r0, r4
    bl func_020216b0
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_020216b0
.L_4fc:
    cmp r6, #0x0
    beq .L_550
    ldr r0, [r7, #0x48]
    ldr r1, [r7, #0x44]
    add r0, r0, r0, lsl #0x2
    add r0, r1, r0
    add r0, r7, r0, lsl #0x2
    ldr r0, [r0, #0x9c]
    cmp r0, #0x0
    bne .L_550
    mov r0, r7
    bl func_ov021_021ab9d0
    ldr r0, [r7]
    mov r1, #0x3
    mov r2, #0x2
    bl func_02021660
    mov r1, #0xb
    mov r2, #0x0
    bl func_020216b0
    mov r0, #0x1
    str r0, [r7, #0x3c]
.L_550:
    mov r0, r7
    bl func_ov021_021abcac
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02104bac
_LIT1: .word 0x2aaaaaab
_LIT2: .word 0x38e38e39

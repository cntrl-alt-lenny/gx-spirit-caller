; func_ov016_021b5dd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005dac
        .extern func_02006110
        .extern func_020061ac
        .extern func_020944a4
        .global func_ov016_021b5dd0
        .arm
func_ov016_021b5dd0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    ldr r1, [r0, #0x14]
    ldr r2, [r0, #0x4]
    rsb r1, r1, #0xc0
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    ldr r3, [r0, #0x18]
    sub r1, r1, #0x8
    cmp r2, #0x1
    add r4, r3, r1
    bne .L_52c
    ldr r1, [r0]
    cmp r1, #0x1
    beq .L_3ac
    cmp r1, #0x2
    beq .L_434
    b .L_52c
.L_3ac:
    add r0, sp, #0xc
    add r1, sp, #0x8
    add r5, r4, #0x5
    mov r6, #0x0
    bl func_02006110
    ldr r0, [sp, #0xc]
    cmp r0, #0x68
    ldrge r1, [sp, #0x8]
    cmpge r1, r5
    blt .L_3e4
    cmp r0, #0x98
    addlt r0, r5, #0x12
    cmplt r1, r0
    movlt r6, #0x1
.L_3e4:
    mov r5, #0x26c
    bl func_020061ac
    cmp r0, #0x0
    sub r1, r4, #0x2
    cmpne r6, #0x0
    movne r5, #0x274
    orr r2, r5, #0x400
    ldr r0, _LIT0
    and r1, r1, #0xff
    orr r3, r1, r0
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020944a4
    b .L_52c
.L_434:
    ldr r6, [r0, #0x10]
    add r0, sp, #0xc
    add r1, sp, #0x8
    add r9, r4, #0x5
    bl func_02006110
    sub r0, r4, #0x2
    and r0, r0, #0xff
    orr fp, r0, #0x4000
    mov r5, #0x0
    mov r7, r5
    orr fp, fp, #-1073741824
    add r4, r9, #0x12
.L_464:
    cmp r6, #0x0
    mov r8, #0x0
    beq .L_4ac
    ldr r1, [sp, #0xc]
    cmp r1, #0xa0
    ldrge r0, [sp, #0x8]
    cmpge r0, r9
    blt .L_490
    cmp r1, #0xd0
    cmplt r0, r4
    movlt r8, #0x1
.L_490:
    rsb sl, r7, #0x26c
    bl func_020061ac
    cmp r0, #0x0
    cmpne r8, #0x0
    movne sl, #0x274
    mov r0, #0x9c
    b .L_4e4
.L_4ac:
    ldr r1, [sp, #0xc]
    cmp r1, #0x30
    ldrge r0, [sp, #0x8]
    cmpge r0, r9
    blt .L_4cc
    cmp r1, #0x60
    cmplt r0, r4
    movlt r8, #0x1
.L_4cc:
    rsb sl, r7, #0x26c
    bl func_020061ac
    cmp r0, #0x0
    cmpne r8, #0x0
    movne sl, #0x274
    mov r0, #0x2c
.L_4e4:
    sub r0, r0, #0x4
    mov r0, r0, lsl #0x17
    orr r0, fp, r0, lsr #0x7
    str r0, [sp]
    orr r0, sl, #0x400
    strh r0, [sp, #0x4]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020944a4
    add r5, r5, #0x1
    rsb r6, r6, #0x1
    add r7, r7, #0x8
    cmp r5, #0x2
    blt .L_464
.L_52c:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xc0614000

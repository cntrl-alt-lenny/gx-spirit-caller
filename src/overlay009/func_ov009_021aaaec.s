; func_ov009_021aaaec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005dac
        .extern func_02006110
        .extern func_020061ac
        .extern func_020944a4
        .global func_ov009_021aaaec
        .arm
func_ov009_021aaaec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    ldr r1, [r0, #0x1c]
    ldr r2, [r0, #0xc]
    rsb r1, r1, #0xc0
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    ldr r3, [r0, #0x20]
    sub r1, r1, #0x8
    cmp r2, #0x1
    add r4, r3, r1
    bne .L_80c
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_68c
    cmp r1, #0x1
    beq .L_714
    b .L_80c
.L_68c:
    add r0, sp, #0xc
    add r1, sp, #0x8
    add r5, r4, #0x5
    mov r6, #0x0
    bl func_02006110
    ldr r0, [sp, #0xc]
    cmp r0, #0x68
    ldrge r1, [sp, #0x8]
    cmpge r1, r5
    blt .L_6c4
    cmp r0, #0x98
    addlt r0, r5, #0x12
    cmplt r1, r0
    movlt r6, #0x1
.L_6c4:
    mov r5, #0x34
    bl func_020061ac
    cmp r0, #0x0
    sub r1, r4, #0x2
    cmpne r6, #0x0
    movne r5, #0x3c
    orr r2, r5, #0x2400
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
    b .L_80c
.L_714:
    ldr r6, [r0, #0x18]
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
.L_744:
    cmp r6, #0x0
    mov r8, #0x0
    beq .L_78c
    ldr r1, [sp, #0xc]
    cmp r1, #0xa0
    ldrge r0, [sp, #0x8]
    cmpge r0, r9
    blt .L_770
    cmp r1, #0xd0
    cmplt r0, r4
    movlt r8, #0x1
.L_770:
    rsb sl, r7, #0x34
    bl func_020061ac
    cmp r0, #0x0
    cmpne r8, #0x0
    movne sl, #0x3c
    mov r0, #0x9c
    b .L_7c4
.L_78c:
    ldr r1, [sp, #0xc]
    cmp r1, #0x30
    ldrge r0, [sp, #0x8]
    cmpge r0, r9
    blt .L_7ac
    cmp r1, #0x60
    cmplt r0, r4
    movlt r8, #0x1
.L_7ac:
    rsb sl, r7, #0x34
    bl func_020061ac
    cmp r0, #0x0
    cmpne r8, #0x0
    movne sl, #0x3c
    mov r0, #0x2c
.L_7c4:
    sub r0, r0, #0x4
    mov r0, r0, lsl #0x17
    orr r0, fp, r0, lsr #0x7
    str r0, [sp]
    orr r0, sl, #0x2400
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
    blt .L_744
.L_80c:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xc0614000

; func_ov005_021b1280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005d90
        .extern func_020060f4
        .extern func_02006190
        .extern func_020943b0
        .global func_ov005_021b1280
        .arm
func_ov005_021b1280:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    mov r7, r0
    ldr r0, [r7, #0xc]
    ldr r1, [r7]
    rsb r0, r0, #0xc0
    add r0, r0, r0, lsr #0x1f
    mov r2, r0, asr #0x1
    ldr r0, [r7, #0x10]
    sub r6, r2, #0x8
    cmp r1, #0x1
    add r4, r0, r6
    mov r5, #0x0
    bne .L_51c
    add r0, sp, #0xc
    add r1, sp, #0x8
    bl func_020060f4
    ldr r0, [r7, #0x18]
    and r0, r0, #0xf
    cmp r0, #0x1
    beq .L_3ac
    cmp r0, #0x2
    beq .L_42c
    b .L_51c
.L_3ac:
    ldr r1, [r7, #0x10]
    ldr r0, [sp, #0xc]
    add r1, r1, r6
    add r2, r1, #0x5
    cmp r0, r2
    ldrge r1, [sp, #0x8]
    cmpge r1, r2
    blt .L_3dc
    cmp r0, #0x98
    addlt r0, r2, #0x12
    cmplt r1, r0
    movlt r5, #0x1
.L_3dc:
    mov r6, #0x27
    bl func_02006190
    cmp r0, #0x0
    sub r1, r4, #0x2
    cmpne r5, #0x0
    movne r6, #0x2f
    orr r2, r6, #0x6400
    ldr r0, _LIT0
    and r1, r1, #0xff
    orr r3, r1, r0
    mov r0, #0x2
    mov r1, #0x0
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020943b0
    b .L_51c
.L_42c:
    ldr r1, [r7, #0x10]
    sub r0, r4, #0x2
    and r0, r0, #0xff
    add r1, r1, r6
    orr fp, r0, #0x4000
    ldr r6, [r7, #0x8]
    add r7, r1, #0x5
    mov r8, r5
    orr fp, fp, #-1073741824
    add r4, r7, #0x12
.L_454:
    cmp r6, #0x0
    mov r9, #0x0
    beq .L_49c
    ldr r1, [sp, #0xc]
    cmp r1, #0xa0
    ldrge r0, [sp, #0x8]
    cmpge r0, r7
    blt .L_480
    cmp r1, #0xd0
    cmplt r0, r4
    movlt r9, #0x1
.L_480:
    rsb sl, r8, #0x27
    bl func_02006190
    cmp r0, #0x0
    cmpne r9, #0x0
    movne sl, #0x2f
    mov r0, #0x9c
    b .L_4d4
.L_49c:
    ldr r1, [sp, #0xc]
    cmp r1, #0x30
    ldrge r0, [sp, #0x8]
    cmpge r0, r7
    blt .L_4bc
    cmp r1, #0x60
    cmplt r0, r4
    movlt r9, #0x1
.L_4bc:
    rsb sl, r8, #0x27
    bl func_02006190
    cmp r0, #0x0
    cmpne r9, #0x0
    movne sl, #0x2f
    mov r0, #0x2c
.L_4d4:
    sub r0, r0, #0x4
    mov r0, r0, lsl #0x17
    orr r0, fp, r0, lsr #0x7
    str r0, [sp]
    orr r0, sl, #0x6400
    strh r0, [sp, #0x4]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020943b0
    add r5, r5, #0x1
    rsb r6, r6, #0x1
    add r8, r8, #0x8
    cmp r5, #0x2
    blt .L_454
.L_51c:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xc0614000

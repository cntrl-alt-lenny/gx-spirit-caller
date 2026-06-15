; func_020a7d0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3808
        .extern func_020b3814
        .global func_020a7d0c
        .arm
func_020a7d0c:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    mov r9, r1
    mov r1, #0x0
    mov sl, r0
    mov r6, r2
    mov r0, r1
    strb r0, [r6, #-1]!
    ldr r0, [sp, #0x58]
    cmp r9, #0x0
    str r0, [sp, #0x10]
    ldrb r0, [sp, #0x4f]
    cmpeq sl, #0x0
    str r2, [sp]
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x54]
    str r1, [sp, #0x14]
    str r0, [sp, #0x8]
    ldrb r0, [sp, #0x4d]
    mov r7, r1
    ldrb r8, [sp, #0x51]
    str r0, [sp, #0xc]
    ldreq r0, [sp, #0x10]
    cmpeq r0, #0x0
    bne .L_9b4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_9a0
    cmp r8, #0x6f
    beq .L_9b4
.L_9a0:
    add sp, sp, #0x18
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_9b4:
    cmp r8, #0x69
    bgt .L_9dc
    bge .L_a0c
    cmp r8, #0x58
    bgt .L_9d0
    beq .L_a60
    b .L_a6c
.L_9d0:
    cmp r8, #0x64
    beq .L_a0c
    b .L_a6c
.L_9dc:
    cmp r8, #0x6f
    bgt .L_9ec
    beq .L_a40
    b .L_a6c
.L_9ec:
    cmp r8, #0x78
    bgt .L_a6c
    cmp r8, #0x75
    blt .L_a6c
    beq .L_a50
    cmp r8, #0x78
    beq .L_a60
    b .L_a6c
.L_a0c:
    subs r0, sl, #0x0
    sbcs r0, r9, #0x0
    mov fp, #0xa
    mov r5, #0x0
    bge .L_a6c
    cmp r9, #-2147483648
    cmpeq sl, r5
    beq .L_a34
    rsbs sl, sl, #0x0
    rsc r9, r9, #0x0
.L_a34:
    mov r0, #0x1
    str r0, [sp, #0x14]
    b .L_a6c
.L_a40:
    mov r5, #0x0
    str r5, [sp, #0xc]
    mov fp, #0x8
    b .L_a6c
.L_a50:
    mov r5, #0x0
    str r5, [sp, #0xc]
    mov fp, #0xa
    b .L_a6c
.L_a60:
    mov r5, #0x0
    str r5, [sp, #0xc]
    mov fp, #0x10
.L_a6c:
    mov r0, sl
    mov r1, r9
    mov r2, fp
    mov r3, r5
    bl func_020b3814
    mov r4, r0
    mov r0, sl
    mov r1, r9
    mov r2, fp
    mov r3, r5
    bl func_020b3808
    mov sl, r0
    cmp r4, #0xa
    mov r9, r1
    addlt r0, r4, #0x30
    blt .L_ab8
    cmp r8, #0x78
    addeq r0, r4, #0x57
    addne r0, r4, #0x37
.L_ab8:
    strb r0, [r6, #-1]!
    mov r0, #0x0
    cmp r9, r0
    cmpeq sl, r0
    add r7, r7, #0x1
    bne .L_a6c
    cmp r5, #0x0
    cmpeq fp, #0x8
    bne .L_af8
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrnesb r0, [r6]
    cmpne r0, #0x30
    movne r0, #0x30
    strneb r0, [r6, #-1]!
    addne r7, r7, #0x1
.L_af8:
    ldrb r0, [sp, #0x4c]
    cmp r0, #0x2
    bne .L_b48
    ldr r0, [sp, #0x8]
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    ldreq r0, [sp, #0xc]
    cmpeq r0, #0x0
    ldrne r0, [sp, #0x10]
    subne r0, r0, #0x1
    strne r0, [sp, #0x10]
    cmp r5, #0x0
    cmpeq fp, #0x10
    bne .L_b48
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrne r0, [sp, #0x10]
    subne r0, r0, #0x2
    strne r0, [sp, #0x10]
.L_b48:
    ldr r0, [sp]
    ldr r1, _LIT0
    sub r2, r0, r6
    ldr r0, [sp, #0x10]
    add r0, r0, r2
    cmp r0, r1
    addgt sp, sp, #0x18
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addgt sp, sp, #0x10
    bxgt lr
    ldr r0, [sp, #0x10]
    cmp r7, r0
    bge .L_b98
    mov r1, #0x30
.L_b84:
    ldr r0, [sp, #0x10]
    add r7, r7, #0x1
    cmp r7, r0
    strb r1, [r6, #-1]!
    blt .L_b84
.L_b98:
    cmp r5, #0x0
    cmpeq fp, #0x10
    bne .L_bb8
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x30
    strneb r8, [r6, #-1]
    strneb r0, [r6, #-2]!
.L_bb8:
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    movne r0, #0x2d
    strneb r0, [r6, #-1]!
    bne .L_bec
    ldr r0, [sp, #0xc]
    cmp r0, #0x1
    moveq r0, #0x2b
    streqb r0, [r6, #-1]!
    beq .L_bec
    cmp r0, #0x2
    moveq r0, #0x20
    streqb r0, [r6, #-1]!
.L_bec:
    mov r0, r6
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd

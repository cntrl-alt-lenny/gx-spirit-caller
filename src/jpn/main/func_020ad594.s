; func_020ad594 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3714
        .extern func_020b3720
        .global func_020ad594
        .arm
func_020ad594:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    mov r9, r1
    mov r1, #0x0
    mov sl, r0
    mov r6, r2
    mov r0, r1
    strh r0, [r6, #-2]!
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
    ldrh r8, [sp, #0x52]
    str r0, [sp, #0xc]
    ldreq r0, [sp, #0x10]
    cmpeq r0, #0x0
    bne .L_90
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_7c
    cmp r8, #0x6f
    beq .L_90
.L_7c:
    add sp, sp, #0x18
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_90:
    cmp r8, #0x69
    bgt .L_b8
    bge .L_e8
    cmp r8, #0x58
    bgt .L_ac
    beq .L_13c
    b .L_148
.L_ac:
    cmp r8, #0x64
    beq .L_e8
    b .L_148
.L_b8:
    cmp r8, #0x6f
    bgt .L_c8
    beq .L_11c
    b .L_148
.L_c8:
    cmp r8, #0x78
    bgt .L_148
    cmp r8, #0x75
    blt .L_148
    beq .L_12c
    cmp r8, #0x78
    beq .L_13c
    b .L_148
.L_e8:
    subs r0, sl, #0x0
    sbcs r0, r9, #0x0
    mov fp, #0xa
    mov r5, #0x0
    bge .L_148
    cmp r9, #-2147483648
    cmpeq sl, r5
    beq .L_110
    rsbs sl, sl, #0x0
    rsc r9, r9, #0x0
.L_110:
    mov r0, #0x1
    str r0, [sp, #0x14]
    b .L_148
.L_11c:
    mov r5, #0x0
    str r5, [sp, #0xc]
    mov fp, #0x8
    b .L_148
.L_12c:
    mov r5, #0x0
    str r5, [sp, #0xc]
    mov fp, #0xa
    b .L_148
.L_13c:
    mov r5, #0x0
    str r5, [sp, #0xc]
    mov fp, #0x10
.L_148:
    mov r0, sl
    mov r1, r9
    mov r2, fp
    mov r3, r5
    bl func_020b3720
    mov r4, r0
    mov r0, sl
    mov r1, r9
    mov r2, fp
    mov r3, r5
    bl func_020b3714
    mov sl, r0
    cmp r4, #0xa
    mov r9, r1
    addlt r0, r4, #0x30
    blt .L_194
    cmp r8, #0x78
    addeq r0, r4, #0x57
    addne r0, r4, #0x37
.L_194:
    strh r0, [r6, #-2]!
    mov r0, #0x0
    cmp r9, r0
    cmpeq sl, r0
    add r7, r7, #0x1
    bne .L_148
    cmp r5, #0x0
    cmpeq fp, #0x8
    bne .L_1d4
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrneh r0, [r6]
    cmpne r0, #0x30
    movne r0, #0x30
    strneh r0, [r6, #-2]!
    addne r7, r7, #0x1
.L_1d4:
    ldrb r0, [sp, #0x4c]
    cmp r0, #0x2
    bne .L_224
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
    bne .L_224
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrne r0, [sp, #0x10]
    subne r0, r0, #0x2
    strne r0, [sp, #0x10]
.L_224:
    ldr r0, [sp]
    ldr r2, _LIT0
    sub r0, r0, r6
    add r1, r0, r0, lsr #0x1f
    ldr r0, [sp, #0x10]
    add r0, r0, r1, asr #0x1
    cmp r0, r2
    addgt sp, sp, #0x18
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addgt sp, sp, #0x10
    bxgt lr
    ldr r0, [sp, #0x10]
    cmp r7, r0
    bge .L_278
    mov r1, #0x30
.L_264:
    ldr r0, [sp, #0x10]
    add r7, r7, #0x1
    cmp r7, r0
    strh r1, [r6, #-2]!
    blt .L_264
.L_278:
    cmp r5, #0x0
    cmpeq fp, #0x10
    bne .L_298
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x30
    strneh r8, [r6, #-2]
    strneh r0, [r6, #-4]!
.L_298:
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    movne r0, #0x2d
    strneh r0, [r6, #-2]!
    bne .L_2cc
    ldr r0, [sp, #0xc]
    cmp r0, #0x1
    moveq r0, #0x2b
    streqh r0, [r6, #-2]!
    beq .L_2cc
    cmp r0, #0x2
    moveq r0, #0x20
    streqh r0, [r6, #-2]!
.L_2cc:
    mov r0, r6
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd

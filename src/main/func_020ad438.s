; func_020ad438 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3a7c
        .global func_020ad438
        .arm
func_020ad438:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    movs sl, r0
    mov r0, #0x0
    mov r5, r1
    str r0, [sp, #0xc]
    ldr r7, [sp, #0x4c]
    mov r6, r0
    strh r0, [r5, #-2]!
    ldrb r0, [sp, #0x43]
    str r1, [sp]
    ldrh r8, [sp, #0x46]
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x48]
    ldrb fp, [sp, #0x41]
    str r0, [sp, #0x8]
    cmpeq r7, #0x0
    bne .L_614
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_600
    cmp r8, #0x6f
    beq .L_614
.L_600:
    add sp, sp, #0x10
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_614:
    cmp r8, #0x69
    bgt .L_63c
    bge .L_670
    cmp r8, #0x58
    bgt .L_630
    beq .L_69c
    b .L_6a4
.L_630:
    cmp r8, #0x64
    beq .L_670
    b .L_6a4
.L_63c:
    cmp r8, #0x6f
    bgt .L_650
    moveq r4, #0x8
    moveq fp, #0x0
    b .L_6a4
.L_650:
    cmp r8, #0x78
    bgt .L_6a4
    cmp r8, #0x75
    blt .L_6a4
    beq .L_690
    cmp r8, #0x78
    beq .L_69c
    b .L_6a4
.L_670:
    cmp sl, #0x0
    mov r4, #0xa
    bge .L_6a4
    mov r0, #0x1
    cmp sl, #-2147483648
    rsbne sl, sl, #0x0
    str r0, [sp, #0xc]
    b .L_6a4
.L_690:
    mov r4, #0xa
    mov fp, #0x0
    b .L_6a4
.L_69c:
    mov r4, #0x10
    mov fp, #0x0
.L_6a4:
    mov r0, sl
    mov r1, r4
    bl func_020b3a7c
    mov r9, r1
    mov r0, sl
    mov r1, r4
    bl func_020b3a7c
    cmp r9, #0xa
    mov sl, r0
    addlt r9, r9, #0x30
    blt .L_6dc
    cmp r8, #0x78
    addeq r9, r9, #0x57
    addne r9, r9, #0x37
.L_6dc:
    cmp sl, #0x0
    strh r9, [r5, #-2]!
    add r6, r6, #0x1
    bne .L_6a4
    cmp r4, #0x8
    bne .L_710
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrneh r0, [r5]
    cmpne r0, #0x30
    movne r0, #0x30
    strneh r0, [r5, #-2]!
    addne r6, r6, #0x1
.L_710:
    ldrb r0, [sp, #0x40]
    cmp r0, #0x2
    bne .L_744
    ldr r0, [sp, #0xc]
    ldr r7, [sp, #0x8]
    cmp r0, #0x0
    cmpeq fp, #0x0
    subne r7, r7, #0x1
    cmp r4, #0x10
    bne .L_744
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    subne r7, r7, #0x2
.L_744:
    ldr r0, [sp]
    ldr r1, _LIT0
    sub r0, r0, r5
    add r0, r0, r0, lsr #0x1f
    add r0, r7, r0, asr #0x1
    cmp r0, r1
    addgt sp, sp, #0x10
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addgt sp, sp, #0x10
    bxgt lr
    cmp r6, r7
    bge .L_78c
    mov r0, #0x30
.L_77c:
    add r6, r6, #0x1
    cmp r6, r7
    strh r0, [r5, #-2]!
    blt .L_77c
.L_78c:
    cmp r4, #0x10
    bne .L_7a8
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x30
    strneh r8, [r5, #-2]
    strneh r0, [r5, #-4]!
.L_7a8:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    movne r0, #0x2d
    strneh r0, [r5, #-2]!
    bne .L_7d8
    cmp fp, #0x1
    moveq r0, #0x2b
    streqh r0, [r5, #-2]!
    beq .L_7d8
    cmp fp, #0x2
    moveq r0, #0x20
    streqh r0, [r5, #-2]!
.L_7d8:
    mov r0, r5
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd

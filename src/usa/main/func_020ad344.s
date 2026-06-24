; func_020ad344 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3988
        .global func_020ad344
        .arm
func_020ad344:
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
    bne .L_5ec
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_5d8
    cmp r8, #0x6f
    beq .L_5ec
.L_5d8:
    add sp, sp, #0x10
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_5ec:
    cmp r8, #0x69
    bgt .L_614
    bge .L_648
    cmp r8, #0x58
    bgt .L_608
    beq .L_674
    b .L_67c
.L_608:
    cmp r8, #0x64
    beq .L_648
    b .L_67c
.L_614:
    cmp r8, #0x6f
    bgt .L_628
    moveq r4, #0x8
    moveq fp, #0x0
    b .L_67c
.L_628:
    cmp r8, #0x78
    bgt .L_67c
    cmp r8, #0x75
    blt .L_67c
    beq .L_668
    cmp r8, #0x78
    beq .L_674
    b .L_67c
.L_648:
    cmp sl, #0x0
    mov r4, #0xa
    bge .L_67c
    mov r0, #0x1
    cmp sl, #-2147483648
    rsbne sl, sl, #0x0
    str r0, [sp, #0xc]
    b .L_67c
.L_668:
    mov r4, #0xa
    mov fp, #0x0
    b .L_67c
.L_674:
    mov r4, #0x10
    mov fp, #0x0
.L_67c:
    mov r0, sl
    mov r1, r4
    bl func_020b3988
    mov r9, r1
    mov r0, sl
    mov r1, r4
    bl func_020b3988
    cmp r9, #0xa
    mov sl, r0
    addlt r9, r9, #0x30
    blt .L_6b4
    cmp r8, #0x78
    addeq r9, r9, #0x57
    addne r9, r9, #0x37
.L_6b4:
    cmp sl, #0x0
    strh r9, [r5, #-2]!
    add r6, r6, #0x1
    bne .L_67c
    cmp r4, #0x8
    bne .L_6e8
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrneh r0, [r5]
    cmpne r0, #0x30
    movne r0, #0x30
    strneh r0, [r5, #-2]!
    addne r6, r6, #0x1
.L_6e8:
    ldrb r0, [sp, #0x40]
    cmp r0, #0x2
    bne .L_71c
    ldr r0, [sp, #0xc]
    ldr r7, [sp, #0x8]
    cmp r0, #0x0
    cmpeq fp, #0x0
    subne r7, r7, #0x1
    cmp r4, #0x10
    bne .L_71c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    subne r7, r7, #0x2
.L_71c:
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
    bge .L_764
    mov r0, #0x30
.L_754:
    add r6, r6, #0x1
    cmp r6, r7
    strh r0, [r5, #-2]!
    blt .L_754
.L_764:
    cmp r4, #0x10
    bne .L_780
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x30
    strneh r8, [r5, #-2]
    strneh r0, [r5, #-4]!
.L_780:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    movne r0, #0x2d
    strneh r0, [r5, #-2]!
    bne .L_7b0
    cmp fp, #0x1
    moveq r0, #0x2b
    streqh r0, [r5, #-2]!
    beq .L_7b0
    cmp fp, #0x2
    moveq r0, #0x20
    streqh r0, [r5, #-2]!
.L_7b0:
    mov r0, r5
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd

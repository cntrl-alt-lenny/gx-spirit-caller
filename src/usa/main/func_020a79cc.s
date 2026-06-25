; func_020a79cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3988
        .global func_020a79cc
        .arm
func_020a79cc:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    movs sl, r0
    mov r0, #0x0
    mov r5, r1
    str r0, [sp, #0xc]
    ldr r7, [sp, #0x4c]
    mov r6, r0
    strb r0, [r5, #-1]!
    ldrb r0, [sp, #0x43]
    str r1, [sp]
    ldrb r8, [sp, #0x45]
    str r0, [sp, #0x4]
    ldr r0, [sp, #0x48]
    ldrb fp, [sp, #0x41]
    str r0, [sp, #0x8]
    cmpeq r7, #0x0
    bne .L_604
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_5f0
    cmp r8, #0x6f
    beq .L_604
.L_5f0:
    add sp, sp, #0x10
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_604:
    cmp r8, #0x69
    bgt .L_62c
    bge .L_660
    cmp r8, #0x58
    bgt .L_620
    beq .L_68c
    b .L_694
.L_620:
    cmp r8, #0x64
    beq .L_660
    b .L_694
.L_62c:
    cmp r8, #0x6f
    bgt .L_640
    moveq r4, #0x8
    moveq fp, #0x0
    b .L_694
.L_640:
    cmp r8, #0x78
    bgt .L_694
    cmp r8, #0x75
    blt .L_694
    beq .L_680
    cmp r8, #0x78
    beq .L_68c
    b .L_694
.L_660:
    cmp sl, #0x0
    mov r4, #0xa
    bge .L_694
    mov r0, #0x1
    cmp sl, #-2147483648
    rsbne sl, sl, #0x0
    str r0, [sp, #0xc]
    b .L_694
.L_680:
    mov r4, #0xa
    mov fp, #0x0
    b .L_694
.L_68c:
    mov r4, #0x10
    mov fp, #0x0
.L_694:
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
    blt .L_6cc
    cmp r8, #0x78
    addeq r9, r9, #0x57
    addne r9, r9, #0x37
.L_6cc:
    cmp sl, #0x0
    strb r9, [r5, #-1]!
    add r6, r6, #0x1
    bne .L_694
    cmp r4, #0x8
    bne .L_700
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrnesb r0, [r5]
    cmpne r0, #0x30
    movne r0, #0x30
    strneb r0, [r5, #-1]!
    addne r6, r6, #0x1
.L_700:
    ldrb r0, [sp, #0x40]
    cmp r0, #0x2
    bne .L_734
    ldr r0, [sp, #0xc]
    ldr r7, [sp, #0x8]
    cmp r0, #0x0
    cmpeq fp, #0x0
    subne r7, r7, #0x1
    cmp r4, #0x10
    bne .L_734
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    subne r7, r7, #0x2
.L_734:
    ldr r0, [sp]
    sub r1, r0, r5
    ldr r0, _LIT0
    add r1, r7, r1
    cmp r1, r0
    addgt sp, sp, #0x10
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addgt sp, sp, #0x10
    bxgt lr
    cmp r6, r7
    bge .L_778
    mov r0, #0x30
.L_768:
    add r6, r6, #0x1
    cmp r6, r7
    strb r0, [r5, #-1]!
    blt .L_768
.L_778:
    cmp r4, #0x10
    bne .L_794
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x30
    strneb r8, [r5, #-1]
    strneb r0, [r5, #-2]!
.L_794:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    movne r0, #0x2d
    strneb r0, [r5, #-1]!
    bne .L_7c4
    cmp fp, #0x1
    moveq r0, #0x2b
    streqb r0, [r5, #-1]!
    beq .L_7c4
    cmp fp, #0x2
    moveq r0, #0x20
    streqb r0, [r5, #-1]!
.L_7c4:
    mov r0, r5
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd

; func_020a7ac0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3a7c
        .global func_020a7ac0
        .arm
func_020a7ac0:
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
    bne .L_74c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_738
    cmp r8, #0x6f
    beq .L_74c
.L_738:
    add sp, sp, #0x10
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_74c:
    cmp r8, #0x69
    bgt .L_774
    bge .L_7a8
    cmp r8, #0x58
    bgt .L_768
    beq .L_7d4
    b .L_7dc
.L_768:
    cmp r8, #0x64
    beq .L_7a8
    b .L_7dc
.L_774:
    cmp r8, #0x6f
    bgt .L_788
    moveq r4, #0x8
    moveq fp, #0x0
    b .L_7dc
.L_788:
    cmp r8, #0x78
    bgt .L_7dc
    cmp r8, #0x75
    blt .L_7dc
    beq .L_7c8
    cmp r8, #0x78
    beq .L_7d4
    b .L_7dc
.L_7a8:
    cmp sl, #0x0
    mov r4, #0xa
    bge .L_7dc
    mov r0, #0x1
    cmp sl, #-2147483648
    rsbne sl, sl, #0x0
    str r0, [sp, #0xc]
    b .L_7dc
.L_7c8:
    mov r4, #0xa
    mov fp, #0x0
    b .L_7dc
.L_7d4:
    mov r4, #0x10
    mov fp, #0x0
.L_7dc:
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
    blt .L_814
    cmp r8, #0x78
    addeq r9, r9, #0x57
    addne r9, r9, #0x37
.L_814:
    cmp sl, #0x0
    strb r9, [r5, #-1]!
    add r6, r6, #0x1
    bne .L_7dc
    cmp r4, #0x8
    bne .L_848
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    ldrnesb r0, [r5]
    cmpne r0, #0x30
    movne r0, #0x30
    strneb r0, [r5, #-1]!
    addne r6, r6, #0x1
.L_848:
    ldrb r0, [sp, #0x40]
    cmp r0, #0x2
    bne .L_87c
    ldr r0, [sp, #0xc]
    ldr r7, [sp, #0x8]
    cmp r0, #0x0
    cmpeq fp, #0x0
    subne r7, r7, #0x1
    cmp r4, #0x10
    bne .L_87c
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    subne r7, r7, #0x2
.L_87c:
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
    bge .L_8c0
    mov r0, #0x30
.L_8b0:
    add r6, r6, #0x1
    cmp r6, r7
    strb r0, [r5, #-1]!
    blt .L_8b0
.L_8c0:
    cmp r4, #0x10
    bne .L_8dc
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    movne r0, #0x30
    strneb r8, [r5, #-1]
    strneb r0, [r5, #-2]!
.L_8dc:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    movne r0, #0x2d
    strneb r0, [r5, #-1]!
    bne .L_90c
    cmp fp, #0x1
    moveq r0, #0x2b
    streqb r0, [r5, #-1]!
    beq .L_90c
    cmp fp, #0x2
    moveq r0, #0x20
    streqb r0, [r5, #-1]!
.L_90c:
    mov r0, r5
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word 0x000001fd

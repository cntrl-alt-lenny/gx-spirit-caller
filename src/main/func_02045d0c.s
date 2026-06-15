; func_02045d0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff908
        .extern data_0219daec
        .extern data_0219daf4
        .extern func_0204525c
        .extern func_02046694
        .extern func_020466f4
        .extern func_02049038
        .extern func_02049120
        .extern func_0204f778
        .extern func_0204f820
        .extern func_0204fa7c
        .extern func_0204fc9c
        .extern func_0204fcc0
        .extern func_0205000c
        .extern func_02052398
        .extern func_02062498
        .extern func_02065e40
        .extern func_020673dc
        .global func_02045d0c
        .arm
func_02045d0c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r7, #0x0
    mov fp, r0
    mov r9, r1
    mov sl, r7
    bl func_0204f778
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r9, #0x4
    addls pc, pc, r9, lsl #0x2
    b .L_64
    b .L_48
    b .L_48
    b .L_50
    b .L_50
    b .L_5c
.L_48:
    mov r4, r7
    b .L_64
.L_50:
    mov r4, #0x6
    ldr r6, _LIT0
    b .L_64
.L_5c:
    ldr r6, _LIT1
    mov r4, #0x9
.L_64:
    cmp r4, #0x0
    bne .L_11c
    mov r0, fp
    bl func_02062498
    movs r7, r0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    ldrb r8, [r7, #0x1]
    ldr r1, [r0]
    mov r5, #0x1
    mov r0, r5, lsl r8
    ldr r1, [r1, #0x644]
    ands r0, r1, r0
    mov r0, r8
    moveq r5, #0x0
    bl func_02052398
    ldr r0, _LIT2
    ldr r1, [r0]
    ldrb r0, [r1, #0x369]
    cmp r0, #0x2
    bne .L_c4
    cmp r9, #0x0
    beq .L_d8
.L_c4:
    ldrb r0, [r1, #0x369]
    cmp r0, #0x3
    bne .L_dc
    cmp r8, #0x0
    bne .L_dc
.L_d8:
    mov sl, #0x1
.L_dc:
    mov r0, r8
    bl func_02046694
    ldr r1, _LIT2
    ldrb r7, [r7]
    ldr r2, _LIT3
    mov fp, #0x0
    ldr r3, [r1]
    str fp, [r2, r7, lsl #0x2]
    ldrb r2, [r3, #0x361]
    mov r7, r0
    sub r0, r2, #0x1
    strb r0, [r3, #0x361]
    ldr r1, [r1]
    ldrb r0, [r1, #0x368]
    sub r0, r0, #0x1
    strb r0, [r1, #0x368]
.L_11c:
    ldr r0, _LIT2
    ldr r1, [r0]
    ldrb r0, [r1, #0x2d]
    cmp r0, #0x0
    bne .L_174
    ldr r0, [r1, #0x24]
    cmp r0, #0x6
    bne .L_174
    cmp r5, #0x0
    bne .L_174
    ldrb r0, [r1, #0x369]
    cmp r0, #0x2
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r4, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_0204f820
    mov r0, r7
    bl func_0204fc9c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_174:
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_0204fcc0
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r4, #0x0
    beq .L_1ac
    mov r0, r4
    mov r1, r6
    bl func_0204525c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1ac:
    ldr r0, _LIT2
    ldr r1, [r0]
    ldrb r0, [r1, #0x2d]
    cmp r0, #0x0
    bne .L_220
    ldrb r0, [r1, #0x369]
    cmp r0, #0x2
    beq .L_1d8
    ldrb r0, [r1, #0x369]
    cmp r0, #0x3
    bne .L_220
.L_1d8:
    ldr r2, _LIT2
    ldr r1, [r2]
    ldrb r0, [r1, #0x361]
    add r6, r0, #0x2
    add r3, r1, r6, lsl #0x2
    ldr r3, [r3, #0x448]
    cmp r3, #0x0
    beq .L_220
    add r3, r1, r6
    ldrb r3, [r3, #0x624]
    add r0, r0, #0x1
    add r0, r1, r0
    strb r3, [r0, #0x624]
    ldr r0, [r2]
    ldrb r1, [r0, #0x361]
    add r0, r1, #0x1
    add r1, r1, #0x3
    bl func_0204fa7c
.L_220:
    ldr r0, _LIT2
    ldr r1, [r0]
    ldrb r0, [r1, #0x369]
    cmp r0, #0x2
    bne .L_268
    ldrb r0, [r1, #0x2d]
    cmp r0, #0x0
    bne .L_248
    bl func_0204f820
    b .L_284
.L_248:
    ldrb r0, [r1, #0x361]
    cmp r0, #0x0
    bne .L_284
    ldr r1, _LIT4
    mov r0, #0x1
    mov r2, #0x0
    bl func_02049038
    b .L_284
.L_268:
    ldrb r0, [r1, #0x361]
    cmp r0, #0x0
    bne .L_284
    ldr r1, _LIT4
    mov r0, #0x1
    mov r2, #0x0
    bl func_02049038
.L_284:
    ldr r0, _LIT2
    ldr r1, [r0]
    ldrb r0, [r1, #0x369]
    cmp r0, #0x0
    beq .L_2a4
    ldrb r0, [r1, #0x369]
    cmp r0, #0x1
    bne .L_2c0
.L_2a4:
    ldr r0, _LIT2
    ldr r2, [r0]
    ldrb r1, [r2, #0x368]
    strb r1, [r2, #0x36a]
    ldr r0, [r0]
    ldr r0, [r0, #0x364]
    bl func_020673dc
.L_2c0:
    ldr r0, _LIT2
    ldr r6, [r0]
    ldr r0, [r6, #0x90]
    cmp r0, #0x0
    beq .L_31c
    cmp r5, #0x0
    beq .L_31c
    cmp r9, #0x0
    moveq r5, #0x1
    mov r0, r7
    movne r5, #0x0
    bl func_02049120
    str r0, [sp]
    ldr r1, [r6, #0x94]
    ldr r0, _LIT2
    str r1, [sp, #0x4]
    ldr r1, [r0]
    mov r0, r4
    ldr r4, [r1, #0x90]
    mov r1, r5
    mov r2, sl
    mov r3, r8
    blx r4
.L_31c:
    ldr r0, _LIT2
    ldr r1, [r0]
    ldrb r0, [r1, #0x2d]
    cmp r0, #0x0
    bne .L_340
    ldrb r0, [r1, #0x369]
    cmp r0, #0x2
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_340:
    ldrb r0, [r1, #0x361]
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_02065e40
    bl func_0205000c
    mov r0, #0x3
    bl func_020466f4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xffffe250
_LIT1: .word 0xffffe24f
_LIT2: .word data_0219daec
_LIT3: .word data_0219daf4
_LIT4: .word data_020ff908

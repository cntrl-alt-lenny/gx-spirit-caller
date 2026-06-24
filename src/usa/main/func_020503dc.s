; func_020503dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff980
        .extern data_020ff98c
        .extern data_020ff998
        .extern func_020466f4
        .extern func_02046778
        .extern func_020467c0
        .extern func_0204987c
        .extern func_0204c398
        .extern func_0204ffe0
        .extern func_020500a4
        .extern func_02062458
        .extern func_02062710
        .extern func_0206271c
        .extern func_020acbac
        .global func_020503dc
        .arm
func_020503dc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r1
    mov r7, r2
    mov r6, r3
    bl func_0204987c
    cmp r0, #0x0
    beq .L_2c4
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x7
    bne .L_2c4
    bl func_0204987c
    ldrb r0, [r0, #0x1a1]
    cmp r0, #0x0
    beq .L_2dc
.L_2c4:
    ldr r1, _LIT0
    mov r0, r8
    mvn r2, #0x0
    bl func_02062710
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_2dc:
    bl func_020467c0
    mov r5, r0
    mvn r2, #0x0
    cmp r5, r2
    bne .L_310
    ldr r1, _LIT1
    mov r0, r8
    bl func_02062710
    ldr r1, _LIT2
    mov r0, #0x6
    bl func_0204ffe0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_310:
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x208]
    cmp r7, r0
    bne .L_354
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x200
    ldrh r0, [r0, #0x88]
    cmp r6, r0
    beq .L_3e4
.L_354:
    ldr r0, [sp, #0x24]
    ldrb r1, [r0]
    cmp r1, #0x0
    beq .L_3cc
    mov r1, #0x0
    mov r2, #0xa
    bl func_020acbac
    mov r4, r0
    bl func_0204987c
    mov r9, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r9, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r4, r0
    bne .L_3cc
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x2
    str r7, [r0, #0x208]
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x200
    strh r6, [r0, #0x88]
    b .L_3e4
.L_3cc:
    ldr r1, _LIT3
    mov r0, r8
    mvn r2, #0x0
    bl func_02062710
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_3e4:
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x184]
    str r1, [r0, #0x188]
    bl func_0204987c
    ldr r1, [r0, #0x8]
    mov r0, r8
    bl func_0206271c
    cmp r0, #0x0
    bne .L_420
    ldr r1, _LIT4
    mov r0, #0x6
    bl func_0204ffe0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_420:
    bl func_020500a4
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    bne .L_454
    ldr r1, [sp, #0x20]
    ldr r0, _LIT5
    mov r4, r1, asr #0x1
    cmp r4, r0
    movge r4, r0
    bl func_0204987c
    add r0, r0, #0x100
    strh r4, [r0, #0xa8]
.L_454:
    mov r0, r5
    bl func_02046778
    mov r4, r0
    mov r0, r5
    bl func_020466f4
    str r8, [r4]
    mov r4, r0
    bl func_0204987c
    ldrb r1, [r0, #0xd]
    add r1, r1, #0x1
    strb r1, [r0, #0xd]
    strb r5, [r4]
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    ldrb r1, [r0, #0xd]
    mov r0, r8
    mov r2, #0x0
    sub r1, r1, #0x1
    add r1, r5, r1
    ldrb r3, [r1, #0x2c8]
    mov r1, r4
    strb r3, [r4, #0x1]
    strh r2, [r4, #0x2]
    str r2, [r4, #0x4]
    bl func_02062458
    mov r0, #0x2
    bl func_0204c398
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_020ff980
_LIT1: .word data_020ff98c
_LIT2: .word 0xfffeabc4
_LIT3: .word data_020ff998
_LIT4: .word 0xfffec5e6
_LIT5: .word 0x0000ffff

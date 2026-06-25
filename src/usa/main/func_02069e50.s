; func_02069e50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101cd0
        .extern data_02101ce0
        .extern data_0219ebec
        .extern func_02054008
        .extern func_020540cc
        .extern func_02054144
        .extern func_020677fc
        .extern func_0206a2a0
        .extern func_0206a2a8
        .extern func_0206a910
        .extern func_0206b3d8
        .extern func_0206b488
        .extern func_020a6c60
        .extern func_020a7294
        .global func_02069e50
        .arm
func_02069e50:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r8, r0
    ldr r1, [r8, #0x5c8]
    ldr r7, [r8, #0x7c]
    ldr r6, [r8, #0x80]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_3e0
    b .L_38
    b .L_98
    b .L_1a8
    b .L_29c
    b .L_350
.L_38:
    cmp r6, #0x1
    blt .L_3e0
    ldrb r1, [r7]
    eor r1, r1, #0xec
    add r3, r1, #0x2
    cmp r6, r3
    blt .L_3e0
    sub r1, r3, #0x1
    ldrb r1, [r7, r1]
    eor r2, r1, #0xea
    add r4, r3, r2
    cmp r6, r4
    blt .L_3e0
    add r1, r7, r3
    bl func_0206a910
    ldr r0, _LIT0
    add r7, r7, r4
    sub r6, r6, r4
    mov r3, #0x1
    mov r1, r7
    mov r2, r6
    add r0, r8, r0
    str r3, [r8, #0x5c8]
    bl func_020677fc
.L_98:
    cmp r6, #0x6
    blt .L_3e0
    ldrb r1, [r7]
    ldrb r0, [r7, #0x1]
    add r5, r8, #0x4a0
    ldr r2, _LIT1
    strb r1, [r8, #0x4a0]
    strb r0, [r5, #0x1]
    ldrb r4, [r7, #0x2]
    ldrb r3, [r7, #0x3]
    mov r0, r8
    mov r1, #0x6
    strb r4, [r5, #0x2]
    strb r3, [r5, #0x3]
    ldr r2, [r2]
    ldr r3, [r8, #0x494]
    ldr r4, [r8, #0x488]
    blx r4
    add r1, r7, #0x4
    ldr r0, _LIT2
    ldrb r2, [r7, #0x4]
    ldrb r1, [r1, #0x1]
    add r3, r8, r0
    add r0, r8, #0x400
    strb r2, [r8, #0x4a8]
    strb r1, [r3, #0x1]
    ldrh r1, [r0, #0xa8]
    ldr r0, _LIT3
    cmp r1, r0
    bne .L_15c
    add r0, r7, #0x6
    sub r1, r6, #0x6
    bl func_0206b3d8
    mvn r1, #0x0
    cmp r0, r1
    beq .L_3e0
    mov r0, r8
    add r1, r7, #0x6
    bl func_0206a2a0
    ldr r0, _LIT1
    ldr r3, [r8, #0x494]
    ldr r2, [r0]
    ldr r4, [r8, #0x488]
    mov r0, r8
    mov r1, #0x5
    blx r4
    ldr r0, [r8, #0x7c]
    cmp r0, #0x0
    beq .L_3e0
.L_15c:
    ldr r0, [r8, #0x5c4]
    add r7, r7, #0x6
    sub r6, r6, #0x6
    ands r0, r0, #0x2
    bne .L_184
    add r0, r8, #0x400
    ldrh r1, [r0, #0xa8]
    ldr r0, _LIT3
    cmp r1, r0
    bne .L_198
.L_184:
    mov r0, #0x5
    str r0, [r8, #0x5c8]
    mov r0, #0x2
    str r0, [r8]
    b .L_3e0
.L_198:
    mov r0, #0x2
    str r0, [r8, #0x5c8]
    mvn r0, #0x0
    str r0, [r8, #0x484]
.L_1a8:
    ldr r1, [r8, #0x484]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_1f8
    cmp r6, #0x1
    blt .L_3e0
    ldrb r1, [r7]
    mov r0, #0x8
    mov r2, #0x0
    str r1, [r8, #0x484]
    ldr r1, [r8, #0x484]
    bl func_02054144
    str r0, [r8, #0x8]
    ldr r0, [r8, #0x8]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r7, r7, #0x1
    sub r6, r6, #0x1
.L_1f8:
    ldr r0, [r8, #0x8]
    bl func_020540cc
    ldr r1, [r8, #0x484]
    cmp r1, r0
    ble .L_278
    add r5, sp, #0x0
    mvn r4, #0x0
.L_214:
    cmp r6, #0x2
    blt .L_278
    add r0, r7, #0x1
    sub r1, r6, #0x1
    bl func_0206b3d8
    mov r9, r0
    cmp r9, r4
    beq .L_278
    ldrb r2, [r7]
    mov r0, r8
    add r1, r7, #0x1
    str r2, [sp, #0x4]
    bl func_0206b488
    str r0, [sp]
    ldr r0, [r8, #0x8]
    mov r1, r5
    bl func_02054008
    add r1, r9, #0x1
    ldr r0, [r8, #0x8]
    add r7, r7, r1
    sub r6, r6, r1
    bl func_020540cc
    ldr r1, [r8, #0x484]
    cmp r1, r0
    bgt .L_214
.L_278:
    ldr r0, [r8, #0x8]
    bl func_020540cc
    ldr r1, [r8, #0x484]
    cmp r1, r0
    bgt .L_3e0
    mov r0, #0x3
    str r0, [r8, #0x5c8]
    mvn r0, #0x0
    str r0, [r8, #0x484]
.L_29c:
    ldr r1, [r8, #0x484]
    mvn r0, #0x0
    cmp r1, r0
    bne .L_2cc
    cmp r6, #0x1
    blt .L_3e0
    ldrb r1, [r7]
    mov r0, #0x0
    add r7, r7, #0x1
    str r1, [r8, #0x484]
    str r0, [r8, #0x480]
    sub r6, r6, #0x1
.L_2cc:
    ldr r1, [r8, #0x484]
    ldr r0, [r8, #0x480]
    cmp r1, r0
    ble .L_338
    add r4, r8, #0x480
    mvn r9, #0x0
.L_2e4:
    mov r0, r7
    mov r1, r6
    bl func_0206b3d8
    mov r5, r0
    cmp r5, r9
    beq .L_338
    mov r0, r8
    mov r1, r7
    bl func_0206b488
    ldr r1, [r4]
    ldr r2, [r8, #0x480]
    add r1, r1, #0x1
    str r1, [r4]
    add r1, r8, r2, lsl #0x2
    str r0, [r1, #0x84]
    ldr r1, [r8, #0x484]
    ldr r0, [r8, #0x480]
    add r7, r7, r5
    cmp r1, r0
    sub r6, r6, r5
    bgt .L_2e4
.L_338:
    ldr r1, [r8, #0x484]
    ldr r0, [r8, #0x480]
    cmp r1, r0
    bgt .L_3e0
    mov r0, #0x4
    str r0, [r8, #0x5c8]
.L_350:
    cmp r6, #0x5
    blt .L_3e0
    mov r9, #0x0
    mvn r4, #0x0
    mvn r5, #0x1
.L_364:
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_0206a2a8
    cmp r0, r5
    addeq sp, sp, #0xc
    moveq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    cmp r0, r4
    bne .L_3c4
    mov r0, #0x5
    str r0, [r8, #0x5c8]
    mov r0, #0x2
    str r0, [r8]
    ldr r0, _LIT1
    ldr r3, [r8, #0x494]
    ldr r2, [r0]
    ldr r4, [r8, #0x488]
    mov r0, r8
    mov r1, #0x3
    sub r6, r6, #0x5
    add r7, r7, #0x5
    blx r4
    b .L_3e0
.L_3c4:
    ldr r1, [r8, #0x7c]
    add r7, r7, r0
    cmp r1, #0x0
    sub r6, r6, r0
    moveq r0, r9
    cmp r0, #0x0
    bne .L_364
.L_3e0:
    cmp r6, #0x0
    bge .L_3fc
    ldr r0, _LIT4
    ldr r1, _LIT5
    ldr r3, _LIT6
    mov r2, #0x0
    bl func_020a6c60
.L_3fc:
    ldr r0, [r8, #0x7c]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    cmp r6, #0x0
    beq .L_424
    mov r1, r7
    mov r2, r6
    bl func_020a7294
.L_424:
    str r6, [r8, #0x80]
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x000004bc
_LIT1: .word data_0219ebec
_LIT2: .word 0x000004a8
_LIT3: .word 0x0000ffff
_LIT4: .word data_02101ce0
_LIT5: .word data_02101cd0
_LIT6: .word 0x000004af

; func_020a1600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a981c
        .extern func_02094410
        .extern func_02094500
        .extern func_020a0884
        .extern func_020a0958
        .extern func_020a1038
        .extern func_020a1b04
        .extern func_020a3148
        .extern func_020a32b4
        .extern func_020a3560
        .extern func_020a35c0
        .extern func_020a35d4
        .extern func_020a5c14
        .global func_020a1600
        .arm
func_020a1600:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r6, r0
    mov r4, r1
    cmp r6, #0x19
    bgt .L_574
    cmp r6, #0x19
    bge .L_7bc
    cmp r6, #0x11
    bgt .L_568
    cmp r6, #0x11
    bge .L_974
    cmp r6, #0x3
    bgt .L_974
    cmp r6, #0x0
    blt .L_974
    cmp r6, #0x0
    beq .L_5b0
    cmp r6, #0x1
    beq .L_5d4
    cmp r6, #0x3
    beq .L_7b0
    b .L_974
.L_568:
    cmp r6, #0x15
    beq .L_59c
    b .L_974
.L_574:
    cmp r6, #0xff
    bgt .L_590
    cmp r6, #0xff
    bge .L_860
    cmp r6, #0x1c
    beq .L_7c4
    b .L_974
.L_590:
    cmp r6, #0x100
    beq .L_8d0
    b .L_974
.L_59c:
    mov r2, r4
    mov r0, #0x0
    mov r1, #0x1
    bl func_020a1b04
    b .L_974
.L_5b0:
    ldrh r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_974
    cmp r0, #0x10
    bcs .L_974
    mov r2, r4
    mov r1, #0x2
    bl func_020a1b04
    b .L_974
.L_5d4:
    ldrh r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_974
    cmp r0, #0x10
    bcs .L_974
    ldr r2, _LIT0
    sub r0, r0, #0x1
    ldr r3, [r2]
    mov r1, #0x0
    add r0, r3, r0, lsl #0x1
    add r0, r0, #0x1400
    strh r1, [r0, #0x8a]
    ldrh r3, [r4, #0x10]
    ldr r5, [r2]
    ldr r0, _LIT1
    sub r2, r3, #0x1
    add r0, r5, r0
    add r0, r0, r2, lsl #0x2
    mov r2, #0x4
    bl func_02094500
    ldr r0, _LIT0
    ldrh r1, [r4, #0x10]
    ldr r0, [r0]
    mov r2, #0x16
    add r0, r0, #0x1340
    sub r1, r1, #0x1
    mla r0, r1, r2, r0
    mov r1, #0x0
    bl func_02094500
    ldrh r0, [r4, #0x10]
    bl func_020a5c14
    ldrh r1, [r4, #0x10]
    ldr r0, _LIT0
    mov r3, #0x0
    ldr r2, [r0]
    sub r1, r1, #0x1
    add r1, r2, r1, lsl #0x1
    add r1, r1, #0x1700
    strh r3, [r1, #0x54]
    ldrh r8, [r4, #0x10]
    ldr r5, [r0]
    mvn r1, #0x0
    sub r7, r8, #0x1
    add r2, r5, r7
    add r2, r2, #0x1500
    ldrsb r3, [r2, #0x26]
    cmp r3, r1
    beq .L_6fc
    ldr r2, _LIT2
    and r3, r3, #0xff
    mul r2, r3, r2
    add r3, r5, r2
    add r9, r3, #0x1d00
    mov r5, #0x1
    ldrh sl, [r9, #0x4e]
    mvn r3, r5, lsl r8
    and sl, sl, r3
    strh sl, [r9, #0x4e]
    ldr r9, [r0]
    add r9, r9, r2
    add r9, r9, #0x1d00
    ldrh sl, [r9, #0x50]
    orr r5, sl, r5, lsl r8
    strh r5, [r9, #0x50]
    ldr r5, [r0]
    add r5, r5, r7
    add r5, r5, #0x1000
    strb r1, [r5, #0x526]
    ldr r0, [r0]
    add r0, r0, r2
    add r0, r0, #0x1d00
    ldrh r1, [r0, #0x4c]
    and r1, r1, r3
    strh r1, [r0, #0x4c]
.L_6fc:
    ldr r1, _LIT0
    ldrh r2, [r4, #0x10]
    ldr r7, [r1]
    mov r3, #0x1
    add r0, r7, #0x1500
    ldrh r5, [r0, #0x36]
    mov r0, r3, lsl r2
    ands r0, r5, r0
    beq .L_74c
    add r0, r7, #0x1000
    ldrb r2, [r0, #0x535]
    sub r2, r2, #0x1
    strb r2, [r0, #0x535]
    ldr r0, [r1]
    ldrh r1, [r4, #0x10]
    add r0, r0, #0x1500
    ldrh r2, [r0, #0x36]
    mvn r1, r3, lsl r1
    and r1, r2, r1
    strh r1, [r0, #0x36]
.L_74c:
    ldrh r0, [r4, #0x10]
    ldr r1, _LIT0
    ldr r2, [r1]
    sub r1, r0, #0x1
    add r1, r2, r1, lsl #0x2
    add r1, r1, #0x1000
    ldr r1, [r1, #0x4e8]
    cmp r1, #0x8
    bne .L_77c
    mov r1, #0x9
    mov r2, #0x0
    bl func_020a1b04
.L_77c:
    ldrh r0, [r4, #0x10]
    mov r2, r4
    mov r1, #0x3
    bl func_020a1b04
    ldrh r1, [r4, #0x10]
    ldr r0, _LIT0
    mov r3, #0x0
    ldr r2, [r0]
    sub r0, r1, #0x1
    add r0, r2, r0, lsl #0x2
    add r0, r0, #0x1000
    str r3, [r0, #0x4e8]
    b .L_974
.L_7b0:
    mov r0, r4
    bl func_020a1038
    b .L_974
.L_7bc:
    bl func_020a0958
    b .L_974
.L_7c4:
    mov r5, #0x0
    ldr r9, _LIT0
    ldr r7, _LIT3
    ldr r8, _LIT2
    mov sl, r5
.L_7d8:
    mul r4, r5, r8
    ldr r1, [r9]
    add r2, r1, r4
    add r0, r2, #0x1000
    ldrb r0, [r0, #0xd52]
    cmp r0, #0x0
    beq .L_828
    add r0, r2, #0x1d00
    ldrh r3, [r0, #0x50]
    cmp r3, #0x0
    beq .L_828
    ldrh r2, [r0, #0x4e]
    add r0, r1, r7
    add r0, r0, r4
    add r1, r1, #0x1340
    bl func_020a32b4
    ldr r0, [r9]
    add r0, r0, r4
    add r0, r0, #0x1d00
    strh sl, [r0, #0x50]
.L_828:
    add r0, r5, #0x1
    and r5, r0, #0xff
    cmp r5, #0x10
    bcc .L_7d8
    bl func_020a35d4
    mov r5, r0
    bl func_020a35c0
    mov r4, r0
    bl func_020a3560
    mov r2, r0
    mov r0, r5
    mov r1, r4
    bl func_020a3148
    b .L_974
.L_860:
    ldrh r0, [r4, #0x2]
    cmp r0, #0xf
    addls pc, pc, r0, lsl #0x2
    b .L_8c0
    b .L_8c0
    b .L_8b0
    b .L_8c0
    b .L_8c0
    b .L_8b0
    b .L_8b0
    b .L_8b0
    b .L_8c0
    b .L_8b0
    b .L_8b0
    b .L_8c0
    b .L_8c0
    b .L_8c0
    b .L_8c0
    b .L_8c0
    b .L_8c0
.L_8b0:
    mov r0, #0x0
    mov r1, #0x9
    bl func_020a0884
    b .L_974
.L_8c0:
    mov r0, #0x0
    mov r1, #0x8
    bl func_020a0884
    b .L_974
.L_8d0:
    ldrh r0, [r4]
    cmp r0, #0x1d
    addls pc, pc, r0, lsl #0x2
    b .L_968
    b .L_958
    b .L_968
    b .L_968
    b .L_968
    b .L_968
    b .L_968
    b .L_968
    b .L_958
    b .L_958
    b .L_968
    b .L_968
    b .L_968
    b .L_968
    b .L_958
    b .L_958
    b .L_958
    b .L_968
    b .L_958
    b .L_958
    b .L_968
    b .L_968
    b .L_958
    b .L_968
    b .L_968
    b .L_968
    b .L_958
    b .L_968
    b .L_968
    b .L_968
    b .L_958
.L_958:
    mov r0, #0x0
    mov r1, #0x9
    bl func_020a0884
    b .L_974
.L_968:
    mov r0, #0x0
    mov r1, #0x8
    bl func_020a0884
.L_974:
    cmp r6, #0x11
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bxne lr
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    mov r2, #0x7d00
    add r3, r1, #0x1000
    ldr r4, [r3, #0x4e4]
    bl func_02094410
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r1]
    cmp r4, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bxeq lr
    mov r2, r0
    mov r1, #0xc
    blx r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word data_021a981c
_LIT1: .word 0x000014a8
_LIT2: .word 0x000005d4
_LIT3: .word 0x0000186c

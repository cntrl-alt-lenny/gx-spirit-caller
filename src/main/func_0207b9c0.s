; func_0207b9c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a088c
        .extern func_0207ab68
        .extern func_0207b038
        .extern func_0207b548
        .extern func_020945f4
        .extern func_02094688
        .extern func_020a06b0
        .global func_0207b9c0
        .arm
func_0207b9c0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl OS_DisableIrq
    ldr r2, _LIT0
    mov r4, r0
    ldr ip, [r2]
    cmp ip, #0x0
    bne .L_3d4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_3d4:
    add r1, ip, #0x2000
    ldr r3, [r1, #0x260]
    cmp r3, #0x3
    beq .L_3f8
    cmp r3, #0x8
    beq .L_508
    cmp r3, #0x9
    beq .L_51c
    b .L_530
.L_3f8:
    cmp r7, #0x0
    bne .L_414
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_414:
    ldrh r3, [r7, #0x3c]
    cmp r3, #0x0
    beq .L_434
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_434:
    cmp r6, #0x0
    beq .L_4bc
    ldrb r3, [r6]
    cmp r3, #0x4
    bcs .L_454
    ldrb r0, [r6, #0x1]
    cmp r0, #0x4
    bcc .L_46c
.L_454:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_46c:
    strb r3, [r1, #0x250]
    ldr r0, [r2]
    ldrb r1, [r6, #0x1]
    add r0, r0, #0x2000
    strb r1, [r0, #0x251]
    ldr r1, [r2]
    add r0, r1, #0x2000
    ldrb r0, [r0, #0x250]
    cmp r0, #0x0
    bne .L_4a8
    add r0, r1, #0x2200
    mov r1, #0x0
    mov r2, #0x50
    bl func_020945f4
    b .L_4cc
.L_4a8:
    add r0, r6, #0x2
    add r1, r1, #0x2200
    mov r2, #0x50
    bl func_02094688
    b .L_4cc
.L_4bc:
    add r0, ip, #0x2200
    mov r1, #0x0
    mov r2, #0x52
    bl func_020945f4
.L_4cc:
    ldr r1, _LIT0
    mov r0, r7
    ldr r1, [r1]
    mov r2, #0xc0
    add r1, r1, #0x2140
    bl func_02094688
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1]
    add r1, r1, #0x2100
    ldrh r2, [r1, #0x6e]
    orr r2, r2, #0x3
    strh r2, [r1, #0x70]
    bl func_0207b548
    b .L_544
.L_508:
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_51c:
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_530:
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_544:
    ldr r1, _LIT1
    ldr r0, _LIT2
    mov r3, r1
    mov r2, #0x50
    str r1, [sp]
    bl func_020a06b0
    cmp r0, #0x2
    beq .L_578
    cmp r0, #0x3
    beq .L_5b0
    cmp r0, #0x8
    beq .L_598
    b .L_5b0
.L_578:
    mov r0, #0x8
    bl func_0207b038
    ldr r0, _LIT0
    mov r1, #0x5
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_5d0
.L_598:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_5b0:
    mov r0, #0xb
    bl func_0207b038
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_5d0:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x3
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word 0x0000ffff
_LIT2: .word func_0207ab68

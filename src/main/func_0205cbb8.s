; func_0205cbb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100cb8
        .extern data_02100cbc
        .extern data_02100ccc
        .extern func_020453e8
        .extern func_02054b9c
        .extern func_020552dc
        .extern func_02056b38
        .extern func_020577d8
        .extern func_02057844
        .extern func_02057980
        .extern func_02057b00
        .extern func_02058528
        .extern func_0205ce40
        .extern func_0205fd94
        .extern func_0205ffc0
        .global func_0205cbb8
        .arm
func_0205cbb8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    mov r6, r1
    ldr r1, [r6, #0x30]
    mov r7, r0
    cmp r1, #0x0
    ldr r5, [r7]
    beq .L_42c
    mov r2, #0x1
    str r2, [sp]
    ldr r1, _LIT0
    add r3, sp, #0xc
    str r1, [sp, #0x4]
    ldr r1, [r6, #0x8]
    add r2, r6, #0x28
    bl func_02057980
    ldr r1, [sp, #0xc]
    cmp r1, #0x0
    bne .L_418
    cmp r0, #0x0
    beq .L_42c
.L_418:
    mov r0, #0x6a
    str r0, [r6]
    add sp, sp, #0x24
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_42c:
    ldr r0, [r6, #0x30]
    cmp r0, #0x0
    bne .L_464
    mov r0, r7
    mov r1, r6
    bl func_0205ce40
    cmp r0, #0x0
    addne sp, sp, #0x24
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [r6]
    cmp r0, #0x6a
    addeq sp, sp, #0x24
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_464:
    add r1, sp, #0xc
    ldr r0, _LIT0
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r6, #0x8]
    add r3, sp, #0x8
    mov r0, r7
    add r2, r6, #0x18
    bl func_02057b00
    cmp r0, #0x0
    movne r0, #0x6a
    strne r0, [r6]
    addne sp, sp, #0x24
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    ble .L_4bc
    mov r0, #0x0
    bl func_02054b9c
    add r0, r0, #0x12c
    str r0, [r6, #0x10]
.L_4bc:
    add r4, sp, #0x20
    add r2, sp, #0x18
    add r3, sp, #0x1c
    mov r0, r7
    add r1, r6, #0x18
    str r4, [sp]
    bl func_02057844
    cmp r0, #0x0
    addne sp, sp, #0x24
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r1, [sp, #0x18]
    cmp r1, #0x0
    beq .L_618
    ldr r2, [sp, #0x1c]
    cmp r2, #0x66
    bgt .L_510
    cmp r2, #0x66
    bge .L_5d8
    cmp r2, #0x1
    beq .L_544
    b .L_60c
.L_510:
    sub r0, r2, #0xc8
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_60c
    b .L_5f0
    b .L_5f0
    b .L_5f0
    b .L_5f0
    b .L_5f0
    b .L_5f0
    b .L_5f0
    b .L_5f0
    b .L_5f0
.L_544:
    ldr r1, [r5, #0x1bc]
    ldr r0, [r5, #0x1c0]
    cmp r1, #0x0
    str r1, [sp, #0x10]
    str r0, [sp, #0x14]
    beq .L_60c
    mov r0, #0xc
    bl func_020453e8
    movs r4, r0
    bne .L_584
    ldr r1, _LIT1
    mov r0, r7
    bl func_0205ffc0
    add sp, sp, #0x24
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_584:
    ldr r0, [r6, #0xc]
    str r0, [r4]
    ldr r0, [sp, #0x18]
    bl func_020552dc
    str r0, [r4, #0x8]
    mov r0, #0x0
    bl func_02054b9c
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    add r1, sp, #0x10
    mov r0, r7
    mov r3, r4
    ldmia r1, {r1, r2}
    bl func_02058528
    cmp r0, #0x0
    beq .L_60c
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_5d8:
    ldr r1, [r6, #0xc]
    ldr r3, _LIT2
    mov r0, r7
    mov r2, #0x67
    bl func_02056b38
    b .L_60c
.L_5f0:
    str r1, [sp]
    ldr r1, [sp, #0x20]
    mov r0, r7
    str r1, [sp, #0x4]
    ldr r3, [r6, #0x18]
    mov r1, r6
    bl func_0205fd94
.L_60c:
    mov r0, r7
    add r1, r6, #0x18
    bl func_020577d8
.L_618:
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    bne .L_4bc
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    movne r0, #0x6a
    strne r0, [r6]
    mov r0, #0x0
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02100cb8
_LIT1: .word data_02100cbc
_LIT2: .word data_02100ccc

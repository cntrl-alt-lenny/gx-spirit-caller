; func_020553ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb30
        .extern data_020ffb60
        .extern data_020ffb6c
        .extern data_020ffb98
        .extern data_020ffbb0
        .extern data_020ffbc8
        .extern data_020ffbd4
        .extern data_020ffbe4
        .extern func_02057fc4
        .extern func_02057ffc
        .extern func_0205ff4c
        .extern func_0206043c
        .extern func_020aae4c
        .global func_020553ac
        .arm
func_020553ac:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x204
    movs r7, r0
    mov r6, r1
    mov r5, r3
    beq .L_24
    ldr r4, [r7]
    cmp r4, #0x0
    bne .L_30
.L_24:
    add sp, sp, #0x204
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_30:
    ldr r1, [r4, #0x108]
    cmp r1, #0x0
    addne sp, sp, #0x204
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r1, [r4, #0x1d8]
    cmp r1, #0x4
    bne .L_64
    ldr r1, _LIT0
    bl func_0205ff4c
    add sp, sp, #0x204
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_64:
    cmp r2, #0x0
    bne .L_80
    ldr r1, _LIT1
    bl func_0205ff4c
    add sp, sp, #0x204
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_80:
    cmp r5, #0x0
    bne .L_9c
    ldr r1, _LIT2
    bl func_0205ff4c
    add sp, sp, #0x204
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_9c:
    mov r1, r2
    add r0, sp, #0x0
    mov r2, #0x100
    bl func_0206043c
    ldrsb r0, [sp]
    cmp r0, #0x0
    beq .L_d8
    add r2, sp, #0x0
    mov r1, #0x2f
.L_c0:
    ldrsb r0, [r2]
    cmp r0, #0x5c
    streqb r1, [r2]
    ldrsb r0, [r2, #0x1]!
    cmp r0, #0x0
    bne .L_c0
.L_d8:
    add r0, sp, #0x100
    mov r1, r5
    mov r2, #0x100
    bl func_0206043c
    add r0, sp, #0x100
    ldrsb r0, [r0]
    cmp r0, #0x0
    beq .L_118
    add r2, sp, #0x100
    mov r1, #0x2f
.L_100:
    ldrsb r0, [r2]
    cmp r0, #0x5c
    streqb r1, [r2]
    ldrsb r0, [r2, #0x1]!
    cmp r0, #0x0
    bne .L_100
.L_118:
    ldr r0, [r4, #0x214]
    cmp r6, r0
    bne .L_154
    add r0, sp, #0x0
    add r1, r4, #0x218
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_154
    add r0, sp, #0x100
    add r1, r4, #0x318
    bl func_020aae4c
    cmp r0, #0x0
    addeq sp, sp, #0x204
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_154:
    add r1, sp, #0x0
    add r0, r4, #0x218
    mov r2, #0x100
    str r6, [r4, #0x214]
    bl func_0206043c
    add r1, sp, #0x100
    add r0, r4, #0x318
    mov r2, #0x100
    bl func_0206043c
    ldr r2, _LIT3
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r7
    mov r2, r6
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT4
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057ffc
    ldr r2, [r4, #0x198]
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057fc4
    ldr r2, _LIT5
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r7
    add r1, r4, #0x1f4
    add r2, sp, #0x0
    bl func_02057ffc
    ldr r2, _LIT6
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, r7
    add r1, r4, #0x1f4
    add r2, sp, #0x100
    bl func_02057ffc
    ldr r2, _LIT7
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02057ffc
    mov r0, #0x0
    add sp, sp, #0x204
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ffb30
_LIT1: .word data_020ffb98
_LIT2: .word data_020ffbb0
_LIT3: .word data_020ffbc8
_LIT4: .word data_020ffb60
_LIT5: .word data_020ffbd4
_LIT6: .word data_020ffbe4
_LIT7: .word data_020ffb6c

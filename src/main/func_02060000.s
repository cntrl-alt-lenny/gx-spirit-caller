; func_02060000 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101234
        .extern data_02101244
        .extern data_02101254
        .extern data_02101260
        .extern data_02101270
        .extern func_020585d4
        .extern func_0205ffd4
        .extern func_020a6d54
        .global func_02060000
        .arm
func_02060000:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r7, r1
    mov r8, r0
    mov r6, r2
    mov r5, r3
    ldr r4, [sp, #0x18]
    bne .L_30
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6d54
.L_30:
    cmp r5, #0x0
    bne .L_4c
    ldr r0, _LIT3
    ldr r1, _LIT1
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6d54
.L_4c:
    cmp r4, #0x0
    bne .L_68
    ldr r0, _LIT5
    ldr r1, _LIT1
    ldr r3, _LIT6
    mov r2, #0x0
    bl func_020a6d54
.L_68:
    ldr r1, [r6]
    ldrsb r0, [r7, r1]
    add r3, r7, r1
    cmp r0, #0x5c
    beq .L_a4
    ldr r2, _LIT7
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a4:
    ldrsb r2, [r3, #0x1]
    add r7, r3, #0x2
    mov r1, #0x0
    cmp r2, #0x5c
    beq .L_130
    ldr r0, _LIT8
.L_bc:
    cmp r2, #0x0
    bne .L_ec
    ldr r2, _LIT7
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_ec:
    cmp r1, r0
    bne .L_11c
    ldr r2, _LIT7
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_11c:
    strb r2, [r5], #0x1
    ldrsb r2, [r7], #0x1
    add r1, r1, #0x1
    cmp r2, #0x5c
    bne .L_bc
.L_130:
    mov r2, #0x0
    strb r2, [r5]
    ldr r0, _LIT8
    b .L_178
.L_140:
    cmp r2, r0
    bne .L_170
    ldr r2, _LIT7
    mov r0, r8
    mov r1, #0x1
    bl func_0205ffd4
    mov r0, r8
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_170:
    strb r1, [r4], #0x1
    add r2, r2, #0x1
.L_178:
    ldrsb r1, [r7], #0x1
    cmp r1, #0x5c
    beq .L_18c
    cmp r1, #0x0
    bne .L_140
.L_18c:
    mov r0, #0x0
    strb r0, [r4]
    sub r1, r7, r3
    ldr r2, [r6]
    sub r1, r1, #0x1
    add r1, r2, r1
    str r1, [r6]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02101234
_LIT1: .word data_02101244
_LIT2: .word 0x00000199
_LIT3: .word data_02101254
_LIT4: .word 0x0000019a
_LIT5: .word data_02101260
_LIT6: .word 0x0000019b
_LIT7: .word data_02101270
_LIT8: .word 0x000001ff

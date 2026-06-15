; func_02073ac0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101eb8
        .extern data_0219eef4
        .extern data_0219eefc
        .extern data_0219ef24
        .extern data_0219ef28
        .extern func_02094688
        .global func_02073ac0
        .arm
func_02073ac0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r4, _LIT0
    mov r7, r0
    ldr r0, [r4]
    mov r6, r2
    mov r5, r3
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r2, _LIT1
    ldr r2, [r2]
    cmp r2, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r2, [sp, #0x1c]
    add r2, r5, r2
    cmp r2, #0x8
    ldmccia sp!, {r4, r5, r6, r7, r8, lr}
    bxcc lr
    ldr r3, _LIT2
    cmp r2, r3
    ldmhiia sp!, {r4, r5, r6, r7, r8, lr}
    bxhi lr
    ldr r3, _LIT3
    ldrb r8, [r6]
    ldrb r4, [r3]
    cmp r8, r4
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    ldrb r8, [r6, #0x1]
    ldrb r4, [r3, #0x1]
    cmp r8, r4
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    ldrb r4, [r6, #0x2]
    ldrb r3, [r3, #0x2]
    cmp r4, r3
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    ldrb r3, [r6, #0x6]
    cmp r3, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    ldrb r3, [r6, #0x7]
    cmp r3, #0x0
    beq .L_208
    cmp r3, #0x6
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
.L_208:
    ldr r4, _LIT4
    add r2, r2, #0x9
    bic r2, r2, #0x1
    ldr lr, [r4]
    mov r3, r2, lsl #0x10
    ldr ip, _LIT5
    ldr r8, [r4]
    ldr r4, [ip]
    mov r2, r3, lsr #0x10
    cmp r8, r4
    add r4, lr, r3, lsr #0x10
    bcs .L_248
    ldr r3, [ip]
    cmp r3, r4
    ldmlsia sp!, {r4, r5, r6, r7, r8, lr}
    bxls lr
.L_248:
    ldr r3, _LIT1
    ldr r8, [r3]
    cmp r4, r8
    bne .L_274
    ldr r3, _LIT5
    mov r4, #0x0
    ldr r3, [r3]
    cmp r3, #0x0
    bne .L_298
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_274:
    ldr r3, [r3]
    cmp r4, r3
    bls .L_298
    ldr r3, _LIT5
    mov r4, r2
    ldr r3, [r3]
    cmp r3, r2
    ldmlsia sp!, {r4, r5, r6, r7, r8, lr}
    bxls lr
.L_298:
    ldr ip, _LIT4
    ldr r3, _LIT1
    ldr lr, [ip]
    ldr r8, [r3]
    add lr, lr, r2
    cmp lr, r8
    bls .L_2dc
    ldr r8, [r3]
    ldr r3, [ip]
    sub r3, r8, r3
    cmp r3, #0x2
    ldrcs r3, [ip]
    movcs r8, #0x0
    strcsh r8, [r0, r3]
    ldr r0, _LIT4
    mov r3, #0x0
    str r3, [r0]
.L_2dc:
    ldr ip, _LIT0
    ldr r3, _LIT4
    ldr r8, [ip]
    ldr lr, [r3]
    mov r0, r1
    strh r2, [r8, lr]
    ldr ip, [ip]
    ldr r1, [r3]
    mov r2, #0x6
    add r1, ip, r1
    add r1, r1, #0x2
    bl func_02094688
    ldr r1, _LIT0
    ldr r0, _LIT4
    ldr r2, [r1]
    ldr r1, [r0]
    mov r0, r7
    add r1, r2, r1
    add r1, r1, #0x8
    mov r2, #0x6
    bl func_02094688
    ldr r1, _LIT0
    ldr r0, _LIT4
    ldr r2, [r1]
    ldr r1, [r0]
    add r0, r6, #0x6
    add r1, r2, r1
    add r1, r1, #0xe
    sub r2, r5, #0x6
    bl func_02094688
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    beq .L_38c
    ldr r2, [sp, #0x1c]
    cmp r2, #0x0
    beq .L_38c
    ldr r3, _LIT0
    ldr r1, _LIT4
    ldr r3, [r3]
    ldr r1, [r1]
    add r1, r3, r1
    add r1, r1, #0x8
    add r1, r1, r5
    bl func_02094688
.L_38c:
    ldr r0, _LIT4
    str r4, [r0]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_0219ef24
_LIT1: .word data_0219ef28
_LIT2: .word 0x000005e4
_LIT3: .word data_02101eb8
_LIT4: .word data_0219eef4
_LIT5: .word data_0219eefc

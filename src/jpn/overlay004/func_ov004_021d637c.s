; func_ov004_021d637c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern data_ov004_0220efc8
        .extern func_02032638
        .extern func_02032ee4
        .extern func_020342f4
        .extern func_02034310
        .extern func_02052c68
        .extern func_02094500
        .extern func_02094688
        .global func_ov004_021d637c
        .arm
func_ov004_021d637c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    str r0, [sp]
    bl func_020342f4
    mov r5, #0x0
    ldr r6, _LIT0
    mov fp, r0
    mov r0, r6
    add r0, r0, #0x3000
    ldr r7, _LIT1
    mov r4, r5
    str r0, [sp, #0x4]
.L_30:
    cmp fp, #0x0
    ldrneb r0, [fp, r4]
    cmpne r0, #0x0
    beq .L_120
    sub r2, r0, #0x1
    ldr r0, _LIT0
    mov r1, #0x54
    mla r9, r2, r1, r0
    add r3, r6, #0x3000
    mov r0, #0x0
    str r0, [r3, #0xd70]
    add ip, r9, #0x3000
    ldr r1, [r3, #0xd34]
    ldr r0, [ip, #0xd34]
    cmp r1, r0
    bls .L_e0
    add r0, r9, #0x128
    add r8, r0, #0x3c00
    ldrb sl, [r3, #0xd78]
    ldrb lr, [ip, #0xd78]
    ldmia r8, {r0, r1, r2}
    add sl, sl, lr
    strb sl, [r3, #0xd78]
    add sl, sp, #0x8
    stmia sl, {r0, r1, r2}
    ldrb sl, [r3, #0xd79]
    ldrb r2, [ip, #0xd79]
    mov r0, r7
    mov r1, r8
    add r2, sl, r2
    strb r2, [r3, #0xd79]
    ldrb sl, [ip, #0xd7a]
    ldrb ip, [r3, #0xd7a]
    mov r2, #0x54
    add sl, ip, sl
    strb sl, [r3, #0xd7a]
    bl func_02094688
    add r0, sp, #0x8
    ldmia r0, {r0, r1, r2}
    stmia r8, {r0, r1, r2}
    add r3, r9, #0x3000
    mov r0, #0x1
    str r0, [r3, #0xd70]
    b .L_110
.L_e0:
    ldrb r1, [ip, #0xd78]
    ldrb r0, [r3, #0xd78]
    add r0, r1, r0
    strb r0, [ip, #0xd78]
    ldrb r1, [ip, #0xd79]
    ldrb r0, [r3, #0xd79]
    add r0, r1, r0
    strb r0, [ip, #0xd79]
    ldrb r0, [r3, #0xd7a]
    ldrb r1, [ip, #0xd7a]
    add r0, r1, r0
    strb r0, [ip, #0xd7a]
.L_110:
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    str r1, [r0, #0xcd0]
    b .L_140
.L_120:
    bl func_02032638
    cmp r0, #0x0
    beq .L_140
    bl func_02032638
    mov r1, r5
    mov r2, r7
    bl func_02032ee4
    add r5, r5, #0x1
.L_140:
    add r6, r6, #0x54
    add r7, r7, #0x54
    add r4, r4, #0x1
    cmp r4, #0x3c
    blt .L_30
    ldr r7, _LIT0
    mov r5, #0x54
    mov r0, r7
    add r0, r0, #0x128
    mov sl, #0x0
    add r6, r0, #0x3c00
    mov r4, r5
    mov fp, r5
.L_174:
    add r0, r7, #0x3000
    ldr r0, [r0, #0xd70]
    cmp r0, #0x0
    bne .L_1cc
    mov r9, sl
    cmp sl, #0x3b
    bge .L_1b8
    mla r8, sl, fp, r6
.L_194:
    add r1, r9, #0x1
    mla r0, r1, r4, r6
    mov r1, r8
    mov r2, r5
    bl func_02094688
    add r9, r9, #0x1
    cmp r9, #0x3b
    add r8, r8, #0x54
    blt .L_194
.L_1b8:
    mov r0, #0x54
    mla r0, r9, r0, r6
    mov r1, #0x0
    mov r2, #0x54
    bl func_02094500
.L_1cc:
    add sl, sl, #0x1
    cmp sl, #0x3c
    add r7, r7, #0x54
    blt .L_174
    bl func_02034310
    ldr r0, [sp]
    cmp r0, #0x0
    addeq sp, sp, #0x14
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    mov r5, #0x0
    add r0, r0, #0x128
    add r4, r0, #0x3c00
.L_200:
    ldr r0, [sp]
    mov r1, r4
    bl func_02052c68
    cmp r0, #0x0
    beq .L_26c
    mov r2, #0x54
    mul r6, r5, r2
    ldr r0, _LIT0
    add r0, r0, r6
    add r4, r0, #0x3000
    ldr r0, _LIT0
    ldrb r3, [r4, #0xd78]
    add r0, r0, #0x128
    add r1, r0, #0x3c00
    ldr r0, [sp]
    add r1, r1, r6
    strb r3, [r0, #0x50]
    ldrb r5, [r4, #0xd79]
    mov r3, r0
    strb r5, [r3, #0x51]
    ldrb r5, [r4, #0xd7a]
    strb r5, [r3, #0x52]
    ldr r4, [r4, #0xd74]
    str r4, [r3, #0x4c]
    bl func_02094688
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_26c:
    add r5, r5, #0x1
    cmp r5, #0x3c
    add r4, r4, #0x54
    blt .L_200
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_ov004_0220efc8

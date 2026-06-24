; func_0203678c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern data_0219b860
        .extern func_020361fc
        .global func_0203678c
        .arm
func_0203678c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r0
    mov r0, r5, lsr #0x14
    and r0, r0, #0xf
    cmp r0, #0x3
    cmpne r0, #0x4
    mov r4, r1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r5, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0xc
    mul r2, r1, r0
    ldr r0, _LIT0
    mov r8, #0x0
    ldr r9, [r0, #0x34]
    ldr r7, _LIT1
    ldrb r1, [r9, r2]
    mov r0, r8
    mov lr, r8
    and r6, r1, #0x7f
    mov r5, #0x8000
    mov r1, #0xc
.L_5c:
    ldrsb r2, [r7, #0x6a]
    cmp r2, #0x0
    blt .L_d8
    cmp r7, r4
    beq .L_d8
    ldr r3, [r7, #0x34]
    tst r3, #0x1000000
    beq .L_d8
    mov r2, r3, lsl #0x10
    mov sl, r2, lsr #0x10
    ldrsb r2, [r7, #0x6f]
    mul ip, sl, r1
    mov r3, r3, lsr #0x14
    cmp r2, #0x0
    and r3, r3, #0xf
    blt .L_d8
    cmp r2, r5
    bge .L_d8
    ldrb ip, [r9, ip]
    and ip, ip, #0x7f
    cmp ip, r6
    bgt .L_d8
    sub r3, r3, #0x3
    cmp r3, #0x1
    bhi .L_d8
    ldr r3, [r7]
    ldrsb r3, [r3, #0x59]
    cmp r3, #0x1
    moveq r5, r2
    moveq r0, r7
    movne r8, r7
.L_d8:
    add lr, lr, #0x1
    cmp lr, #0x18
    add r7, r7, #0x78
    blt .L_5c
    cmp r0, #0x0
    bne .L_158
    cmp r8, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r5, [r8, #0x34]
    mov r8, #0x0
    ldr r7, _LIT1
    mov r6, r8
.L_10c:
    ldrsb r0, [r7, #0x6a]
    cmp r0, #0x0
    blt .L_140
    cmp r7, r4
    beq .L_140
    ldr r0, [r7, #0x34]
    tst r0, #0x1000000
    beq .L_140
    cmp r0, r5
    bne .L_140
    mov r0, r7
    mov r1, r6
    bl func_020361fc
.L_140:
    add r8, r8, #0x1
    cmp r8, #0x18
    add r7, r7, #0x78
    blt .L_10c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_158:
    mov r1, #0x0
    bl func_020361fc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219b200
_LIT1: .word data_0219b860

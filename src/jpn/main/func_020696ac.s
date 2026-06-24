; func_020696ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101cb8
        .extern data_02101cd0
        .extern func_02054c84
        .extern func_02069888
        .extern func_02069980
        .extern func_02069a10
        .extern func_02069ba0
        .extern func_02069d70
        .extern func_0206b1e4
        .extern func_020a6c60
        .extern func_020a7294
        .global func_020696ac
        .arm
func_020696ac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r9, r0
    ldr r0, [r9, #0x80]
    mov r8, #0x0
    cmp r0, #0x3
    blt .L_1b4
    ldr sl, _LIT0
    ldr fp, _LIT1
    add r7, sp, #0x0
    mov r6, r8
    mov r4, r8
    add r5, r9, #0x80
.L_34:
    ldr r0, [r9, #0x7c]
    ldrb r1, [r0]
    ldrb r0, [r0, #0x1]
    strb r1, [r7]
    strb r0, [r7, #0x1]
    ldrh r0, [sp]
    mov r1, r0, asr #0x8
    mov r0, r0, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    strh r0, [sp]
    ldrh r2, [sp]
    cmp r2, #0x1000
    movhi r8, #0x4
    bhi .L_1b4
    ldr r0, [r9, #0x80]
    cmp r0, r2
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [r9, #0x7c]
    ldrsb r0, [r1, #0x2]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_14c
    b .L_14c
    b .L_b8
    b .L_d0
    b .L_e8
    b .L_108
    b .L_120
    b .L_138
.L_b8:
    mov r0, r9
    add r1, r1, #0x3
    sub r2, r2, #0x3
    bl func_02069d70
    mov r8, r0
    b .L_14c
.L_d0:
    mov r0, r9
    add r1, r1, #0x3
    sub r2, r2, #0x3
    bl func_02069888
    mov r8, r0
    b .L_14c
.L_e8:
    ldr r0, [r9, #0x4b0]
    mov r3, r6
    bl func_02054c84
    cmp r0, #0x0
    bgt .L_14c
    add sp, sp, #0x4
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_108:
    mov r0, r9
    add r1, r1, #0x3
    sub r2, r2, #0x3
    bl func_02069980
    mov r8, r0
    b .L_14c
.L_120:
    mov r0, r9
    add r1, r1, #0x3
    sub r2, r2, #0x3
    bl func_02069a10
    mov r8, r0
    b .L_14c
.L_138:
    mov r0, r9
    add r1, r1, #0x3
    sub r2, r2, #0x3
    bl func_02069ba0
    mov r8, r0
.L_14c:
    ldrh r0, [sp]
    ldr r1, [r5]
    sub r0, r1, r0
    str r0, [r5]
    ldr r0, [r9, #0x80]
    cmp r0, #0x0
    bge .L_17c
    ldr r3, _LIT2
    mov r0, sl
    mov r1, fp
    mov r2, r4
    bl func_020a6c60
.L_17c:
    ldr r2, [r9, #0x80]
    cmp r2, #0x0
    beq .L_1a0
    ldr r0, [r9, #0x7c]
    cmp r0, #0x0
    beq .L_1a0
    ldrh r1, [sp]
    add r1, r0, r1
    bl func_020a7294
.L_1a0:
    cmp r8, #0x0
    bne .L_1b4
    ldr r0, [r9, #0x80]
    cmp r0, #0x3
    bge .L_34
.L_1b4:
    cmp r8, #0x0
    beq .L_1c4
    mov r0, r9
    bl func_0206b1e4
.L_1c4:
    mov r0, r8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02101cb8
_LIT1: .word data_02101cd0
_LIT2: .word 0x000005b4

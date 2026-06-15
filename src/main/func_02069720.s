; func_02069720 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101d98
        .extern data_02101db0
        .extern func_02054cf8
        .extern func_020698fc
        .extern func_020699f4
        .extern func_02069a84
        .extern func_02069c14
        .extern func_02069de4
        .extern func_0206b258
        .extern func_020a6d54
        .extern func_020a7388
        .global func_02069720
        .arm
func_02069720:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r9, r0
    ldr r0, [r9, #0x80]
    mov r8, #0x0
    cmp r0, #0x3
    blt .L_95c
    ldr sl, _LIT0
    ldr fp, _LIT1
    add r7, sp, #0x0
    mov r6, r8
    mov r4, r8
    add r5, r9, #0x80
.L_7dc:
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
    bhi .L_95c
    ldr r0, [r9, #0x80]
    cmp r0, r2
    addlt sp, sp, #0x4
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [r9, #0x7c]
    ldrsb r0, [r1, #0x2]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_8f4
    b .L_8f4
    b .L_860
    b .L_878
    b .L_890
    b .L_8b0
    b .L_8c8
    b .L_8e0
.L_860:
    mov r0, r9
    add r1, r1, #0x3
    sub r2, r2, #0x3
    bl func_02069de4
    mov r8, r0
    b .L_8f4
.L_878:
    mov r0, r9
    add r1, r1, #0x3
    sub r2, r2, #0x3
    bl func_020698fc
    mov r8, r0
    b .L_8f4
.L_890:
    ldr r0, [r9, #0x4b0]
    mov r3, r6
    bl func_02054cf8
    cmp r0, #0x0
    bgt .L_8f4
    add sp, sp, #0x4
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8b0:
    mov r0, r9
    add r1, r1, #0x3
    sub r2, r2, #0x3
    bl func_020699f4
    mov r8, r0
    b .L_8f4
.L_8c8:
    mov r0, r9
    add r1, r1, #0x3
    sub r2, r2, #0x3
    bl func_02069a84
    mov r8, r0
    b .L_8f4
.L_8e0:
    mov r0, r9
    add r1, r1, #0x3
    sub r2, r2, #0x3
    bl func_02069c14
    mov r8, r0
.L_8f4:
    ldrh r0, [sp]
    ldr r1, [r5]
    sub r0, r1, r0
    str r0, [r5]
    ldr r0, [r9, #0x80]
    cmp r0, #0x0
    bge .L_924
    ldr r3, _LIT2
    mov r0, sl
    mov r1, fp
    mov r2, r4
    bl func_020a6d54
.L_924:
    ldr r2, [r9, #0x80]
    cmp r2, #0x0
    beq .L_948
    ldr r0, [r9, #0x7c]
    cmp r0, #0x0
    beq .L_948
    ldrh r1, [sp]
    add r1, r0, r1
    bl func_020a7388
.L_948:
    cmp r8, #0x0
    bne .L_95c
    ldr r0, [r9, #0x80]
    cmp r0, #0x3
    bge .L_7dc
.L_95c:
    cmp r8, #0x0
    beq .L_96c
    mov r0, r9
    bl func_0206b258
.L_96c:
    mov r0, r8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02101d98
_LIT1: .word data_02101db0
_LIT2: .word 0x000005b4

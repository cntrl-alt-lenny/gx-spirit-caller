; func_02073318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_02101eb8
        .extern data_0219ef1c
        .extern data_0219ef2c
        .extern func_02073450
        .extern func_02073ac0
        .extern func_02073e54
        .extern func_02073f84
        .extern func_02094688
        .global func_02073318
        .arm
func_02073318:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r1
    mov r5, r3
    add r1, r7, #0x14
    add r1, r1, r5
    ldr r3, [sp, #0x24]
    mov r1, r1, lsl #0x10
    mov r4, r1, lsr #0x10
    mov r1, r3, lsl #0x10
    mov r3, r4, asr #0x8
    mov r1, r1, lsr #0x10
    mov r8, r0
    orr r3, r3, r4, lsl #0x8
    mov r0, r1, asr #0x8
    strh r3, [r8, #-18]
    orr r0, r0, r1, lsl #0x8
    strh r0, [r8, #-14]
    mov r3, #0x0
    sub r0, r8, #0x14
    mov r1, #0x14
    mov r6, r2
    strh r3, [r8, #-10]
    ldr r4, [sp, #0x20]
    bl func_02073f84
    mov r2, r0, asr #0x8
    ldr r1, _LIT0
    orr r0, r2, r0, lsl #0x8
    strh r0, [r8, #-10]
    cmp r4, r1
    beq .L_bb8
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r4, r0
    beq .L_bb8
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    mov ip, #0x800
    sub r0, r8, #0x14
    add r1, r7, #0x14
    str ip, [sp, #0x4]
    bl func_02073450
.L_bb8:
    ldr r0, _LIT0
    cmp r4, r0
    beq .L_bec
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r4, r0
    beq .L_bec
    mov r0, r4
    bl func_02073e54
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
.L_bec:
    ldr r0, _LIT2
    sub r1, r8, #0x1c
    mov r2, #0x8
    bl func_02094688
    bl OS_DisableIrq
    mov r4, r0
    ldr r0, _LIT3
    str r6, [sp]
    mov r1, r0
    str r5, [sp, #0x4]
    sub r2, r8, #0x1c
    add r3, r7, #0x1c
    bl func_02073ac0
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word 0x7f000001
_LIT1: .word data_0219ef1c
_LIT2: .word data_02101eb8
_LIT3: .word data_0219ef2c

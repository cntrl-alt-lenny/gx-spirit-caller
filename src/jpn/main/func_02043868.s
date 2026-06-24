; func_02043868 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020feb68
        .extern func_02094500
        .extern func_02094688
        .global func_02043868
        .arm
func_02043868:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    str r2, [sp]
    umull r4, r5, r1, r4
    ldr r6, _LIT1
    mov r5, r5, lsr #0x1
    umull r4, r5, r6, r5
    mov sl, r0
    subs r5, r1, r4
    movne r4, #0x4
    ldr r2, _LIT0
    ldr r0, [sp]
    moveq r4, #0x0
    cmp r0, #0x0
    umull r0, r2, r1, r2
    mov r2, r2, lsr #0x1
    addeq sp, sp, #0xc
    add r0, r4, r2, lsl #0x2
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r3, r0
    addcc sp, sp, #0xc
    mvncc r0, #0x0
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r7, sl, r1
    ldr r6, [sp]
    cmp sl, r7
    beq .L_190
    mov r0, #0x1
    mov r5, #0x0
    str r0, [sp, #0x4]
    mov fp, #0x3
    mov r4, #0x2a
.L_84:
    sub r9, r7, sl
    ldr r1, _LIT2
    mov r0, r9, lsl #0x3
    smull r2, r3, r1, r0
    ldr r1, _LIT3
    add r3, r3, r0, lsr #0x1f
    smull r2, r3, r1, r3
    subs r3, r0, r2
    ldr r1, _LIT2
    ldrne r8, [sp, #0x4]
    smull r2, r3, r1, r0
    moveq r8, r5
    add r3, r3, r0, lsr #0x1f
    cmp r9, #0x3
    movge r9, fp
    add r0, sp, #0x8
    mov r1, r5
    mov r2, fp
    add r8, r3, r8
    bl func_02094500
    mov r0, sl
    add r1, sp, #0x8
    mov r2, r9
    bl func_02094688
    ldr r0, _LIT4
    cmp r8, #0x2
    ldr r1, [r0]
    ldrb r0, [sp, #0x8]
    mov r0, r0, asr #0x2
    ldrsb r0, [r1, r0]
    strb r0, [r6]
    strltb r4, [r6, #0x1]
    blt .L_12c
    ldrb r2, [sp, #0x8]
    ldr r0, _LIT4
    ldrb r1, [sp, #0x9]
    mov r2, r2, lsl #0x4
    and r2, r2, #0x3f
    ldr r0, [r0]
    orr r1, r2, r1, asr #0x4
    ldrsb r0, [r0, r1]
    strb r0, [r6, #0x1]
.L_12c:
    cmp r8, #0x3
    strltb r4, [r6, #0x2]
    blt .L_15c
    ldrb r2, [sp, #0x9]
    ldr r0, _LIT4
    ldrb r1, [sp, #0xa]
    mov r2, r2, lsl #0x2
    and r2, r2, #0x3f
    ldr r0, [r0]
    orr r1, r2, r1, asr #0x6
    ldrsb r0, [r0, r1]
    strb r0, [r6, #0x2]
.L_15c:
    cmp r8, #0x4
    strltb r4, [r6, #0x3]
    blt .L_180
    ldr r0, _LIT4
    ldrb r1, [sp, #0xa]
    ldr r2, [r0]
    and r0, r1, #0x3f
    ldrsb r0, [r2, r0]
    strb r0, [r6, #0x3]
.L_180:
    add sl, sl, r9
    cmp sl, r7
    add r6, r6, #0x4
    bne .L_84
.L_190:
    ldr r0, [sp]
    sub r0, r6, r0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xaaaaaaab
_LIT1: .word 0x00000003
_LIT2: .word 0x2aaaaaab
_LIT3: .word 0x00000006
_LIT4: .word data_020feb68

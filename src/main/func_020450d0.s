; func_020450d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bece4
        .extern func_02094688
        .global func_020450d0
        .arm
func_020450d0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov lr, #0x0
    and ip, lr, #0x0
    mvn r5, #-16777216
    ldr r4, _LIT0
    and r2, r2, #0x1
    mov r6, ip, lsl #0x2
    and r3, r3, #0x3
    and r5, r1, r5
    orr r1, r3, r2, lsl #0x2
    orr r6, r6, r2, lsr #0x1e
    mov r7, ip, lsl #0x3
    and r2, r0, r4
    orr r0, r1, r5, lsl #0x3
    orr r1, r0, r2, lsl #0x1b
    mov r3, ip, lsl #0x1b
    orr r3, r3, r2, lsr #0x5
    orr r7, r7, r5, lsr #0x1d
    orr r0, ip, r6
    orr r0, r7, r0
    orr r0, r3, r0
    add r2, sp, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
.L_64:
    ldrb r0, [r2]
    add lr, lr, #0x1
    cmp lr, #0x6
    eor r0, r0, #0xd6
    strb r0, [r2], #0x1
    blt .L_64
    ldr r2, _LIT1
    add r5, sp, #0x0
    mov r4, #0x0
.L_88:
    ldrb r3, [r5]
    add r4, r4, #0x1
    cmp r4, #0x5
    mov r0, r3, asr #0x4
    and r1, r0, #0xf
    and r0, r3, #0xf
    ldrb r1, [r2, r1]
    ldrb r0, [r2, r0]
    orr r0, r0, r1, lsl #0x4
    strb r0, [r5], #0x1
    blt .L_88
    add r0, sp, #0x0
    add r1, sp, #0x8
    mov r2, #0x8
    bl func_02094688
    ldr r4, _LIT2
    add r5, sp, #0x8
    mov r3, #0x0
    add r1, sp, #0x0
.L_d4:
    ldrb r2, [r5]
    ldrb r0, [r4]
    add r3, r3, #0x1
    cmp r3, #0x5
    strb r2, [r1, r0]
    add r5, r5, #0x1
    add r4, r4, #0x1
    blt .L_d4
    ldrb r2, [sp, #0x5]
    mov r0, #0x0
    ldr r3, [sp]
    and r2, r2, #0x7
    strb r0, [sp, #0x7]
    strb r0, [sp, #0x6]
    strb r2, [sp, #0x5]
    ldr r2, [sp, #0x4]
    mov r4, r3, lsl #0x1
    mov r2, r2, lsl #0x1
    orr r2, r2, r3, lsr #0x1f
    str r2, [sp, #0x4]
    ldrb r2, [sp, #0x5]
    str r4, [sp]
    ldrb r3, [sp]
    mov r2, r2, asr #0x3
    and r2, r2, #0x1
    orr r2, r3, r2
    strb r2, [sp]
.L_140:
    ldrb r2, [r1]
    add r0, r0, #0x1
    cmp r0, #0x6
    eor r2, r2, #0x67
    strb r2, [r1], #0x1
    blt .L_140
    ldrb r0, [sp, #0x5]
    mov r1, #0x0
    strb r1, [sp, #0x7]
    and r0, r0, #0x7
    strb r1, [sp, #0x6]
    strb r0, [sp, #0x5]
    ldr r0, [sp]
    ldr r1, [sp, #0x4]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word data_020bece4+0x44
_LIT2: .word data_020bece4+0x3c

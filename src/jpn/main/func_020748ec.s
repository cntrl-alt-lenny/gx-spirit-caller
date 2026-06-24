; func_020748ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee00
        .extern func_02070898
        .extern func_020709d8
        .extern func_02075a00
        .extern func_02094688
        .global func_020748ec
        .arm
func_020748ec:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r4, [r5, #0xc]
    ldr r0, [r4, #0x824]
    cmp r0, #0x0
    bne .L_b0
    ldr r0, [r5, #0x44]
    cmp r0, #0x5
    addcc sp, sp, #0x8
    ldmccia sp!, {r4, r5, r6, lr}
    bxcc lr
    add r0, sp, #0x0
    mov r1, r5
    bl func_020709d8
    ldrb r2, [r0, #0x3]
    ldrb r0, [r0, #0x4]
    ldr r1, _LIT0
    add r0, r0, r2, lsl #0x8
    add r0, r0, #0x5
    str r0, [sp]
    cmp r0, r1
    movhi r0, #0x9
    addhi sp, sp, #0x8
    strhib r0, [r4, #0x455]
    ldmhiia sp!, {r4, r5, r6, lr}
    bxhi lr
    ldr r1, _LIT1
    ldr r1, [r1]
    blx r1
    str r0, [r4, #0x824]
    ldr r0, [r4, #0x824]
    cmp r0, #0x0
    moveq r0, #0x9
    addeq sp, sp, #0x8
    streqb r0, [r4, #0x455]
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldr r1, [sp]
    mov r0, #0x0
    str r1, [r4, #0x828]
    str r0, [r4, #0x82c]
    strb r0, [r4, #0x456]
    b .L_c4
.L_b0:
    ldr r0, [r5, #0x44]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
.L_c4:
    add r0, sp, #0x0
    mov r1, r5
    bl func_020709d8
    ldr r3, [r4, #0x828]
    ldr r2, [r4, #0x82c]
    ldr r1, [sp]
    sub r2, r3, r2
    cmp r1, r2
    strcs r2, [sp]
    movcs r6, #0x1
    ldr r3, [r4, #0x824]
    ldr r1, [r4, #0x82c]
    ldr r2, [sp]
    add r1, r3, r1
    movcc r6, #0x0
    bl func_02094688
    ldr r0, [sp]
    mov r1, r5
    bl func_02070898
    cmp r6, #0x0
    beq .L_140
    ldr r1, [r4, #0x824]
    mov r0, r4
    bl func_02075a00
    ldrb r0, [r4, #0x456]
    add sp, sp, #0x8
    cmp r0, #0x0
    moveq r0, #0x0
    streq r0, [r4, #0x824]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_140:
    ldr r1, [r4, #0x82c]
    ldr r0, [sp]
    add r0, r1, r0
    str r0, [r4, #0x82c]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x00004805
_LIT1: .word data_0219ee00

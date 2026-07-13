; func_0207a868 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a088c
        .extern func_02079e4c
        .extern func_02079e70
        .extern func_0207a7d4
        .extern func_0207a868
        .extern func_0207af28
        .extern func_0207b038
        .extern func_0207b0e0
        .extern func_0207b13c
        .extern func_0207b18c
        .extern func_0207c698
        .extern func_020928cc
        .extern func_0209eb00
        .extern func_0209eb48
        .extern func_020b3a7c
        .global func_0207a868
        .arm
func_0207a868:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, #0x14
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_2ac
    b .L_34
    b .L_29c
    b .L_2ac
    b .L_2ac
    b .L_2ac
.L_34:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0x260]
    cmp r0, #0x5
    bne .L_68
    mov r0, #0x6
    bl func_0207b038
    mov r0, #0x0
    ldr r3, _LIT1
    mov r1, r0
    mov r2, r0
    bl func_0207b13c
.L_68:
    ldr r1, _LIT0
    ldr r2, [r1]
    add r0, r2, #0x2000
    ldr r0, [r0, #0x260]
    cmp r0, #0x6
    beq .L_94
    cmp r0, #0x7
    beq .L_20c
    cmp r0, #0xd
    beq .L_21c
    b .L_22c
.L_94:
    add r0, r2, #0x2200
    mov r2, #0x7
    strh r2, [r0, #0x80]
    ldrh r0, [r5, #0x8]
    cmp r0, #0x5
    bne .L_120
    ldr r0, [r1]
    add r1, r0, #0x2200
    add r0, r0, #0x2000
    ldrh r1, [r1, #0x8c]
    ldr r0, [r0, #0x288]
    bl func_020928cc
    ldrh r0, [r5, #0xe]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_120
    ldr r8, _LIT2
    mov r6, r4
    mov r7, #0x7
.L_e0:
    add r0, r5, r4, lsl #0x1
    add r2, r5, r4, lsl #0x2
    ldrh r1, [r0, #0x50]
    ldr r0, [r2, #0x10]
    bl func_0207c698
    str r8, [sp]
    add r0, r5, r4, lsl #0x2
    ldr r2, [r0, #0x10]
    mov r0, r7
    mov r1, r6
    mov r3, r5
    bl func_0207b0e0
    ldrh r0, [r5, #0xe]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_e0
.L_120:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x2000
    ldr r1, [r0, #0x264]
    and r0, r1, #0xc00000
    cmp r0, #0xc00000
    bne .L_18c
    ldr r0, _LIT3
    and r0, r1, r0
    bl func_02079e4c
    movs r1, r0
    beq .L_18c
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x2000
    ldr r6, [r0, #0x284]
    mov r0, r6
    bl func_020b3a7c
    cmp r1, #0x0
    bne .L_18c
    ldr r4, _LIT4
    mov r1, #0x0
    mov r2, r6
    mov r3, r1
    mov r0, #0x8
    str r4, [sp]
    bl func_0207b0e0
.L_18c:
    ldrh r0, [r5, #0xa]
    bl func_02079e70
    rsb r0, r0, #0x20
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_0207b18c
    ldr r1, _LIT0
    mov r2, #0x1
    mov r2, r2, lsl r0
    ldr r0, [r1]
    mov r2, r2, asr #0x1
    add r0, r0, #0x2200
    strh r2, [r0, #0x8e]
    ldr r0, [r1]
    add r1, r0, #0x2200
    add r0, r0, #0x2000
    ldrh r1, [r1, #0x8c]
    ldr r0, [r0, #0x288]
    bl func_020928cc
    ldr r3, _LIT0
    ldr r2, _LIT5
    ldr r1, [r3]
    ldr r0, _LIT6
    add r1, r1, #0x2000
    ldr r4, [r1, #0x284]
    add r4, r4, #0x1
    str r4, [r1, #0x284]
    ldr r1, [r3]
    add r1, r1, r2
    bl func_0209eb48
    mov r4, r0
    b .L_22c
.L_20c:
    ldr r0, _LIT7
    bl func_0209eb00
    mov r4, r0
    b .L_22c
.L_21c:
    bl func_0207af28
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_22c:
    cmp r4, #0x2
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    cmp r4, #0x3
    beq .L_274
    cmp r4, #0x8
    bne .L_274
    mov r0, #0xc
    bl func_0207b038
    mov r1, #0x0
    ldr r3, _LIT8
    mov r2, r1
    mov r0, #0x1
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_274:
    mov r0, #0xb
    bl func_0207b038
    mov r1, #0x0
    ldr r3, _LIT9
    mov r2, r1
    mov r0, #0x7
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_29c:
    bl func_0207af28
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_2ac:
    mov r0, #0xb
    bl func_0207b038
    mov r1, #0x0
    ldr r3, _LIT10
    mov r2, r1
    mov r0, #0x7
    bl func_0207b13c
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word 0x00000704
_LIT2: .word 0x0000071a
_LIT3: .word 0x00003ffe
_LIT4: .word 0x00000728
_LIT5: .word 0x00002288
_LIT6: .word func_0207a868
_LIT7: .word func_0207a7d4
_LIT8: .word 0x00000753
_LIT9: .word 0x0000075c
_LIT10: .word 0x0000076d

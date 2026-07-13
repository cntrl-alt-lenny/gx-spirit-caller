; func_0207b250 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee6c
        .extern data_021a088c
        .extern func_0207b18c
        .extern func_0207b548
        .extern func_02094688
        .extern func_0209e308
        .global func_0207b250
        .arm
func_0207b250:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r0, r2
    mov r4, r1
    bl func_0207b548
    ldr r2, _LIT0
    mov r3, #0x400
    ldr r1, [r2]
    mov r0, #0x0
    add ip, r1, #0x1500
    add r1, r1, #0x2000
    str ip, [r1, #0x288]
    ldr r1, [r2]
    add r1, r1, #0x2200
    strh r3, [r1, #0x8c]
    bl func_0207b18c
    ldr r1, _LIT0
    mov r2, #0x1
    mov r2, r2, lsl r0
    ldr r0, [r1]
    mov r2, r2, asr #0x1
    add r0, r0, #0x2200
    strh r2, [r0, #0x8e]
    ldr r0, [r1]
    add r0, r0, #0x2200
    ldrh r0, [r0, #0x68]
    cmp r0, #0x0
    bne .L_78
    bl func_0209e308
.L_78:
    ldr r2, _LIT0
    ldr r1, [r2]
    add r1, r1, #0x2200
    strh r0, [r1, #0x90]
    ldr r1, [r2]
    add r0, r1, #0x2000
    ldr r0, [r0, #0x264]
    and r0, r0, #0x300000
    cmp r0, #0x300000
    movne r2, #0x1
    moveq r2, #0x0
    add r0, r1, #0x2200
    strh r2, [r0, #0x98]
    cmp r5, #0x0
    bne .L_d4
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0]
    ldr r0, _LIT2
    add r1, r2, r1
    mov r2, #0x6
    bl func_02094688
    b .L_f0
.L_d4:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, [r0]
    mov r0, r5
    add r1, r2, r1
    mov r2, #0x6
    bl func_02094688
.L_f0:
    cmp r4, #0x0
    beq .L_104
    ldr r0, _LIT3
    cmp r4, r0
    bne .L_138
.L_104:
    ldr r0, _LIT0
    ldr r1, _LIT4
    ldr r2, [r0]
    ldr r0, _LIT3
    add r1, r2, r1
    mov r2, #0x20
    bl func_02094688
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x9a]
    b .L_184
.L_138:
    ldr r0, _LIT0
    ldr r1, _LIT4
    ldr r2, [r0]
    mov r0, r4
    add r1, r2, r1
    mov r2, #0x20
    bl func_02094688
    mov r1, #0x0
.L_158:
    ldrb r0, [r4]
    cmp r0, #0x0
    beq .L_174
    add r1, r1, #0x1
    cmp r1, #0x20
    add r4, r4, #0x1
    blt .L_158
.L_174:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x9a]
.L_184:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x2000
    str r1, [r0, #0x284]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word 0x00002292
_LIT2: .word data_020bee6c+0x10
_LIT3: .word data_020bee6c+0x18
_LIT4: .word 0x0000229c

; func_02050450 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffa60
        .extern data_020ffa6c
        .extern data_020ffa78
        .extern func_02046760
        .extern func_020467e4
        .extern func_0204682c
        .extern func_020498f0
        .extern func_0204c40c
        .extern func_02050054
        .extern func_02050118
        .extern func_020624cc
        .extern func_02062784
        .extern func_02062790
        .extern func_020acca0
        .global func_02050450
        .arm
func_02050450:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r1
    mov r7, r2
    mov r6, r3
    bl func_020498f0
    cmp r0, #0x0
    beq .L_350
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x7
    bne .L_350
    bl func_020498f0
    ldrb r0, [r0, #0x1a9]
    cmp r0, #0x0
    beq .L_368
.L_350:
    ldr r1, _LIT0
    mov r0, r8
    mvn r2, #0x0
    bl func_02062784
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_368:
    bl func_0204682c
    mov r5, r0
    mvn r2, #0x0
    cmp r5, r2
    bne .L_39c
    ldr r1, _LIT1
    mov r0, r8
    bl func_02062784
    ldr r1, _LIT2
    mov r0, #0x6
    bl func_02050054
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_39c:
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x210]
    cmp r7, r0
    bne .L_3e0
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x200
    ldrh r0, [r0, #0x90]
    cmp r6, r0
    beq .L_470
.L_3e0:
    ldr r0, [sp, #0x24]
    ldrb r1, [r0]
    cmp r1, #0x0
    beq .L_458
    mov r1, #0x0
    mov r2, #0xa
    bl func_020acca0
    mov r4, r0
    bl func_020498f0
    mov r9, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r9, r0, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r4, r0
    bne .L_458
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x2
    str r7, [r0, #0x210]
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    add r0, r4, r0, lsl #0x1
    add r0, r0, #0x200
    strh r6, [r0, #0x90]
    b .L_470
.L_458:
    ldr r1, _LIT3
    mov r0, r8
    mvn r2, #0x0
    bl func_02062784
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_470:
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x18c]
    str r1, [r0, #0x190]
    bl func_020498f0
    ldr r1, [r0, #0x8]
    mov r0, r8
    bl func_02062790
    cmp r0, #0x0
    bne .L_4ac
    ldr r1, _LIT4
    mov r0, #0x6
    bl func_02050054
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_4ac:
    bl func_02050118
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    bne .L_4e0
    ldr r1, [sp, #0x20]
    ldr r0, _LIT5
    mov r4, r1, asr #0x1
    cmp r4, r0
    movge r4, r0
    bl func_020498f0
    add r0, r0, #0x100
    strh r4, [r0, #0xb0]
.L_4e0:
    mov r0, r5
    bl func_020467e4
    mov r4, r0
    mov r0, r5
    bl func_02046760
    str r8, [r4]
    mov r4, r0
    bl func_020498f0
    ldrb r1, [r0, #0xd]
    add r1, r1, #0x1
    strb r1, [r0, #0xd]
    strb r5, [r4]
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldrb r1, [r0, #0xd]
    mov r0, r8
    mov r2, #0x0
    sub r1, r1, #0x1
    add r1, r5, r1
    ldrb r3, [r1, #0x2d0]
    mov r1, r4
    strb r3, [r4, #0x1]
    strh r2, [r4, #0x2]
    str r2, [r4, #0x4]
    bl func_020624cc
    mov r0, #0x2
    bl func_0204c40c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_020ffa60
_LIT1: .word data_020ffa6c
_LIT2: .word 0xfffeabc4
_LIT3: .word data_020ffa78
_LIT4: .word 0xfffec5e6
_LIT5: .word 0x0000ffff

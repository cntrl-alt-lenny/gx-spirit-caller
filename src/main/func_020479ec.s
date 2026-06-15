; func_020479ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc74
        .extern data_0219dc78
        .extern data_0219dc7c
        .extern func_02040258
        .extern func_020402ec
        .extern func_0204037c
        .extern func_0204052c
        .extern func_0204548c
        .extern func_020454cc
        .extern func_020459c4
        .extern func_02047de8
        .extern func_02047ea0
        .extern func_020480b4
        .extern func_02053190
        .extern func_020930b0
        .extern func_020945f4
        .extern func_02094688
        .extern func_020aadf8
        .extern func_020b3808
        .global func_020479ec
        .arm
func_020479ec:
    stmfd sp!, {lr}
    sub sp, sp, #0x3d4
    bl func_020402ec
    cmp r0, #0x15
    bne .L_294
    add r0, sp, #0x0
    bl func_02040258
    ldr r0, _LIT0
    add r1, sp, #0x4a
    ldr r0, [r0]
    add r0, r0, #0x48
    bl func_020aadf8
    ldr r0, _LIT0
    add r1, sp, #0x100
    ldr r0, [r0]
    add r1, r1, #0x77
    add r0, r0, #0x148
    bl func_020aadf8
    bl func_0204037c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    mov r2, r0
    ldr r1, [r1, #0x24]
    bl func_0204548c
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    str r2, [r1, #0x24]
    ldr r0, [r0]
    ldr r0, [r0, #0x1c]
    bl func_02053190
    cmp r0, #0x0
    beq .L_270
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr ip, [r0]
    ldr r0, _LIT2
    ldr r2, [r1]
    ldr r3, [r0]
    add r0, ip, #0x48
    add r1, ip, #0x148
    blx r3
    add sp, sp, #0x3d4
    ldmfd sp!, {pc}
.L_270:
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr r1, [r0]
    mov r3, #0x3
    add r0, r1, #0x48
    add r1, r1, #0x148
    bl func_02047de8
    add sp, sp, #0x3d4
    ldmfd sp!, {pc}
.L_294:
    bl func_020402ec
    cmp r0, #0x0
    addeq sp, sp, #0x3d4
    ldmeqfd sp!, {pc}
    bl func_020930b0
    ldr r3, _LIT0
    ldr r2, _LIT4
    ldr ip, [r3]
    mov r3, #0x0
    ldr lr, [ip, #0x28]
    ldr ip, [ip, #0x2c]
    subs lr, r0, lr
    sbc r0, r1, ip
    mov r1, r0, lsl #0x6
    orr r1, r1, lr, lsr #0x1a
    mov r0, lr, lsl #0x6
    bl func_020b3808
    ldr r2, _LIT5
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_330
    add r0, sp, #0x1c4
    bl func_02040258
    bl func_0204037c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    mov r2, r0
    ldr r1, [r1, #0x24]
    bl func_0204548c
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    mov r0, #0x2
    str r2, [r1, #0x24]
    ldr r1, [sp, #0x1c4]
    bl func_020480b4
    add sp, sp, #0x3d4
    ldmfd sp!, {pc}
.L_330:
    bl func_0204037c
    add r0, sp, #0x388
    mov r1, #0x0
    mov r2, #0x48
    bl func_020945f4
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x10]
    bl func_020459c4
    ldr r1, _LIT0
    mov r2, r0, lsl #0x1
    ldr r1, [r1]
    add r2, r2, #0x2
    ldr r0, [r1, #0x10]
    add r1, sp, #0x388
    bl func_02094688
    ldr r0, _LIT0
    ldr r1, _LIT6
    ldr r2, [r0]
    add r0, sp, #0x3bc
    add r1, r2, r1
    bl func_020aadf8
    ldr r2, _LIT7
    ldr r0, _LIT0
    str r2, [sp, #0x3c8]
    ldr r2, _LIT8
    ldr r1, [r0]
    str r2, [sp, #0x3cc]
    ldr r1, [r1, #0x24]
    add r0, sp, #0x388
    bl func_0204052c
    add sp, sp, #0x3d4
    ldmfd sp!, {pc}
_LIT0: .word data_0219dc78
_LIT1: .word data_0219dc74
_LIT2: .word data_0219dc7c
_LIT3: .word func_02047ea0
_LIT4: .word 0x000082ea
_LIT5: .word 0x00002710
_LIT6: .word 0x00000251
_LIT7: .word func_020454cc
_LIT8: .word func_0204548c

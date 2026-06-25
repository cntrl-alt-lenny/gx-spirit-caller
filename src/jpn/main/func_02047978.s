; func_02047978 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219db94
        .extern data_0219db98
        .extern data_0219db9c
        .extern func_02040208
        .extern func_0204029c
        .extern func_0204032c
        .extern func_020404dc
        .extern func_0204543c
        .extern func_0204547c
        .extern func_0204591c
        .extern func_02047d74
        .extern func_02047e2c
        .extern func_02048040
        .extern func_0205311c
        .extern func_02092fc8
        .extern func_02094500
        .extern func_02094688
        .extern func_020aad04
        .extern func_020b3714
        .global func_02047978
        .arm
func_02047978:
    stmfd sp!, {lr}
    sub sp, sp, #0x3d4
    bl func_0204029c
    cmp r0, #0x15
    bne .L_d8
    add r0, sp, #0x0
    bl func_02040208
    ldr r0, _LIT0
    add r1, sp, #0x4a
    ldr r0, [r0]
    add r0, r0, #0x48
    bl func_020aad04
    ldr r0, _LIT0
    add r1, sp, #0x100
    ldr r0, [r0]
    add r1, r1, #0x77
    add r0, r0, #0x148
    bl func_020aad04
    bl func_0204032c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    mov r2, r0
    ldr r1, [r1, #0x24]
    bl func_0204543c
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    str r2, [r1, #0x24]
    ldr r0, [r0]
    ldr r0, [r0, #0x1c]
    bl func_0205311c
    cmp r0, #0x0
    beq .L_b4
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
.L_b4:
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr r1, [r0]
    mov r3, #0x3
    add r0, r1, #0x48
    add r1, r1, #0x148
    bl func_02047d74
    add sp, sp, #0x3d4
    ldmfd sp!, {pc}
.L_d8:
    bl func_0204029c
    cmp r0, #0x0
    addeq sp, sp, #0x3d4
    ldmeqfd sp!, {pc}
    bl func_02092fc8
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
    bl func_020b3714
    ldr r2, _LIT5
    cmp r1, #0x0
    cmpeq r0, r2
    bls .L_174
    add r0, sp, #0x1c4
    bl func_02040208
    bl func_0204032c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    mov r2, r0
    ldr r1, [r1, #0x24]
    bl func_0204543c
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    mov r0, #0x2
    str r2, [r1, #0x24]
    ldr r1, [sp, #0x1c4]
    bl func_02048040
    add sp, sp, #0x3d4
    ldmfd sp!, {pc}
.L_174:
    bl func_0204032c
    add r0, sp, #0x388
    mov r1, #0x0
    mov r2, #0x48
    bl func_02094500
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x10]
    bl func_0204591c
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
    bl func_020aad04
    ldr r2, _LIT7
    ldr r0, _LIT0
    str r2, [sp, #0x3c8]
    ldr r2, _LIT8
    ldr r1, [r0]
    str r2, [sp, #0x3cc]
    ldr r1, [r1, #0x24]
    add r0, sp, #0x388
    bl func_020404dc
    add sp, sp, #0x3d4
    ldmfd sp!, {pc}
_LIT0: .word data_0219db98
_LIT1: .word data_0219db94
_LIT2: .word data_0219db9c
_LIT3: .word func_02047e2c
_LIT4: .word 0x000082ea
_LIT5: .word 0x00002710
_LIT6: .word 0x00000251
_LIT7: .word func_0204547c
_LIT8: .word func_0204543c

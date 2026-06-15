; func_0207b62c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a088c
        .extern func_02079e78
        .extern func_0207ab68
        .extern func_0207b038
        .extern func_020928cc
        .extern func_0209d758
        .extern func_0209de74
        .extern func_0209f030
        .extern func_0209f0d8
        .extern func_0209f168
        .global func_0207b62c
        .arm
func_0207b62c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_34
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_34:
    add r1, r1, #0x2000
    ldr r2, [r1, #0x260]
    cmp r2, #0xd
    addls pc, pc, r2, lsl #0x2
    b .L_dc
    b .L_dc
    b .L_94
    b .L_dc
    b .L_f4
    b .L_dc
    b .L_dc
    b .L_a8
    b .L_dc
    b .L_dc
    b .L_f4
    b .L_dc
    b .L_dc
    b .L_f4
    b .L_80
.L_80:
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x2
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_94:
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_a8:
    mov r0, #0xd
    bl func_0207b038
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1]
    mov r2, #0x9
    add r1, r1, #0x2200
    strh r2, [r1, #0x80]
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x3
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_dc:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_f4:
    ldrb r0, [r1, #0x26b]
    cmp r0, #0x1
    bne .L_120
    mov r0, #0xd
    bl func_0207b038
    ldr r0, _LIT0
    mov r1, #0x9
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_238
.L_120:
    bl func_0209d758
    mov r5, r0
    mov r1, #0x2
    bl func_020928cc
    ldrh r0, [r5]
    cmp r0, #0x0
    beq .L_150
    cmp r0, #0x1
    beq .L_190
    cmp r0, #0x2
    beq .L_19c
    b .L_1a8
.L_150:
    bl func_0209de74
    cmp r0, #0x0
    bne .L_1c4
    mov r0, #0x1
    bl func_0207b038
    ldr r1, _LIT0
    mov r0, r4
    ldr r1, [r1]
    mov r2, #0x0
    add r1, r1, #0x2200
    strh r2, [r1, #0x80]
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_190:
    ldr r0, _LIT1
    bl func_0209f168
    b .L_1c4
.L_19c:
    ldr r0, _LIT1
    bl func_0209f0d8
    b .L_1c4
.L_1a8:
    ldr r1, _LIT0
    ldr r0, _LIT2
    ldr r1, [r1]
    mov r2, #0x1
    add r1, r1, #0x2000
    strb r2, [r1, #0x26b]
    bl func_0209f030
.L_1c4:
    cmp r0, #0x2
    beq .L_1e0
    cmp r0, #0x3
    beq .L_218
    cmp r0, #0x8
    beq .L_200
    b .L_218
.L_1e0:
    mov r0, #0xd
    bl func_0207b038
    ldr r0, _LIT0
    mov r1, #0x9
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_238
.L_200:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_218:
    mov r0, #0xb
    bl func_0207b038
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x7
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_238:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x3
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word func_0207ab68
_LIT2: .word func_02079e78

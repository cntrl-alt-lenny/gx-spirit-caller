; func_0207b8d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a07ac
        .extern func_0207aa80
        .extern func_0207af50
        .extern func_0207b460
        .extern func_02094500
        .extern func_02094688
        .extern func_020a05bc
        .global func_0207b8d8
        .arm
func_0207b8d8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl OS_DisableIrq
    ldr r2, _LIT0
    mov r4, r0
    ldr ip, [r2]
    cmp ip, #0x0
    bne .L_40
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_40:
    add r1, ip, #0x2000
    ldr r3, [r1, #0x260]
    cmp r3, #0x3
    beq .L_64
    cmp r3, #0x8
    beq .L_174
    cmp r3, #0x9
    beq .L_188
    b .L_19c
.L_64:
    cmp r7, #0x0
    bne .L_80
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_80:
    ldrh r3, [r7, #0x3c]
    cmp r3, #0x0
    beq .L_a0
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_a0:
    cmp r6, #0x0
    beq .L_128
    ldrb r3, [r6]
    cmp r3, #0x4
    bcs .L_c0
    ldrb r0, [r6, #0x1]
    cmp r0, #0x4
    bcc .L_d8
.L_c0:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_d8:
    strb r3, [r1, #0x250]
    ldr r0, [r2]
    ldrb r1, [r6, #0x1]
    add r0, r0, #0x2000
    strb r1, [r0, #0x251]
    ldr r1, [r2]
    add r0, r1, #0x2000
    ldrb r0, [r0, #0x250]
    cmp r0, #0x0
    bne .L_114
    add r0, r1, #0x2200
    mov r1, #0x0
    mov r2, #0x50
    bl func_02094500
    b .L_138
.L_114:
    add r0, r6, #0x2
    add r1, r1, #0x2200
    mov r2, #0x50
    bl func_02094688
    b .L_138
.L_128:
    add r0, ip, #0x2200
    mov r1, #0x0
    mov r2, #0x52
    bl func_02094500
.L_138:
    ldr r1, _LIT0
    mov r0, r7
    ldr r1, [r1]
    mov r2, #0xc0
    add r1, r1, #0x2140
    bl func_02094688
    ldr r1, _LIT0
    mov r0, r5
    ldr r1, [r1]
    add r1, r1, #0x2100
    ldrh r2, [r1, #0x6e]
    orr r2, r2, #0x3
    strh r2, [r1, #0x70]
    bl func_0207b460
    b .L_1b0
.L_174:
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_188:
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_19c:
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_1b0:
    ldr r1, _LIT1
    ldr r0, _LIT2
    mov r3, r1
    mov r2, #0x50
    str r1, [sp]
    bl func_020a05bc
    cmp r0, #0x2
    beq .L_1e4
    cmp r0, #0x3
    beq .L_21c
    cmp r0, #0x8
    beq .L_204
    b .L_21c
.L_1e4:
    mov r0, #0x8
    bl func_0207af50
    ldr r0, _LIT0
    mov r1, #0x5
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_23c
.L_204:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_21c:
    mov r0, #0xb
    bl func_0207af50
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_23c:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x3
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a07ac
_LIT1: .word 0x0000ffff
_LIT2: .word func_0207aa80

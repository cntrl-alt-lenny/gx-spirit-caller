; func_0207ca44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a0890
        .extern data_021a0894
        .extern data_021a089c
        .extern func_0207b538
        .extern func_0207c9f0
        .extern func_02091a8c
        .extern func_02092748
        .extern func_020927b8
        .extern func_02094688
        .extern func_0209f720
        .global func_0207ca44
        .arm
func_0207ca44:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    mov r6, r2
    bl OS_DisableIrq
    mov r5, r0
    bl func_0207b538
    cmp r0, #0x0
    bne .L_8c
    mov r0, r5
    bl OS_RestoreIrq
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_8c:
    ldr r0, _LIT0
    bl func_020927b8
    bl func_0207b538
    movs r4, r0
    bne .L_bc
    ldr r0, _LIT0
    bl func_02092748
    mov r0, r5
    bl OS_RestoreIrq
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_bc:
    add r0, r4, #0x2000
    ldr r1, [r0, #0x260]
    cmp r1, #0x9
    bne .L_d8
    ldrb r0, [r0, #0x26b]
    cmp r0, #0x1
    bne .L_f4
.L_d8:
    ldr r0, _LIT0
    bl func_02092748
    mov r0, r5
    bl OS_RestoreIrq
    mvn r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_f4:
    mov r0, r7
    mov r2, r6
    add r1, r4, #0xf00
    bl func_02094688
    mov r3, r6, lsl #0x10
    ldr r0, _LIT1
    mov r1, r8
    add r2, r4, #0xf00
    mov r3, r3, lsr #0x10
    bl func_0209f720
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_14c
    b .L_14c
    b .L_14c
    b .L_168
    b .L_14c
    b .L_14c
    b .L_14c
    b .L_14c
    b .L_14c
    b .L_14c
.L_14c:
    ldr r0, _LIT0
    bl func_02092748
    mov r0, r5
    bl OS_RestoreIrq
    mvn r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_168:
    ldr r0, _LIT2
    bl func_02091a8c
    ldr r0, _LIT3
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_1a0
    cmp r0, #0x1
    ldr r0, _LIT0
    bl func_02092748
    mov r0, r5
    bl OS_RestoreIrq
    mvn r0, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_1a0:
    ldr r0, _LIT0
    bl func_02092748
    mov r0, r5
    bl OS_RestoreIrq
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a089c
_LIT1: .word func_0207c9f0
_LIT2: .word data_021a0894
_LIT3: .word data_021a0890

; func_0207bde0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a07ac
        .extern func_0207aa80
        .extern func_0207af50
        .extern func_0209efe4
        .global func_0207bde0
        .arm
func_0207bde0:
    stmdb sp!, {r4, lr}
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_2c
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
.L_2c:
    add r1, r1, #0x2000
    ldr r1, [r1, #0x260]
    cmp r1, #0x1
    beq .L_5c
    cmp r1, #0x3
    beq .L_7c
    cmp r1, #0x4
    bne .L_6c
    bl OS_RestoreIrq
    mov r0, #0x2
    ldmia sp!, {r4, lr}
    bx lr
.L_5c:
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
.L_6c:
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
.L_7c:
    ldr r0, _LIT1
    bl func_0209efe4
    cmp r0, #0x2
    beq .L_a0
    cmp r0, #0x3
    beq .L_d4
    cmp r0, #0x8
    beq .L_c0
    b .L_d4
.L_a0:
    mov r0, #0x4
    bl func_0207af50
    ldr r0, _LIT0
    mov r1, #0x2
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_f0
.L_c0:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x4
    ldmia sp!, {r4, lr}
    bx lr
.L_d4:
    mov r0, #0xb
    bl func_0207af50
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, lr}
    bx lr
.L_f0:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x3
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a07ac
_LIT1: .word func_0207aa80

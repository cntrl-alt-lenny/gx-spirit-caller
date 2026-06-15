; func_020745fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a071c
        .extern data_021a63d0
        .extern func_020919d8
        .global func_020745fc
        .arm
func_020745fc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl OS_DisableIrq
    ldr r4, _LIT0
    mov r6, #0x0
    mov r2, r6
    ldr r1, _LIT1
.L_1c:
    ldrb r3, [r4, #0x5a]
    cmp r3, #0x0
    beq .L_38
    ldr r3, [r4, #0x50]
    sub r3, r5, r3
    cmp r3, r1
    strgtb r2, [r4, #0x5a]
.L_38:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r4, r4, #0x5c
    blt .L_1c
    bl OS_RestoreIrq
    ldr r0, _LIT2
    ldr r4, [r0, #0x8]
    cmp r4, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    mov r6, #0x0
.L_64:
    ldr r1, [r4, #0xa4]
    cmp r1, #0x0
    beq .L_d0
    ldr r0, [r1]
    cmp r0, #0x0
    beq .L_d0
    ldrb r0, [r1, #0x9]
    cmp r0, #0x0
    beq .L_d0
    ldrb r0, [r1, #0x8]
    cmp r0, #0x4
    bne .L_d0
    ldr r0, [r1, #0xc]
    ldrb r0, [r0, #0x455]
    cmp r0, #0x8
    bcs .L_d0
    ldr r0, [r1, #0x10]
    sub r0, r5, r0
    cmp r0, #0xef
    ble .L_d0
    ldr r0, [r1, #0x4]
    cmp r0, #0x2
    bne .L_d0
    strb r6, [r1, #0x8]
    str r6, [r1, #0x4]
    ldr r0, [r1]
    bl func_020919d8
.L_d0:
    ldr r4, [r4, #0x68]
    cmp r4, #0x0
    bne .L_64
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a071c
_LIT1: .word 0x000003bd
_LIT2: .word data_021a63d0

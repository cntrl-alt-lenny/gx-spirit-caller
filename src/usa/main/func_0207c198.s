; func_0207c198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a07ac
        .extern func_0207b148
        .extern func_0207cc94
        .extern func_02093100
        .extern func_02093110
        .extern func_02093524
        .extern func_02093534
        .extern func_02093544
        .global func_0207c198
        .arm
func_0207c198:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl OS_DisableIrq
    ldr r2, _LIT0
    mov r4, r0
    ldr r1, [r2]
    cmp r1, #0x0
    beq .L_34
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_34:
    cmp r6, #0x0
    bne .L_4c
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_4c:
    ands r1, r6, #0x1f
    beq .L_64
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_64:
    cmp r5, #0x2300
    bcs .L_7c
    bl OS_RestoreIrq
    mov r0, #0x6
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_7c:
    str r6, [r2]
    add r0, r6, #0x2000
    mov r1, #0x1
    str r1, [r0, #0x260]
    ldr r1, [r2]
    mov r0, #0x0
    add r1, r1, #0x2200
    strh r0, [r1, #0x80]
    ldr r1, [r2]
    add r1, r1, #0x2200
    strh r0, [r1, #0x68]
    ldr r1, [r2]
    add r1, r1, #0x2000
    strb r0, [r1, #0x26a]
    ldr r1, [r2]
    add r1, r1, #0x2000
    strb r0, [r1, #0x26b]
    ldr r1, [r2]
    add r1, r1, #0x2200
    strh r0, [r1, #0x82]
    ldr r1, [r2]
    add r1, r1, #0x2200
    strh r0, [r1, #0xf8]
    bl func_0207b148
    bl func_0207cc94
    bl func_02093100
    cmp r0, #0x0
    bne .L_f0
    bl func_02093110
.L_f0:
    bl func_02093534
    cmp r0, #0x0
    bne .L_100
    bl func_02093544
.L_100:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    add r0, r1, r0
    bl func_02093524
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a07ac
_LIT1: .word 0x000022cc

; func_0207c280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a088c
        .extern func_0207b230
        .extern func_0207cd7c
        .extern func_020931e8
        .extern func_020931f8
        .extern func_0209360c
        .extern func_0209361c
        .extern func_0209362c
        .global func_0207c280
        .arm
func_0207c280:
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
    bl func_0207b230
    bl func_0207cd7c
    bl func_020931e8
    cmp r0, #0x0
    bne .L_f0
    bl func_020931f8
.L_f0:
    bl func_0209361c
    cmp r0, #0x0
    bne .L_100
    bl func_0209362c
.L_100:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    add r0, r1, r0
    bl func_0209360c
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a088c
_LIT1: .word 0x000022cc

; func_0207beec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a07ac
        .extern func_0207aa80
        .extern func_0207ad8c
        .extern func_0207af50
        .extern func_0207b320
        .extern func_0209dd80
        .extern func_0209dffc
        .extern func_0209e404
        .extern func_0209e7dc
        .extern func_0209f0bc
        .global func_0207beec
        .arm
func_0207beec:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1]
    cmp r1, #0x0
    bne .L_34
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_34:
    add r1, r1, #0x2000
    ldr r1, [r1, #0x260]
    cmp r1, #0x1
    beq .L_58
    cmp r1, #0x2
    beq .L_68
    cmp r1, #0x3
    beq .L_78
    b .L_88
.L_58:
    mov r0, r6
    mov r1, r5
    bl func_0207b320
    b .L_98
.L_68:
    bl OS_RestoreIrq
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_78:
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_88:
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_98:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r1, r0, #0x2000
    ldr r1, [r1, #0x26c]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_0209dffc
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_10c
    b .L_128
    b .L_10c
    b .L_10c
    b .L_dc
    b .L_f8
    b .L_10c
    b .L_10c
.L_dc:
    mov r0, #0xb
    bl func_0207af50
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_f8:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x5
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_10c:
    mov r0, #0xb
    bl func_0207af50
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_128:
    bl func_0209e404
    cmp r0, #0x0
    bne .L_170
    bl func_0209dd80
    cmp r0, #0x0
    beq .L_15c
    mov r0, #0xb
    bl func_0207af50
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_15c:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x5
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_170:
    ldr r0, _LIT1
    bl func_0209e7dc
    cmp r0, #0x0
    beq .L_19c
    mov r0, #0xb
    bl func_0207af50
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_19c:
    ldr r0, _LIT2
    bl func_0209f0bc
    cmp r0, #0x2
    beq .L_1c0
    cmp r0, #0x3
    beq .L_1fc
    cmp r0, #0x8
    beq .L_1e0
    b .L_1fc
.L_1c0:
    mov r0, #0x2
    bl func_0207af50
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r0, [r0]
    add r0, r0, #0x2200
    strh r1, [r0, #0x80]
    b .L_218
.L_1e0:
    mov r0, #0xc
    bl func_0207af50
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_1fc:
    mov r0, #0xb
    bl func_0207af50
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x7
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_218:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a07ac
_LIT1: .word func_0207ad8c
_LIT2: .word func_0207aa80

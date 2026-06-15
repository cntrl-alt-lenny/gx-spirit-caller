; func_0209591c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a674c
        .extern data_021a6750
        .extern data_021a675c
        .extern data_021a6760
        .extern data_021a6768
        .extern data_021a6770
        .extern func_02093814
        .extern func_02095cc8
        .global func_0209591c
        .arm
func_0209591c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    bl OS_DisableIrq
    mov r5, r0
    ands r0, r4, #0x1
    beq .L_f8
    bl func_02095cc8
    ldr r4, _LIT0
    ldr r1, [r4]
    cmp r1, r0
    bne .L_120
    mov r6, #0x64
.L_cc:
    mov r0, r5
    bl OS_RestoreIrq
    mov r0, r6
    bl func_02093814
    bl OS_DisableIrq
    mov r5, r0
    bl func_02095cc8
    ldr r1, [r4]
    cmp r1, r0
    beq .L_cc
    b .L_120
.L_f8:
    bl func_02095cc8
    ldr r1, _LIT0
    ldr r1, [r1]
    cmp r1, r0
    bne .L_120
    mov r0, r5
    bl OS_RestoreIrq
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_120:
    ldr r0, _LIT1
    ldr r2, _LIT2
    ldr r3, [r0]
    add r1, r3, #0x1
    ldr r4, [r2, r3, lsl #0x2]
    str r1, [r0]
    cmp r1, #0x8
    movgt r1, #0x0
    strgt r1, [r0]
    ldr r0, [r4]
    mov r1, r4
    cmp r0, #0x0
    beq .L_164
.L_154:
    ldr r1, [r1]
    ldr r0, [r1]
    cmp r0, #0x0
    bne .L_154
.L_164:
    ldr r0, _LIT3
    ldr r3, _LIT4
    ldr r0, [r0]
    ldr r2, _LIT0
    cmp r0, #0x0
    strne r4, [r0]
    ldreq r0, _LIT5
    ldr lr, [r3]
    streq r4, [r0]
    ldr ip, _LIT3
    sub r6, lr, #0x1
    ldr r0, [r2]
    str r1, [ip]
    add lr, r0, #0x1
    mov r0, r5
    str r6, [r3]
    str lr, [r2]
    bl OS_RestoreIrq
    mov r0, r4
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a6750
_LIT1: .word data_021a6760
_LIT2: .word data_021a6770
_LIT3: .word data_021a675c
_LIT4: .word data_021a6768
_LIT5: .word data_021a674c

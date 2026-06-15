; func_0207397c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219eef4
        .extern data_0219eefc
        .extern data_0219ef20
        .extern data_0219ef24
        .extern data_0219ef28
        .extern data_021a63d0
        .extern func_02091a8c
        .global func_0207397c
        .arm
func_0207397c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r6, r0
    bl OS_DisableIrq
    ldr sl, _LIT0
    ldr r9, _LIT1
    ldr r2, [sl]
    ldr r1, [r9]
    mov r5, r0
    cmp r2, r1
    bne .L_58
    ldr r8, _LIT2
    ldr r7, _LIT3
    mov r4, #0x0
.L_34:
    ldr r1, [r8, #0x4]
    mov r0, r4
    str r1, [r7]
    bl func_02091a8c
    str r4, [r7]
    ldr r1, [sl]
    ldr r0, [r9]
    cmp r1, r0
    beq .L_34
.L_58:
    mov r0, r5
    bl OS_RestoreIrq
    ldr r0, _LIT4
    ldr r5, [r0]
    ldr r0, _LIT0
    ldr r1, _LIT5
    mov r3, #0x0
.L_74:
    ldr r4, [r1]
    ldr r2, [r0]
    sub r2, r4, r2
    cmp r2, #0x2
    strcc r3, [r0]
    ldr r2, [r0]
    ldrh r2, [r5, r2]
    cmp r2, #0x0
    streq r3, [r0]
    cmp r2, #0x0
    beq .L_74
    sub r0, r2, #0x2
    ldr r1, _LIT4
    str r0, [r6]
    ldr r0, _LIT0
    ldr r1, [r1]
    ldr r0, [r0]
    add r0, r1, r0
    add r0, r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word data_0219eefc
_LIT1: .word data_0219eef4
_LIT2: .word data_021a63d0
_LIT3: .word data_0219ef20
_LIT4: .word data_0219ef24
_LIT5: .word data_0219ef28

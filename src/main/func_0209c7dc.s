; func_0209c7dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a63d0
        .extern data_021a84c0
        .extern func_02000b60
        .extern func_02091a8c
        .extern func_0209c31c
        .extern func_0209c8d0
        .global func_0209c7dc
        .arm
func_0209c7dc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov sl, r0
    ldr r6, _LIT0
    ldr r0, _LIT1
    mov r9, r1
    mov r8, r2
    mov r7, r3
    bl func_02000b60
    bl OS_DisableIrq
    ldr r1, [r6, #0x114]
    mov r5, r0
    ands r0, r1, #0x4
    beq .L_4c
    add r4, r6, #0x10c
.L_38:
    mov r0, r4
    bl func_02091a8c
    ldr r0, [r6, #0x114]
    ands r0, r0, #0x4
    bne .L_38
.L_4c:
    ldr r0, [r6, #0x114]
    ldr r1, [sp, #0x20]
    orr r0, r0, #0x4
    str r0, [r6, #0x114]
    str r7, [r6, #0x38]
    mov r0, r5
    str r1, [r6, #0x3c]
    bl OS_RestoreIrq
    str sl, [r6, #0x1c]
    str r9, [r6, #0x20]
    ldr r0, [sp, #0x24]
    ldr r1, [sp, #0x28]
    str r8, [r6, #0x24]
    ldr r2, [sp, #0x2c]
    str r1, [r6, #0x2c]
    ldr r1, [sp, #0x30]
    str r2, [r6, #0x30]
    str r1, [r6, #0x34]
    cmp r0, #0x0
    beq .L_b0
    ldr r0, _LIT2
    bl func_0209c31c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
.L_b0:
    ldr r0, _LIT3
    ldr r1, _LIT0
    ldr r2, [r0, #0x4]
    mov r0, r6
    str r2, [r1, #0x104]
    bl func_0209c8d0
    ldr r0, [r6]
    ldr r0, [r0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word data_021a84c0
_LIT1: .word 0x02000c1c
_LIT2: .word func_0209c8d0
_LIT3: .word data_021a63d0

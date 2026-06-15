; func_0209cb68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a63d0
        .extern data_021a84c0
        .extern data_021a8ae0
        .extern data_021a8b00
        .extern func_02091a8c
        .extern func_02093d44
        .extern func_0209c0a0
        .extern func_0209c31c
        .extern func_0209cad8
        .extern func_0209cc90
        .extern func_0209cea4
        .global func_0209cb68
        .arm
func_0209cb68:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    ldr r6, _LIT0
    mov sl, r0
    mov r9, r1
    mov r8, r2
    mov r7, r3
    ldr fp, _LIT1
    bl func_0209c0a0
    bl OS_DisableIrq
    ldr r1, [r6, #0x114]
    mov r5, r0
    ands r0, r1, #0x4
    beq .L_d4
    add r4, r6, #0x10c
.L_c0:
    mov r0, r4
    bl func_02091a8c
    ldr r0, [r6, #0x114]
    ands r0, r0, #0x4
    bne .L_c0
.L_d4:
    ldr r1, [r6, #0x114]
    ldr r0, [sp, #0x28]
    orr r1, r1, #0x4
    str r1, [r6, #0x114]
    ldr r1, [sp, #0x2c]
    str r0, [r6, #0x38]
    mov r0, r5
    str r1, [r6, #0x3c]
    bl OS_RestoreIrq
    ldr r0, _LIT2
    str sl, [r6, #0x28]
    ldr r0, [r0]
    cmp sl, #0x3
    add r0, r9, r0
    str r0, [r6, #0x1c]
    str r8, [r6, #0x20]
    str r7, [r6, #0x24]
    bhi .L_124
    mov r0, sl
    bl func_02093d44
.L_124:
    mov r0, fp
    bl func_0209cea4
    cmp r0, #0x0
    beq .L_158
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    bl func_0209cad8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_158:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    beq .L_178
    ldr r0, _LIT3
    bl func_0209c31c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_178:
    ldr r1, _LIT4
    mov r0, r6
    ldr r1, [r1, #0x4]
    str r1, [r6, #0x104]
    bl func_0209cc90
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a84c0
_LIT1: .word data_021a8b00
_LIT2: .word data_021a8ae0
_LIT3: .word func_0209cc90
_LIT4: .word data_021a63d0

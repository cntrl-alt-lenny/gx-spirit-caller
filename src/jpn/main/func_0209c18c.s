; func_0209c18c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a83e0
        .extern func_020919a4
        .extern func_02093b08
        .global func_0209c18c
        .arm
func_0209c18c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    ldr r5, _LIT0
    mov r7, r0
    mov r6, r1
    bl OS_DisableIrq
    ldr r1, [r5, #0x8]
    mov r4, r0
    cmp r1, r7
    bne .L_1e0
    ldr r0, [r5, #0x18]
    cmp r0, r6
    beq .L_210
    bl func_02093b08
    b .L_210
.L_1e0:
    ldr r0, [r5, #0x8]
    mvn r8, #0x2
    cmp r0, r8
    beq .L_208
    add r9, r5, #0x10
.L_1f4:
    mov r0, r9
    bl func_020919a4
    ldr r0, [r5, #0x8]
    cmp r0, r8
    bne .L_1f4
.L_208:
    str r7, [r5, #0x8]
    str r6, [r5, #0x18]
.L_210:
    ldr r1, [r5, #0xc]
    mov r0, r4
    add r1, r1, #0x1
    str r1, [r5, #0xc]
    ldr r1, [r5]
    mov r2, #0x0
    str r2, [r1]
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word data_021a83e0

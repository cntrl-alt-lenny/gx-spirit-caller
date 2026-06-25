; func_0209c0e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a83e0
        .extern func_02091924
        .extern func_02093b08
        .global func_0209c0e8
        .arm
func_0209c0e8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r5, _LIT0
    mov r7, r0
    mov r6, r1
    bl OS_DisableIrq
    mov r1, r5
    mov r4, r0
    ldr r0, [r1, #0x8]
    cmp r0, r7
    bne .L_138
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_140
.L_138:
    bl func_02093b08
    b .L_180
.L_140:
    ldr r0, [r5, #0x18]
    cmp r0, r6
    beq .L_150
    bl func_02093b08
.L_150:
    ldr r0, [r5, #0xc]
    sub r0, r0, #0x1
    str r0, [r5, #0xc]
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_180
    mvn r0, #0x2
    str r0, [r5, #0x8]
    mov r1, #0x0
    add r0, r5, #0x10
    str r1, [r5, #0x18]
    bl func_02091924
.L_180:
    ldr r1, [r5]
    mov r2, #0x0
    mov r0, r4
    str r2, [r1]
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a83e0

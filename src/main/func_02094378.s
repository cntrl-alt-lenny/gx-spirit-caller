; func_02094378 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a6710
        .extern func_02090624
        .extern func_02090728
        .extern func_020907b4
        .extern func_02093c20
        .extern func_02093dc8
        .extern func_020942b0
        .global func_02094378
        .arm
func_02094378:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    cmp r2, #0x0
    bne .L_578
    cmp r3, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r0, [sp, #0x10]
    blx r3
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_578:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_578
    ldr r5, _LIT1
.L_58c:
    ldr r0, [r5]
    and r0, r0, #0x7000000
    mov r0, r0, lsr #0x18
    ands r0, r0, #0x2
    beq .L_58c
    ldr ip, _LIT0
    ldr lr, [sp, #0x10]
    str r3, [ip, #0x10]
    mov r5, #0x1
    mov r0, r4
    mov r3, #0x0
    str r5, [ip]
    str r4, [ip, #0x4]
    str r1, [ip, #0x8]
    str r2, [ip, #0xc]
    str lr, [ip, #0x14]
    bl func_02093c20
    mov r0, r4
    bl func_02093dc8
    bl OS_DisableIrq
    ldr r1, _LIT1
    mov r4, r0
    ldr r0, [r1]
    ldr r1, _LIT0
    and r0, r0, #-1073741824
    mov r2, r0, lsr #0x1e
    mov r0, #0x200000
    str r2, [r1, #0x18]
    bl func_02090728
    ldr r1, _LIT0
    ldr r2, _LIT1
    str r0, [r1, #0x1c]
    ldr r0, [r2]
    ldr r1, _LIT2
    bic r0, r0, #-1073741824
    orr r3, r0, #0x40000000
    mov r0, #0x200000
    str r3, [r2]
    bl func_020907b4
    mov r0, #0x200000
    bl func_02090624
    bl func_020942b0
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a6710
_LIT1: .word 0x04000600
_LIT2: .word func_020942b0

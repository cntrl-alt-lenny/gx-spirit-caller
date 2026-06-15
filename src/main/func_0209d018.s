; func_0209d018 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a84c0
        .extern func_020905a8
        .extern func_020905dc
        .extern func_020919d8
        .extern func_02091a0c
        .extern func_02093d44
        .extern func_0209cd3c
        .extern func_0209d0f8
        .extern func_0209d4ec
        .global func_0209d018
        .arm
func_0209d018:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0, #0x28]
    bl func_02093d44
    ldr r0, _LIT0
    ldr r3, [r0, #0x1c]
    ldr r2, [r0, #0x20]
    ldr r1, [r0, #0x24]
    add r3, r3, #0x200
    add r2, r2, #0x200
    subs r1, r1, #0x200
    str r3, [r0, #0x1c]
    str r2, [r0, #0x20]
    str r1, [r0, #0x24]
    bne .L_600
    mov r0, #0x80000
    bl func_020905dc
    mov r0, #0x80000
    bl func_020905a8
    ldr r7, _LIT0
    bl func_0209cd3c
    bl func_0209d4ec
    ldr r0, [r7]
    mov r1, #0x0
    str r1, [r0]
    ldr r6, [r7, #0x38]
    ldr r5, [r7, #0x3c]
    bl OS_DisableIrq
    ldr r1, [r7, #0x114]
    mov r4, r0
    bic r0, r1, #0x4c
    str r0, [r7, #0x114]
    add r0, r7, #0x10c
    bl func_02091a0c
    ldr r0, [r7, #0x114]
    ands r0, r0, #0x10
    beq .L_5d4
    add r0, r7, #0x44
    bl func_020919d8
.L_5d4:
    mov r0, r4
    bl OS_RestoreIrq
    cmp r6, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    mov r0, r5
    blx r6
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
.L_600:
    bl func_0209d0f8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a84c0

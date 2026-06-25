; func_0209cf24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a83e0
        .extern func_020904c0
        .extern func_020904f4
        .extern func_020918f0
        .extern func_02091924
        .extern func_02093c50
        .extern func_0209cc48
        .extern func_0209d004
        .extern func_0209d3f8
        .global func_0209cf24
        .arm
func_0209cf24:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0, #0x28]
    bl func_02093c50
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
    bne .L_340
    mov r0, #0x80000
    bl func_020904f4
    mov r0, #0x80000
    bl func_020904c0
    ldr r7, _LIT0
    bl func_0209cc48
    bl func_0209d3f8
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
    bl func_02091924
    ldr r0, [r7, #0x114]
    ands r0, r0, #0x10
    beq .L_314
    add r0, r7, #0x44
    bl func_020918f0
.L_314:
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
.L_340:
    bl func_0209d004
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a83e0

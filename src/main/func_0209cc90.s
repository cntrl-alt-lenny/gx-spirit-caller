; func_0209cc90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a84c0
        .extern data_021a8b00
        .extern func_020919d8
        .extern func_02091a0c
        .extern func_0209cd3c
        .extern func_0209d1f0
        .extern func_0209d4ec
        .global func_0209cc90
        .arm
func_0209cc90:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    mov r0, r4
    bl func_0209d1f0
    cmp r0, #0x0
    beq .L_1d4
    ldr r1, [r4]
    mov r0, r4
    blx r1
.L_1d4:
    ldr r7, _LIT1
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
    beq .L_224
    add r0, r7, #0x44
    bl func_020919d8
.L_224:
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
_LIT0: .word data_021a8b00
_LIT1: .word data_021a84c0

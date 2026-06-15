; func_02091b5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a63d0
        .extern func_02091690
        .extern func_020916c8
        .extern func_0209198c
        .extern func_02091a0c
        .extern func_02091b30
        .extern func_02091be4
        .extern func_02092074
        .extern func_02092154
        .extern func_02092700
        .global func_02091b5c
        .arm
func_02091b5c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x4]
    cmp r0, r5
    bne .L_28
    bl func_02091be4
.L_28:
    bl func_020916c8
    mov r0, r5
    bl func_02092700
    mov r0, r5
    bl func_02091b30
    ldr r0, [r5, #0x78]
    cmp r0, #0x0
    beq .L_50
    mov r1, r5
    bl func_02092154
.L_50:
    mov r0, r5
    bl func_02092074
    mov r1, #0x2
    add r0, r5, #0x9c
    str r1, [r5, #0x64]
    bl func_02091a0c
    bl func_02091690
    mov r0, r4
    bl OS_RestoreIrq
    bl func_0209198c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a63d0

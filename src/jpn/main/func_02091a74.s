; func_02091a74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a62f0
        .extern func_020915a8
        .extern func_020915e0
        .extern func_020918a4
        .extern func_02091924
        .extern func_02091afc
        .extern OSi_CancelThreadAlarmForSleep
        .extern func_02091f8c
        .extern func_0209206c
        .extern func_02092618
        .global func_02091a74
        .arm
func_02091a74:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x4]
    cmp r0, r5
    bne .L_28
    bl func_02091afc
.L_28:
    bl func_020915e0
    mov r0, r5
    bl func_02092618
    mov r0, r5
    bl OSi_CancelThreadAlarmForSleep
    ldr r0, [r5, #0x78]
    cmp r0, #0x0
    beq .L_50
    mov r1, r5
    bl func_0209206c
.L_50:
    mov r0, r5
    bl func_02091f8c
    mov r1, #0x2
    add r0, r5, #0x9c
    str r1, [r5, #0x64]
    bl func_02091924
    bl func_020915a8
    mov r0, r4
    bl OS_RestoreIrq
    bl func_020918a4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a62f0

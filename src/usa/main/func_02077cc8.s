; func_02077cc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a063c
        .extern func_02094688
        .extern func_020a734c
        .global func_02077cc8
        .arm
func_02077cc8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r7, r0
    bl OS_DisableIrq
    mov r6, #0x0
    ldr r4, _LIT0
    mov r5, r0
    strb r6, [r7, #0x30]
    add r9, r7, #0x74
    mov r8, #0x20
.L_1d0:
    ldrb r0, [r4, #0x5a]
    cmp r0, #0x0
    beq .L_228
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    bne .L_228
    ldrh r0, [r4, #0x58]
    cmp r0, #0x0
    bne .L_228
    mov r0, r4
    mov r1, r9
    mov r2, r8
    bl func_020a734c
    cmp r0, #0x0
    bne .L_228
    mov r1, r7
    add r0, r4, #0x20
    mov r2, #0x30
    bl func_02094688
    mov r0, #0x1
    strb r0, [r7, #0x30]
    b .L_238
.L_228:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r4, r4, #0x5c
    blt .L_1d0
.L_238:
    mov r0, r5
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word data_021a063c

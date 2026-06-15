; func_02093ee0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_01ff86c4
        .extern func_020906dc
        .extern func_02093dc8
        .global func_02093ee0
        .arm
func_02093ee0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r4, r3
    mov r7, r0
    mov r6, r1
    mov r5, r2
    ldr r8, [sp, #0x18]
    bne .L_e0
    cmp r8, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r0, [sp, #0x1c]
    blx r8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_e0:
    bl func_02093dc8
    cmp r8, #0x0
    beq .L_13c
    ldr r2, [sp, #0x1c]
    mov r0, r7
    mov r1, r8
    bl func_020906dc
    bl OS_DisableIrq
    mov r3, r4, lsr #0x2
    ldr r1, _LIT0
    mov r2, r7, lsl #0x2
    add r2, r2, #0x4000000
    str r5, [r2, #0xe0]
    mov r4, r0
    add r1, r1, r7, lsl #0x2
    mov r0, r7
    mov r2, r6
    orr r3, r3, #-989855744
    bl func_01ff86c4
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_13c:
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r2, r7, lsl #0x2
    mov r3, r4, lsr #0x2
    mov r4, r0
    add ip, r2, #0x4000000
    mov r0, r7
    mov r2, r6
    add r1, r1, r7, lsl #0x2
    orr r3, r3, #-2063597568
    str r5, [ip, #0xe0]
    bl func_01ff86c4
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word 0x040000e0

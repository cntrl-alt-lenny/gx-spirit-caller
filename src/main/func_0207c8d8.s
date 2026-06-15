; func_0207c8d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0207b538
        .extern func_020945f4
        .global func_0207c8d8
        .arm
func_0207c8d8:
    stmdb sp!, {r4, lr}
    bl OS_DisableIrq
    mov r4, r0
    bl func_0207b538
    cmp r0, #0x0
    bne .L_28
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, lr}
    bx lr
.L_28:
    add r1, r0, #0x2000
    ldr r0, [r1, #0x270]
    cmp r0, #0x0
    beq .L_4c
    ldr r2, [r1, #0x274]
    cmp r2, #0x0
    ble .L_4c
    mov r1, #0x0
    bl func_020945f4
.L_4c:
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, lr}
    bx lr

; func_0206d390 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ec0c
        .extern data_021a62f0
        .extern func_020b377c
        .global func_0206d390
        .arm
func_0206d390:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x4]
    ldr r5, [r0, #0xa4]
    bl OS_DisableIrq
    cmp r5, #0x0
    beq .L_6c
    ldrh r3, [r5, #0x2e]
    cmp r3, #0x0
    beq .L_5c
    ldrh r2, [r5, #0x2c]
    cmp r2, #0x0
    beq .L_5c
    ldr r1, _LIT1
    cmp r3, r2
    ldr r1, [r1, #0x24]
    movgt r3, r2
    cmp r3, r1
    movgt r3, r1
    mov r5, r3, lsl #0x1
    b .L_78
.L_5c:
    ldr r1, _LIT1
    ldr r1, [r1, #0x24]
    mov r5, r1, lsl #0x1
    b .L_78
.L_6c:
    ldr r1, _LIT1
    ldr r1, [r1, #0x24]
    mov r5, r1, lsl #0x1
.L_78:
    bl OS_RestoreIrq
    cmp r5, #0x0
    ble .L_a4
    mov r0, r4
    mov r1, r5
    bl func_020b377c
    cmp r0, #0x0
    mulgt r0, r5, r0
    addgt sp, sp, #0x4
    ldmgtia sp!, {r4, r5, lr}
    bxgt lr
.L_a4:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a62f0
_LIT1: .word data_0219ec0c

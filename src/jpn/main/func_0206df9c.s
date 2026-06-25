; func_0206df9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ec08
        .extern data_0219ec68
        .extern data_0219ec6c
        .extern func_0206ddf4
        .global func_0206df9c
        .arm
func_0206df9c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    ldr r5, _LIT1
.L_c:
    bl OS_DisableIrq
    ldr r6, [r5]
    cmp r6, #0x0
    beq .L_40
    ldr r2, [r4]
.L_20:
    cmp r6, r2
    beq .L_34
    ldrsh r1, [r6, #0x70]
    ands r1, r1, #0x10
    beq .L_40
.L_34:
    ldr r6, [r6, #0x7c]
    cmp r6, #0x0
    bne .L_20
.L_40:
    bl OS_RestoreIrq
    cmp r6, #0x0
    beq .L_58
    mov r0, r6
    bl func_0206ddf4
    b .L_c
.L_58:
    ldr r0, _LIT1
    ldr r1, [r0]
    cmp r1, #0x0
    beq .L_84
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r1, r0
    bne .L_9c
    ldr r0, [r1, #0x7c]
    cmp r0, #0x0
    bne .L_9c
.L_84:
    ldr r0, _LIT2
    ldr r0, [r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
.L_9c:
    mvn r0, #0x19
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_0219ec08
_LIT1: .word data_0219ec68
_LIT2: .word data_0219ec6c

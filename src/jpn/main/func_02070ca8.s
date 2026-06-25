; func_02070ca8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219ee3c
        .extern func_02070f54
        .extern func_020722b0
        .extern func_020919a4
        .extern func_02092fc8
        .global func_02070ca8
        .arm
func_02070ca8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov sl, r0
    bl func_02070f54
    mov r8, r0
    mov r9, #0x0
    mov fp, r9
    mov r4, #0x1
    mov r6, #0x2
    mov r5, #0x18
.L_28:
    str r8, [sl, #0x28]
    strb r6, [sl, #0x8]
    bl func_02092fc8
    mov r2, r0, lsr #0x10
    orr r2, r2, r1, lsl #0x10
    str r2, [sl, #0x10]
    mov r0, sl
    mov r1, r6
    mov r2, r5
    bl func_020722b0
    bl OS_DisableIrq
    mov r7, r0
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_74
    mov r0, fp
    str r4, [sl, #0x4]
    bl func_020919a4
.L_74:
    mov r0, r7
    bl OS_RestoreIrq
    ldrb r0, [sl, #0x8]
    cmp r0, #0x4
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_b0
    add r9, r9, #0x1
    cmp r9, #0x3
    bcc .L_28
.L_b0:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219ee3c

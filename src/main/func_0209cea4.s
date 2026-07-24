; func_0209cea4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021026d8
        .extern data_021a84c0
        .extern func_01ff8000
        .extern func_020905a8
        .extern func_02090624
        .extern func_020907b4
        .extern func_020928cc
        .extern func_020928e8
        .extern DC_WaitWriteBufferEmpty
        .extern func_02092940
        .extern func_02092e38
        .extern func_0209d018
        .extern func_0209d0f8
        .global func_0209cea4
        .arm
func_0209cea4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    ldr fp, _LIT0
    mov r7, #0x0
    ldr r9, [fp, #0x20]
    mov sl, r0
    mov r6, r7
    mov r5, r7
    mov r1, r7
    ands r4, r9, #0x1f
    ldr r8, [fp, #0x24]
    bne .L_3fc
    ldr r0, [fp, #0x28]
    cmp r0, #0x3
    movls r1, #0x1
.L_3fc:
    cmp r1, #0x0
    beq .L_450
    bl func_02092e38
    ldr r1, _LIT1
    add r2, r9, r8
    cmp r2, r1
    mov r3, #0x1
    mov r1, #0x0
    bls .L_428
    cmp r9, #0x2000000
    movcc r1, r3
.L_428:
    cmp r1, #0x0
    bne .L_448
    cmp r0, r2
    bcs .L_444
    add r0, r0, #0x4000
    cmp r0, r9
    bhi .L_448
.L_444:
    mov r3, #0x0
.L_448:
    cmp r3, #0x0
    moveq r5, #0x1
.L_450:
    cmp r5, #0x0
    beq .L_46c
    ldr r1, [fp, #0x1c]
    ldr r0, _LIT2
    orr r1, r1, r8
    ands r0, r1, r0
    moveq r6, #0x1
.L_46c:
    cmp r6, #0x0
    beq .L_47c
    cmp r8, #0x0
    movne r7, #0x1
.L_47c:
    ldr r0, _LIT3
    cmp r7, #0x0
    ldr r0, [r0]
    ldr r0, [r0, #0x60]
    bic r0, r0, #0x7000000
    orr r0, r0, #-1593835520
    str r0, [sl, #0x4]
    beq .L_510
    bl OS_DisableIrq
    mov r5, r0
    mov r0, r9
    mov r1, r8
    bl func_02092940
    cmp r4, #0x0
    beq .L_4d8
    sub r9, r9, r4
    mov r0, r9
    mov r1, #0x20
    bl func_020928e8
    add r0, r9, r8
    mov r1, #0x20
    bl func_020928e8
    add r8, r8, #0x20
.L_4d8:
    mov r0, r9
    mov r1, r8
    bl func_020928cc
    bl DC_WaitWriteBufferEmpty
    ldr r1, _LIT4
    mov r0, #0x80000
    bl func_020907b4
    mov r0, #0x80000
    bl func_020905a8
    mov r0, #0x80000
    bl func_02090624
    mov r0, r5
    bl OS_RestoreIrq
    bl func_0209d0f8
.L_510:
    mov r0, r7
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a84c0
_LIT1: .word func_01ff8000
_LIT2: .word 0x000001ff
_LIT3: .word data_021026d8
_LIT4: .word func_0209d018

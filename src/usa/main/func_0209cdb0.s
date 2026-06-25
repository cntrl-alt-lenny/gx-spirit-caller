; func_0209cdb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021025f8
        .extern data_021a83e0
        .extern func_01ff8000
        .extern func_020904c0
        .extern func_0209053c
        .extern func_020906cc
        .extern func_020927e4
        .extern func_02092800
        .extern func_02092858
        .extern func_02092928
        .extern func_02092d50
        .extern func_0209cf24
        .extern func_0209d004
        .global func_0209cdb0
        .arm
func_0209cdb0:
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
    bne .L_3c
    ldr r0, [fp, #0x28]
    cmp r0, #0x3
    movls r1, #0x1
.L_3c:
    cmp r1, #0x0
    beq .L_90
    bl func_02092d50
    ldr r1, _LIT1
    add r2, r9, r8
    cmp r2, r1
    mov r3, #0x1
    mov r1, #0x0
    bls .L_68
    cmp r9, #0x2000000
    movcc r1, r3
.L_68:
    cmp r1, #0x0
    bne .L_88
    cmp r0, r2
    bcs .L_84
    add r0, r0, #0x4000
    cmp r0, r9
    bhi .L_88
.L_84:
    mov r3, #0x0
.L_88:
    cmp r3, #0x0
    moveq r5, #0x1
.L_90:
    cmp r5, #0x0
    beq .L_ac
    ldr r1, [fp, #0x1c]
    ldr r0, _LIT2
    orr r1, r1, r8
    ands r0, r1, r0
    moveq r6, #0x1
.L_ac:
    cmp r6, #0x0
    beq .L_bc
    cmp r8, #0x0
    movne r7, #0x1
.L_bc:
    ldr r0, _LIT3
    cmp r7, #0x0
    ldr r0, [r0]
    ldr r0, [r0, #0x60]
    bic r0, r0, #0x7000000
    orr r0, r0, #-1593835520
    str r0, [sl, #0x4]
    beq .L_150
    bl OS_DisableIrq
    mov r5, r0
    mov r0, r9
    mov r1, r8
    bl func_02092858
    cmp r4, #0x0
    beq .L_118
    sub r9, r9, r4
    mov r0, r9
    mov r1, #0x20
    bl func_02092800
    add r0, r9, r8
    mov r1, #0x20
    bl func_02092800
    add r8, r8, #0x20
.L_118:
    mov r0, r9
    mov r1, r8
    bl func_020927e4
    bl func_02092928
    ldr r1, _LIT4
    mov r0, #0x80000
    bl func_020906cc
    mov r0, #0x80000
    bl func_020904c0
    mov r0, #0x80000
    bl func_0209053c
    mov r0, r5
    bl OS_RestoreIrq
    bl func_0209d004
.L_150:
    mov r0, r7
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_021a83e0
_LIT1: .word func_01ff8000
_LIT2: .word 0x000001ff
_LIT3: .word data_021025f8
_LIT4: .word func_0209cf24

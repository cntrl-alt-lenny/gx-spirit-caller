; func_0208878c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a512c
        .extern data_021a516c
        .extern func_02087240
        .extern func_020872a4
        .extern func_020872e4
        .extern func_020923d8
        .extern func_02094ce4
        .extern func_02094f3c
        .extern func_020954b4
        .extern func_020954f4
        .extern func_02095584
        .global func_0208878c
        .arm
func_0208878c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    ldr r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r1, [r4, #0x2c]
    mov r3, #0x0
    cmp r1, #0x0
    movge r7, #0x1
    movlt r7, #0x0
    cmp r7, #0x0
    movne r0, #0x1
    movne r2, r0, lsl r1
    ldr r0, [r4, #0x24]
    ldr r1, [r4, #0x28]
    moveq r2, #0x0
    bl func_02094f3c
    cmp r7, #0x0
    beq .L_8c
    bl func_020954b4
    mov r5, r0
    mov r0, #0x1
    bl func_02095584
    mov r0, r5
    bl func_020954f4
    ldr r6, _LIT1
    mov r5, #0x0
.L_74:
    mov r0, r6
    mov r1, r5
    mov r2, r5
    bl func_020923d8
    cmp r0, #0x0
    bne .L_74
.L_8c:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_9c
    bl func_020872a4
.L_9c:
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    beq .L_ac
    bl func_020872e4
.L_ac:
    cmp r7, #0x0
    beq .L_bc
    ldr r0, [r4, #0x2c]
    bl func_02087240
.L_bc:
    ldr r0, [r4, #0x4]
    cmp r0, #0x1
    bne .L_dc
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    mov r3, r0
    bl func_02094ce4
.L_dc:
    mov r0, #0x0
    str r0, [r4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021a516c
_LIT1: .word data_021a512c

; func_02097528 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02096728
        .extern func_02097258
        .extern func_020972d4
        .global func_02097528
        .arm
func_02097528:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, [r5, #0x1c]
    mov r4, r0
    ands r0, r1, #0x2
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_384
    mov r0, r5
    ldr r1, [r5, #0x1c]
    bl func_020972d4
    ldr r1, [r5, #0x1c]
    mov r7, r0
    orr r0, r1, #0x80
    str r0, [r5, #0x1c]
    ldr r0, [r5, #0x24]
    cmp r0, #0x0
    beq .L_33c
    mov r6, #0x3
.L_324:
    ldr r8, [r0, #0x4]
    mov r1, r6
    bl func_02096728
    mov r0, r8
    cmp r8, #0x0
    bne .L_324
.L_33c:
    mov r0, #0x0
    str r0, [r5, #0x24]
    cmp r7, #0x0
    beq .L_354
    mov r0, r5
    bl func_02097258
.L_354:
    mov r0, #0x0
    str r0, [r5, #0x28]
    str r0, [r5, #0x2c]
    str r0, [r5, #0x30]
    str r0, [r5, #0x34]
    str r0, [r5, #0x38]
    str r0, [r5, #0x40]
    ldr r0, [r5, #0x40]
    str r0, [r5, #0x3c]
    ldr r0, [r5, #0x1c]
    bic r0, r0, #0xa2
    str r0, [r5, #0x1c]
.L_384:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr

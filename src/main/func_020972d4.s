; func_020972d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02091a8c
        .global func_020972d4
        .arm
func_020972d4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r6, r0
    bl OS_DisableIrq
    ldr r1, [r6, #0x1c]
    mov r4, r0
    ands r0, r1, #0x8
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    moveq r5, #0x1
    movne r5, #0x0
    cmp r5, #0x0
    beq .L_f4
    ldr r0, [r6, #0x1c]
    ands r0, r0, #0x10
    beq .L_e8
    ldr r0, [r6, #0x1c]
    orr r0, r0, #0x40
    str r0, [r6, #0x1c]
    add r7, r6, #0x14
.L_d0:
    mov r0, r7
    bl func_02091a8c
    ldr r0, [r6, #0x1c]
    ands r0, r0, #0x40
    bne .L_d0
    b .L_f4
.L_e8:
    ldr r0, [r6, #0x1c]
    orr r0, r0, #0x8
    str r0, [r6, #0x1c]
.L_f4:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr

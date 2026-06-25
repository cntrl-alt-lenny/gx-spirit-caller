; func_0206d74c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0206d728
        .extern func_020919a4
        .global func_0206d74c
        .arm
func_0206d74c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov sl, r0
    mov r9, r1
    mov r8, r2
    cmp r8, r9
    mov fp, r3
    ldr r7, [sl, #0x68]
    movgt r8, r9
    bl OS_DisableIrq
    ldr r1, [sp, #0x28]
    str r0, [sp]
    and r5, r1, #0x1
    add r4, r7, #0x104
.L_38:
    mov r0, sl
    bl func_0206d728
    mov r6, r0
    cmp r6, r8
    blt .L_64
    add r0, r7, #0x100
    ldrh r0, [r0]
    cmp r6, r9
    movge r6, r9
    str r0, [fp]
    b .L_7c
.L_64:
    cmp r5, #0x0
    moveq r6, #0x0
    beq .L_7c
    mov r0, r4
    bl func_020919a4
    b .L_38
.L_7c:
    ldr r0, [sp]
    bl OS_RestoreIrq
    mov r0, r6
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr

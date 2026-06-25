; func_020a5448 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02094688
        .global func_020a5448
        .arm
func_020a5448:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov r6, r3
    mov r5, #0x0
    bl OS_DisableIrq
    add r2, r9, #0x30
    add r1, r9, #0x70
    mov r4, r0
    cmp r2, r1
    bcs .L_8c
.L_34:
    ldr r0, [r2, #0xc]
    cmp r0, #0x2
    bcc .L_80
    ldr r0, [r2]
    subs r0, r8, r0
    bmi .L_80
    ldr r3, [r2, #0x4]
    add ip, r0, r6
    cmp ip, r3
    bhi .L_80
    ldr r3, [r2, #0x8]
    mov r1, r7
    mov r2, r6
    add r0, r3, r0
    bl func_02094688
    mov r0, #0x0
    str r0, [r9]
    mov r5, #0x1
    b .L_8c
.L_80:
    add r2, r2, #0x10
    cmp r2, r1
    bcc .L_34
.L_8c:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr

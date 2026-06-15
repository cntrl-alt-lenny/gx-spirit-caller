; func_020a55e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02093bfc
        .global func_020a55e0
        .arm
func_020a55e0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r9, r1
    mov r8, r2
    mov r7, r3
    bl OS_DisableIrq
    mov r6, r0
    add r5, r4, #0x30
    add r4, r4, #0x70
.L_1b48:
    cmp r5, r4
    bcc .L_1b54
    bl func_02093bfc
.L_1b54:
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_1b78
    str r9, [r5]
    str r8, [r5, #0x4]
    ldr r0, [sp, #0x20]
    str r7, [r5, #0x8]
    str r0, [r5, #0xc]
    b .L_1b80
.L_1b78:
    add r5, r5, #0x10
    b .L_1b48
.L_1b80:
    mov r0, r6
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr

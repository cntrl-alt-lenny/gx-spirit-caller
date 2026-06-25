; func_0207caf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0207b450
        .global func_0207caf8
        .arm
func_0207caf8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, #0x0
    mov r4, r0
    mov r6, r7
    bl func_0207b450
    mov r5, r0
    bl OS_DisableIrq
    cmp r5, #0x0
    beq .L_50
    add r1, r5, #0x2000
    ldr r2, [r1, #0x260]
    cmp r2, #0x9
    bne .L_50
    ldrb r1, [r1, #0x26b]
    cmp r1, #0x0
    addeq r2, r5, #0x2100
    ldreq r1, _LIT0
    ldreqh r6, [r2, #0x4a]
    addeq r7, r5, r1
.L_50:
    bl OS_RestoreIrq
    cmp r4, #0x0
    strneh r6, [r4]
    mov r0, r7
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x0000214c

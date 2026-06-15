; func_0209f970 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0209448c
        .extern func_0209d69c
        .extern func_0209f2a8
        .extern func_0209fe94
        .global func_0209f970
        .arm
func_0209f970:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x10
    mov sl, r0
    mov r9, r1
    bl OS_DisableIrq
    add r1, sl, #0x800
    ldrh r1, [r1, #0x8]
    mov r7, r0
    mov r1, r1, lsl #0x9
    ldrh r1, [sl, r1]
    cmp r1, #0x0
    bne .L_91c
    bl func_0209d69c
    add r1, sl, #0x800
    ldrh r6, [r1, #0x8]
    mov r5, r0
    ldrh r1, [r1, #0x18]
    add r0, r6, #0x1
    and r0, r0, #0x3
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    cmp r1, #0x1
    addeq r0, r4, #0x1
    andeq r0, r0, #0x3
    moveq r0, r0, lsl #0x10
    moveq r8, r0, lsr #0x10
    movne r8, r4
    add r1, sl, r8, lsl #0x9
    mov r0, #0x0
    mov r2, #0x200
    bl func_0209448c
    add r0, sl, #0x800
    ldrh r3, [r0, #0xe]
    orr r2, r5, #0x1
    mov r1, r8, lsl #0x9
    and r2, r3, r2
    strh r2, [sl, r1]
    strh r4, [r0, #0x8]
    ldrh r0, [r0, #0xe]
    mov r1, r6, lsl #0x9
    cmp r9, #0x1
    strh r0, [sl, r1]
    ldreqh r0, [sl, r1]
    biceq r0, r0, #0x1
    streqh r0, [sl, r1]
    mov r0, r7
    bl OS_RestoreIrq
    add r3, sl, #0x800
    ldrh r1, [r3, #0xe]
    mov r4, #0x1
    ldr r0, _LIT0
    and r1, r1, r5
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    str r1, [sp]
    ldrh r5, [r3, #0x16]
    mov r1, sl
    add r2, sl, r6, lsl #0x9
    str r5, [sp, #0x4]
    str r4, [sp, #0x8]
    ldrh r3, [r3, #0x14]
    bl func_0209f2a8
    cmp r0, #0x7
    bne .L_8f0
    add r0, sl, r6, lsl #0x1
    ldr r1, _LIT1
    add r0, r0, #0x800
    strh r1, [r0]
    add r0, sl, #0x800
    ldrh r1, [r0, #0xa]
    add sp, sp, #0x10
    add r1, r1, #0x1
    and r1, r1, #0x3
    strh r1, [r0, #0xa]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
.L_8f0:
    cmp r0, #0x0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bxeq lr
    cmp r0, #0x2
    addne r0, sl, #0x800
    movne r1, #0x5
    strneh r1, [r0, #0x1c]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
.L_91c:
    bl OS_RestoreIrq
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word func_0209fe94
_LIT1: .word 0x0000ffff

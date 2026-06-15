; func_02029a88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201eaa0
        .global func_02029a88
        .arm
func_02029a88:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    mov r4, r0
    ldr r0, [r4, #0x16c]
    mov sl, #0x0
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0xc
    str r0, [sp, #0x20]
    ldr r0, [r4, #0x170]
    mov fp, #0x1
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0xc
    add r9, r4, #0x98
    str r0, [sp, #0x24]
    add r5, r4, #0x100
    mov r7, sl
    mov r6, sl
    mov r8, fp
.L_404:
    ldrb r0, [r4, #0x79]
    cmp sl, r0
    bge .L_488
    ldr r0, [r9, #0xd0]
    tst r0, r8, lsl sl
    addne r0, r9, sl, lsl #0x2
    ldrne r1, [r0, #0x8]
    cmpne r1, #0x0
    beq .L_488
    ldrh r0, [r5, #0x9a]
    add r2, sp, #0x20
    mov r3, r6
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1f
    ldrsh r0, [r5, #0x8c]
    movne ip, r8
    moveq ip, r7
    str r6, [sp]
    str r6, [sp, #0x4]
    ldrsh lr, [r5, #0x90]
    cmp r0, #0x0
    moveq r0, fp
    str lr, [sp, #0x8]
    ldrsh lr, [r5, #0x8e]
    movne r0, #0x2
    str lr, [sp, #0xc]
    ldr lr, [r4, #0x7c]
    str lr, [sp, #0x10]
    ldr lr, [r4, #0x80]
    str lr, [sp, #0x14]
    str ip, [sp, #0x18]
    str r6, [sp, #0x1c]
    bl func_0201eaa0
.L_488:
    add sl, sl, #0x1
    cmp sl, #0x18
    blt .L_404
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}

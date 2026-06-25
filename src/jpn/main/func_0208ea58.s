; func_0208ea58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208c0b8
        .extern func_0208c260
        .extern func_0208c2fc
        .global func_0208ea58
        .arm
func_0208ea58:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x24
    mov r9, r0
    ldr r6, [r9]
    ldr r5, [r2]
    add r0, sp, #0x0
    sub r5, r6, r5
    str r5, [sp]
    ldr r7, [r9, #0x4]
    ldr r6, [r2, #0x4]
    mov r5, r1
    sub r1, r7, r6
    str r1, [sp, #0x4]
    ldr r6, [r9, #0x8]
    ldr r2, [r2, #0x8]
    mov r1, r0
    sub r2, r6, r2
    mov r8, r3
    str r2, [sp, #0x8]
    ldr r7, [sp, #0x40]
    bl func_0208c0b8
    add r1, sp, #0x0
    add r2, sp, #0xc
    mov r0, r5
    bl func_0208c260
    add r0, sp, #0xc
    mov r1, r0
    bl func_0208c0b8
    add r0, sp, #0x0
    add r1, sp, #0xc
    add r2, sp, #0x18
    bl func_0208c260
    cmp r8, #0x0
    beq .L_e0
    ldr r0, _LIT0
    mov r1, #0x2
    str r1, [r0]
    ldr r0, [sp, #0xc]
    ldr r4, _LIT1
    str r0, [r4]
    ldr r0, [sp, #0x18]
    str r0, [r4]
    ldr r0, [sp]
    str r0, [r4]
    ldr r0, [sp, #0x10]
    str r0, [r4]
    ldr r0, [sp, #0x1c]
    str r0, [r4]
    ldr r0, [sp, #0x4]
    str r0, [r4]
    ldr r0, [sp, #0x14]
    str r0, [r4]
    ldr r0, [sp, #0x20]
    str r0, [r4]
    ldr r0, [sp, #0x8]
    str r0, [r4]
.L_e0:
    add r1, sp, #0xc
    mov r0, r9
    bl func_0208c2fc
    rsb r6, r0, #0x0
    add r1, sp, #0x18
    mov r0, r9
    bl func_0208c2fc
    rsb r5, r0, #0x0
    add r1, sp, #0x0
    mov r0, r9
    bl func_0208c2fc
    cmp r8, #0x0
    strne r6, [r4]
    rsb r0, r0, #0x0
    strne r5, [r4]
    strne r0, [r4]
    cmp r7, #0x0
    addeq sp, sp, #0x24
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    ldr r1, [sp, #0xc]
    str r1, [r7]
    ldr r1, [sp, #0x18]
    str r1, [r7, #0x4]
    ldr r1, [sp]
    str r1, [r7, #0x8]
    ldr r1, [sp, #0x10]
    str r1, [r7, #0xc]
    ldr r1, [sp, #0x1c]
    str r1, [r7, #0x10]
    ldr r1, [sp, #0x4]
    str r1, [r7, #0x14]
    ldr r1, [sp, #0x14]
    str r1, [r7, #0x18]
    ldr r1, [sp, #0x20]
    str r1, [r7, #0x1c]
    ldr r1, [sp, #0x8]
    str r1, [r7, #0x20]
    str r6, [r7, #0x24]
    str r5, [r7, #0x28]
    str r0, [r7, #0x2c]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word 0x04000440
_LIT1: .word 0x0400045c

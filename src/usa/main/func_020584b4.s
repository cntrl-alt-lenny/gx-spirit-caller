; func_020584b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021001c4
        .extern func_02045398
        .extern func_0205ff4c
        .global func_020584b4
        .arm
func_020584b4:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r0, #0x18
    mov r5, r3
    ldr r4, [r6]
    bl func_02045398
    cmp r0, #0x0
    bne .L_324
    ldr r1, _LIT0
    mov r0, r6
    bl func_0205ff4c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
.L_324:
    ldr r3, [sp, #0x14]
    ldr r2, [sp, #0x18]
    ldr r1, [sp, #0x20]
    str r3, [r0]
    str r2, [r0, #0x4]
    str r5, [r0, #0x8]
    cmp r1, #0x0
    ldrne r1, [r1, #0x18]
    ldr r2, [sp, #0x24]
    strne r1, [r0, #0x10]
    moveq r1, #0x0
    streq r1, [r0, #0x10]
    mov r1, #0x0
    str r2, [r0, #0xc]
    str r1, [r0, #0x14]
    ldr r1, [r4, #0x438]
    cmp r1, #0x0
    streq r0, [r4, #0x438]
    ldr r1, [r4, #0x43c]
    cmp r1, #0x0
    strne r0, [r1, #0x14]
    str r0, [r4, #0x43c]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word data_021001c4

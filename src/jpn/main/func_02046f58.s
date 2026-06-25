; func_02046f58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_02045230
        .extern func_02046334
        .extern func_0204664c
        .extern func_02049308
        .global func_02046f58
        .arm
func_02046f58:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02045230
    cmp r0, #0x0
    bne .L_3c
    ldr r0, _LIT0
    ldr r2, [r0]
    ldr r1, [r2, #0x24]
    cmp r1, #0x3
    blt .L_3c
    cmp r1, #0x4
    bne .L_48
.L_3c:
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_48:
    str r6, [r2, #0x78]
    ldr r1, [r0]
    mov r0, #0x4
    str r5, [r1, #0x7c]
    bl func_0204664c
    ldr r0, _LIT0
    ldr r1, [sp, #0x20]
    ldr r3, [r0]
    ldr r0, [sp, #0x24]
    str r4, [sp]
    str r1, [sp, #0x4]
    ldr r4, [sp, #0x28]
    str r0, [sp, #0x8]
    ldr r2, _LIT1
    add r0, r3, #0xe0
    add r1, r3, #0x1e0
    mov r3, #0x0
    str r4, [sp, #0xc]
    bl func_02049308
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219da0c
_LIT1: .word func_02046334

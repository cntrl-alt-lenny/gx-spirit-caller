; func_02072398 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219f178
        .extern data_021a63d0
        .extern func_02072414
        .extern func_02072c78
        .extern func_02073738
        .extern func_02073eb0
        .global func_02072398
        .arm
func_02072398:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, [r6, #0x1c]
    mov r5, r1
    mov r4, r2
    bl func_02072414
    cmp r0, #0x0
    bne .L_38
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x4]
    cmp r0, r1
    beq .L_5c
.L_38:
    mov r0, #0x0
    mov r1, r0
    mov r2, r6
    mov r3, r5
    str r4, [sp]
    bl func_02072c78
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_5c:
    ldr r0, [r6, #0x1c]
    bl func_02073eb0
    bl func_02073738
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a63d0
_LIT1: .word data_0219f178

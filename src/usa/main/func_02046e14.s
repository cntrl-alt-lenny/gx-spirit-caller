; func_02046e14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_02045230
        .extern func_020461ac
        .extern func_0204664c
        .extern func_02046788
        .extern func_02051310
        .global func_02046e14
        .arm
func_02046e14:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02045230
    cmp r0, #0x0
    bne .L_230
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x24]
    cmp r0, #0x3
    beq .L_23c
.L_230:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_23c:
    bl func_02046788
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r3, [r1]
    mov r0, #0x5
    str r6, [r3, #0x88]
    ldr r3, [r1]
    str r5, [r3, #0x8c]
    ldr r1, [r1]
    strb r2, [r1, #0x2c]
    bl func_0204664c
    sub r0, r7, #0x1
    ldr r5, [sp, #0x18]
    ldr r1, _LIT1
    mov r3, r4
    and r0, r0, #0xff
    mov r2, #0x0
    str r5, [sp]
    bl func_02051310
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219da0c
_LIT1: .word func_020461ac

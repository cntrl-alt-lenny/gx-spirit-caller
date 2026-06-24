; func_020722b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219f098
        .extern data_021a62f0
        .extern func_0207232c
        .extern func_02072b90
        .extern func_02073650
        .extern func_02073dc8
        .global func_020722b0
        .arm
func_020722b0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, [r6, #0x1c]
    mov r5, r1
    mov r4, r2
    bl func_0207232c
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
    bl func_02072b90
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_5c:
    ldr r0, [r6, #0x1c]
    bl func_02073dc8
    bl func_02073650
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a62f0
_LIT1: .word data_0219f098

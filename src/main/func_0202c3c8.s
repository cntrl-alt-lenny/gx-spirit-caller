; func_0202c3c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_0219a93c
        .global func_0202c3c8
        .arm
func_0202c3c8:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_184
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    str r1, [r0]
.L_184:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_1ac
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    str r1, [r0, #0x4]
.L_1ac:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0, #0x4]
    str r1, [r0, #0x8]
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219a93c

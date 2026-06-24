; func_0202aeec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_0219a85c
        .global func_0202aeec
        .arm
func_0202aeec:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x30]
    cmp r0, #0x0
    beq .L_2c
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x30]
.L_2c:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    beq .L_54
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x34]
.L_54:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x2c]
    cmp r0, #0x0
    beq .L_7c
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x2c]
.L_7c:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_a4
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x38]
.L_a4:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_cc
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x8]
.L_cc:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_f4
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x4]
.L_f4:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_11c
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0xc]
.L_11c:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_144
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x10]
.L_144:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x14]
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219a85c

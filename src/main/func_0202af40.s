; func_0202af40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_0219a93c
        .global func_0202af40
        .arm
func_0202af40:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x30]
    cmp r0, #0x0
    beq .L_150
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x30]
.L_150:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x34]
    cmp r0, #0x0
    beq .L_178
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x34]
.L_178:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x2c]
    cmp r0, #0x0
    beq .L_1a0
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x2c]
.L_1a0:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x38]
    cmp r0, #0x0
    beq .L_1c8
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x38]
.L_1c8:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_1f0
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x8]
.L_1f0:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_218
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x4]
.L_218:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_240
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0xc]
.L_240:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_268
    bl Task_InvokeLocked
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x10]
.L_268:
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
_LIT0: .word data_0219a93c

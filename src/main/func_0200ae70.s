; func_0200ae70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .global func_0200ae70
        .arm
func_0200ae70:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_a8
    bl Task_InvokeLocked
.L_a8:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_b8
    bl Task_InvokeLocked
.L_b8:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_c8
    bl Task_InvokeLocked
.L_c8:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_d8
    bl Task_InvokeLocked
.L_d8:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_e8
    bl Task_InvokeLocked
.L_e8:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_f8
    bl Task_InvokeLocked
.L_f8:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_108
    bl Task_InvokeLocked
.L_108:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_118
    bl Task_InvokeLocked
.L_118:
    mov r0, #0x1
    ldmia sp!, {r4, pc}

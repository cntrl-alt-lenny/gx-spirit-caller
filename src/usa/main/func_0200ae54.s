; func_0200ae54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .global func_0200ae54
        .arm
func_0200ae54:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_20
    bl Task_InvokeLocked
.L_20:
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_30
    bl Task_InvokeLocked
.L_30:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_40
    bl Task_InvokeLocked
.L_40:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_50
    bl Task_InvokeLocked
.L_50:
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_60
    bl Task_InvokeLocked
.L_60:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_70
    bl Task_InvokeLocked
.L_70:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_80
    bl Task_InvokeLocked
.L_80:
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_90
    bl Task_InvokeLocked
.L_90:
    mov r0, #0x1
    ldmia sp!, {r4, pc}

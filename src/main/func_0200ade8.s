; func_0200ade8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern func_0200ae70
        .extern func_0200af08
        .extern func_0200af24
        .extern func_0200afc8
        .extern func_0200b06c
        .extern func_0200b0c8
        .extern func_0200b124
        .extern func_0200b140
        .extern func_0200b15c
        .extern func_0200b178
        .global func_0200ade8
        .arm
func_0200ade8:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x274]
    cmp r0, #0x0
    beq .L_20
    bl Task_InvokeLocked
.L_20:
    ldr r0, [r4, #0x280]
    cmp r0, #0x0
    beq .L_30
    bl Task_InvokeLocked
.L_30:
    mov r0, r4
    bl func_0200ae70
    ldr r0, [r4, #0x80]
    bl func_0200af08
    ldr r0, [r4, #0x90]
    bl func_0200af24
    ldr r0, [r4, #0x88]
    bl func_0200afc8
    ldr r0, [r4, #0x98]
    bl func_0200b06c
    ldr r0, [r4, #0xa4]
    bl func_0200b0c8
    ldr r0, [r4, #0x94]
    bl func_0200b124
    ldr r0, [r4, #0x8c]
    bl func_0200b140
    ldr r0, [r4, #0xa0]
    bl func_0200b15c
    ldr r0, [r4, #0xa8]
    bl func_0200b178
    mov r0, #0x1
    ldmia sp!, {r4, pc}

; func_0200adcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern func_0200ae54
        .extern func_0200aeec
        .extern func_0200af08
        .extern func_0200afac
        .extern func_0200b050
        .extern func_0200b0ac
        .extern func_0200b108
        .extern func_0200b124
        .extern func_0200b140
        .extern func_0200b15c
        .global func_0200adcc
        .arm
func_0200adcc:
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
    bl func_0200ae54
    ldr r0, [r4, #0x80]
    bl func_0200aeec
    ldr r0, [r4, #0x90]
    bl func_0200af08
    ldr r0, [r4, #0x88]
    bl func_0200afac
    ldr r0, [r4, #0x98]
    bl func_0200b050
    ldr r0, [r4, #0xa4]
    bl func_0200b0ac
    ldr r0, [r4, #0x94]
    bl func_0200b108
    ldr r0, [r4, #0x8c]
    bl func_0200b124
    ldr r0, [r4, #0xa0]
    bl func_0200b140
    ldr r0, [r4, #0xa8]
    bl func_0200b15c
    mov r0, #0x1
    ldmia sp!, {r4, pc}

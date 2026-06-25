; func_0209578c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02095250
        .extern func_02095298
        .extern func_020952f0
        .extern func_020953c0
        .extern func_02095584
        .extern func_02095828
        .global func_0209578c
        .arm
func_0209578c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02095250
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    bl func_02095298
    cmp r0, #0x0
    ldmneia sp!, {r4, lr}
    bxne lr
    ands r0, r4, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    bl func_020953c0
    cmp r0, #0x0
    ble .L_70
    mov r4, #0x0
.L_4c:
    mov r0, r4
    bl func_02095828
    cmp r0, #0x0
    bne .L_4c
    bl func_02095298
    cmp r0, #0x0
    beq .L_78
    ldmia sp!, {r4, lr}
    bx lr
.L_70:
    mov r0, #0x1
    bl func_02095584
.L_78:
    bl func_020952f0
    mov r4, #0x1
.L_80:
    mov r0, r4
    bl func_02095828
    bl func_02095298
    cmp r0, #0x0
    beq .L_80
    ldmia sp!, {r4, lr}
    bx lr

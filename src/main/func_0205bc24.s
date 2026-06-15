; func_0205bc24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100a8c
        .extern data_02100ad4
        .extern data_02100ad8
        .extern func_02058a08
        .extern func_0205af90
        .extern func_0205d7e4
        .extern func_0205febc
        .extern func_020604a4
        .extern func_020a6d54
        .global func_0205bc24
        .arm
func_0205bc24:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r1
    ldr r3, [r5]
    mov r4, #0x0
    cmp r3, #0x4
    addls pc, pc, r3, lsl #0x2
    b .L_dbc
    b .L_d8c
    b .L_d98
    b .L_da4
    b .L_dbc
    b .L_db0
.L_d8c:
    bl func_02058a08
    mov r4, r0
    b .L_ddc
.L_d98:
    bl func_0205d7e4
    mov r4, r0
    b .L_ddc
.L_da4:
    bl func_0205af90
    mov r4, r0
    b .L_ddc
.L_db0:
    bl func_0205febc
    mov r4, r0
    b .L_ddc
.L_dbc:
    ldr r1, _LIT0
    mov r2, r3
    bl func_020604a4
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r3, _LIT3
    mov r2, #0x0
    bl func_020a6d54
.L_ddc:
    cmp r4, #0x0
    strne r4, [r5, #0x1c]
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02100a8c
_LIT1: .word data_02100ad4
_LIT2: .word data_02100ad8
_LIT3: .word 0x00000146

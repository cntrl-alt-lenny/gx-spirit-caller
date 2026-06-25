; func_0205bbb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021009ac
        .extern data_021009f4
        .extern data_021009f8
        .extern func_02058994
        .extern func_0205af1c
        .extern func_0205d770
        .extern func_0205fe48
        .extern func_02060430
        .extern func_020a6c60
        .global func_0205bbb0
        .arm
func_0205bbb0:
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
    bl func_02058994
    mov r4, r0
    b .L_ddc
.L_d98:
    bl func_0205d770
    mov r4, r0
    b .L_ddc
.L_da4:
    bl func_0205af1c
    mov r4, r0
    b .L_ddc
.L_db0:
    bl func_0205fe48
    mov r4, r0
    b .L_ddc
.L_dbc:
    ldr r1, _LIT0
    mov r2, r3
    bl func_02060430
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r3, _LIT3
    mov r2, #0x0
    bl func_020a6c60
.L_ddc:
    cmp r4, #0x0
    strne r4, [r5, #0x1c]
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021009ac
_LIT1: .word data_021009f4
_LIT2: .word data_021009f8
_LIT3: .word 0x00000146

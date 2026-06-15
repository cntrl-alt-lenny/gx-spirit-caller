; func_02054148 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffb04
        .extern data_020ffb5c
        .extern func_020453b4
        .extern func_02054314
        .extern func_020a6d54
        .global func_02054148
        .arm
func_02054148:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r0
    bne .L_24
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x69
    bl func_020a6d54
.L_24:
    ldr r0, [r5]
    mov r4, #0x0
    cmp r0, #0x0
    ble .L_50
.L_34:
    mov r0, r5
    mov r1, r4
    bl func_02054314
    ldr r0, [r5]
    add r4, r4, #0x1
    cmp r4, r0
    blt .L_34
.L_50:
    ldr r0, [r5, #0x14]
    bl func_020453b4
    mov r0, r5
    bl func_020453b4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020ffb5c
_LIT1: .word data_020ffb04

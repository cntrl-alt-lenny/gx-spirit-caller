; func_0206e430 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ec68
        .extern func_0206e490
        .global func_0206e430
        .arm
func_0206e430:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r1, r0
    cmp r1, #0x0
    ble .L_24
    ldr r0, _LIT0
    bl func_0206e490
    cmp r0, #0x0
    bne .L_34
.L_24:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {lr}
    bx lr
.L_34:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219ec68

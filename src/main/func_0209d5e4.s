; func_0209d5e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8d20
        .extern data_021a8d24
        .extern func_02093bfc
        .extern func_0209d55c
        .global func_0209d5e4
        .arm
func_0209d5e4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    and r0, r1, #0x3f
    cmp r0, #0x11
    bne .L_68
    ldr r2, _LIT0
    ldr r0, [r2]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldr r1, _LIT1
    mov r0, #0x1
    ldr r1, [r1]
    str r0, [r2]
    cmp r1, #0x0
    beq .L_48
    blx r1
.L_48:
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    bl func_0209d55c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_68:
    bl func_02093bfc
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a8d20
_LIT1: .word data_021a8d24

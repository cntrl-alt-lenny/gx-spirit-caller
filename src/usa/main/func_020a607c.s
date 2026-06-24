; func_020a607c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9868
        .extern data_021a986c
        .extern func_02093b08
        .extern func_020a605c
        .global func_020a607c
        .arm
func_020a607c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    and r0, r1, #0x3f
    cmp r0, #0x11
    bne .L_68
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r1, [r1]
    cmp r1, #0x0
    beq .L_44
    blx r1
.L_44:
    cmp r0, #0x0
    beq .L_50
    bl func_020a605c
.L_50:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_68:
    bl func_02093b08
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a9868
_LIT1: .word data_021a986c

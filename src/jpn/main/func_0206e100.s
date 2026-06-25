; func_0206e100 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ec00
        .extern data_0219ec04
        .extern data_0219ee3c
        .extern func_02091680
        .extern func_02093714
        .global func_0206e100
        .arm
func_0206e100:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r2, [r0]
    cmp r2, #0x0
    bne .L_228
    ldr r0, _LIT1
    ldr r0, [r0]
    and r0, r0, #0x3
    cmp r0, #0x1
    bne .L_238
    bl func_02093714
    cmp r0, #0x12
    beq .L_238
    mov r0, #0xa
    bl func_02091680
    b .L_238
.L_228:
    ldr r0, _LIT2
    ldr r1, [r0]
    cmp r1, #0x0
    streq r2, [r0]
.L_238:
    ldr r0, _LIT0
    ldr r0, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219ee3c
_LIT1: .word data_0219ec04
_LIT2: .word data_0219ec00

; func_0206e174 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ece0
        .extern data_0219ece4
        .extern data_0219ef1c
        .extern func_02091768
        .extern func_02093808
        .global func_0206e174
        .arm
func_0206e174:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r2, [r0]
    cmp r2, #0x0
    bne .L_9f8
    ldr r0, _LIT1
    ldr r0, [r0]
    and r0, r0, #0x3
    cmp r0, #0x1
    bne .L_a08
    bl func_02093808
    cmp r0, #0x12
    beq .L_a08
    mov r0, #0xa
    bl func_02091768
    b .L_a08
.L_9f8:
    ldr r0, _LIT2
    ldr r1, [r0]
    cmp r1, #0x0
    streq r2, [r0]
.L_a08:
    ldr r0, _LIT0
    ldr r0, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_0219ef1c
_LIT1: .word data_0219ece4
_LIT2: .word data_0219ece0

; func_0208f458 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6324
        .extern data_021a6328
        .extern func_0208cefc
        .global func_0208f458
        .arm
func_0208f458:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0208cefc
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1]
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    cmp r0, #0x20
    beq .L_114
    cmp r0, #0x40
    ldreq r1, _LIT1
    ldreq r0, _LIT2
    add sp, sp, #0x4
    streq r1, [r0]
    ldmfd sp!, {lr}
    bx lr
.L_114:
    ldr r1, _LIT3
    ldr r0, _LIT2
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6328
_LIT1: .word 0x06894000
_LIT2: .word data_021a6324
_LIT3: .word 0x06890000

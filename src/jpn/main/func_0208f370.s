; func_0208f370 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6244
        .extern data_021a6248
        .extern func_0208ce14
        .global func_0208f370
        .arm
func_0208f370:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0208ce14
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1]
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    cmp r0, #0x20
    beq .L_bc
    cmp r0, #0x40
    ldreq r1, _LIT1
    ldreq r0, _LIT2
    add sp, sp, #0x4
    streq r1, [r0]
    ldmfd sp!, {lr}
    bx lr
.L_bc:
    ldr r1, _LIT3
    ldr r0, _LIT2
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6248
_LIT1: .word 0x06894000
_LIT2: .word data_021a6244
_LIT3: .word 0x06890000

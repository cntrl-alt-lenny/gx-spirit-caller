; func_02033bdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02033bdc
        .arm
func_02033bdc:
    ldrb ip, [r0]
    cmp ip, #0x0
    bxne lr
    cmp r3, #0x0
    movne r3, #0x1
    moveq r3, #0x2
    strb r3, [r0]
    mov r3, #0x0
    strb r3, [r0, #0x1]
    strb r1, [r0, #0x2]
    strb r3, [r0, #0x3]
    str r3, [r0, #0x4]
    ldr r3, [sp]
    str r2, [r0, #0x8]
    ldr r1, [sp, #0x4]
    str r3, [r0, #0xc]
    str r1, [r0, #0x10]
    bx lr

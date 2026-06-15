; func_02066ea0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02066ea0
        .arm
func_02066ea0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    strb r1, [r0]
    ldrb ip, [r2]
    ldrb r3, [r2, #0x1]
    add lr, r0, #0x1
    mov r1, #0x5
    strb ip, [r0, #0x1]
    strb r3, [lr, #0x1]
    ldrb r3, [r2, #0x2]
    ldrb r2, [r2, #0x3]
    strb r3, [lr, #0x2]
    strb r2, [lr, #0x3]
    str r1, [r0, #0x800]
    add sp, sp, #0x4
    ldmfd sp!, {pc}

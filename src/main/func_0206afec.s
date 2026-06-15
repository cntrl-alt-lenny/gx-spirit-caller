; func_0206afec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0206afec
        .arm
func_0206afec:
    stmdb sp!, {r0, r1, r2, r3}
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    add ip, sp, #0xc
    ldrb r3, [ip]
    ldrb r1, [ip, #0x1]
    ldr lr, [r0]
    strb r3, [lr]
    strb r1, [lr, #0x1]
    ldrb r3, [ip, #0x2]
    ldrb r1, [ip, #0x3]
    strb r3, [lr, #0x2]
    strb r1, [lr, #0x3]
    ldr r1, [r2]
    add r1, r1, #0x4
    str r1, [r2]
    ldr r1, [r0]
    add r1, r1, #0x4
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    add sp, sp, #0x10
    bx lr

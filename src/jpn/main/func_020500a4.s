; func_020500a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .global func_020500a4
        .arm
func_020500a4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0204987c
    mov r1, #0xff
    strb r1, [r0, #0x3c4]
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x3c5]
    add sp, sp, #0x4
    ldmfd sp!, {pc}

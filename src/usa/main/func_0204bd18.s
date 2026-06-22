; func_0204bd18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_020624bc
        .global func_0204bd18
        .arm
func_0204bd18:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0204987c
    mov r1, #0x2
    strb r1, [r0, #0x1a0]
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_020624bc
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}

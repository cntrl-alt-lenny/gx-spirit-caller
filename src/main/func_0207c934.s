; func_0207c934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_01ff8180
        .extern func_02091a0c
        .global func_0207c934
        .arm
func_0207c934:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, [r0, #0x8]
    ldr r1, _LIT0
    cmp r2, r1
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldr r1, [r0, #0xc]
    sub r1, r1, #0x1
    str r1, [r0, #0xc]
    ldr r1, [r0, #0xc]
    cmp r1, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    mov r1, #0x0
    str r1, [r0, #0x8]
    bl func_02091a0c
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word func_01ff8180

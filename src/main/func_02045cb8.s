; func_02045cb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern data_0219daf0
        .extern func_0204525c
        .extern func_02054bfc
        .extern func_02062510
        .global func_02045cb8
        .arm
func_02045cb8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_02062510
    bl func_02054bfc
    ldr r2, _LIT0
    ldr r1, _LIT1
    str r0, [r2]
    mov r0, #0x9
    bl func_0204525c
    ldr r0, _LIT2
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219daf0
_LIT1: .word 0xfffe8515
_LIT2: .word data_0219daec

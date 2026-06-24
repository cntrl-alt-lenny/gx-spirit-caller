; func_020539f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e394
        .extern data_0219e398
        .extern data_0219e3a0
        .extern func_02054c34
        .extern func_020552bc
        .global func_020539f0
        .arm
func_020539f0:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr r1, _LIT0
    mov r0, #0x8
    str r1, [sp]
    ldr r1, _LIT1
    str r0, [sp, #0x4]
    ldr r0, [r1]
    ldr r2, [r1, #0x4c]
    ldr r1, _LIT2
    mov r3, #0x0
    bl func_02054c34
    bl func_020552bc
    ldr r1, _LIT1
    str r0, [r1, #0x50]
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_0219e398
_LIT1: .word data_0219e394
_LIT2: .word data_0219e3a0

; func_02053a64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e474
        .extern data_0219e478
        .extern data_0219e480
        .extern func_02054ca8
        .extern func_02055330
        .global func_02053a64
        .arm
func_02053a64:
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
    bl func_02054ca8
    bl func_02055330
    ldr r1, _LIT1
    str r0, [r1, #0x50]
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_0219e478
_LIT1: .word data_0219e474
_LIT2: .word data_0219e480

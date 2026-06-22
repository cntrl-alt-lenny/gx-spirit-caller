; func_020a6c60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210271c
        .extern func_020a6a3c
        .extern func_020a94f0
        .global func_020a6c60
        .arm
func_020a6c60:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov lr, r1
    mov ip, r2
    str r3, [sp]
    ldr r0, _LIT0
    mov r1, r4
    mov r2, lr
    mov r3, ip
    bl func_020a94f0
    bl func_020a6a3c
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_0210271c

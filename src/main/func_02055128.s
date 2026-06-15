; func_02055128 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054c78
        .global func_02055128
        .arm
func_02055128:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    mov r1, #0x4
    str r1, [sp, #0x8]
    add ip, sp, #0x8
    ldr r1, _LIT0
    ldr r2, _LIT1
    add r3, sp, #0x4
    str ip, [sp]
    bl func_02054c78
    mvn r1, #0x0
    cmp r0, r1
    ldrne r1, [sp, #0x4]
    mov r0, r1
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word 0x0000ffff
_LIT1: .word 0x00001001

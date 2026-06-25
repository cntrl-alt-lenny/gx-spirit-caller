; func_020904f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020904f4
        .arm
func_020904f4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr lr, _LIT0
    mov r3, #0x0
    ldrh ip, [lr]
    ldr r2, _LIT1
    mvn r1, r0
    strh r3, [lr]
    ldr r0, [r2]
    and r1, r0, r1
    str r1, [r2]
    ldrh r1, [lr]
    strh ip, [lr]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x04000208
_LIT1: .word 0x04000210

; func_0208bf3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208be70
        .global func_0208bf3c
        .arm
func_0208bf3c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r0, #0x0
    addle sp, sp, #0x4
    movle r0, #0x0
    ldmlefd sp!, {lr}
    bxle lr
    ldr r2, _LIT0
    mov r3, #0x1
    strh r3, [r2]
    ldr r1, _LIT1
    mov r2, #0x0
    str r2, [r1]
    str r0, [r1, #0x4]
    bl func_0208be70
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word 0x040002b0
_LIT1: .word 0x040002b8

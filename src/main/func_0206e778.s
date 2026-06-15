; func_0206e778 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ed74
        .extern func_0206e690
        .global func_0206e778
        .arm
func_0206e778:
    stmdb sp!, {r0, r1, r2, r3}
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    add r1, sp, #0x8
    mov r0, #0x2
    mov r3, #0x10
    bl func_0206e690
    ldr r0, _LIT0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word data_0219ed74

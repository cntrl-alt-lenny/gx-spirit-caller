; func_0206bcbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ebf8
        .extern func_02000b60
        .extern func_0206baf4
        .extern func_0206bc78
        .global func_0206bcbc
        .arm
func_0206bcbc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, _LIT0
    bl func_02000b60
    ldr r0, _LIT1
    ldr r1, [r0]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, lr}
    bxne lr
    str r4, [r0]
    bl func_0206baf4
    bl func_0206bc78
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x02000bc4
_LIT1: .word data_0219ebf8
